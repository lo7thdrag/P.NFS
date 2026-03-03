unit uBaseFunctionSutBlackshark;

interface
  uses
    Classes, Windows, Math, uBaseConst, Graphics, uCoordDataTypes, System.SysUtils;
  type
    TBGRA = packed record
      b, g, r, a: Byte;
    end;

  procedure TransAlphaBlend(aCnv: TCanvas; aBmpBG, aBmp: TBitmap;
    const x, y: integer; clTrans: TColor; aVal: Byte);
  procedure ChangeBitmapIndex(Bmp: TBitmap; const oldClr, newClr: TColor);
  procedure TranslatePoint(const ct: TPoint; var pt: TPoint);

  procedure InitOleVariant(var TheVar:OleVariant);

  function BlendPixel32(const p1, p2: TColor; const a: Byte): TColor;
  function RoundPoint(const d: t2DPoint): TPoint;

  function CalcBearing(const x1, y1, x2, y2: double): Double;
  function CalcRange(const x1, y1, x2, y2: double):Double;
  function CalcElevation(const r, z1, z2: double): double;

  function ValidateDegree(const aDegree: double): double;
  function ConvCartesian_To_Compass(const degree: double): double ;
  function ConvCompass_To_Cartesian(const degree: double): double;

  function ConvCustomAngleStart(const degree,startAngle: Double):Double;
  function ConvCoordPolar_To_Cartesian(const aAngleRadian, aRadius: Double)
    : t2DPoint;
  procedure SendKey(const VK: WORD);
  function ExtractToken(const Btn: string): string;

  function ComputeBallisticAngleVacuum(const RangeX, DeltaHeight, V0: Double;
    out AngleLowDeg, AngleHighDeg: Double): Boolean;

implementation
  //==============================================================================
  procedure InitOleVariant(var TheVar:OleVariant);
  begin
    TVarData(TheVar).vType:=varError;
    TVarData(TheVar).vError:=  DISP_E_PARAMNOTFOUND;
  end;

  //==============================================================================
  function ConvCartesian_To_Compass(const degree: double): double ;
  begin
    // input : derajat (0..360) dari sumbu X, CCW, cartesian
    // output: derajat (0..360) dari utara,   CW, kompas

     result := 90.0 - degree;
     if result < 0.0 then result := result + 360.0;
  end;

  //==============================================================================
  function ConvCompass_To_Cartesian(const degree: double): double;
  begin
    result := ValidateDegree(90.0 - degree);
  end;

  //==============================================================================
  function ValidateDegree(const aDegree: double): double;
  begin
    result := aDegree - (Floor(aDegree / 360.0) * 360.0);
  end;

  //==============================================================================
  function ConvCustomAngleStart(const degree,startAngle: Double):Double;
  begin
    result := startAngle - degree;
    if result < 0.0 then result := result + 360.0;
  end;

  //==============================================================================
  function CalcBearing(const x1, y1, x2, y2: double): Double;
  var dx, dy, bearing: Extended;
  begin
    { input dec degree, output Compass Coord }
    dx := (x2 - x1);
    dy := (y2 - y1);
    bearing := C_RadToDeg * ArcTan2(dy, dx);
    result  := ConvCartesian_To_Compass(bearing);
  end;
  function CalcElevation(const r, z1, z2: double): double;
  begin
   { input apapun asal sama } //untested;
   { return positif if z2 > z1 }
    result := C_RadToDeg * ArcTan2(z2-z1, r );
  end;
  function CalcRange(const x1, y1, x2, y2: double):Double;
  var dx, dy : Extended;
  begin
   {input dec degree, output nautical mile, }
    dx := (x2 - x1) * C_Degree_To_NauticalMile;
    dy := (y2 - y1) * C_Degree_To_NauticalMile;

    result := sqrt(sqr(dx) + sqr(dy));
  end;

  //==============================================================================
  procedure TransAlphaBlend(aCnv: TCanvas; aBmpBG, aBmp: TBitmap;
  const x, y: integer; clTrans: TColor; aVal: Byte);
  type
    PDWordArray = ^TDWordArray;
    TDWordArray = array [0 .. 255] of LongWord;
    // bitmap larger than 256 width is not supported;
  var
    i, j, iMax, jMax: integer;
    rB, rC: TRect;
    lBG, lBMP: PDWordArray;
  begin
    aBmp.PixelFormat := pf32bit;
    aBmpBG.PixelFormat := pf32bit;
    aBmpBG.Width := aBmp.Width div 2;
    aBmpBG.Height := aBmp.Height div 2;

    rC := Rect(x, y, x + aBmp.Width div 2, y + aBmp.Height div 2);
    rB := Rect(0, 0, aBmp.Width div 2, aBmp.Height div 2);

    aBmpBG.Canvas.CopyRect(rB, aCnv, rC);
    if aBmp.Height div 2 > 255 then
      jMax := 255
    else
      jMax := (aBmp.Height div 2) - 1;

    if aBmp.Height div 2 > 255 then
      iMax := 255
    else
      iMax := (aBmp.Width div 2) - 1;

    for j := 0 to jMax do
    begin
      lBG := aBmpBG.ScanLine[j];
      lBMP := aBmp.ScanLine[j];

      for i := 0 to iMax do
        if lBMP[i] <> clTrans then
          lBG[i] := BlendPixel32(lBG[i], lBMP[i], aVal);

    end;
    aCnv.Draw(x, y, aBmpBG);
  end;

  //==============================================================================
  function BlendPixel32(const p1, p2: TColor; const a: Byte): TColor;
  var
    minA: Byte;
    r1, r2, r3: ^TBGRA;
  begin
    r1 := @p1;
    r2 := @p2;
    minA := 255 - a;
    r3 := @result;
    r3.a := 0;
    r3.b := (r1^.b * minA + r2^.b * a) div 256;
    r3.g := (r1^.g * minA + r2^.g * a) div 256;
    r3.r := (r1^.r * minA + r2^.r * a) div 256;
  end;

  //==============================================================================
  // bitmap manipulation function
  procedure ChangeBitmapIndex(Bmp: TBitmap; const oldClr, newClr: TColor);
  // works only with 256 color bitmap..
  type
    TArrayByte = array [0 .. 255] of Byte;
    PAByte = ^TArrayByte;
  var
    i, j: integer;
    pB: PAByte;
    hPal: HPALETTE;
    oClr, nClr: Byte;
  begin
    Bmp.PixelFormat := pf8bit;
    hPal := Bmp.Palette;

    oClr := GetNearestPaletteIndex(hPal, oldClr);
    nClr := GetNearestPaletteIndex(hPal, newClr);

    for j := 0 to Bmp.Height - 1 do
    begin
      pB := Bmp.ScanLine[j];
      for i := 0 to Bmp.Width - 1 do
      begin
        if pB[i] = oClr then
          pB[i] := nClr
      end;
    end;
  end;

  function RoundPoint(const d: t2DPoint): TPoint;
  begin
    result.X := Round(d.X);
    result.Y := Round(d.Y);
  end;

  function ConvCoordPolar_To_Cartesian(const aAngleRadian, aRadius: Double)
    : t2DPoint;
  begin
    result.X := aRadius * Cos(aAngleRadian);
    result.Y := aRadius * Sin(aAngleRadian);
  end;

  procedure TranslatePoint(const ct: TPoint; var pt: TPoint);
  begin
    pt.X := ct.X + pt.X;
    pt.Y := ct.Y - pt.Y;
  end;


  // -----------------------------------------------------------
// Kirim event keyboard (modern, SendInput)
// -----------------------------------------------------------
procedure SendKey(const VK: WORD);
var
  Input: TInput;
begin
  ZeroMemory(@Input, SizeOf(Input));
  Input.Itype := INPUT_KEYBOARD;
  Input.ki.wVk := VK;
  Input.ki.dwFlags := 0; // key down
  SendInput(1, Input, SizeOf(Input));

  ZeroMemory(@Input, SizeOf(Input));
  Input.Itype := INPUT_KEYBOARD;
  Input.ki.wVk := VK;
  Input.ki.dwFlags := KEYEVENTF_KEYUP; // key up
  SendInput(1, Input, SizeOf(Input));
end;

// -----------------------------------------------------------
// Ambil data setelah prefix: btn_NXXXXX
// -----------------------------------------------------------
function ExtractToken(const Btn: string): string;
begin
  // Format tombol: btn_NS, btn_N7, btn_NEnter, dst
  if Btn.StartsWith('btn_N') then
    Result := Btn.Substring(5)  // ambil setelah 'btn_N'
  else if Btn.StartsWith('btn_') then
    Result := Btn.Substring(4)  // ambil setelah 'btn_'
  else
    Result := Btn;
end;


function ComputeBallisticAngleVacuum(const RangeX, DeltaHeight, V0: Double;
  out AngleLowDeg, AngleHighDeg: Double): Boolean;
var
  g, x, y, v2, v4, D, tanLow, tanHigh: Double;
begin
  Result := False;
  AngleLowDeg := 0;
  AngleHighDeg := 0;

  g := 9.80665;
  x := RangeX;
  y := DeltaHeight;

  if (V0 <= 0) or (x <= 0) then
    Exit;

  v2 := Sqr(V0);
  v4 := v2 * v2;

  D := v4 - g * (g * Sqr(x) + 2 * y * v2);
  if D < 0 then Exit;

  D := Sqrt(D);

  tanLow  := (v2 - D) / (g * x);
  tanHigh := (v2 + D) / (g * x);

  AngleLowDeg  := RadToDeg(ArcTan(tanLow));
  AngleHighDeg := RadToDeg(ArcTan(tanHigh));

  Result := True;
end;
end.
