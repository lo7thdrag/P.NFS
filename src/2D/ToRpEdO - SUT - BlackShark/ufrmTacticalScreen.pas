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
  AdvCombo, ImageButton, uTransparentOverlay, uSimulationTrack, uSurfaceTrack, uSubSurfaceTrack, uTorpedoTrack;

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
    procedure FMapTPMapViewChanged(Sender: TObject);
    procedure pnlOperatorMessagesClick(Sender: TObject);
    procedure cbbMotionModeChange(Sender: TObject);
    procedure ibGrabClick(Sender: TObject);
    procedure lblCursorCenterClick(Sender: TObject);
    procedure lblOwnShipCenterClick(Sender: TObject);
    procedure ZoomClick(Sender: TObject);
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
//    FMapCanvas: TCanvas;
    FCursorX, FCursorY: Double;
    FLyrDraw: CMapXLayer;
    FTrueMotion, FEnableGrab: Boolean;

//    MemBmp: TBitmap;
//    MapRect: TRect;

    FOverlay : TTransparentOverlay;

    procedure UpdateRadarDisplay;
    procedure SetLayoutForm;
    procedure UpdateAttachFormDisplay;
    procedure DrawTicksDegree(aCnv: TCanvas);
    procedure Render(aCnv: TCanvas);
    function Rotate(Width, Height, Radius: Integer; Degrees: Double): Winapi.Windows.TPoint;
    procedure DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer; Color: TColor; Width: Integer);
    procedure LoadGeoset(const aGst: string); virtual;
    procedure PassMouseToMap(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y:Integer);

    procedure OverlayPaint(Sender: TObject; ACanvas: TCanvas);
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

procedure TFrmTacticalScreen.cbbMotionModeChange(Sender: TObject);
begin
  if cbbMotionMode.ItemIndex = 0 then
  begin
    FTrueMotion := True;
  end
  else if cbbMotionMode.ItemIndex = 1 then
  begin
    FTrueMotion := false;
    FMapTP.CurrentTool := miArrowTool;
    FOverlay.Cursor := crDefault;
  end;
end;

procedure TFrmTacticalScreen.cbbZoomScaleChange(Sender: TObject);
var zoomScale : single;
begin
  zoomScale := StrToFloat(cbbZoomScale.Text);
  FMapTP.ZoomTo(3.92 * zoomScale, FMapTP.CenterX, FMapTP.CenterY);
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
begin
//
end;

procedure TFrmTacticalScreen.FMapTPMapViewChanged(Sender: TObject);
begin
//  if Assigned(FOverlay) then
//  begin
//    FOverlay.Invalidate;
//  end;
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
//  MemBmp:= TBitmap.Create;
//  MapRect:= Rect(0, 0, FMapTP.Width, FMapTP.Height);
//  MemBmp.Width:= MapRect.Width;
//  MemBmp.Height:= MapRect.Height;
//  MemBmp.PixelFormat:= pf32bit;

  SetLayoutForm;
  UpdateAttachFormDisplay;
//  frmTacticalScreen.DoubleBuffered := false;

//  FMapCanvas := TCanvas.Create;
  LoadGeoset('..\data\maps\IndonesiaBlackShark.gst');

  pnlTacticalPicture.DoubleBuffered := False;
  FMapTP.DoubleBuffered := false;
  EnableComposited(pnlTacticalPicture);

  FMapTP.Align:= alClient;

  FOverlay := TTransparentOverlay.Create(Self);
  FOverlay.OnPaint:= OverlayPaint;
  FOverlay.Parent := pnlTacticalPicture;
  FOverlay.Align := alClient;
  FOverlay.BringToFront;
  FOverlay.OnMouseDownEvent := PassMouseToMap;
  FOverlay.OnMouseUpEvent := PassMouseToMap;

  FTrueMotion := false;
  FEnableGrab := false;
//  FOverlay.pa
//  pnlBase.DoubleBuffered := False;
//  pnlTPGroup.DoubleBuffered := False;
//  pnlTacticalPicture.DoubleBuffered := False;
end;

procedure TFrmTacticalScreen.FormDestroy(Sender: TObject);
begin
//  MemBmp.Free;
end;

procedure TFrmTacticalScreen.ibGrabClick(Sender: TObject);
begin
  if FTrueMotion then
  begin
    FEnableGrab := not FEnableGrab;
  end;

  if FEnableGrab then
  begin
//    FOverlay.ControlState := csPanning;
    FOverlay.Cursor := crHandPoint;
    FMapTP.CurrentTool := miPanTool;
  end
  else
  begin
    FMapTP.CurrentTool := miArrowTool;
    FOverlay.Cursor := crDefault;
  end;
end;

procedure TFrmTacticalScreen.lblCursorCenterClick(Sender: TObject);
begin
  if FTrueMotion then
  begin
    FMapTP.CenterX := SutBlacksharkManager.CursorX;
    FMapTP.CenterY := SutBlacksharkManager.CursorY;
  end;
end;

procedure TFrmTacticalScreen.lblOwnShipCenterClick(Sender: TObject);
begin
  if FTrueMotion then
  begin
    FMapTP.CenterX := SutBlacksharkManager.xShip.PositionX;
    FMapTP.CenterY := SutBlacksharkManager.xShip.PositionY;
  end;
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
    FMapTP.ZoomTo(3.92 * 8, FMapTP.CenterX, FMapTP.CenterY); // 8 Mile circle radius
  end
end;   

procedure TFrmTacticalScreen.PassMouseToMap(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
  Msg: UINT;
  Param : WPARAM;
begin
  if Button = mbLeft then Msg := WM_LBUTTONDOWN
  else Msg := WM_MOUSEMOVE;

  Param := 0;
  if Button = mbleft then Param := Param or MK_LBUTTON;

  POstMessage(FMapTP.Handle, Msg, Param, MakeLParam(X, Y))

end;

procedure TFrmTacticalScreen.pnlOperatorMessagesClick(Sender: TObject);
begin
  SutBlacksharkManager.OperatorMessages := '';
end;

procedure TFrmTacticalScreen.Render(aCnv: TCanvas);
var
  i: Integer;
  Ship, OwnShip: TSimulationTrack;
  MapX, MapY: Double;
  ScrX, ScrY: Single;
  TrkHstry : TTrackPoint;
  R1, R2, R3 : Integer;
  Polygn: array[0..3] of System.types.TPoint;
  PolySuspect: array[0..4] of System.types.TPoint;
begin
  OwnShip := nil;

  if VehicleMgr.ObjectList.Count>0 then
  
    for i := 0 to VehicleMgr.ObjectList.Count - 1 do
    begin
      if TSimulationTrack(VehicleMgr.ObjectList[i]).ShipID = UniqueID_To_dbID(SutBlacksharkManager.xShip.UniqueID) then
      begin
        OwnShip := TSimulationTrack(VehicleMgr.ObjectList[i]);

        OwnShip.HistorySaveCounter := OwnShip.HistorySaveCounter + 1;
        if OwnShip.HistorySaveCounter = OwnShip.HistoryCountToSave then
        begin
          OwnShip.HistorySaveCounter := 0;
          TrkHstry := TTrackPoint.Create;
          TrkHstry.PosX := OwnShip.PosX;
          TrkHstry.PosY := OwnShip.PosY;
          OwnShip.TrackHistory.Add(TrkHstry);
          if OwnShip.TrackHistory.Count > 20 then
          begin
//            TTrackPoint(OwnShip.TrackHistory[0]).Free;
            TObject(OwnShip.TrackHistory[0]).Free;
            OwnShip.TrackHistory.Delete(0);
          end;

        end;

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
        if VehicleMgr.ObjectList[i] is TTorpedoTrack then
        begin
          // gambar torpedo disini
        end

        else
        begin
          Ship := TSimulationTrack(VehicleMgr.ObjectList[i]);

          Ship.HistorySaveCounter := Ship.HistorySaveCounter + 1;
          if Ship.HistorySaveCounter = Ship.HistoryCountToSave then
          begin
            Ship.HistorySaveCounter := 0;
            TrkHstry := TTrackPoint.Create;
            TrkHstry.PosX := Ship.PosX;
            TrkHstry.PosY := Ship.PosY;
            Ship.TrackHistory.Add(TrkHstry);
            if Ship.TrackHistory.Count > 20 then
            begin
              TObject(Ship.TrackHistory[0]).Free;
              Ship.TrackHistory.Delete(0);
            end;

          end;

          MapX := Ship.PosX;
          MapY := Ship.PosY;

          FMapTP.ConvertCoord(ScrX, ScrY, MapX, MapY, 0);

          if Ship.Identity = tidUnknown then
          begin
            aCnv.Pen.Color := clBlack;
            aCnv.Pen.Style := psClear;
            aCnv.Pen.Width := 1;

            aCnv.Brush.Color := RGB(243, 235, 118); // kuning cerah
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
          end
          else if Ship.Identity = tidAssdFriend then
          begin
            aCnv.Pen.Color := clBlack;
            aCnv.Pen.Style := psClear;
            aCnv.Pen.Width := 1;

            aCnv.Brush.Color := RGB(118, 185, 218); // biru cerah
            aCnv.Brush.Style := bsSolid;

            R1 := 7;
            R2 := 9;
            aCnv.Ellipse(Round(scrx - R1), Round(Scry - R1), Round(ScrX + R1), Round(ScrY + r1));

            if Ship.Domain = 3 then
            begin
              Polygn[0] := System.Classes.Point(Round(ScrX) - R2, Round(ScrY) - R2);
              Polygn[1] := System.Classes.Point(Round(ScrX)- R1, Round(ScrY));
              Polygn[2] := System.Classes.Point(Round(ScrX) + R1 - 2, Round(ScrY));
              Polygn[3] := System.Classes.Point(Round(ScrX) + R1, Round(ScrY) - R2);
              aCnv.Polygon(polygn);
            end;
          end
          else if Ship.Identity = tidFriend then
          begin
            aCnv.Pen.Color := clBlack;
            aCnv.Pen.Style := psClear;
            aCnv.Pen.Width := 1;

            aCnv.Brush.Color := RGB(118, 185, 218); // biru cerah
            aCnv.Brush.Style := bsSolid;

            R1 := 7;
            R2 := 9;
            aCnv.Ellipse(Round(scrx - R1), Round(Scry - R1), Round(ScrX + R1), Round(ScrY + r1));

            if Ship.Domain = 3 then
            begin
              Polygn[0] := System.Classes.Point(Round(ScrX) - R2, Round(ScrY) - R2);
              Polygn[1] := System.Classes.Point(Round(ScrX)- R1, Round(ScrY));
              Polygn[2] := System.Classes.Point(Round(ScrX) + R1 - 2, Round(ScrY));
              Polygn[3] := System.Classes.Point(Round(ScrX) + R1, Round(ScrY) - R2);
              aCnv.Polygon(polygn);
            end;
          end
          else if Ship.Identity = tidNeutral then
          begin
            if Ship.Domain = 1 then
            begin
              R1 := 7;
              aCnv.Pen.Color := clGreen;
              aCnv.Pen.Style := psSolid;
              aCnv.Pen.Width := 1;

              aCnv.Brush.Color := RGB(156, 202, 134); // hijau cerah
              aCnv.Brush.Style := bsSolid;

              aCnv.Rectangle(Round(ScrX) - R1, Round(ScrY) -R1, Round(ScrX) + R1, Round(ScrY) + R1);
            end
            else if Ship.Domain = 3 then
            begin
              R1 := 7;
              aCnv.Pen.Color := clGreen;
              aCnv.Pen.Style := psClear;
              aCnv.Pen.Width := 1;

              aCnv.Brush.Color := RGB(156, 202, 134); // hijau cerah
              aCnv.Brush.Style := bsSolid;

              aCnv.Rectangle(Round(ScrX) - R1, Round(ScrY) -R1, Round(ScrX) + R1, Round(ScrY) + R1);

              aCnv.Pen.Style := psSolid;
              aCnv.MoveTo(Round(ScrX) - R1, Round(ScrY) - R1 - 1);
              aCnv.LineTo(Round(ScrX) - R1, Round(ScrY) + R1 - 1);
              aCnv.MoveTo(Round(ScrX) - R1, Round(ScrY) + R1 - 1);
              aCnv.LineTo(Round(ScrX) + R1, Round(ScrY) + R1 - 1);
              aCnv.MoveTo(Round(ScrX) + R1 - 1, Round(ScrY) + R1 - 1);
              aCnv.LineTo(Round(ScrX) + R1 - 1, Round(ScrY) - R1 - 1);
            end;
          end
          else if Ship.Identity = tidSuspect then
          begin
            aCnv.Pen.Color := clBlack;
            aCnv.Pen.Style := psClear;
            aCnv.Pen.Width := 1;

            aCnv.Brush.Color := RGB(233, 118, 123); // merah cerah
            aCnv.Brush.Style := bsSolid;

            if Ship.Domain = 1 then
            begin
              R1 := 8;
              Polygn[0] := System.Classes.Point(Round(ScrX) - R1, Round(ScrY));
              Polygn[1] := System.Classes.Point(Round(ScrX), Round(ScrY) + R1);
              Polygn[2] := System.Classes.Point(Round(ScrX) + R1, Round(ScrY));
              Polygn[3] := System.Classes.Point(Round(ScrX), Round(ScrY) - R1);
              aCnv.Polygon(polygn);
            end
            else if Ship.Domain = 3 then
            begin
              R1 := 6;
              R2 := 1;
              R3 := 8;
              PolySuspect[0] := System.Classes.Point(Round(ScrX) - R1, Round(ScrY) - R1);
              PolySuspect[1] := System.Classes.Point(Round(ScrX) - R1, Round(ScrY) + R2);
              PolySuspect[2] := System.Classes.Point(Round(ScrX), Round(ScrY) + R3);
              PolySuspect[3] := System.Classes.Point(Round(ScrX) + R1, Round(ScrY) + R2);
              PolySuspect[4] := System.Classes.Point(Round(ScrX) + R1, Round(ScrY) - R1);
              aCnv.Polygon(PolySuspect);
            end;
          end
          else if Ship.Identity = tidHostile then
          begin
            aCnv.Pen.Color := clBlack;
            aCnv.Pen.Style := psClear;
            aCnv.Pen.Width := 1;

            aCnv.Brush.Color := RGB(233, 118, 123); // merah cerah
            aCnv.Brush.Style := bsSolid;

            if Ship.Domain = 1 then
            begin
              R1 := 8;
              Polygn[0] := System.Classes.Point(Round(ScrX) - R1, Round(ScrY));
              Polygn[1] := System.Classes.Point(Round(ScrX), Round(ScrY) + R1);
              Polygn[2] := System.Classes.Point(Round(ScrX) + R1, Round(ScrY));
              Polygn[3] := System.Classes.Point(Round(ScrX), Round(ScrY) - R1);
              aCnv.Polygon(polygn);
            end
            else if Ship.Domain = 3 then
            begin
              R1 := 6;
              R2 := 1;
              R3 := 8;
              PolySuspect[0] := System.Classes.Point(Round(ScrX) - R1, Round(ScrY) - R1);
              PolySuspect[1] := System.Classes.Point(Round(ScrX) - R1, Round(ScrY) + R2);
              PolySuspect[2] := System.Classes.Point(Round(ScrX), Round(ScrY) + R3);
              PolySuspect[3] := System.Classes.Point(Round(ScrX) + R1, Round(ScrY) + R2);
              PolySuspect[4] := System.Classes.Point(Round(ScrX) + R1, Round(ScrY) - R1);
              aCnv.Polygon(PolySuspect);
            end;
          end

          else if Ship.Identity = tidPending then
          begin
            aCnv.Pen.Color := clBlack;
            aCnv.Pen.Style := psClear;
            aCnv.Pen.Width := 1;

            aCnv.Brush.Color := RGB(243, 235, 118); // kuning cerah
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
          end;

          if Ship.Controlled_Track then
          begin
            aCnv.Pen.Color := clWhite;
            aCnv.Pen.Style := psSolid;
            aCnv.Brush.Color := clWhite;
            aCnv.Brush.Style := bsClear;
            aCnv.Ellipse(Round(ScrX) - 11, Round(ScrY) - 11, Round(ScrX) + 11, Round(ScrY) + 11);
          end;

          aCnv.Pen.Style := psSolid;
          aCnv.Pen.Width := 1;
          aCnv.Brush.Style := bsClear;
          aCnv.Pen.Color := clGray;

          aCnv.TextOut(Round(ScrX)+5, Round(ScrY)+5, Format('%.6d',[Ship.MSITrackNumber]));
        end;
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

//  if Assigned(FOverlay) then begin
//    FOverlay.BringToFront;
//    FOverlay.Show;
//    FOverlay.Paint;
//  end;

  if not FTrueMotion then
  begin
    FMapTP.CenterX := SutBlacksharkManager.xShip.PositionX;
    FMapTP.CenterY := SutBlacksharkManager.xShip.PositionY;
  end;
  pnlTacticalPicture.Repaint;

  pnlOperatorMessages.Caption := SutBlacksharkManager.OperatorMessages;
  // get variable pada blackshark manager disini
end;

procedure TFrmTacticalScreen.UpdateAttachFormDisplay;
begin
  {$REGION 'Ownship Data'}
  if not Assigned(FFrmOwnShipTS) then
  begin
    FFrmOwnShipTS := TfrmOwnShip.Create(Self);
    frmOwnShip    := FFrmOwnShipTS;
    FFrmOwnShipTS.Parent := pnlOwnShip;
    FFrmOwnShipTS.Align := alClient;
    FFrmOwnShipTS.Show;
  end;
  {$ENDREGION}

  {$REGION 'Alert and Operator Messages'}
  if not Assigned(FFrmAlertandOpearatorMassageTS) then
  begin
    FFrmAlertandOpearatorMassageTS := TfrmAlertsandOpearatorMassage.Create(Self);
    frmAlertsandOpearatorMassage   := FFrmAlertandOpearatorMassageTS;
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
    frmTargetInControl    := FFrmTargetInControltS;
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
    frmSystemStatus := FFrmSystemStatus;
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
    frmSystemInfo  := FFrmSystemInfo;
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
    frmCursor  := FFrmCursor;
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

procedure TFrmTacticalScreen.ZoomClick(Sender: TObject);
begin
  if TImageButton(Sender).Tag = 1 then
  begin
    if cbbZoomScale.ItemIndex <> 0 then
    begin
      cbbZoomScale.ItemIndex := cbbZoomScale.ItemIndex -1;
      cbbZoomScaleChange(Sender);
    end;
  end
  else if TImageButton(Sender).Tag = 0 then
  begin
    if cbbZoomScale.ItemIndex <> 14 then
    begin
      cbbZoomScale.ItemIndex := cbbZoomScale.ItemIndex +1;
      cbbZoomScaleChange(Sender);
    end;
  end;
end;

procedure TFrmTacticalScreen.OverlayPaint(Sender: TObject; ACanvas: TCanvas);
var
  ScreenX, ScreenY : Single;
begin 
  ACanvas.Pen.Color := clWhite;
  ACanvas.Pen.Style := psSolid;
  ACanvas.Pen.Width := 1;

  FMapTP.ConvertCoord(ScreenX, ScreenY, FCursorX, FCursorY, miMapToScreen);

  ACanvas.Rectangle(Round(ScreenX) - 1, Round(ScreenY) - 15, Round(ScreenX) + 1, Round(ScreenY) - 4); // cursor bagian atas
  ACanvas.Rectangle(Round(ScreenX) - 1, Round(ScreenY) + 15, Round(ScreenX) + 1, Round(ScreenY) + 4); // cursor bagian bawah

  ACanvas.Rectangle(Round(ScreenX) - 15, Round(ScreenY) - 1, Round(ScreenX) - 4, Round(ScreenY) + 1); // cursor bagian kiri
  ACanvas.Rectangle(Round(ScreenX) + 4, Round(ScreenY) - 1, Round(ScreenX) + 15, Round(ScreenY) + 1); // cursor bagian kanan

  frmTacticalScreen.DrawTicksDegree(ACanvas);
  frmTacticalScreen.Render(ACanvas);
end;

end.

