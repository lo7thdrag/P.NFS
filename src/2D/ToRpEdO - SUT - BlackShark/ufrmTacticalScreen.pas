unit ufrmTacticalScreen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, uVehicle, RzButton, RzRadChk,
  uSutBlacksharkManager, uVehicleManager, uSettingFormToMonitorWith_ini,
  uFormUtil, UfrmRadar, ufrmOwnShip, ufrmAlertandOpearatorMassage,
  ufmTargetInControl, uBaseFunction, ufrmTorpedoAllocation, ufrmSystemStatus,
  ufrmSystemInfo, ufrmCursor, uLibConst, uBaseConst, Vcl.OleCtrls, MapXLib_TLB,
  AdvCombo, ImageButton;

//const
//  MAX_TARGET = 50;

type
  TSonarTarget = record
    Bearing: Double;
    Speed: Double;
    Strength: Integer;
  end;

  TFrmTacticalScreen = class(TForm)
    pnlBase: TPanel;
    pnlUpperInfo: TPanel;
    pnlOwnShip: TPanel;
    pnlAlert: TPanel;
    pnlSystemStatus: TPanel;
    pnlOperatorMessages: TPanel;
    pnlRight: TPanel;
    pnlSystemInfo: TPanel;
    pnlObjectInControl: TPanel;
    pnlToolArea: TPanel;
    pnlCursor: TPanel;
    pnlTPGroup: TPanel;
    pnlTacticalPicture: TPanel;
    tmrUpdateTP: TTimer;
    FMapTP: TMap;
    pnlGeo: TPanel;
    ibBoxedZoom: TImageButton;
    ibGrab: TImageButton;
    lblZoomScaleSat: TLabel;
    ibZoomIn: TImageButton;
    ibZoomOut: TImageButton;
    lblMapFilter: TLabel;
    lblOwnShipCenter: TLabel;
    lblCursorCenter: TLabel;
    btnZoomIn: TButton;
    btnZoomOut: TButton;
    cbbZoomScale: TAdvComboBox;
    cbbMotionMode: TAdvComboBox;
    procedure FormCreate(Sender: TObject);
    procedure tmrUpdateTPTimer(Sender: TObject);
    procedure FMapTPDrawUserLayer(ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure FMapTPMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbbZoomScaleChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    BearingCount: Integer;
    FFrmRadar: TFrmRadar;

    FFrmOwnShipTS: TfrmOwnShip;
    FFrmAlertandOpearatorMassageTS: TfrmAlertsandOpearatorMassage;
    FFrmTargetInControlTS: TfrmTargetInControl;
    FFrmSystemStatus: TfrmSystemStatus;

    FFrmTorpedoAllocation: TfrmTorpedoAllocation;
    FFrmSystemInfo: TfrmSystemInfo;
    FFrmCursor: TfrmCursor;
    FMapCanvas: TCanvas;
    FCursorX, FCursorY: Double;
    FLyrDraw: CMapXLayer;

    MemBmp: TBitmap;
    MapRect: TRect;

    procedure UpdateRadarDisplay;
    procedure SetLayoutForm;
    procedure UpdateAttachFormDisplay;
    procedure DrawTicksDegree(aCnv: TCanvas);
    procedure Render(aCnv: TCanvas);
    function Rotate(Width, Height, Radius: Integer; Degrees: Double): Winapi.Windows.TPoint;
    procedure DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer; Color: TColor; Width: Integer);
    procedure LoadGeoset(const aGst: string); virtual;
    { Public declarations }
  end;

var
  frmTacticalScreen: TFrmTacticalScreen;

implementation

uses
  ufrmTorpedoWP;

{$R *.dfm}

procedure EnableComposited(WinControl: TWinControl);
var
  i: Integer;
  NewExStyle: DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for i := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

procedure TFrmTacticalScreen.cbbZoomScaleChange(Sender: TObject);
var zoomScale : single;
begin
  zoomScale := StrToFloat(cbbZoomScale.Text);
  FMapTP.ZoomTo(3.7025 * zoomScale, FMapTP.CenterX, FMapTP.CenterY);
end;

procedure TFrmTacticalScreen.DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer; Color: TColor; Width: Integer);
begin
  Canvas.Pen.Color := Color;
  Canvas.Pen.Width := Width;
  Canvas.MoveTo(X1, Y1);
  Canvas.LineTo(X2, Y2);
end;

procedure TFrmTacticalScreen.DrawTicksDegree(aCnv: TCanvas);
var
  I, Size, Enlarge, StartAngle, AngleRadius: Integer;
  ticksMax, ticks, ticksEnlarge, ticksMin: integer;
  labels, decimals, labelsoffset: integer;
  Angle, AngleOffset, BaseAngle: integer;
  Increment, Degrees, CurValue, IncValue: Double;
  R: TRect;
  P1, P2: Winapi.Windows.TPoint;
  Mask, StrValue: string;
  ticksColor: TColor;
  labelsfont: TFont;
  left, top, right, bottom: Integer;
  diffBeetwinWH: Integer;  //differnt beetwin width and height width - height, kemudian dibagi dua sebagai batas left dan right,supaya lingkarannya tetap center.
begin
  Angle := 0;
  BaseAngle := round(CBaseAngle);
  AngleOffset := round(CBaseAngle);
  StartAngle := BaseAngle + Angle;
  diffBeetwinWH := (FMapTP.Width - FMapTP.Height) div 2;

  top := 50;
  bottom := FMapTP.Height - top;
  left := diffBeetwinWH + top;
  right := FMapTP.Width - left;

  //draw ticks:
  aCnv.Pen.Color := CForegroundColor;

  aCnv.Brush.Style := bsClear;
//    R := Rect(0,0, Map.Width, Map.Height);
  R := Rect(left, top, right, bottom);
  AngleRadius := (R.right - R.left) div 2;
//    AngleRadius := 280;
  ticksMax := -9;
  ticks := round(36);
  ticksEnlarge := 5;
  ticksMin := 8;
  ticksColor := clWhite;
  labels := 24;
  decimals := 0;
  labelsoffset := -20;

  {jarum derajat}

  if ticks >= 1 then
  begin
    Enlarge := ticksEnlarge;
    Degrees := StartAngle;
    Increment := AngleOffset / ticks;
    aCnv.Pen.Style := psSolid;
    aCnv.Pen.Color := clWhite;
    aCnv.Pen.Width := 2;
    aCnv.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
    for I := 1 to ticks + 1 do
    begin
//        if (Enlarge mod TicksEnlarge = 0) then
//          Size := TicksMax else Size := TicksMin;
      Size := ticksMax;
      Inc(Enlarge);
      P1 := Rotate(FMapTP.Width, FMapTP.Height, AngleRadius, Degrees);
      P2 := Rotate(FMapTP.Width, FMapTP.Height, AngleRadius + Size, Degrees);
      DrawLine(aCnv, P1.X, P1.Y, P2.X, P2.Y, ticksColor, 2);
      Degrees := Degrees + Increment;
    end;
  end;

  {angka}
  labelsfont := TFont.Create();
  try
    labelsfont.Color := clWhite;
    labelsfont.Size := 10;

    if labels >= 1 then
    begin
      aCnv.Font := labelsfont;
      CurValue := 0;
      IncValue := (360 - 0) / labels;
      Degrees := StartAngle;
      Increment := AngleOffset / labels;
//      Mask := '%.' + IntToStr(Decimals) + 'f';
      Mask := '000';
      for I := 1 to labels do
      begin
        P1 := Rotate(FMapTP.Width, FMapTP.Height, AngleRadius + labelsoffset, Degrees);
        if round(CurValue) mod 30 = 0 then
        begin
          if CurValue > 180 then
            StrValue := FormatFloat(Mask, CurValue {- 360} ) {+ '°'}
          else
            StrValue := FormatFloat(Mask, CurValue) {+ '°'};

          P1.X := P1.X - aCnv.TextWidth(StrValue) div 2;
          P1.Y := P1.Y - aCnv.TextHeight(StrValue) div 2;
          aCnv.TextOut(P1.X, P1.Y, StrValue);
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue * I);
        end
        else
        begin
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue * I);
        end;
      end;
    end;
  finally
    labelsfont.Free;
  end;
end;

procedure TFrmTacticalScreen.FMapTPDrawUserLayer(ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
var
  CrsrX, CrsrY: Single;
//  MemBmp: TBitmap;
//  MapRect: TRect;
begin
  FMapCanvas.Handle := hOutputDC;

//  MemBmp:= TBitmap.Create;
  try
//    MapRect:= Rect(0, 0, FMapTP.Width, FMapTP.Height);
//    MemBmp.Width:= MapRect.Width;
//    MemBmp.Height:= MapRect.Height;
//    MemBmp.PixelFormat:= pf32bit;
    MemBmp.Canvas.CopyRect(MapRect, FMapCanvas, MapRect);

    if FCursorX <> 0 then
    begin
      MemBmp.Canvas.Pen.Color := clWhite;
      MemBmp.Canvas.Pen.Style := psSolid;
      MemBmp.Canvas.Pen.Width := 1;

      MemBmp.Canvas.Brush.Color := clWhite;
      MemBmp.Canvas.Brush.Style := bsSolid;
      FMapTP.ConvertCoord(CrsrX, CrsrY, FCursorX, FCursorY, 0);

      MemBmp.Canvas.Rectangle(Round(CrsrX) - 1, Round(CrsrY) - 15, Round(CrsrX) + 1, Round(CrsrY) - 4); // cursor bagian atas
      MemBmp.Canvas.Rectangle(Round(CrsrX) - 1, Round(CrsrY) + 15, Round(CrsrX) + 1, Round(CrsrY) + 4); // cursor bagian bawah

      MemBmp.Canvas.Rectangle(Round(CrsrX) - 15, Round(CrsrY) - 1, Round(CrsrX) - 4, Round(CrsrY) + 1); // cursor bagian kiri
      MemBmp.Canvas.Rectangle(Round(CrsrX) + 4, Round(CrsrY) - 1, Round(CrsrX) + 15, Round(CrsrY) + 1); // cursor bagian kanan

//      FMapCanvas.Pen.Color := clWhite;
//      FMapCanvas.Pen.Style := psSolid;
//      FMapCanvas.Pen.Width := 1;
//
//      FMapCanvas.Brush.Color := clWhite;
//      FMapCanvas.Brush.Style := bsSolid;
//      FMapTP.ConvertCoord(CrsrX, CrsrY, FCursorX, FCursorY, 0);
//
//      FMapCanvas.Rectangle(Round(CrsrX) - 1, Round(CrsrY) - 15, Round(CrsrX) + 1, Round(CrsrY) - 4); // cursor bagian atas
//      FMapCanvas.Rectangle(Round(CrsrX) - 1, Round(CrsrY) + 15, Round(CrsrX) + 1, Round(CrsrY) + 4); // cursor bagian bawah
//
//      FMapCanvas.Rectangle(Round(CrsrX) - 15, Round(CrsrY) - 1, Round(CrsrX) - 4, Round(CrsrY) + 1); // cursor bagian kiri
//      FMapCanvas.Rectangle(Round(CrsrX) + 4, Round(CrsrY) - 1, Round(CrsrX) + 15, Round(CrsrY) + 1); // cursor bagian kanan
    end;

    DrawTicksDegree(MemBmp.Canvas);
    Render(MemBmp.Canvas);

    BitBlt(FMapCanvas.Handle, 0, 0, FMapTP.Width, FMapTP.Height,
      MemBmp.Canvas.Handle, 0, 0, SRCCOPY);
  finally
//    MemBmp.Free
  end;
end;

procedure TFrmTacticalScreen.FMapTPMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  posX, posY: Single;
begin
  // create cursor dan gambar cursor, juga kirim posisi cursor ke blackshark manager buat di set di form cursor
  posX := X;
  posY := Y;
  FMapTP.ConvertCoord(posX, posY, FCursorX, FCursorY, 1); // 1 berarti ngisi ke kanan (geo), 0 berarti ngisi ke kiri(screen)
  SutBlacksharkManager.CursorX := fcursorX;
  SutBlacksharkManager.CursorY := FCursorY;
end;

procedure TFrmTacticalScreen.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  MemBmp:= TBitmap.Create;
  MapRect:= Rect(0, 0, FMapTP.Width, FMapTP.Height);
  MemBmp.Width:= MapRect.Width;
  MemBmp.Height:= MapRect.Height;
  MemBmp.PixelFormat:= pf32bit;

  SetLayoutForm;
  UpdateAttachFormDisplay;
//  frmTacticalScreen.DoubleBuffered := false;

  FMapCanvas := TCanvas.Create;
  LoadGeoset('..\data\maps\IndonesiaBlackShark.gst');
  EnableComposited(pnlTacticalPicture);
  pnlTacticalPicture.DoubleBuffered := False;
  FMapTP.DoubleBuffered := false;

//  pnlBase.DoubleBuffered := False;
//  pnlTPGroup.DoubleBuffered := False;
//  pnlTacticalPicture.DoubleBuffered := False;
end;

procedure TFrmTacticalScreen.FormDestroy(Sender: TObject);
begin
  MemBmp.Free;
end;

procedure TFrmTacticalScreen.LoadGeoset(const aGst: string);
var
  i: integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  InitOleVariant(z);
  FMapTP.Layers.RemoveAll;

  if (aGst <> '') and FileExists(aGst) then
  begin
    FMapTP.Geoset := aGst;
    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'Animation');
    FLyrDraw := FMapTP.Layers.Add(mInfo, 1);
    FMapTP.Layers.AnimationLayer := FLyrDraw;
    FMapTP.BackColor := $000000000;
    FMapTP.MapUnit := miUnitNauticalMile;
    FMapTP.CenterX := 112.75;
    FMapTP.CenterY := -7.2;
    FMapTP.ZoomTo(3.7025 * 8, FMapTP.CenterX, FMapTP.CenterY); // 8 Mile circle radius
  end
end;

procedure TFrmTacticalScreen.Render(aCnv: TCanvas);
var
  i: Integer;
  Ship, OwnShip: TVehicle;
  MapX, MapY: Double;
  ScrX, ScrY: Single;
begin
  OwnShip := nil;
  for i := 0 to VehicleMgr.ObjectList.Count - 1 do
  begin
    if TVehicle(VehicleMgr.ObjectList[i]).ShipID = 0 then
    begin
      OwnShip := TVehicle(VehicleMgr.ObjectList[i]);
      FMapTP.CenterX := OwnShip.PosX;
      FMapTP.CenterY := OwnShip.PosY;

      MapX := OwnShip.PosX;
      MapY := OwnShip.PosY;

      FMapTP.ConvertCoord(ScrX, ScrY, MapX, MapY, 0);

      aCnv.Pen.Color := RGB(107, 157, 173);
      aCnv.Pen.Style := psSolid;
      aCnv.Pen.Width := 2;
      aCnv.Brush.Color := RGB(107, 157, 173);
      aCnv.Brush.Style := bsClear;
      aCnv.Ellipse(Round(ScrX) - 8, Round(ScrY) - 8, Round(ScrX) + 8, Round(ScrY) + 8);

      aCnv.MoveTo(Round(ScrX) - 8, Round(ScrY));
      aCnv.LineTo(Round(ScrX) + 8, Round(ScrY));

      aCnv.MoveTo(Round(ScrX), Round(ScrY) - 8);
      aCnv.LineTo(Round(ScrX), Round(ScrY) + 8);
//      Break;
//      Continue;
    end
    else
    begin
      Ship := TVehicle(VehicleMgr.ObjectList[i]);

      MapX := Ship.PosX;
      MapY := Ship.PosY;

      FMapTP.ConvertCoord(ScrX, ScrY, MapX, MapY, 0);

      aCnv.Pen.Color := clBlack;
      aCnv.Pen.Style := psClear;
      aCnv.Pen.Width := 1;

      aCnv.Brush.Color := RGB(243, 235, 118);
      aCnv.Brush.Style := bsSolid;
      if Ship.Domain = 1 then
      begin
        aCnv.Ellipse(Round(ScrX) - 10, Round(ScrY) - 5, Round(ScrX) + 10, Round(ScrY) + 5);
        aCnv.Ellipse(Round(ScrX) - 5, Round(ScrY) - 10, Round(ScrX) + 5, Round(ScrY) + 10);
      end
      else if Ship.Domain = 3 then
      begin
        aCnv.Ellipse(Round(ScrX) - 10, Round(ScrY) - 5, Round(ScrX) + 10, Round(ScrY) + 5);
        aCnv.Ellipse(Round(ScrX) - 5, Round(ScrY) - 5, Round(ScrX) + 5, Round(ScrY) + 10);
      end;

      aCnv.Pen.Style := psSolid;
      aCnv.Pen.Width := 1;
      aCnv.Brush.Style := bsClear;
      aCnv.Pen.Color := clGray;

      aCnv.TextOut(Round(ScrX)+5, Round(ScrY)+5, Format('%.4d',[Ship.ShipID])); // perlu diganti dengan ID object
//      Continue;
//      Break;
    end;
  end;
end;

function TFrmTacticalScreen.Rotate(Width, Height, Radius: Integer; Degrees: Double): Winapi.Windows.TPoint;
var
  Angle: Double;
  W, H: Integer;
//  HeadingView : THeadingRadarView;
begin
  Angle := ConvCartesian_To_Compass(Degrees) * C_DegToRad;

  W := Width div 2;
  H := Height div 2;
  Result.X := W + Round(Cos(Angle) * Radius);
  Result.Y := H + Round(Sin(Angle) * Radius);
  Result.Y := (H * 2) - Result.Y;
end;

procedure TFrmTacticalScreen.SetLayoutForm;
var
  path: string;
  idxTactScreen, alTactScreen, xTactScreen, yTactScreen, idxTorpedoWP, alTorpedoWP, xTorpedoWP, yTorpedoWP, bdrPanelAtas, bdrPanelBawah, bdrTemp: Integer;
begin
  path := ExtractFilePath(Application.ExeName) + 'SetFormBlackSharkToMonitor.ini';

  Getsettingform(path, 'TACTICAL_SCREEN', idxTactScreen, alTactScreen, xTactScreen, yTactScreen);
  Getsettingform(path, 'TORPEDO_WP', idxTorpedoWP, alTorpedoWP, xTorpedoWP, yTorpedoWP);

// rojek
  AlignFormToMonitor(idxTactScreen, apLeftTop, xTactScreen, yTactScreen, TForm(frmTacticalScreen));
  AlignFormToMonitor(idxTorpedoWP, apLeftTop, xTorpedoWP, yTorpedoWP, TForm(frmTorpedoWP));
end;

procedure TFrmTacticalScreen.tmrUpdateTPTimer(Sender: TObject);
begin
  UpdateRadarDisplay;

  // get variable pada blackshark manager disini

end;

procedure TFrmTacticalScreen.UpdateAttachFormDisplay;
begin
  {$REGION 'Ownship Data'}
  if not Assigned(FFrmOwnShipTS) then
  begin
    FFrmOwnShipTS := TfrmOwnShip.Create(Self);
    FFrmOwnShipTS.Parent := pnlOwnShip;
    FFrmOwnShipTS.Align := alClient;
    FFrmOwnShipTS.Show;
  end;
  {$ENDREGION}

  {$REGION 'Alert and Operator Messages'}
  if not Assigned(FFrmAlertandOpearatorMassageTS) then
  begin
    FFrmAlertandOpearatorMassageTS := TfrmAlertsandOpearatorMassage.Create(Self);
    FFrmAlertandOpearatorMassageTS.Parent := pnlAlert;
    FFrmAlertandOpearatorMassageTS.Align := alClient;
    FFrmAlertandOpearatorMassageTS.Show;
  end;
  {$ENDREGION}

  {$REGION 'Target In Control'}
  if not Assigned(FFrmTargetInControltS) then
  begin
    FFrmTargetInControltS.Caption := '';

    FFrmTargetInControltS := TfrmTargetInControl.Create(Self);
    FFrmTargetInControltS.Parent := pnlObjectInControl;
    FFrmTargetInControltS.Align := alClient;
    FFrmTargetInControltS.Show;
  end;
  {$ENDREGION}

  {$REGION 'System Status'}
  if not Assigned(FFrmSystemStatus) then
  begin
    pnlSystemStatus.Caption := '';

    FFrmSystemStatus := TfrmSystemStatus.Create(Self);
    FFrmSystemStatus.Parent := pnlSystemStatus;
    FFrmSystemStatus.Align := alClient;
    FFrmSystemStatus.Show;
  end;
    {$ENDREGION}

    {$REGION 'System Info'}
  if not Assigned(FFrmSystemInfo) then
  begin
    pnlSystemInfo.Caption := '';

    FFrmSystemInfo := TfrmSystemInfo.Create(Self);
    FFrmSystemInfo.Parent := pnlSystemInfo;
    FFrmSystemInfo.Align := alClient;
    FFrmSystemInfo.Show;
  end;
    {$ENDREGION}

  {$REGION 'Cursor Position'}
  if not Assigned(FFrmCursor) then
  begin
    pnlCursor.Caption := '';

    FFrmCursor := TfrmCursor.Create(Self);
    FFrmCursor.Parent := pnlCursor;
    FFrmCursor.Align := alClient;
    FFrmCursor.Show;
  end;
  {$ENDREGION}
end;

procedure TFrmTacticalScreen.UpdateRadarDisplay;
begin
  if VehicleMgr.ObjectList <> nil then
  begin
//    if not Assigned(FFrmRadar) then begin
//      FFrmRadar := TfrmRadar.Create(Self);
//      FFrmRadar.Parent := pnlTacticalPicture;
//      FFrmRadar.Align := alClient;
//      FFrmRadar.Show;
//      EnableComposited(pnlTacticalPicture);
//    end;

    {$REGION 'Torpedo Allocation'}
    if SutBlacksharkManager.isTorpedoAllocShow then
    begin
      {$REGION 'Torpedo Allocation'}
      if not Assigned(FFrmTorpedoAllocation) then      // di create saat tombol TEP torp alloc
      begin
        FFrmTorpedoAllocation := TfrmTorpedoAllocation.Create(Self);
        FFrmTorpedoAllocation.Parent := pnlToolArea;
        FFrmTorpedoAllocation.Align := alClient;
        FFrmTorpedoAllocation.Show;
      end;
      {$ENDREGION}
    end
    else
    begin
      if Assigned(FFrmTorpedoAllocation) then
        FreeAndNil(FFrmTorpedoAllocation);
    end;
    {$ENDREGION}
    Exit;
  end;

end;

end.

