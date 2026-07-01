unit ufrmTorpedoWP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, uSettingFormToMonitorWith_ini, uFormUtil, ufrmTacticalScreen,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.OleCtrls, MapXLib_TLB, uBaseFunction, uLibConst,
  uBaseConst, uRadarVisual, uMapXUnitConverter, uCoordConverter, System.Math, uSutBlacksharkManager, uRadarNorthIndicator,
  uVehicleManager, uScriptSutBlackshark, uSimulationManager, uBridgeSet, ulibSettings, uDataModule, uVehicle,
  ImageButton, AdvCombo, Vcl.Grids, AdvUtil, AdvObj, BaseGrid, AdvGrid, uTCPDatatype,

  ufrmOwnShip, ufrmAlertandOpearatorMassage, ufmTargetInControl, ufrmContactInControl, ufrmTorpedoTubeCommands,
  ufrmTorpedoTubeStatusWindow, ufrmTorpedoGuidance, ufrmHomingCommands, ufrmHomingStatusPlot, ufrmDepthPlot,
  ufrmTorpedoParameterSetting, ufrmEngagementDataOverview, ufrmControlByNumber, ufrmTrackingList, ufrmSensorTrackList,
  ufrmTackHistory, ufrmCreateModifyTrack, ufrmTorpedoContactList, ufrmWakeList, ufrmTorpedoVerticalView, 
  ufrmTorpedoParameterDepthSettings;


type
  TFrmTorpedoWP = class(TForm)
    {$REGION 'Components'}
    pnlInfoAtas: TPanel;
    pnlTorpedoGeo: TPanel;
    pnlTEP: TPanel;
    pnlBase: TPanel;
    pnlTacticalBtn: TPanel;
    pnlSubmodeTools6: TPanel;
    pnlSubmodeTools7: TPanel;
    pnlSubmodeTools8: TPanel;
    pnlSubmodeTools9: TPanel;
    pnlTrackManagement: TPanel;
    pnlSystem: TPanel;
    pnlAssFunc1: TPanel;
    pnlRadarFreeze: TPanel;
    pnlAssFunc2: TPanel;
    pnlAssFunc0: TPanel;
    pnlTorpedoBtn: TPanel;
    pnlIntercom: TPanel;
    pnlTMABtn: TPanel;
    pnlSubmodeTools16: TPanel;
    pnlSubmodeTools17: TPanel;
    pnlSubmodeTools18: TPanel;
    pnlSubmodeTools19: TPanel;
    pnlRecordPMA: TPanel;
    pnlToolkit: TPanel;
    pnlAssFunc4: TPanel;
    pnlControlByNumber: TPanel;
    pnlResmBtn: TPanel;
    pnlAssFunc5: TPanel;
    pnlAssFunc3: TPanel;
    pnlPeriscopeBtn: TPanel;
    pnlAckAlert: TPanel;
    pnlLinkBtn: TPanel;
    pnlSubmodeTools10: TPanel;
    pnlSubmodeTools11: TPanel;
    pnlSubmodeTools12: TPanel;
    pnlSubmodeTools13: TPanel;
    pnlSubmodeTools14: TPanel;
    pnlSubmodeTools0: TPanel;
    pnlSubmodeTools15: TPanel;
    pnlSubmodeTools1: TPanel;
    pnlSubmodeTools2: TPanel;
    pnlSubmodeTools3: TPanel;
    pnlSubmodeTools4: TPanel;
    pnlSubmodeTools5: TPanel;
    lblSubmodeTools0: TLabel;
    lblSubmodeTools1: TLabel;
    lblSubmodeTools2: TLabel;
    lblSubmodeTools3: TLabel;
    lblSubmodeTools4: TLabel;
    lblSubmodeTools5: TLabel;
    lblSubmodeTools6: TLabel;
    lblSubmodeTools7: TLabel;
    lblSubmodeTools10: TLabel;
    lblSubmodeTools11: TLabel;
    lblSubmodeTools12: TLabel;
    lblSubmodeTools13: TLabel;
    lblSubmodeTools14: TLabel;
    lblSubmodeTools15: TLabel;
    lblSubmodeTools16: TLabel;
    lblSubmodeTools17: TLabel;
    lblSubmodeTools18: TLabel;
    lblSubmodeTools19: TLabel;
    lblSubmodeTools9: TLabel;
    lblSubmodeTools8: TLabel;
    lblTrackManagement: TLabel;
    lblRecordPMA: TLabel;
    lblRadarFreeze: TLabel;
    lblControlByNumber: TLabel;
    lblSystem: TLabel;
    lblToolkit: TLabel;
    lblAssFunc0: TLabel;
    lblAssFunc3: TLabel;
    lblAssFunc1: TLabel;
    lblAssFunc4: TLabel;
    lblAssFunc2: TLabel;
    lblAssFunc5: TLabel;
    lblIntercom: TLabel;
    lblAckAlert: TLabel;
    FMap: TMap;
    Panel1: TPanel;
    imgListLight: TImageList;
    imgBackgrounSituationZone: TImage;
    Timer1: TTimer;
    tmrUpdateForm: TTimer;
    tmrUpdateDataPos: TTimer;
    ImageButton1: TImageButton;
    ImageButton2: TImageButton;
    AdvComboBox1: TAdvComboBox;
    Label3: TLabel;
    cbbMotionMode: TAdvComboBox;
    TimerBlink: TTimer;
    pnlOwnshipData: TPanel;
    pnlAlerts: TPanel;
    pnlTargetInControl: TPanel;
    pnlContactInCtrl: TPanel;
    pnlGroupInfo: TPanel;
    pnlGroupInfoAtas: TPanel;
    pnlGroupInfoBawah: TPanel;
    pnlTorpedoTubes: TPanel;
    pnlLeft: TPanel;
    pnlTop: TPanel;
    pnlTorpedoGuidanceWindow: TPanel;
    pnlTorpedoTubesStatus: TPanel;
    pnlTorpedoRight: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnlTorpedoHomingCmd: TPanel;
    pnlDepthPlot: TPanel;
    pnlTorpedoHomingStatusPlot: TPanel;
    pnlTorpedoParamSettings: TPanel;
    pnlToSo: TPanel;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure pnlTacticalBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlFuncTaskRightMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlAssFuncMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlSubmodeTools0MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure tmrUpdateFormTimer(Sender: TObject);
    procedure tmrUpdateDataPosTimer(Sender: TObject);
    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TimerBlinkTimer(Sender: TObject);

  protected
    procedure DrawAngle(aCnv: TCanvas);
    function Rotate(Width, Height, Radius: Integer; Degrees: Double): Winapi.Windows.TPoint;
    function MeterWidth: Integer;
    function MeterHeight: Integer;
    procedure DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;Color: TColor; Width: Integer);

  private
    { Private declarations }
    Submode, SubmodeTools, FuncTaskRightMode : Byte;
    BitMapLampGrey, BitMapLampGreen, BitMapLampRed : TBitmap;
    FDropSonar, FToSoAudio, FFire, FStopFireSeq, FClassification, FGuideToBearing, FTorpVertView, FTorpContactMngmnt, FSPA,
    FTorpExcercise, FImmediateFire, FTorpAlloc, FLaunchSalvo, FTorpEmergencyExe,
    FMarkSpecialEvent, FTorpCtrl, FSim, FPresetTorpParam, FCoverage :Boolean;
    FLyrDraw: CMapXLayer;
    FCurrentRange, FBearingVal, FElevVal : Double;  // meter
    FRings       : TRadarRangeRings;
    FBearing0    : TRadarBearing;
    FNorthAngle : Double;
    FMapCanvas     : TCanvas;
    FMapConverter : TMapXUnitConverter;
    FNorthInd : TRadarNorthIndicator;
    FShipHeading : Integer;

//    TargetMgr : TRadarTargetManager;

    FCircleRect  : TRect;
    FCircleCX    : Integer;
    FCircleCY    : Integer;
    FCircleR     : Integer; // radius pixel lingkaran peta

    FFlag       : Byte;
    FBitmapBackground : TBitmap;

        //setting parameter
    pCurrentScenID  : integer;
    pServer_Ip,
    pServer_Port,               //TriD_IP, TriD_Port,
    pDBServer,
    pDBProto,
    pDBName,
    pDBUser,
    pDBPass,
    pShipName,
    pClassName      : string;
    pShipID,
    pClassID        : Integer;



    FBlinkPanel: TPanel;
    FBlinkState: Boolean;

    {Attach Form}
    FFrmOwnShip                  : TfrmOwnShip;
    FFrmAlertandOpearatorMassage : TfrmAlertsandOpearatorMassage;
    FFrmTargetInControl          : TfrmTargetInControl;
    FFrmContactInControl         : TfrmContactInControl;
    FFrmTorpedoTubesCommand      : TfrmTorpedoTubeCommands;
    FFrmTorpedoTubesStatus       : TfrmTorpedoTubeStatusWindow;
    FFrmTorpedoGuidance          : TfrmTorpedoGuidanceWindow;
    FFrmTorpedoHomingCommand     : TfrmHomingCommands;
    FFrmTorpedoHomingStatusPlot  : TfrmHomingStatusPlot;
    FFrmDepthPlot                : TfrmDepthPlot;
    FFrmTorpedoParameters        : TfrmTorpedoParameterSetting;
    FFrmEngagementDataOverview   : TfrmEngagementDataOverview;
    FfrmTorpedoParameterDepth    : TfrmTorpedoParameterDepthSettings;

    procedure SubmodeSelect(Sender: Tobject);
    procedure FuncTaskRightSelect(Sender: Tobject);
    procedure SubmodeToolsSelect(Sender: Tobject);
    procedure SetLayoutForm;
    procedure ResetSubmodeTools;
    procedure ResetAssociatedFunction;
    procedure LoadGeoset(const aGst: string); virtual;
    procedure setRegionCircle;
    procedure DrawAll(aCnv: TCanvas; aCvt: TCoordConverter; aFlag: Byte);

    procedure UpdateAttachFormDisplay;

  public
    { Public declarations }
    rCX, rCY: integer;
    OwnshipHeadingVal, OwnshipLatPosVal, OwnshipLongPosVal, OwnshipSpeedVal, OwnshipDepth : string;
    SelectedVehicleState : Boolean;
  end;

var
  frmTorpedoWP: TFrmTorpedoWP;
  //TFrmTacticalScreen

implementation

{$R *.dfm}

const
  CMin_Z = 0;
  CMax_Z = 64;

{ TFrmTacticalScreen }

procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

function ZoomIndexToScale(const i: Integer): double;
begin
  if i < -3 then
    result := 0.125
  else if i > 14 then
    result := 2500.0
  else
    result := Power(2.0, (i - 3));
end;

function FindClosestZoomIndex(const z: double): Integer;
var
  i: Integer;
begin
  if z >= 2500 then
    result := CMax_Z
  else if z <= 0.125 then
    result := CMin_Z
  else
  begin
    i := Round(Log2(z));
    result := i + 3;
  end;
end;
function FixMapZoom(z: double): double;
begin
  if z >= 1.0 then
    result := Round(z)
  else
    result := 0.001 * Round(z * 1000);
end;

procedure TFrmTorpedoWP.DrawAll(aCnv: TCanvas; aCvt: TCoordConverter;
  aFlag: Byte);
var
  pnt: Winapi.Windows.TPoint;
  z: double;
  i: Integer;
begin
  aCvt.ConvertToScreen(FMap.CenterX, FMap.CenterY, pnt.X, pnt.Y);

  z := FixMapZoom(FMap.Zoom);
  i := FindClosestZoomIndex(z);
  z := ZoomIndexToScale(i);

    // --- North Indicator ---
//    FNorthInd.CenterX       := FCircleCX;
//    FNorthInd.CenterY       := FCircleCY;
//    FNorthInd.RadiusPx      := FCircleR;
//    if Assigned(SutBlacksharkManager) then
//    begin
//      if Assigned(SutBlacksharkManager.xShip) then
//      begin
//        FNorthInd.HeadingDeg    := SutBlacksharkManager.xShip.Heading;
//        FNorthInd.UseTrueMotion := SutBlacksharkManager.IsTrueMotion; // TRUE or FALSE
//      end;
//    end;
//    FNorthInd.Draw(aCnv);



    // RANGE RINGS
//    FRings.CircleRect    := FCircleRect;
//    FRings.CurrentRange_m := FCurrentRange;
//    FRings.ConvertCoord(aCvt);
//    FRings.Draw(aCnv);

    // BEARING 0�
//    FBearing0.CircleRect := FCircleRect;
//    FBearing0.ConvertCoord(aCvt);
//    FBearing0.Draw(aCnv);

//    TargetMgr.Draw(aCnv);

    VehicleMgr.DrawAll(aCnv);
end;



procedure TFrmTorpedoWP.DrawAngle(aCnv: TCanvas);
var
  I,Size,Enlarge,StartAngle,AngleRadius: Integer;
  ticksMax,ticks,ticksEnlarge,ticksMin :integer;
  labels,decimals,labelsoffset: integer;
  Angle,AngleOffset,BaseAngle : integer;
  Increment,Degrees,CurValue,IncValue: Double;
  R: TRect;
  P1, P2: Winapi.Windows.TPoint;
  Mask,StrValue: string;
  ticksColor : TColor;
  labelsfont : TFont;

  left,top,right,bottom : Integer;
  diffBeetwinWH : Integer;  //differnt beetwin width and height width - height, kemudian dibagi dua sebagai batas left dan right,supaya lingkarannya tetap center.
begin
  Angle := 0;
  baseAngle := round(CBaseAngle);
  AngleOffset := round(CBaseAngle);
  labelsfont := TFont.Create();
  labelsfont.Color := clYellow;
  labelsfont.Size := 10;
  StartAngle := BaseAngle + Angle;

  diffBeetwinWH := (FMap.Width - FMap.Height) div 2;

  top := 50;
  bottom := FMap.Height - top;
  left := diffBeetwinWH + top;
  right := FMap.Width - left;
  with aCnv do
  begin
		Pen.Color := CForegroundColor;

    Brush.Style := bsClear;
//    R := Rect(0,0, Map.Width, Map.Height);
    R := Rect(left,top, right, bottom);
    AngleRadius := (R.right - R.left) div 2;
//    AngleRadius := 280;
    ticksmax := 16;
    ticks := round(24);
    ticksEnlarge := 5;
    ticksMin := 8;
    ticksColor := clGreen;
    labels := 24;
    decimals := 0;
    labelsoffset := 30;

    {jarum derajat}

    if Ticks >= 1 then
    begin
      Enlarge := TicksEnlarge;
      Degrees := StartAngle;
      Increment := AngleOffset/Ticks;
      aCnv.Pen.Color := clRed;
      aCnv.Pen.Width := 3;
      aCnv.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
      for I := 1 to Ticks + 1 do
      begin
//        if (Enlarge mod TicksEnlarge = 0) then
//          Size := TicksMax else Size := TicksMin;
        Size := TicksMax;
        Inc(Enlarge);
        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius, Degrees);
        P2 := Rotate(MeterWidth, MeterHeight, AngleRadius + Size, Degrees);
        DrawLine(aCnv, P1.X, P1.Y, P2.X, P2.Y, TicksColor, 2);
        Degrees := Degrees + Increment;
      end;
    end;


    {angka}

    if Labels >= 1 then
    begin
      Font := LabelsFont;
      CurValue := 0;
      IncValue := (360 - 0)/labels;
      Degrees := StartAngle;
      Increment := AngleOffset/labels;
      Mask := '%.' + IntToStr(Decimals) + 'f';
      for I := 1 to Labels  do
      begin
//        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius + LabelsOffset, Degrees);
        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius + LabelsOffset, Degrees);

//        if strlen(pchar(floattostr(CurValue))) <= 2 then
//          begin
//          if curValue = 0 then
//             StrValue := '00'+Format(Mask, [CurValue])
//          else
//             StrValue := '0'+Format(Mask, [CurValue]);
//          end
//        else
        if round(CurValue) mod 30 = 0 then
        begin
          if CurValue > 180 then
             StrValue := Format(Mask, [CurValue - 360]) + '�'
          else
            StrValue := Format(Mask, [CurValue]) + '�';

          P1.X := P1.X - TextWidth(StrValue) div 2;
          P1.Y := P1.Y - TextHeight(StrValue) div 2;
          TextOut(P1.X, P1.Y, StrValue);
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue*I);
        end
        else
        begin
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue*I);
        end;
      end;
    end;
  end;

end;

procedure TFrmTorpedoWP.DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;
  Color: TColor; Width: Integer);
begin
  Canvas.Pen.Color := Color;
  Canvas.Pen.Width := Width;
  Canvas.MoveTo(X1, Y1);
  Canvas.LineTo(X2, Y2);
end;

procedure TFrmTorpedoWP.FMapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
  FMapCanvas.Handle := hOutputDC;
  DrawAll(FMapCanvas, FMapConverter, FFlag);
end;

procedure TFrmTorpedoWP.FMapMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
//  Sel: TRadarTargetSymbol;
  v : TVehicle;
  rangeX, dH, v0: Double;
  aLow, aHigh, aEnv: Double;
  ok: Boolean;
begin
  if Button <> mbLeft then Exit;

//  Sel := TargetMgr.SelectAt(X, Y);

  v := VehicleMgr.SelectAt(X, Y);


  FMap.Refresh; // langsung repaint untuk tunjukkan kotak putih

  if Assigned(v) then
  begin
    // misalnya tampilkan info target
    // ShowMessage('Target terpilih: ' + Sel.TrackLabel);

    SutBlacksharkManager.SelectedVehicle := v;
    rangeX := CalcRange(SutBlacksharkManager.xShip.PositionX, SutBlacksharkManager.xShip.PositionY, v.PosX, v.PosY) * C_NauticalMile_To_Metre;   // 3 km
    dH     := v.PosZ;    // target 20 m lebih rendah
    v0     := 1035;    // m/s

    SelectedVehicleState := true;

//    FBlinkPanel := pnlSubmodeTools11;
//    FBlinkState := False;
//    TimerBlink.Enabled := True;

    if Assigned(SutBlacksharkManager) then
    begin
      // 1) Tanpa environment (vakum)
      ok := SutBlacksharkManager.ComputeGunElevationVacuum(rangeX, dH, v0, aLow, aHigh);
//      edtLowPR.Text := FormatFloat('0.00', aLow);
//      edtHighPR.Text := FormatFloat('0.00', aHigh);
    end;
  end
  else
  begin
    SelectedVehicleState := false;
    if (lblSubmodeTools11.Caption = 'Imme-' + #13#10 + 'diate' + #13#10 + 'Firing') and (pnlSubmodeTools11.Enabled = true)
      and (lblSubmodeTools11.Enabled = true)then
    begin
      TimerBlink.Enabled := False;
      pnlSubmodeTools11.Color := clBlack;
    end;
  end;
end;

procedure TFrmTorpedoWP.FMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  isValid : Boolean;
  RecSend : TRecSetTorpedoSUT;

  CorrectBearing,
  CorrectElev : Double;
  aLow, aHigh: Double;
  range,rangem, bearing : Double;
begin

  if SelectedVehicleState = false then
  begin
    RecSend.ShipID              := SutBlacksharkManager.ShipID;
    RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID         := 1;
    RecSend.mMissileID          := 0;
    RecSend.mMissileNumber      := 0;
//      RecSend.OrderID             := 0;

    RecSend.mTorpedoSpeed       := 0;
    RecSend.mT_ID               := 0;
    RecSend.mMissileType        := 0;
    RecSend.mTorpedoDepth       := 0;
    RecSend.mTorpedoCourse      := 0;

    RecSend.mTargetType         := 0;
//      RecSend.mSalvoRate          := 30;


    RecSend.OrderID := __ORD_TORPEDOSUT_MANUAL;
    SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);
    Exit;
  end;

  if (Assigned(SutBlacksharkManager.SelectedVehicle)) and (SelectedVehicleState = true)then
  begin
    range := CalcRange(SutBlacksharkManager.xShip.PositionX, SutBlacksharkManager.xShip.PositionY, SutBlacksharkManager.SelectedVehicle.PosX, SutBlacksharkManager.SelectedVehicle.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    bearing := CalcBearing(SutBlacksharkManager.xShip.PositionX, SutBlacksharkManager.xShip.PositionY, SutBlacksharkManager.SelectedVehicle.PosX, SutBlacksharkManager.SelectedVehicle.PosY);
    // range = 3000 m, target lebih rendah 25 m
    ComputeBallisticAngleVacuum(rangem, SutBlacksharkManager.SelectedVehicle.PosZ, 800, aLow, aHigh);

    if (aLow <= 80 ) and (aLow >= 0 )then
    begin
//      FTargetAngleElevasi:= StrToFloatDef(edtElevasi.Text, 0);
      aLow := FMod(aLow, 360);
      if aLow < 0 then
        aLow := aLow + 360;

      RecSend.ShipID              := SutBlacksharkManager.ShipID;
      RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
      RecSend.mLauncherID         := 1;
      RecSend.mMissileID          := 0;
      RecSend.mMissileNumber      := 0;
//      RecSend.OrderID             := 0;

      RecSend.mTorpedoSpeed       := 0;
      RecSend.mT_ID               := SutBlacksharkManager.SelectedVehicle.ShipID;
      RecSend.mMissileType        := 0;
      RecSend.mTorpedoDepth       := aLow;
      RecSend.mTorpedoCourse      := bearing;

      RecSend.mTargetType         := SutBlacksharkManager.SelectedVehicle.Domain;
//      RecSend.mSalvoRate          := 30;


      RecSend.OrderID := __ORD_TORPEDOSUT_NAVIGATE;
      SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);
    end
    else if (aLow >= 350 )then
    begin
      alow := FMod(alow, 360);
      if alow < 0 then
        alow := alow + 360;

      RecSend.ShipID              := SutBlacksharkManager.ShipID;
      RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
      RecSend.mLauncherID         := 1;
      RecSend.mMissileID          := 0;
      RecSend.mMissileNumber      := 0;
//      RecSend.OrderID             := 0;

      RecSend.mTorpedoSpeed       := 0;
      RecSend.mT_ID               := SutBlacksharkManager.SelectedVehicle.ShipID;
      RecSend.mMissileType        := 0;
      RecSend.mTorpedoDepth       := aLow;
      RecSend.mTorpedoCourse      := bearing;

      RecSend.mTargetType         := SutBlacksharkManager.SelectedVehicle.Domain;
//      RecSend.mSalvoRate          := 30;


      RecSend.OrderID := __ORD_TORPEDOSUT_NAVIGATE;
      SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);
    end;
  end;
end;

procedure TFrmTorpedoWP.FormCreate(Sender: TObject);
var
  n : Integer;
//  T: TRadarTargetSymbol;
  ShipClassName,
  ShipCallSign: string;
  V: TVehicle;
  i : Integer;
begin
//  SetLayoutForm;  // set layout dipindah ke tactical screen karena tactical screen dicreate setelah torpedoWP
  ResetAssociatedFunction;
  ResetSubmodeTools;
  FuncTaskRightMode := 7;
  Submode := 7;
  SubmodeTools := 20;

  BeginGame_SutBlackshark;
  SutBlacksharkManager := TSutBlacksharkManager.Create;
  SimCenter := SutBlacksharkManager;
  SimCenter.FMap := FMap;
//  SutBlacksharkManager.OnPtkCommand := ptkCommand; // petek
//  SutBlacksharkManager.initEvent;


  FNorthAngle := 0;
  FMapCanvas         := TCanvas.Create;
  FMapConverter := TMapXUnitConverter.Create;
  FMapConverter.FMap := FMap;
  FCurrentRange := CRangeOperationBS[3]; // default di 8 nm

  VehicleMgr := TVehicleManager.Create;
  VehicleMgr.CoordConverter := FMapConverter;

  EnableComposited(pnlTorpedoGeo);
  EnableComposited(pnlBase);
//  FBitmapBackground := TBitmap.Create;
//  FBitmapBackground.Height := imgBackgrounSituationZone.Height;
//  FBitmapBackground.Width := imgBackgrounSituationZone.Width;
//  FBitmapBackground.Canvas.Brush.Color := clNone; // new color
//  FBitmapBackground.Canvas.FillRect(
//   Rect(
//     0,
//     0,
//     FBitmapBackground.Width,
//     FBitmapBackground.Height
//    )
//  );

//  imgBackgrounSituationZone.Picture.Assign(FBitmapBackground);

  LoadGeoset('..\data\maps\IndonesiaNoGrid.gst');

  setRegionCircle;

//  FRings := TRadarRangeRings.Create;
//  FRings.Visible := True;

//  FNorthInd := TRadarNorthIndicator.Create;

  FShipHeading := 0; // awal

//  FBearing0 := TRadarBearing.Create(0, clWhite, 'MR35');

//  FMap.ZoomTo((Self.FCurrentRange) * 2, FMap.CenterX, FMap.CenterY);

  FMap.ZoomTo(50 * 2, FMap.CenterX, FMap.CenterY);    // rojek coba map di zoom out

  BitMapLampGrey := TBitmap.Create;
  BitMapLampGreen := TBitmap.Create;
  BitMapLampRed := TBitmap.Create;
  imgListLight.GetBitmap(0, BitMapLampGrey);
  imgListLight.GetBitmap(4, BitMapLampGreen);
  imgListLight.GetBitmap(5, BitMapLampRed);

  {
  imgMSI.Picture.Bitmap := BitMapLampRed;
  imgNav.Picture.Bitmap := BitMapLampRed;
  imgRad.Picture.Bitmap := BitMapLampRed;
  imgResm.Picture.Bitmap := BitMapLampRed;
  imgPerisc.Picture.Bitmap := BitMapLampRed;
  imgSonar.Picture.Bitmap := BitMapLampRed;
  imgMast.Picture.Bitmap := BitMapLampRed;
  imgLink.Picture.Bitmap := BitMapLampRed;
  imgWTSRC.Picture.Bitmap := BitMapLampRed;
  imgTBI.Picture.Bitmap := BitMapLampRed;
  }

  n := ParamCount ;
  if n < max_param then
  begin
    SutBlacksharkManager.IsStandAlone := true ;
  end;

  if not SutBlacksharkManager.IsStandAlone then
  begin
      InitDefault_AllConfigFromInstruktur(pServer_Ip,pServer_Port,
    pDBServer, pDBProto, pDBName, pDBUser,
    pDBPass, pShipID, pCurrentScenID);

    SutBlacksharkManager.CurrentScenID := pCurrentScenID;
    SutBlacksharkManager.Server_Ip := pServer_Ip;
    SutBlacksharkManager.Server_Port := pServer_Port;               //TriD_IP, TriD_Port,
    SutBlacksharkManager.DBServer := vDbServer.mDBServer;
    SutBlacksharkManager.DBProto := vDbServer.mDBProto;
    SutBlacksharkManager.DBName := vDbServer.mDBName;
    SutBlacksharkManager.DBUser := vDbServer.mDBUser;
    SutBlacksharkManager.DBPass := vDbServer.mDBPass;
    SutBlacksharkManager.ShipID := pShipID;
    SutBlacksharkManager.ClassID := pClassID;

    SutBlacksharkManager.ServerIp := vBridgeServer.m2D_IP;
    SutBlacksharkManager.ServerPort := vBridgeServer.m2D_Port;

    SutBlacksharkManager.InitializeSimulation;

    if DataModule1.InitZDB(vDbServer.mDBServer, vDbServer.mDBProto, vDbServer.mDBName, vDbServer.mDBUser, vDbServer.mDBPass, vDbServer.mDBPort) then
    begin
      SutBlacksharkManager.ShipClassID  := DataModule1.GetShipType(SutBlacksharkManager.ShipID, ShipClassName);
      SutBlacksharkManager.ShipName     := DataModule1.GetShipName(SutBlacksharkManager.ShipID);
      SutBlacksharkManager.ShipNumber := DataModule1.GetShipNoById(SutBlacksharkManager.ShipID);
      SutBlacksharkManager.ShipCallSign := DataModule1.GetShipCallsignByID(SutBlacksharkManager.ShipID);

      SutBlacksharkManager.xShip.UniqueID := dbID_to_UniqueID(SutBlacksharkManager.ShipID);

//      lblKriName.Caption := 'KRI ' + Meriam57Manager.ShipCallSign + '-' + IntToStr(Meriam57Manager.ShipNumber);
    end;
    SutBlacksharkManager.Env_Map := DataModule1.GetMapById(SutBlacksharkManager.CurrentScenID);

    SutBlacksharkManager.GetTorpedoWeaponAssigned;

//
//    if Assigned(FCCManager.AssignedWeapon) then
//    begin
//      FTargetAngleKolonka := Meriam57Manager.AssignedWeapon.Pos_H;
//      FAngleKolonka := Meriam57Manager.AssignedWeapon.Pos_H;
//
//      edtTraining.Text := FormatFloat('0.00', FTargetAngleKolonka);
//    end;
//    FireAllow := True;
//    rgnOuter := CreateRectRgn(0,0,Width,Height);  // bolongin form biar masuk 3d
//    rgnInner := CreateRectRgn(825,1,1280,413);
//
//    CombineRgn(rgnOuter, rgnOuter, rgnInner, RGN_DIFF);
//    SetWindowRgn(Handle, rgnOuter, True);

      // Header
           {
      for i := 0 to AdvStringGrid1.ColCount - 1 do
      begin
        AdvStringGrid1.Alignments[i,0] := taCenter;
        AdvStringGrid1.FontStyles[i,0] := [fsBold];
      end;

      AdvStringGrid1.Cells[0,0] := 'Target';
      AdvStringGrid1.Cells[1,0] := 'Salvo';
      AdvStringGrid1.Cells[2,0] := 'Torpedo';
      AdvStringGrid1.Cells[3,0] := 'Console';
            }
    SutBlacksharkManager.Running := True;
  end;

  pnlTacticalBtnMouseDown(pnlTorpedoBtn, mbLeft, [ssLeft], 38, 61);

  {$REGION 'Panel'}
  pnlOwnshipData.Caption             := '';
  pnlTargetInControl.Caption         := '';
  pnlContactInCtrl.Caption           := '';
  pnlTorpedoTubes.Caption            := '';
  pnlTorpedoTubesStatus.Caption      := '';
  pnlTorpedoGuidanceWindow.Caption   := '';
  pnlTorpedoHomingCmd.Caption        := '';
  pnlTorpedoHomingStatusPlot.Caption := '';
  pnlDepthPlot.Caption               := '';
  pnlTorpedoParamSettings.Caption    := '';
  pnlGroupInfoBawah.Caption          := '';
  pnlToSo.Caption                    := '';
  {$ENDREGION}

  UpdateAttachFormDisplay;
end;

procedure TFrmTorpedoWP.FormDestroy(Sender: TObject);
begin
  BitMapLampGrey.Free;
  BitMapLampGreen.Free;
  BitMapLampRed.Free;

  FMapConverter.Free;
  FMapCanvas.Free;
  SutBlacksharkManager.Free;
//  VehicleMgr.Free;
end;

procedure TFrmTorpedoWP.FormPaint(Sender: TObject);
begin
  DrawAngle(imgBackgrounSituationZone.Canvas);
end;

procedure TFrmTorpedoWP.FuncTaskRightSelect(Sender: Tobject);
var
  SenderPanel: TObject;
begin
  if Sender is TLabel then SenderPanel := (Sender as Tlabel).Parent

  else SenderPanel := Sender;

  if TPanel(SenderPanel).Tag = FuncTaskRightMode then Exit;

  ResetAssociatedFunction;

  pnlTrackManagement.Color := clBlack;
  pnlRadarFreeze.Color := clBlack;
  pnlSystem.Color := clBlack;
  pnlRecordPMA.Color := clBlack;
  pnlControlByNumber.Color := clBlack;
  pnltoolkit.Color := clBlack;

  TPanel(SenderPanel).Color := clLime;
  FuncTaskRightMode := TPanel(SenderPanel).Tag;

  case FuncTaskRightMode of
    0:
    begin
      lblAssFunc0.Caption := 'Create' + #13#10 + 'Modify' + #13#10 + 'Track';
      pnlAssFunc0.Enabled := True;
      lblAssFunc0.Enabled := True;

      lblAssFunc2.Caption := 'Combine' + #13#10 + 'Track';
      pnlAssFunc2.Enabled := True;
      lblAssFunc2.Enabled := True;

      lblAssFunc3.Caption := 'Create' + #13#10 + 'Track';
      pnlAssFunc3.Enabled := True;
      lblAssFunc3.Enabled := True;

      lblAssFunc4.Caption := 'Track' + #13#10 + 'History';
      pnlAssFunc4.Enabled := True;
      lblAssFunc4.Enabled := True;

      lblAssFunc5.Caption := 'Delete' + #13#10 + 'Track';
      pnlAssFunc5.Enabled := True;
      lblAssFunc5.Enabled := True;
    end;
    1:
    begin

    end;
    2:
    begin
      lblAssFunc0.Caption := 'System' + #13#10 + 'Mode' + #13#10 + 'Select';
      pnlAssFunc0.Enabled := True;
      lblAssFunc0.Enabled := True;

      lblAssFunc1.Caption := 'Opera-' + #13#10 + 'tion' + #13#10 + 'Area';
      pnlAssFunc1.Enabled := True;
      lblAssFunc1.Enabled := True;

      lblAssFunc4.Caption := 'Torp' + #13#10 + 'Info';
      pnlAssFunc4.Enabled := True;
      lblAssFunc4.Enabled := True;

      lblAssFunc5.Caption := 'Nav' + #13#10 + 'Setting';
      pnlAssFunc5.Enabled := True;
      lblAssFunc5.Enabled := True;
    end;
    3:
    begin
      lblAssFunc0.Caption := 'Tactical' + #13#10 + 'Recording';
      pnlAssFunc0.Enabled := True;
      lblAssFunc0.Enabled := True;

      lblAssFunc1.Caption := 'PMA';
      pnlAssFunc1.Enabled := True;
      lblAssFunc1.Enabled := True;

      lblAssFunc2.Caption := 'Snapshot';
      pnlAssFunc2.Enabled := True;
      lblAssFunc2.Enabled := True;

      lblAssFunc3.Caption := 'Image' + #13#10 + 'Recording';
      pnlAssFunc3.Enabled := True;
      lblAssFunc3.Enabled := True;

      lblAssFunc4.Caption := 'Image' + #13#10 + 'Replay';
      pnlAssFunc4.Enabled := True;
      lblAssFunc4.Enabled := True;
    end;
    4:
    begin
      lblAssFunc0.Caption := 'Track' + #13#10 + 'CtrlBy' + #13#10 + 'Number';
      pnlAssFunc0.Enabled := True;
      lblAssFunc0.Enabled := True;

      lblAssFunc1.Caption := 'Track' + #13#10 + 'List';
      pnlAssFunc1.Enabled := True;
      lblAssFunc1.Enabled := True;

      lblAssFunc2.Caption := 'Sensor' + #13#10 + 'Track' + #13#10 + 'List';
      pnlAssFunc2.Enabled := True;
      lblAssFunc2.Enabled := True;

      lblAssFunc3.Caption := 'Tact' + #13#10 + 'Trp/Cnt' + #13#10 + 'List';
      pnlAssFunc3.Enabled := True;
      lblAssFunc3.Enabled := True;

      lblAssFunc4.Caption := 'Torp' + #13#10 + 'Trp/Cnt' + #13#10 + 'List';
      pnlAssFunc4.Enabled := True;
      lblAssFunc4.Enabled := True;

      lblAssFunc5.Caption := 'Wake' + #13#10 + 'List';
      pnlAssFunc5.Enabled := True;
      lblAssFunc5.Enabled := True;
    end;
    5:
    begin
      lblAssFunc0.Caption := 'Tactical' + #13#10 + 'Calc';
      pnlAssFunc0.Enabled := True;
      lblAssFunc0.Enabled := True;

      lblAssFunc1.Caption := 'Media' + #13#10 + 'Writer';
      pnlAssFunc1.Enabled := True;
      lblAssFunc1.Enabled := True;

      lblAssFunc2.Caption := 'Browser';
      pnlAssFunc2.Enabled := True;
      lblAssFunc2.Enabled := True;

      lblAssFunc3.Caption := 'Area' + #13#10 + 'Manager';
      pnlAssFunc3.Enabled := True;
      lblAssFunc3.Enabled := True;
    end;
  end;
end;

procedure TFrmTorpedoWP.Label1Click(Sender: TObject);
begin
//  Invalidate;
end;

procedure TFrmTorpedoWP.LoadGeoset(const aGst: string);
var i: integer;
  z: OleVariant;
  mInfo : CMapXLayerInfo;
begin

  InitOleVariant(z);
  FMap.Layers.RemoveAll;

  if (aGst <> '') and  FileExists(aGst) then begin
    FMap.Geoset := aGst;
    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw ;
    mInfo.AddParameter('Name', 'Animation');
    FLyrDraw := FMap.Layers.Add(mInfo, 1);
    FMap.Layers.AnimationLayer := FLyrDraw;
    FMap.BackColor := CBackgroundMapColor;
    FMap.MapUnit := miUnitNauticalMile;
    FMap.CenterX := 112.75;
    fmap.CenterY := -7.2;
//    FMap.ZoomTo(Self.FCurrentRange * 2, FMap.CenterX, FMap.CenterY);
    FMap.ZoomTo(50* 2, FMap.CenterX, FMap.CenterY);
  end

end;

function TFrmTorpedoWP.MeterHeight: Integer;
begin
  Result := FMap.Height;
end;

function TFrmTorpedoWP.MeterWidth: Integer;
begin
  Result := FMap.Width;
end;

procedure TFrmTorpedoWP.pnlAssFuncMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  SenderPanel: TObject;
begin
  if Sender is TLabel then SenderPanel := (Sender as Tlabel).Parent

  else SenderPanel := Sender;

  case TPanel(SenderPanel).Tag of
    0:
    begin
      // FuncTaskRightMode di check di dalam sini
      if FuncTaskRightMode = 0 then // Create Modify Track
      begin
        if not Assigned(frmCreateModifyTrack) then
        begin
          frmCreateModifyTrack := TfrmCreateModifyTrack.Create(Self);
          frmCreateModifyTrack.Show;
          frmCreateModifyTrack.Top := 300;
          frmCreateModifyTrack.Left := 300;
        end
        else FreeAndNil(frmCreateModifyTrack);
      end
      else if FuncTaskRightMode = 2 then // System Mode Select
      begin

      end
      else if FuncTaskRightMode = 3 then // Tactical Recording
      begin

      end
      else if FuncTaskRightMode = 4 then // Track CtrlBy Numb
      begin
        if not Assigned(frmControlByNumber) then
        begin
          frmControlByNumber := TfrmControlByNumber.Create(Self);
          frmControlByNumber.Show;
          frmControlByNumber.Top := 300;
          frmControlByNumber.Left := 300;
        end

        else FreeAndNil(frmControlByNumber);
      end
      else if FuncTaskRightMode = 5 then // Tactical Calc
      begin

      end
    end;
    1:
    begin
      if FuncTaskRightMode = 0 then  // kosong
      begin

      end
      else if FuncTaskRightMode = 2 then  // Opera- tion Area
      begin

      end
      else if FuncTaskRightMode = 3 then  // PMA
      begin

      end
      else if FuncTaskRightMode = 4 then  // Track List
      begin
        if not Assigned(frmTrackListNumber) then
        begin
          frmTrackListNumber := TfrmTrackListNumber.Create(Self);
          frmTrackListNumber.Show;
          frmTrackListNumber.Top := 300;
          frmTrackListNumber.Left := 300;
        end

        else FreeAndNil(frmTrackListNumber);
      end
      else if FuncTaskRightMode = 5 then  // Media Writer
      begin

      end
    end;
    2:
    begin
      if FuncTaskRightMode = 0 then  // Combine Track
      begin

      end
      else if FuncTaskRightMode = 2 then  // kosong
      begin

      end
      else if FuncTaskRightMode = 3 then  // Snapshot
      begin

      end
      else if FuncTaskRightMode = 4 then  // Sensor Track List
      begin
        if not Assigned(frmSensorTrackList) then
        begin
          frmSensorTrackList := TfrmSensorTrackList.Create(Self);
          frmSensorTrackList.Show;
          frmSensorTrackList.Top := 300;
          frmSensorTrackList.Left := 300;
        end

        else FreeAndNil(frmSensorTrackList);
      end
      else if FuncTaskRightMode = 5 then  // Browser
      begin

      end
    end;
    3:
    begin
      if FuncTaskRightMode = 0 then  // Create Track
      begin

      end
      else if FuncTaskRightMode = 2 then  // kosong
      begin

      end
      else if FuncTaskRightMode = 3 then  // Image Recording
      begin

      end
      else if FuncTaskRightMode = 4 then  // Tact Trp/Cnt List
      begin
        if not Assigned(frmTorpedoContactList) then
        begin
          frmTorpedoContactList := TfrmTorpedoContactList.Create(Self);
          frmTorpedoContactList.Show;
          frmTorpedoContactList.Top := 300;
          frmTorpedoContactList.Left := 300;
        end

        else FreeAndNil(frmTorpedoContactList);
      end
      else if FuncTaskRightMode = 5 then  // Area Manager
      begin

      end
    end;
    4:
    begin
      if FuncTaskRightMode = 0 then  // Track History
      begin
        if not Assigned(frmTrackHistory) then
        begin
          frmTrackHistory := TfrmTrackHistory.Create(Self);
          frmTrackHistory.Show;
          frmTrackHistory.Top := 300;
          frmTrackHistory.Left := 300;
        end

        else FreeAndNil(frmTrackHistory);
      end
      else if FuncTaskRightMode = 2 then  // Torp Info
      begin

      end
      else if FuncTaskRightMode = 3 then  // Image Replay
      begin

      end
      else if FuncTaskRightMode = 4 then  // Torp Trp/Cnt List
      begin
        if not Assigned(frmTorpedoContactList) then
        begin
          frmTorpedoContactList := TfrmTorpedoContactList.Create(Self);
          frmTorpedoContactList.Show;
          frmTorpedoContactList.Top := 300;
          frmTorpedoContactList.Left := 300;
        end

        else FreeAndNil(frmTorpedoContactList);
      end
      else if FuncTaskRightMode = 5 then  // kosong
      begin

      end
    end;
    5:
    begin
      if FuncTaskRightMode = 0 then  // Delete Track
      begin

      end
      else if FuncTaskRightMode = 2 then  // Nav Setting
      begin

      end
      else if FuncTaskRightMode = 3 then  // kosong
      begin

      end
      else if FuncTaskRightMode = 4 then  // Wake List
      begin
        if not Assigned(frmWakeList) then
        begin
          frmWakeList := TfrmWakeList.Create(Self);
          frmWakeList.Show;
          frmWakeList.Top := 300;
          frmWakeList.Left := 300;
        end

        else FreeAndNil(frmWakeList);
      end
      else if FuncTaskRightMode = 5 then  // kosong
      begin

      end
    end;
  end;
end;

procedure TFrmTorpedoWP.pnlFuncTaskRightMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FuncTaskRightSelect(sender);
end;

procedure TFrmTorpedoWP.pnlSubmodeTools0MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//   TPanel(TLabel(Sender).Parent).Color := clLime;

  SubmodeToolsSelect(Sender);
end;

procedure TFrmTorpedoWP.pnlTacticalBtnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  if TPanel(Sender).Color = clLime then
//    TPanel(Sender).Color := clBlack
//  else if TPanel(Sender).Color = clBlack then
//    TPanel(Sender).Color := clLime;
    SubmodeSelect(Sender);
//  (Sender as TPanel).Color := clLime;
end;

procedure TFrmTorpedoWP.ResetAssociatedFunction;
begin
  pnlAssFunc0.Color := clBlack;
  pnlAssFunc1.Color := clBlack;
  pnlAssFunc2.Color := clBlack;
  pnlAssFunc3.Color := clBlack;
  pnlAssFunc4.Color := clBlack;
  pnlAssFunc5.Color := clBlack;

  pnlAssFunc0.Enabled := False;
  pnlAssFunc1.Enabled := False;
  pnlAssFunc2.Enabled := False;
  pnlAssFunc3.Enabled := False;
  pnlAssFunc4.Enabled := False;
  pnlAssFunc5.Enabled := False;

  lblAssFunc0.Enabled := False;
  lblAssFunc1.Enabled := False;
  lblAssFunc2.Enabled := False;
  lblAssFunc3.Enabled := False;
  lblAssFunc4.Enabled := False;
  lblAssFunc5.Enabled := False;

  lblAssFunc0.Caption := '';
  lblAssFunc1.Caption := '';
  lblAssFunc2.Caption := '';
  lblAssFunc3.Caption := '';
  lblAssFunc4.Caption := '';
  lblAssFunc5.Caption := '';
end;

procedure TFrmTorpedoWP.ResetSubmodeTools;
begin
  pnlSubmodeTools0.Color := clBlack;
  pnlSubmodeTools1.Color := clBlack;
  pnlSubmodeTools2.Color := clBlack;
  pnlSubmodeTools3.Color := clBlack;
  pnlSubmodeTools4.Color := clBlack;
  pnlSubmodeTools5.Color := clBlack;
  pnlSubmodeTools6.Color := clBlack;
  pnlSubmodeTools7.Color := clBlack;
  pnlSubmodeTools8.Color := clBlack;
  pnlSubmodeTools9.Color := clBlack;
  pnlSubmodeTools10.Color := clBlack;
  pnlSubmodeTools11.Color := clBlack;
  pnlSubmodeTools12.Color := clBlack;
  pnlSubmodeTools13.Color := clBlack;
  pnlSubmodeTools14.Color := clBlack;
  pnlSubmodeTools15.Color := clBlack;
  pnlSubmodeTools16.Color := clBlack;
  pnlSubmodeTools17.Color := clBlack;
  pnlSubmodeTools18.Color := clBlack;
  pnlSubmodeTools19.Color := clBlack;

  pnlSubmodeTools0.Enabled := False;
  pnlSubmodeTools1.Enabled := False;
  pnlSubmodeTools2.Enabled := False;
  pnlSubmodeTools3.Enabled := False;
  pnlSubmodeTools4.Enabled := False;
  pnlSubmodeTools5.Enabled := False;
  pnlSubmodeTools6.Enabled := False;
  pnlSubmodeTools7.Enabled := False;
  pnlSubmodeTools8.Enabled := False;
  pnlSubmodeTools9.Enabled := False;
  pnlSubmodeTools10.Enabled := False;
  pnlSubmodeTools11.Enabled := False;
  pnlSubmodeTools12.Enabled := False;
  pnlSubmodeTools13.Enabled := False;
  pnlSubmodeTools14.Enabled := False;
  pnlSubmodeTools15.Enabled := False;
  pnlSubmodeTools16.Enabled := False;
  pnlSubmodeTools17.Enabled := False;
  pnlSubmodeTools18.Enabled := False;
  pnlSubmodeTools19.Enabled := False;

  lblSubmodeTools0.Enabled := False;
  lblSubmodeTools1.Enabled := False;
  lblSubmodeTools2.Enabled := False;
  lblSubmodeTools3.Enabled := False;
  lblSubmodeTools4.Enabled := False;
  lblSubmodeTools5.Enabled := False;
  lblSubmodeTools6.Enabled := False;
  lblSubmodeTools7.Enabled := False;
  lblSubmodeTools8.Enabled := False;
  lblSubmodeTools9.Enabled := False;
  lblSubmodeTools10.Enabled := False;
  lblSubmodeTools11.Enabled := False;
  lblSubmodeTools12.Enabled := False;
  lblSubmodeTools13.Enabled := False;
  lblSubmodeTools14.Enabled := False;
  lblSubmodeTools15.Enabled := False;
  lblSubmodeTools16.Enabled := False;
  lblSubmodeTools17.Enabled := False;
  lblSubmodeTools18.Enabled := False;
  lblSubmodeTools19.Enabled := False;

  lblSubmodeTools0.Caption := '';
  lblSubmodeTools1.Caption := '';
  lblSubmodeTools2.Caption := '';
  lblSubmodeTools3.Caption := '';
  lblSubmodeTools4.Caption := '';
  lblSubmodeTools5.Caption := '';
  lblSubmodeTools6.Caption := '';
  lblSubmodeTools7.Caption := '';
  lblSubmodeTools8.Caption := '';
  lblSubmodeTools9.Caption := '';
  lblSubmodeTools10.Caption := '';
  lblSubmodeTools11.Caption := '';
  lblSubmodeTools12.Caption := '';
  lblSubmodeTools13.Caption := '';
  lblSubmodeTools14.Caption := '';
  lblSubmodeTools15.Caption := '';
  lblSubmodeTools16.Caption := '';
  lblSubmodeTools17.Caption := '';
  lblSubmodeTools18.Caption := '';
  lblSubmodeTools19.Caption := '';
end;

function TFrmTorpedoWP.Rotate(Width, Height, Radius: Integer;
  Degrees: Double): Winapi.Windows.TPoint;
var
  Angle: Double;
  W, H: Integer;
//  HeadingView : THeadingRadarView;
begin
//  if Assigned(NavSimCenter.NAV_Radar.HeadingView) then
//  begin
//   HeadingView := uRadarNavManager.NavSimCenter.NAV_Radar.getHeadingLine;
//   if HeadingView.HeadingMode = sbmCourseUp then
//   begin
//       Angle := HeadingView.Heading;
//       if Angle < 0 then Angle := CBaseAngle - Angle;
//       Angle := CBaseAngle - Angle;
//       Angle := ConvCompass_To_Cartesian(Angle);
//       Angle := ConvCustomAngleStart(degrees,Angle);
//       Angle := Angle*C_DegToRad;
//   end
//   else
//   //if HeadingView.HeadingMode = sbmCourseUp then
//      Angle  := ConvCartesian_To_Compass(Degrees)*C_DegToRad;
//  end
//  else
     Angle := ConvCartesian_To_Compass(Degrees)*C_DegToRad;

  W := Width div 2;
  H := Height div 2;
  Result.X := W + Round(Cos(Angle) * Radius);
  Result.Y := H + Round(Sin(Angle) * Radius);
  Result.Y := (H * 2) - Result.Y;
end;

procedure TFrmTorpedoWP.SetLayoutForm;
var
  path : string;
  idxTactScreen, alTactScreen, xTactScreen, yTactScreen,
  idxTorpedoWP, alTorpedoWP, xTorpedoWP, yTorpedoWP,
  bdrPanelAtas,  bdrPanelBawah,  bdrTemp: Integer;
begin
   path := ExtractFilePath(Application.ExeName) + 'SetFormBlackSharkToMonitor.ini';

   Getsettingform(path, 'TACTICAL_SCREEN',  idxTactScreen,  alTactScreen,    xTactScreen,   yTactScreen);
   Getsettingform(path, 'TORPEDO_WP', idxTorpedoWP, alTorpedoWP,   xTorpedoWP,  yTorpedoWP);
//   Getsettingform(path, 'BORDER',     bdrPanelAtas,  bdrPanelBawah,  bdrKeyboard,  bdrTemp);

//test rojek
//  frmTacticalScreen.Monitor := Screen.Monitors[idxPanelAtas];
//  frmSupportScreen.Monitor := Screen.Monitors[idxPanelBawah];
   AlignFormToMonitor(0, apLeftTop, -1920, 0, TForm(frmTacticalScreen));
   AlignFormToMonitor(1, apLeftTop, 0, 0, TForm(frmTorpedoWP));
//    case Screen.MonitorCount of
//      1 :
//        begin
//          AlignFormToMonitor(0, apLeftTop, 0, 0, TForm(frmTacticalScreen));
//          AlignFormToMonitor(0, apLeftTop, 0, 0, TForm(frmSupportScreen));
//        end;
//      2,3 :
//        begin
//          AlignFormToMonitor(idxPanelAtas, apLeftTop, 0, 0, TForm(frmTacticalScreen));
//          AlignFormToMonitor(idxPanelBawah, apLeftTop, 0, 0, TForm(frmSupportScreen));
//        end;
//    end;
end;

procedure TFrmTorpedoWP.setRegionCircle;
const brd = 30;
var eRgn: HRGN;
    r : TRect;
    rcxMap, rcyMap: integer;
    left,top,right,bottom : Integer;
    diffBeetwinWH : Integer;  //differnt beetwin width and height width - height, kemudian dibagi dua sebagai batas left dan right,supaya lingkarannya tetap center.
begin
  rCXMap := FMap.Width  shr 1;
  rCYMap := FMap.Height shr 1;

//  r := Rect(222,50, FMap.Height + 110, FMap.Height - 50);
  diffBeetwinWH := (FMap.Width - FMap.Height) div 2;

  top := 50;
  bottom := FMap.Height - top;
  left := diffBeetwinWH + top;
  right := FMap.Width - left;

  FCircleRect  := Rect(left,top, right, bottom);

//  eRgn := CreateEllipticRgn(FCircleRect.Left, FCircleRect.Top, FCircleRect.Right, FCircleRect.Bottom);
//  SetWindowRgn(FMap.Handle, eRgn, true);

  // center & radius dalam koordinat FMap (DC yang dipakai DrawUserLayer)
  FCircleCX := (FCircleRect.Left + FCircleRect.Right) div 2;
  FCircleCY := (FCircleRect.Top  + FCircleRect.Bottom) div 2;
  FCircleR  := (FCircleRect.Right - FCircleRect.Left) div 2;

  //global Form Koord
  rCx := rcxMap - FMap.Left;
  rCy := rCYMap + FMap.Top;
end;

procedure TFrmTorpedoWP.SubmodeToolsSelect(Sender: Tobject);
var
  L: TLabel;
  P: TPanel;
  isValid : Boolean;
  RecSend : TRecSetTorpedoSUT;

  CorrectBearing,
  CorrectElev : Double;
  aLow, aHigh: Double;
  range,rangem, bearing : Double;
begin

  if not (Sender is TLabel) then Exit;

  if TLabel(Sender).Enabled = False then Exit;

  L := TLabel(Sender);

  if not (L.Parent is TPanel) then Exit;

  P := TPanel(L.Parent);

  if not P.Enabled then
    Exit;

//  if not (TLabel(Sender).Parent is TPanel) then
//  Exit;
//
//  if TPanel((Sender as TLabel).Parent).Enabled = false then Exit;

//  if TPanel((Sender as TLabel).Parent).Tag = SubmodeTools then Exit;

//  if Sender is TLabel then SenderPanel := (Sender as Tlabel).Parent
//
//  else SenderPanel := Sender;



//  pnlSubmodeTools0.Color := clBlack;
//  pnlSubmodeTools1.Color := clBlack;
//  pnlSubmodeTools2.Color := clBlack;
//  pnlSubmodeTools3.Color := clBlack;
//  pnlSubmodeTools4.Color := clBlack;
//  pnlSubmodeTools5.Color := clBlack;
//  pnlSubmodeTools6.Color := clBlack;
//  pnlSubmodeTools7.Color := clBlack;
//  pnlSubmodeTools8.Color := clBlack;
//  pnlSubmodeTools9.Color := clBlack;
//  pnlSubmodeTools10.Color := clBlack;
//  pnlSubmodeTools11.Color := clBlack;
//  pnlSubmodeTools12.Color := clBlack;
//  pnlSubmodeTools13.Color := clBlack;
//  pnlSubmodeTools14.Color := clBlack;
//  pnlSubmodeTools15.Color := clBlack;
//  pnlSubmodeTools16.Color := clBlack;
//  pnlSubmodeToolS17.Color := clBlack;
//  pnlSubmodeTools18.Color := clBlack;
//  pnlSubmodeTools19.Color := clBlack;

//  TLabel(Sender).Color := clLime;
// 0: Drop Sonar Track, 1: , 2: ToSo Audio, 3: Fire, 4: Stop Fire Seq, 5: Classification, 6: Guide To Bearing
// 7: Torp Vert View, 8: Torp Contact Mngmnt, 9: SPA, 10: Torp Exercise Mode, 11: Immediate Fire, 12: TorpAlloc
// 13: Launch Salvo, 14: Torp Emerg Exe, 15: Mark Special Event, 16: Torp Ctrl, 17: Sim
// 18: Preset Torp Params, 19: Coverage
  case p.Tag of
    0:
    begin
      FDropSonar := not FDropSonar;

      if FDropSonar then pnlSubmodeTools0.Color := clLime
      else pnlSubmodeTools0.Color := clBlack;

    end;
    2:
    begin
      FToSoAudio := not FToSoAudio;

      if FToSoAudio then pnlSubmodeTools2.Color := clLime
      else pnlSubmodeTools2.Color := clBlack;
    end;
    3:
    begin

    end;
    4:
    begin

    end;
    5:
    begin
      FClassification := not FClassification;

      if FClassification then pnlSubmodeTools5.Color := clLime
      else pnlSubmodeTools5.Color := clBlack;
    end;
    6:
    begin

    end;
    7:
    begin
//      FTorpVertView := not FTorpVertView;
//
//      if FTorpVertView then pnlSubmodeTools7.Color := clLime
//      else pnlSubmodeTools7.Color := clBlack;

      if not Assigned(frmTorpedoVerticalView) then
      begin
        frmTorpedoVerticalView := TfrmTorpedoVerticalView.Create(Self);
        frmTorpedoVerticalView.Show;
        frmTorpedoVerticalView.Top := 300;
        frmTorpedoVerticalView.Left := 300;
      end

      else FreeAndNil(frmTorpedoVerticalView);
    end;
    8:
    begin
      FTorpContactMngmnt := not FTorpContactMngmnt;

      if FTorpContactMngmnt then pnlSubmodeTools8.Color := clLime
      else pnlSubmodeTools8.Color := clBlack;
    end;
    9:
    begin
      FSPA := not FSPA;

      if FSPA then pnlSubmodeTools9.Color := clLime
      else pnlSubmodeTools9.Color := clBlack;
    end;
    10:
    begin
      FTorpExcercise := not FTorpExcercise;

      if FTorpExcercise then pnlSubmodeTools10.Color := clLime
      else pnlSubmodeTools10.Color := clBlack;
    end;
    11:
    begin

    end;
    12:
    begin
      FTorpAlloc := not FTorpAlloc;

      if FTorpAlloc then
      begin
        pnlSubmodeTools12.Color := clLime;
        SutBlacksharkManager.isTorpedoAllocShow := FTorpAlloc;
      end
      else
      begin
        pnlSubmodeTools12.Color := clBlack;
        SutBlacksharkManager.isTorpedoAllocShow := FTorpAlloc;
      end;
    end;
    13:
    begin
      FLaunchSalvo := not FLaunchSalvo;

      if FLaunchSalvo then
      begin
        pnlSubmodeTools13.Color := clLime;

        lblSubmodeTools3.Caption := 'Fire';
        pnlSubmodeTools3.Enabled := True;
        lblSubmodeTools3.Enabled := True;

        lblSubmodeTools4.Caption := 'Stop' + #13#10 + 'Fire'+ #13#10 + 'Seq';
        pnlSubmodeTools4.Enabled := True;
        lblSubmodeTools4.Enabled := True;
      end
      else
      begin
        pnlSubmodeTools13.Color := clBlack;

        lblSubmodeTools3.Caption := '';
        pnlSubmodeTools3.Enabled := false;
        lblSubmodeTools3.Enabled := false;

        lblSubmodeTools4.Caption := '';
        pnlSubmodeTools4.Enabled := false;
        lblSubmodeTools4.Enabled := false;
      end;
    end;
    14:
    begin

    end;
    15:
    begin

    end;
    16:
    begin
      FTorpCtrl := not FTorpCtrl;

      if FTorpCtrl then
      begin
        pnlSubmodeTools16.Color := clLime;
        lblSubmodeTools6.Caption := 'Guide' + #13#10 + 'To'+ #13#10 + 'Bearing';
        pnlSubmodeTools6.Enabled := True;
        lblSubmodeTools6.Enabled := True;
      end
      else
      begin
        pnlSubmodeTools16.Color := clBlack;
        lblSubmodeTools6.Caption := '';
        pnlSubmodeTools6.Enabled := false;
        lblSubmodeTools6.Enabled := false;
      end;

      if not Assigned(FFrmTorpedoGuidance) then
      begin
//        pnlTorpedoGuidanceWindow.Caption := '';

        FFrmTorpedoGuidance        := TfrmTorpedoGuidanceWindow.Create(Self);
        FFrmTorpedoGuidance.Parent := pnlTorpedoGuidanceWindow;
        FFrmTorpedoGuidance.Align  := alClient;
        FFrmTorpedoGuidance.Show;
      end
      else FreeAndNil(FFrmTorpedoGuidance);

      if not Assigned(FFrmTorpedoHomingStatusPlot) then
      begin

        FFrmTorpedoHomingStatusPlot        := TfrmHomingStatusPlot.Create(Self);
        FFrmTorpedoHomingStatusPlot.Parent := pnlTorpedoHomingStatusPlot;
        FFrmTorpedoHomingStatusPlot.Align  := alClient;
        FFrmTorpedoHomingStatusPlot.Show;

        pnlToSo.BringToFront;
      end
      else FreeAndNil(FFrmTorpedoHomingStatusPlot);
    end;
    17:
    begin

    end;
    18:
    begin

    end;
    19:
    begin

    end;
  end;

//  TLabel(Sender).paren
//  TPanel((Sender as TLabel).Parent).Color := clLime;
  SubmodeTools := TPanel((Sender as TLabel).Parent).Tag;

  if (SubmodeTools = 11) and (lblSubmodeTools11.Caption = 'Imme-' + #13#10 + 'diate' + #13#10 + 'Firing') and (pnlSubmodeTools11.Enabled = true)
      and (lblSubmodeTools11.Enabled = true) then
  begin
    if (Assigned(SutBlacksharkManager.SelectedVehicle)) and (SelectedVehicleState = true)then
    begin
      range := CalcRange(SutBlacksharkManager.xShip.PositionX, SutBlacksharkManager.xShip.PositionY, SutBlacksharkManager.SelectedVehicle.PosX, SutBlacksharkManager.SelectedVehicle.PosY);
      rangem := range * C_NauticalMile_To_Metre;
      bearing := CalcBearing(SutBlacksharkManager.xShip.PositionX, SutBlacksharkManager.xShip.PositionY, SutBlacksharkManager.SelectedVehicle.PosX, SutBlacksharkManager.SelectedVehicle.PosY);
      // range = 3000 m, target lebih rendah 25 m
      ComputeBallisticAngleVacuum(rangem, SutBlacksharkManager.SelectedVehicle.PosZ, 800, aLow, aHigh);

      if (aLow <= 80 ) and (aLow >= 0 )then
      begin
  //      FTargetAngleElevasi:= StrToFloatDef(edtElevasi.Text, 0);
        aLow := FMod(aLow, 360);
        if aLow < 0 then
          aLow := aLow + 360;

        RecSend.ShipID              := SutBlacksharkManager.ShipID;
        RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
        RecSend.mLauncherID         := 1;
        RecSend.mMissileID          := 0;
        RecSend.mMissileNumber      := 0;
  //      RecSend.OrderID             := 0;

        RecSend.mTorpedoSpeed       := 0;
        RecSend.mT_ID               := SutBlacksharkManager.SelectedVehicle.ShipID;
        RecSend.mMissileType        := 0;
        RecSend.mTorpedoDepth       := aLow;
        RecSend.mTorpedoCourse      := bearing;

        RecSend.mTargetType         := SutBlacksharkManager.SelectedVehicle.Domain;
  //      RecSend.mSalvoRate          := 30;


        RecSend.OrderID := __ORD_TORPEDOSUT_FIRED;
        SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);
      end
      else if (aLow >= 350 )then
      begin
        alow := FMod(alow, 360);
        if alow < 0 then
          alow := alow + 360;

        RecSend.ShipID              := SutBlacksharkManager.ShipID;
        RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
        RecSend.mLauncherID         := 1;
        RecSend.mMissileID          := 0;
        RecSend.mMissileNumber      := 0;
  //      RecSend.OrderID             := 0;

        RecSend.mTorpedoSpeed       := 0;
        RecSend.mT_ID               := SutBlacksharkManager.SelectedVehicle.ShipID;
        RecSend.mMissileType        := 0;
        RecSend.mTorpedoDepth       := aLow;
        RecSend.mTorpedoCourse      := bearing;

        RecSend.mTargetType         := SutBlacksharkManager.SelectedVehicle.Domain;
  //      RecSend.mSalvoRate          := 30;


        RecSend.OrderID := __ORD_TORPEDOSUT_FIRED;
        SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);
      end;
    end;
  end;

//
end;

procedure TFrmTorpedoWP.SubmodeSelect(Sender: Tobject);
begin
  if TPanel(Sender).Tag = submode then Exit;

  ResetSubmodeTools;

  pnlTacticalBtn.Color := clBlack;
  pnlTorpedoBtn.Color := clBlack;
  pnlTMABtn.Color := clBlack;
  pnlLinkBtn.Color := clBlack;
  pnlResmBtn.Color := clBlack;
  pnlPeriscopeBtn.Color := clBlack;

  TPanel(Sender).Color := clLime;
  Submode := TPanel(Sender).Tag;

  case Submode of
    0:
    begin
      lblSubmodeTools0.Caption := 'Drop' + #13#10 + 'Sonar' + #13#10 + 'Track';
      pnlSubmodeTools0.Enabled := True;
      lblSubmodeTools0.Enabled := True;

      lblSubmodeTools2.Caption := 'RESM' + #13#10 + 'Data' + #13#10 + 'Control';
      pnlSubmodeTools2.Enabled := True;
      lblSubmodeTools2.Enabled := True;

      lblSubmodeTools5.Caption := 'Classi-' + #13#10 + 'fication';
      pnlSubmodeTools5.Enabled := True;
      lblSubmodeTools5.Enabled := True;


      lblSubmodeTools6.Caption := 'CEP';
      pnlSubmodeTools6.Enabled := True;
      lblSubmodeTools6.Enabled := True;

      lblSubmodeTools7.Caption := 'Threat' + #13#10 + 'Eval';
      pnlSubmodeTools7.Enabled := True;
      lblSubmodeTools7.Enabled := True;

      lblSubmodeTools9.Caption := 'SPA';
      pnlSubmodeTools9.Enabled := True;
      lblSubmodeTools9.Enabled := True;

      lblSubmodeTools11.Caption := 'Imme-' + #13#10 + 'diate' + #13#10 + 'Firing';
      pnlSubmodeTools11.Enabled := True;
      lblSubmodeTools11.Enabled := True;

      lblSubmodeTools12.Caption := 'Torp' + #13#10 + 'Alloc';
      pnlSubmodeTools12.Enabled := True;
      lblSubmodeTools12.Enabled := True;

      lblSubmodeTools17.Caption := 'Sim';
      pnlSubmodeTools17.Enabled := True;
      lblSubmodeTools17.Enabled := True;

      lblSubmodeTools18.Caption := 'Data' + #13#10 + 'Export' + #13#10 + 'Setup';
      pnlSubmodeTools18.Enabled := True;
      lblSubmodeTools18.Enabled := True;

      lblSubmodeTools19.Caption := 'Cove-' + #13#10 + 'rage';
      pnlSubmodeTools19.Enabled := True;
      lblSubmodeTools19.Enabled := True;
    end;
    1:
    begin
      lblSubmodeTools0.Caption := 'Drop' + #13#10 + 'Sonar' + #13#10 + 'Track';
      pnlSubmodeTools0.Enabled := True;
      lblSubmodeTools0.Enabled := True;

      lblSubmodeTools3.Caption := 'RESM' + #13#10 + 'Data' + #13#10 + 'Control';
      pnlSubmodeTools3.Enabled := True;
      lblSubmodeTools3.Enabled := True;

      lblSubmodeTools5.Caption := 'Classi-' + #13#10 + 'fication';
      pnlSubmodeTools5.Enabled := True;
      lblSubmodeTools5.Enabled := True;

      lblSubmodeTools6.Caption := 'CEP';
      pnlSubmodeTools6.Enabled := True;
      lblSubmodeTools6.Enabled := True;

      lblSubmodeTools8.Caption := 'Torp' + #13#10 + 'Contact' + #13#10 + 'Mngmnt';
      pnlSubmodeTools8.Enabled := True;
      lblSubmodeTools8.Enabled := True;

      lblSubmodeTools9.Caption := 'SPA';
      pnlSubmodeTools9.Enabled := True;
      lblSubmodeTools9.Enabled := True;

      lblSubmodeTools10.Caption := 'Display' + #13#10 + 'Calc';
      pnlSubmodeTools10.Enabled := True;
      lblSubmodeTools10.Enabled := True;

      lblSubmodeTools11.Caption := 'Display' + #13#10 + 'Trial';
      pnlSubmodeTools11.Enabled := True;
      lblSubmodeTools11.Enabled := True;

      lblSubmodeTools12.Caption := 'Initial' + #13#10 + 'Range';
      pnlSubmodeTools12.Enabled := True;
      lblSubmodeTools12.Enabled := True;

      lblSubmodeTools14.Caption := 'Excl' + #13#10 + 'OS' + #13#10 + 'Mnvr';
      pnlSubmodeTools14.Enabled := True;
      lblSubmodeTools14.Enabled := True;

      lblSubmodeTools15.Caption := 'Select' + #13#10 + '4' + #13#10 + 'Brngs';
      pnlSubmodeTools15.Enabled := True;
      lblSubmodeTools15.Enabled := True;

      lblSubmodeTools16.Caption := 'Set' + #13#10 + 'Tgt' + #13#10 + 'Mnvr';
      pnlSubmodeTools16.Enabled := True;
      lblSubmodeTools16.Enabled := True;

      lblSubmodeTools17.Caption := 'Set' + #13#10 + 'BBRF' + #13#10 + 'Official';
      pnlSubmodeTools17.Enabled := True;
      lblSubmodeTools17.Enabled := True;

      lblSubmodeTools18.Caption := 'Auto' + #13#10 + 'Select' + #13#10 + 'Official';
      pnlSubmodeTools18.Enabled := True;
      lblSubmodeTools18.Enabled := True;

      lblSubmodeTools19.Caption := 'Cove-' + #13#10 + 'rage';
      pnlSubmodeTools19.Enabled := True;
      lblSubmodeTools19.Enabled := True;
    end;
    2:
    begin
//      lblSubmodeTools0.Caption := 'Drop' + #13#10 + 'Sonar'+ #13#10 + 'Track';
//      pnlSubmodeTools0.Enabled := True;
//      lblSubmodeTools0.Enabled := True;

      lblSubmodeTools0.Caption := 'ToSo' + #13#10 + 'Audio';
      pnlSubmodeTools0.Enabled := True;
      lblSubmodeTools0.Enabled := True;

//      lblSubmodeTools3.Caption := 'Fire';
//      pnlSubmodeTools3.Enabled := True;
//      lblSubmodeTools3.Enabled := True;
//
//      lblSubmodeTools4.Caption := 'Stop' + #13#10 + 'Fire'+ #13#10 + 'Seq';
//      pnlSubmodeTools4.Enabled := True;
//      lblSubmodeTools4.Enabled := True;

      lblSubmodeTools5.Caption := 'Classi-' + #13#10 + 'fication';
      pnlSubmodeTools5.Enabled := True;
      lblSubmodeTools5.Enabled := True;

//      lblSubmodeTools6.Caption := 'Guide' + #13#10 + 'To'+ #13#10 + 'Bearing';
//      pnlSubmodeTools6.Enabled := True;
//      lblSubmodeTools6.Enabled := True;

      lblSubmodeTools7.Caption := 'Torp' + #13#10 + 'Vert' + #13#10 + 'View';
      pnlSubmodeTools7.Enabled := True;
      lblSubmodeTools7.Enabled := True;

      lblSubmodeTools8.Caption := 'Torp' + #13#10 + 'Contact' + #13#10 + 'Mngmnt';
      pnlSubmodeTools8.Enabled := True;
      lblSubmodeTools8.Enabled := True;

      lblSubmodeTools9.Caption := 'SPA';
      pnlSubmodeTools9.Enabled := True;
      lblSubmodeTools9.Enabled := True;

      lblSubmodeTools10.Caption := 'Torp' + #13#10 + 'Exercise' + #13#10 + 'Mode';
      pnlSubmodeTools10.Enabled := True;
      lblSubmodeTools10.Enabled := True;

      lblSubmodeTools11.Caption := 'Imme-' + #13#10 + 'diate' + #13#10 + 'Firing';
      pnlSubmodeTools11.Enabled := True;
      lblSubmodeTools11.Enabled := True;

      lblSubmodeTools12.Caption := 'Torp' + #13#10 + 'Alloc';
      pnlSubmodeTools12.Enabled := True;
      lblSubmodeTools12.Enabled := True;

      lblSubmodeTools13.Caption := 'Launch' + #13#10 + 'Salvo';
      pnlSubmodeTools13.Enabled := True;
      lblSubmodeTools13.Enabled := True;

      lblSubmodeTools14.Caption := 'Torp' + #13#10 + 'Emerg' + #13#10 + 'Exe';
      pnlSubmodeTools14.Enabled := True;
      lblSubmodeTools14.Enabled := True;

      lblSubmodeTools15.Caption := 'Mark' + #13#10 + 'Special' + #13#10 + 'Event';
      pnlSubmodeTools15.Enabled := True;
      lblSubmodeTools15.Enabled := True;

      lblSubmodeTools16.Caption := 'Torp' + #13#10 + 'Ctrl';
      pnlSubmodeTools16.Enabled := True;
      lblSubmodeTools16.Enabled := True;

      lblSubmodeTools17.Caption := 'Sim';
      pnlSubmodeTools17.Enabled := True;
      lblSubmodeTools17.Enabled := True;

      lblSubmodeTools18.Caption := 'Preset' + #13#10 + 'Torp' + #13#10 + 'Params';
      pnlSubmodeTools18.Enabled := True;
      lblSubmodeTools18.Enabled := True;

      lblSubmodeTools19.Caption := 'Cove-' + #13#10 + 'rage';
      pnlSubmodeTools19.Enabled := True;
      lblSubmodeTools19.Enabled := True;
    end;
    3:
    begin
      lblSubmodeTools0.Caption := 'SERO' + #13#10 + '400' + #13#10 + 'Ctrl';
      pnlSubmodeTools0.Enabled := True;
      lblSubmodeTools0.Enabled := True;

      lblSubmodeTools1.Caption := 'OMS' + #13#10 + '100' + #13#10 + 'Ctrl';
      pnlSubmodeTools1.Enabled := True;
      lblSubmodeTools1.Enabled := True;

      lblSubmodeTools2.Caption := 'Replay';
      pnlSubmodeTools2.Enabled := True;
      lblSubmodeTools2.Enabled := True;
    end;
    4:
    begin
      lblSubmodeTools3.Caption := 'RESM' + #13#10 + 'Data' + #13#10 + 'Control';
      pnlSubmodeTools3.Enabled := True;
      lblSubmodeTools3.Enabled := True;

      lblSubmodeTools1.Caption := 'Classi-' + #13#10 + 'fication';
      pnlSubmodeTools1.Enabled := True;
      lblSubmodeTools1.Enabled := True;
    end;
    5:
    begin
      lblSubmodeTools0.Caption := 'Assign' + #13#10 + 'Track';
      pnlSubmodeTools0.Enabled := True;
      lblSubmodeTools0.Enabled := True;

      lblSubmodeTools1.Caption := 'Deassign' + #13#10 + 'Track';
      pnlSubmodeTools1.Enabled := True;
      lblSubmodeTools1.Enabled := True;

      lblSubmodeTools2.Caption := 'Wipe' + #13#10 + 'Track';
      pnlSubmodeTools2.Enabled := True;
      lblSubmodeTools2.Enabled := True;

      lblSubmodeTools3.Caption := 'Engage-' + #13#10 + 'Ments';
      pnlSubmodeTools3.Enabled := True;
      lblSubmodeTools3.Enabled := True;

      lblSubmodeTools4.Caption := 'Conflict';
      pnlSubmodeTools4.Enabled := True;
      lblSubmodeTools4.Enabled := True;

      lblSubmodeTools5.Caption := 'Settings';
      pnlSubmodeTools5.Enabled := True;
      lblSubmodeTools5.Enabled := True;

      lblSubmodeTools6.Caption := 'Free' + #13#10 + 'Text';
      pnlSubmodeTools6.Enabled := True;
      lblSubmodeTools6.Enabled := True;

      lblSubmodeTools7.Caption := 'Link' + #13#10 + 'Freeze' + #13#10 + 'Tracks';
      pnlSubmodeTools7.Enabled := True;
      lblSubmodeTools7.Enabled := True;

      lblSubmodeTools8.Caption := 'CDO';
      pnlSubmodeTools8.Enabled := True;
      lblSubmodeTools8.Enabled := True;

      lblSubmodeTools9.Caption := 'Test';
      pnlSubmodeTools9.Enabled := True;
      lblSubmodeTools9.Enabled := True;

      lblSubmodeTools10.Caption := 'Corr' + #13#10 + 'List';
      pnlSubmodeTools10.Enabled := True;
      lblSubmodeTools10.Enabled := True;

      lblSubmodeTools11.Caption := 'Set' + #13#10 + 'Track' + #13#10 + 'Alert';
      pnlSubmodeTools11.Enabled := True;
      lblSubmodeTools11.Enabled := True;

      lblSubmodeTools12.Caption := 'PU' + #13#10 + 'Update' + #13#10 + 'Request';
      pnlSubmodeTools12.Enabled := True;
      lblSubmodeTools12.Enabled := True;

      lblSubmodeTools13.Caption := 'PU' + #13#10 + 'Retrans' + #13#10 + 'Request';
      pnlSubmodeTools13.Enabled := True;
      lblSubmodeTools13.Enabled := True;

      lblSubmodeTools14.Caption := 'Orders';
      pnlSubmodeTools14.Enabled := True;
      lblSubmodeTools14.Enabled := True;

      lblSubmodeTools15.Caption := 'Init' + #13#10 + 'Pointer';
      pnlSubmodeTools15.Enabled := True;
      lblSubmodeTools15.Enabled := True;

      lblSubmodeTools16.Caption := 'Delete' + #13#10 + 'Pointer';
      pnlSubmodeTools16.Enabled := True;
      lblSubmodeTools16.Enabled := True;

      lblSubmodeTools17.Caption := 'IFF' + #13#10 + 'Clear' + #13#10 + 'Mode';
      pnlSubmodeTools17.Enabled := True;
      lblSubmodeTools17.Enabled := True;

      lblSubmodeTools18.Caption := 'IFF' + #13#10 + 'Update' + #13#10 + 'Request';
      pnlSubmodeTools18.Enabled := True;
      lblSubmodeTools18.Enabled := True;
    end;
  end;
end;

procedure TFrmTorpedoWP.Timer1Timer(Sender: TObject);
begin
  //imgBackgrounSituationZone.Repaint;
  Invalidate;
end;

procedure TFrmTorpedoWP.TimerBlinkTimer(Sender: TObject);
begin
  if FBlinkPanel = nil then Exit;

  if SelectedVehicleState = false then Exit;

  if (lblSubmodeTools11.Caption = 'Imme-' + #13#10 + 'diate' + #13#10 + 'Firing') and (pnlSubmodeTools11.Enabled = true)
      and (lblSubmodeTools11.Enabled = true)then
  begin
    FBlinkState := not FBlinkState;

    if FBlinkState then
      FBlinkPanel.Color := clRed
    else
      FBlinkPanel.Color := clBlack;
  end;
end;

procedure TFrmTorpedoWP.tmrUpdateDataPosTimer(Sender: TObject);
begin
  {
  lblTanggaljam.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss',now);
  lblOwnshipHeadingVal.Caption := FormatFloat('00.0', SutBlacksharkManager.xShip.Heading);
  lblOwnshipLatPosVal.Caption := FormatFloat('0.0000', SutBlacksharkManager.xShip.PositionY);
  lblOwnshipLongPosVal.Caption := FormatFloat('0.0000', SutBlacksharkManager.xShip.PositionX);
  lblOwnshipSpeedVal.Caption := FormatFloat('00.0', SutBlacksharkManager.xShip.Speed);
  lblOwnshipDepth.Caption := FormatFloat('00.0', SutBlacksharkManager.xShip.PositionZ );

  OwnshipHeadingVal := lblOwnshipHeadingVal.Caption;
  OwnshipLatPosVal := lblOwnshipLatPosVal.Caption;
  OwnshipLongPosVal:= lblOwnshipLongPosVal.Caption;
  OwnshipSpeedVal:= lblOwnshipSpeedVal.Caption;
  OwnshipDepth := lblOwnshipDepth.Caption;
   }
end;

procedure TFrmTorpedoWP.tmrUpdateFormTimer(Sender: TObject);
begin
//  if FNorthAngle < 360 then
//    Inc(FNorthAngle)
//  else
//    FNorthAngle := 0;

//  imgCompas.Repaint;

//  lblBiteTimeSystemValue.Caption := FormatDateTime('hh:nn:ss',now);

  if Assigned(SutBlacksharkManager) then
  begin
    if Assigned(SutBlacksharkManager.xShip) then
    begin
//      edtNavDataLAT.Text := FormatFloat('0.000000', FCCManager.xShip.PositionY);
//      edtNavDataLON.Text := FormatFloat('0.000000', FCCManager.xShip.PositionX);

      if not SutBlacksharkManager.IsTrueMotion then begin
        Fmap.CenterX := SutBlacksharkManager.xShip.PositionX;
        Fmap.CenterY := SutBlacksharkManager.xShip.PositionY;
      //    FMap.Rotation := 0;
        FNorthAngle := 0;
      end
      else
      begin
        FNorthAngle := -SutBlacksharkManager.xShip.Heading;;
      //    FMap.Rotation := -FCCManager.xShip.Heading;
      end;
    end;
  end;
end;

procedure TFrmTorpedoWP.UpdateAttachFormDisplay;
begin
  {$REGION 'Ownship Data'}
  if not Assigned(FFrmOwnShip) then
  begin
    pnlOwnshipData.Caption := '';

    FFrmOwnShip        := TfrmOwnShip.Create(Self);
    FFrmOwnShip.Parent := pnlOwnshipData;
    FFrmOwnShip.Align  := alClient;
    FFrmOwnShip.Show;
  end;
  {$ENDREGION}

  {$REGION 'Alert and Operator Messages'}
  if not Assigned(FFrmAlertandOpearatorMassage) then
  begin
    pnlAlerts.Caption := '';

    FFrmAlertandOpearatorMassage        := TfrmAlertsandOpearatorMassage.Create(Self);
    FFrmAlertandOpearatorMassage.Parent := pnlAlerts;
    FFrmAlertandOpearatorMassage.Align  := alClient;
    FFrmAlertandOpearatorMassage.Show;
  end;
  {$ENDREGION}

  {$REGION 'Target In Control'}
  if not Assigned(FFrmTargetInControl) then
  begin
    pnlTargetInControl.Caption := '';

    FFrmTargetInControl        := TfrmTargetInControl.Create(Self);
    FFrmTargetInControl.Parent := pnlTargetInControl;
    FFrmTargetInControl.Align  := alClient;
    FFrmTargetInControl.Show;
  end;
  {$ENDREGION}

  {$REGION 'Contact In Control'}
  if not Assigned(FFrmContactInControl) then
  begin
    pnlContactInCtrl.Caption := '';

    FFrmContactInControl        := TfrmContactInControl.Create(Self);
    FFrmContactInControl.Parent := pnlContactInCtrl;
    FFrmContactInControl.Align  := alClient;
    FFrmContactInControl.Show;
  end;
  {$ENDREGION}

  {$REGION 'Torpedo Tubes Status Panel'}
  if not Assigned(FFrmTorpedoTubesStatus) then
  begin
    pnlTorpedoTubesStatus.Caption := '';

    FFrmTorpedoTubesStatus        := TfrmTorpedoTubeStatusWindow.Create(Self);
    FFrmTorpedoTubesStatus.Parent := pnlTorpedoTubesStatus;
    FFrmTorpedoTubesStatus.Align  := alClient;
    FFrmTorpedoTubesStatus.Show;
  end;
  {$ENDREGION}

  {$REGION 'Depth Plot'}
  if not Assigned(FFrmDepthPlot) then
  begin
    pnlDepthPlot.Caption := '';

    FFrmDepthPlot        := TfrmDepthPlot.Create(Self);
    FFrmDepthPlot.Parent := pnlDepthPlot;
    FFrmDepthPlot.Align  := alClient;
    FFrmDepthPlot.Show;
  end;
  {$ENDREGION}

  {$REGION 'Engagement Data Overview'}
  if not Assigned(FFrmEngagementDataOverview) then
  begin
    pnlGroupInfoBawah.Caption := '';

    FFrmEngagementDataOverview        := TfrmEngagementDataOverview.Create(Self);
    FFrmEngagementDataOverview.Parent := pnlGroupInfoBawah;
    FFrmEngagementDataOverview.Align  := alClient;
    FFrmEngagementDataOverview.Show;
  end;
  {$ENDREGION}

  {$REGION 'Homing Status Plot'}
//  if not Assigned(FFrmTorpedoHomingStatusPlot) then
//  begin
//    pnlTorpedoHomingStatusPlot.Caption := '';
//
//    FFrmTorpedoHomingStatusPlot        := TfrmHomingStatusPlot.Create(Self);
//    FFrmTorpedoHomingStatusPlot.Parent := pnlTorpedoHomingStatusPlot;
//    FFrmTorpedoHomingStatusPlot.Align  := alClient;
//    FFrmTorpedoHomingStatusPlot.Show;
//
//    pnlToSo.BringToFront;
//  end;
  {$ENDREGION}

end;

end.
