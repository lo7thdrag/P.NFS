unit uRadarTargets;

interface

uses
  Windows, SysUtils, Classes, Math, Graphics,
  uCoordConverter;

type
  PRGBQuad = ^TRGBQuad;
  TRGBQuad = packed record
    B, G, R, A: Byte;
  end;

  TRadarTargetSymbol = class
  private
    // map position
    FMapX, FMapY : Double;

    // screen position
    FScreenX, FScreenY: Integer;

    FVisible    : Boolean;
    FSelected   : Boolean;
    FConv       : TCoordConverter;

    // bitmap symbol
    FBitmap     : TBitmap;
    FUseBitmap  : Boolean;

    // font symbol
    FUseFont    : Boolean;
    FFontName   : string;
    FFontSize   : Integer;
    FFontChar   : WideChar;
    FFontColorNormal   : TColor;
    FFontColorSelected : TColor;

    // circle fallback
    FCircleRadius       : Integer;
    FCircleColorNormal  : TColor;
    FCircleColorSelected: TColor;

    // track label di atas simbol
    FTrackLabel     : string;
    FTrackFontColor : TColor;
    FTrackFontSize  : Integer;
    FLastBounds: TRect;
    FBitmapTintAlpha: Byte;
    FBitmapTintColor: TColor; // cache bounds terakhir (untuk hit-test tanpa Canvas)

    procedure UpdateScreenPos;
    procedure SetSelected(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    property Visible : Boolean read FVisible write FVisible;
    property Selected: Boolean read FSelected write SetSelected;

    property MapX: Double read FMapX write FMapX;
    property MapY: Double read FMapY write FMapY;

    property ScreenX: Integer read FScreenX;
    property ScreenY: Integer read FScreenY;

    property CoordConverter: TCoordConverter read FConv write FConv;

    // Bitmap
    procedure LoadBitmapFromFile(const AFileName: string);
    procedure ClearBitmap;
    procedure TintBitmap(const Src: TBitmap; AColor: TColor; Alpha: Byte);

    // Font symbol
    procedure SetFontSymbol(const AFontName: string; AChar: WideChar;
                            AColorNormal, AColorSelected: TColor;
                            ASize: Integer);
    procedure ClearFontSymbol;

    // Circle fallback
    property CircleRadius: Integer read FCircleRadius write FCircleRadius;
    property CircleColorNormal: TColor read FCircleColorNormal write FCircleColorNormal;
    property CircleColorSelected: TColor read FCircleColorSelected write FCircleColorSelected;

    // Track label
    property TrackLabel: string read FTrackLabel write FTrackLabel;
    property TrackFontColor: TColor read FTrackFontColor write FTrackFontColor;
    property TrackFontSize: Integer read FTrackFontSize write FTrackFontSize;

    // koordinat
    procedure ConvertCoord;

    // bounding rect simbol (dipakai juga untuk selection & hit test)
    function GetBounds(ACanvas: TCanvas): TRect;

    // cek klik pada target
    function HitTest(ACanvas: TCanvas; X, Y: Integer): Boolean;

    // gambar satu target
    procedure Draw(ACanvas: TCanvas);

    property BitmapTintColor: TColor read FBitmapTintColor write FBitmapTintColor;
    property BitmapTintAlpha: Byte read FBitmapTintAlpha write FBitmapTintAlpha;
  end;


  TRadarTargetManager = class
  private
    FList : TList; // of TRadarTargetSymbol
    FConv : TCoordConverter;
  public
    constructor Create;
    destructor Destroy; override;

    property CoordConverter: TCoordConverter read FConv write FConv;

    function AddTarget(AMapX, AMapY: Double): TRadarTargetSymbol;
    procedure RemoveTarget(ATarget: TRadarTargetSymbol);
    procedure Clear;

    function Count: Integer;
    function Items(Index: Integer): TRadarTargetSymbol;

    // gambar semua target
    procedure Draw(ACanvas: TCanvas);

    // klik: pilih target pada (X,Y)
    function SelectAt(X, Y: Integer): TRadarTargetSymbol;

    procedure DeselectAll;
  end;

implementation

// warna Delphi -> komponen RGB
procedure SplitRGB(C: TColor; out R,G,B: Byte);
begin
  C := ColorToRGB(C);
  R := GetRValue(C); G := GetGValue(C); B := GetBValue(C);
end;

// Semua piksel yang "hitam" → diwarnai TintColor + alpha=255
// Piksel selain hitam → alpha=0 (transparan)
// Tolerance 0..255 (contoh 8..16) agar "nyaris hitam" ikut diwarnai.
procedure TintBlackAndMakeOthersTransparent(var Bmp: TBitmap; TintColor: TColor; Tolerance: Byte = 8);
var
  x, y: Integer;
  p: PRGBQuad;
  r, g, b: Byte;
  tr, tg, tb: Byte;
begin
  if (Bmp.Width = 0) or (Bmp.Height = 0) then Exit;
  Bmp.PixelFormat := pf32bit;

  SplitRGB(TintColor, tr, tg, tb);

  for y := 0 to Bmp.Height - 1 do
  begin
    p := Bmp.ScanLine[y];
    for x := 0 to Bmp.Width - 1 do
    begin
      r := p^.R; g := p^.G; b := p^.B;

      // "Hitam" jika semua channel <= tolerance
      if (r <= Tolerance) and (g <= Tolerance) and (b <= Tolerance) then
      begin
        // warnai sesuai TintColor dan buat terlihat
        p^.R := tr;
        p^.G := tg;
        p^.B := tb;
        p^.A := $FF;     // fully opaque
      end
      else
      begin
        // bukan hitam → jadikan transparan
        p^.A := 0;
        // (opsional) nolkan RGB supaya aman
        p^.R := 0; p^.G := 0; p^.B := 0;
      end;

      Inc(p);
    end;
  end;
end;

procedure PremultiplyAlpha(var Bmp: TBitmap);
var
  x,y: Integer;
  p: PRGBQuad;
  a: Integer;
begin
  if (Bmp.Width=0) or (Bmp.Height=0) then Exit;
  Bmp.PixelFormat := pf32bit;
  // Jika Delphi modern, ini cukup:
  {$IF CompilerVersion >= 20.0}
  Bmp.AlphaFormat := afPremultiplied;
  {$ELSE}
  for y := 0 to Bmp.Height-1 do
  begin
    p := Bmp.ScanLine[y];
    for x := 0 to Bmp.Width-1 do
    begin
      a := p^.A;
      p^.R := (p^.R * a) div 255;
      p^.G := (p^.G * a) div 255;
      p^.B := (p^.B * a) div 255;
      Inc(p);
    end;
  end;
  {$IFEND}
end;

procedure DrawBitmapWithAlpha(ACanvas: TCanvas; X, Y: Integer; Src: TBitmap);
var
  bf: BLENDFUNCTION;
begin
  PremultiplyAlpha(Src);
  bf.BlendOp := AC_SRC_OVER;
  bf.BlendFlags := 0;
  bf.SourceConstantAlpha := 255;    // gunakan alpha per-pixel
  bf.AlphaFormat := AC_SRC_ALPHA;   // penting!
  AlphaBlend(ACanvas.Handle, X, Y, Src.Width, Src.Height,
             Src.Canvas.Handle, 0, 0, Src.Width, Src.Height, bf);
end;

{ TRadarTargetSymbol }
constructor TRadarTargetSymbol.Create;
begin
  inherited Create;
  FVisible  := True;
  FSelected := False;

  FMapX := 0;
  FMapY := 0;
  FScreenX := 0;
  FScreenY := 0;

  FConv := nil;

  FBitmap := TBitmap.Create;
  FUseBitmap := False;

  FUseFont := False;
  FFontName := 'Segoe UI';
  FFontSize := 10;
  FFontChar := '▲'; // default icon
  FFontColorNormal   := clLime;
  FFontColorSelected := clYellow;

  FCircleRadius        := 3;
  FCircleColorNormal   := clLime;
  FCircleColorSelected := clYellow;

  FTrackLabel     := '';
  FTrackFontColor := clWhite;
  FTrackFontSize  := 8;
  FLastBounds := Rect(0,0,0,0);

  FBitmapTintColor := clNone;
  FBitmapTintAlpha := 0;
end;

destructor TRadarTargetSymbol.Destroy;
begin
  FBitmap.Free;
  inherited;
end;

procedure TRadarTargetSymbol.SetSelected(const Value: Boolean);
begin
  FSelected := Value;
end;

procedure TRadarTargetSymbol.TintBitmap(const Src: TBitmap; AColor: TColor;
  Alpha: Byte);
var
  BlendFunc: BLENDFUNCTION;
  DC: HDC;
  R: TRect;
begin
  DC := Src.Canvas.Handle;
  R := Rect(0, 0, Src.Width, Src.Height);
  BlendFunc.BlendOp := AC_SRC_OVER;
  BlendFunc.BlendFlags := 0;
  BlendFunc.SourceConstantAlpha := Alpha;
  BlendFunc.AlphaFormat := 0;
  Src.Canvas.Brush.Color := AColor;
  AlphaBlend(DC, 0, 0, Src.Width, Src.Height,
             DC, 0, 0, Src.Width, Src.Height, BlendFunc);
end;

procedure TRadarTargetSymbol.LoadBitmapFromFile(const AFileName: string);
begin
  FUseBitmap := False;
  FBitmap.Assign(nil);

  if (AFileName <> '') and FileExists(AFileName) then
  try
    FBitmap.LoadFromFile(AFileName);
//    TintBitmap(FBitmap, clLime, 128); // lapisi hijau transparan 50%
    FBitmap.Transparent := True;
    // warnai hanya piksel hitam:
//    TintBlackPixelsOnly(FBitmap, clLime, 56, 255, True);
//    TintBlackPixelsOnly_NoAlphaSkip(FBitmap, clLime, 56, 255, True);
    FUseBitmap := (FBitmap.Width > 0) and (FBitmap.Height > 0);
  except
    FUseBitmap := False;
  end;
end;

procedure TRadarTargetSymbol.ClearBitmap;
begin
  FUseBitmap := False;
  FBitmap.Assign(nil);
end;

procedure TRadarTargetSymbol.SetFontSymbol(const AFontName: string;
  AChar: WideChar; AColorNormal, AColorSelected: TColor; ASize: Integer);
begin
  FUseFont           := True;
  FFontName          := AFontName;
  FFontChar          := AChar;
  FFontColorNormal   := AColorNormal;
  FFontColorSelected := AColorSelected;
  FFontSize          := ASize;
end;

procedure TRadarTargetSymbol.ClearFontSymbol;
begin
  FUseFont := False;
end;

procedure TRadarTargetSymbol.UpdateScreenPos;
begin
  if Assigned(FConv) then
    FConv.ConvertToScreen(FMapX, FMapY, FScreenX, FScreenY)
  else
  begin
    FScreenX := Round(FMapX);
    FScreenY := Round(FMapY);
  end;
end;

procedure TRadarTargetSymbol.ConvertCoord;
begin
  UpdateScreenPos;
end;

function TRadarTargetSymbol.GetBounds(ACanvas: TCanvas): TRect;
var
  w, h, r: Integer;
  s: UnicodeString;
begin
  UpdateScreenPos;

  // Jika tidak ada Canvas, pakai cache terakhir (kalau ada)
  if ACanvas = nil then
  begin
    if not IsRectEmpty(FLastBounds) then
      Exit(FLastBounds);

    // Fallback estimasi awal (sebelum pernah di-Draw):
    if FUseBitmap and (FBitmap.Width > 0) and (FBitmap.Height > 0) then
    begin
      w := FBitmap.Width; h := FBitmap.Height;
      Result := Rect(FScreenX - w div 2, FScreenY - h div 2,
                     FScreenX + w div 2, FScreenY + h div 2);
    end
    else if FUseFont then
    begin
      // Estimasi kasar jika belum pernah diukur:
      // lebar ≈ 0.6*FontSize, tinggi ≈ 1.2*FontSize
      w := Max(6, Round(0.6 * FFontSize));
      h := Max(6, Round(1.2 * FFontSize));
      Result := Rect(FScreenX - w div 2, FScreenY - h div 2,
                     FScreenX + w div 2, FScreenY + h div 2);
    end
    else
    begin
      r := Max(2, FCircleRadius);
      Result := Rect(FScreenX - r, FScreenY - r,
                     FScreenX + r, FScreenY + r);
    end;

    InflateRect(Result, 2, 2);
    Exit;
  end;

  // ------ Mode dengan Canvas (ukur akurat) ------
  if FUseBitmap and (FBitmap.Width > 0) and (FBitmap.Height > 0) then
  begin
    w := FBitmap.Width; h := FBitmap.Height;
    Result := Rect(FScreenX - w div 2, FScreenY - h div 2,
                   FScreenX + w div 2, FScreenY + h div 2);
  end
  else if FUseFont then
  begin
    ACanvas.Font.Name := FFontName;
    ACanvas.Font.Size := FFontSize;
    s := FFontChar;
    w := ACanvas.TextWidth(s);
    h := ACanvas.TextHeight(s);
    Result := Rect(FScreenX - w div 2, FScreenY - h div 2,
                   FScreenX + w div 2, FScreenY + h div 2);
  end
  else
  begin
    r := Max(2, FCircleRadius);
    Result := Rect(FScreenX - r, FScreenY - r,
                   FScreenX + r, FScreenY + r);
  end;

  InflateRect(Result, 2, 2);
end;



function TRadarTargetSymbol.HitTest(ACanvas: TCanvas; X, Y: Integer): Boolean;
var
  R: TRect;
begin
  R := GetBounds(ACanvas);
  Result := PtInRect(R, Point(X, Y));
end;

procedure TRadarTargetSymbol.Draw(ACanvas: TCanvas);
var
  R: TRect;
  col: TColor;
  s: UnicodeString;
  w, h, rad: Integer;
  txtX, txtY: Integer;
  work : TBitmap;
begin
  if not FVisible then Exit;

  UpdateScreenPos;

  // hitung bounds simbol (untuk label & kotak select)
  R := GetBounds(ACanvas);
  FLastBounds := R; // <-- cache untuk SelectAt tanpa Canvas

  // ====== gambar simbol ======

  if FUseBitmap and (FBitmap.Width > 0) and (FBitmap.Height > 0) then
  begin
//    ACanvas.Draw(
//      FScreenX - FBitmap.Width div 2,
//      FScreenY - FBitmap.Height div 2,
//      FBitmap
//    );
//
//    if (FBitmapTintColor <> clNone) and (FBitmapTintAlpha > 0) then
//      TintBitmap(FBitmap, FBitmapTintColor, FBitmapTintAlpha);

// buat salinan kerja agar sumber asli tidak berubah
    Work := TBitmap.Create;
    try
      Work.Assign(FBitmap);
      Work.PixelFormat := pf32bit;

      // Warnai semua hitam → FBitmapTintColor, selain hitam transparan
      // (atur toleransi sesuai ikonmu; 8–16 biasanya pas untuk anti-alias)
      TintBlackAndMakeOthersTransparent(Work, FBitmapTintColor, 12);

      // Gambar dengan per-pixel alpha
      DrawBitmapWithAlpha(ACanvas,
        FScreenX - Work.Width div 2,
        FScreenY - Work.Height div 2,
        Work);

//      // contoh pewarnaan: kuning saat selected, hijau saat normal
//      if FSelected then
//        TintBlackPixelsOnly_NoAlphaSkip(Work, clYellow, 56, 255, True)
//      else
//        TintBlackPixelsOnly_NoAlphaSkip(Work, FBitmapTintColor,   56, FBitmapTintAlpha, True);

//      ACanvas.Draw(
//        FScreenX - Work.Width div 2,
//        FScreenY - Work.Height div 2,
//        Work
//      );
    finally
      Work.Free;
    end;
  end
  else if FUseFont then
  begin
    if FSelected then
      col := FFontColorSelected
    else
      col := FFontColorNormal;

    ACanvas.Brush.Style := bsClear;
    ACanvas.Font.Name   := FFontName;
    ACanvas.Font.Size   := FFontSize;
    ACanvas.Font.Color  := col;

    s := FFontChar;
    w := ACanvas.TextWidth(s);
    h := ACanvas.TextHeight(s);

    ACanvas.TextOut(
      FScreenX - w div 2,
      FScreenY - h div 2,
      s
    );
  end
  else
  begin
    // fallback: bulatan kecil
    if FSelected then
      col := FCircleColorSelected
    else
      col := FCircleColorNormal;

    rad := FCircleRadius;
    if rad < 2 then rad := 2;

    ACanvas.Brush.Style := bsSolid;
    ACanvas.Brush.Color := col;
    ACanvas.Pen.Style   := psSolid;
    ACanvas.Pen.Color   := col;

    ACanvas.Ellipse(
      FScreenX - rad, FScreenY - rad,
      FScreenX + rad, FScreenY + rad
    );
  end;

  // ====== track number di atas simbol ======
  if FTrackLabel <> '' then
  begin
    ACanvas.Brush.Style := bsClear;
    ACanvas.Font.Name   := 'Segoe UI';
    ACanvas.Font.Size   := FTrackFontSize;
    ACanvas.Font.Color  := FTrackFontColor;

    w := ACanvas.TextWidth(FTrackLabel);
    h := ACanvas.TextHeight(FTrackLabel);

    // posisikan di atas kotak simbol (pakai R.Top sebagai referensi)
    txtX := FScreenX - (w div 2);
    txtY := R.Top - h - 1;

    ACanvas.TextOut(txtX, txtY, FTrackLabel);
  end;

  // ====== kotak seleksi putih di sekitar simbol ======
  if FSelected then
  begin
    ACanvas.Brush.Style := bsClear;
    ACanvas.Pen.Style   := psSolid;
    ACanvas.Pen.Color   := clWhite;
    ACanvas.Rectangle(R);
  end;
end;

{ TRadarTargetManager }

constructor TRadarTargetManager.Create;
begin
  inherited Create;
  FList := TList.Create;
  FConv := nil;
end;

destructor TRadarTargetManager.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TRadarTargetManager.Count: Integer;
begin
  Result := FList.Count;
end;

function TRadarTargetManager.Items(Index: Integer): TRadarTargetSymbol;
begin
  Result := TRadarTargetSymbol(FList[Index]);
end;

function TRadarTargetManager.AddTarget(AMapX, AMapY: Double): TRadarTargetSymbol;
begin
  Result := TRadarTargetSymbol.Create;
  Result.MapX := AMapX;
  Result.MapY := AMapY;
  Result.CoordConverter := FConv;
  FList.Add(Result);
end;

procedure TRadarTargetManager.RemoveTarget(ATarget: TRadarTargetSymbol);
begin
  if FList.Remove(ATarget) <> -1 then
    ATarget.Free;
end;

procedure TRadarTargetManager.Clear;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    TObject(FList[i]).Free;
  FList.Clear;
end;

procedure TRadarTargetManager.DeselectAll;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    TRadarTargetSymbol(FList[i]).Selected := False;
end;

procedure TRadarTargetManager.Draw(ACanvas: TCanvas);
var
  i: Integer;
  T: TRadarTargetSymbol;
begin
  for i := 0 to FList.Count - 1 do
  begin
    T := TRadarTargetSymbol(FList[i]);
    T.CoordConverter := FConv;
    T.Draw(ACanvas);
  end;
end;

function TRadarTargetManager.SelectAt(X, Y: Integer): TRadarTargetSymbol;
var
  i: Integer;
  T, Hit: TRadarTargetSymbol;
  R : TRect;
begin
  Hit := nil;

  // Loop mundur: prioritas target terakhir digambar (di atas)
  for i := FList.Count - 1 downto 0 do
  begin
    T := TRadarTargetSymbol(FList[i]);
    if T.Visible then
    begin
      // pakai bounding rect hit-test tanpa canvas
      T.ConvertCoord;
      R := T.GetBounds(nil); // nil karena pakai data internal

//      if Assigned(R) then
//      begin
          if PtInRect(R, Point(X, Y)) then
          begin
            Hit := T;
            Break;
          end;
//      end;
    end;
  end;

  // update flag selected
  for i := 0 to FList.Count - 1 do
  begin
    T := TRadarTargetSymbol(FList[i]);
    T.Selected := (T = Hit);
  end;

  Result := Hit;
end;


end.

