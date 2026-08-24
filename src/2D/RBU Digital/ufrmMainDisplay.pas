unit ufrmMainDisplay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, MapXLib_TLB,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons, TFlatButtonUnit,
  Vcl.ComCtrls, VrControls, VrTrackBar, {acPNG,} Vcl.Imaging.pngimage,
  System.Math, uRBU_Manager, uLibRBU, uBridgeSet, uSimulationManager, uBaseFunctionRBUD,
  uMapXUnitConverter, uRadarVisual, uCoordConverter, uRadarDynamicSector,
  VrAngularMeter;

type
  TGroupBox = class(Vcl.StdCtrls.TGroupBox) //declare this before of your form definition
  public
    procedure Paint; override;
  end;

  TfrmMainDisplay = class(TForm)
    pnlLeft: TPanel;
    pnlCenter: TPanel;
    pnlRight: TPanel;
    pnlLTop: TPanel;
    pnlLCenter: TPanel;
    pnlLBottom: TPanel;
    FMap: TMap;
    pnlLTRight: TPanel;
    grpEquipmentStatus: TGroupBox;
    pnlRRRT: TPanel;
    edtRBUTrainLInRange: TEdit;
    edtRBUTrainRInRange: TEdit;
    edtRBUElevInRange: TEdit;
    edtRBUTargetDetected: TEdit;
    imgRBUTrainLInRange: TImage;
    ilLed: TImageList;
    imgRBUTrainRInRange: TImage;
    imgRBUElevInRange: TImage;
    imgRBUTargetDetected: TImage;
    pnlPwrRef: TPanel;
    imgPwr: TImage;
    imgRef: TImage;
    edtPwr: TEdit;
    edtRef: TEdit;
    pnlVoltRef: TPanel;
    edtVoltRef: TEdit;
    edtVoltRefValue: TEdit;
    grpFiringModeRBU: TGroupBox;
    pnlSistemBurja: TPanel;
    imgSistemBurjaLama: TImage;
    imgSistemBurjaBaru: TImage;
    edtSistemBurjaLama: TEdit;
    edtSistemBurjaBaru: TEdit;
    pnlSalvoSelect: TPanel;
    pnlLabelSalvoL: TPanel;
    pnlLabelSalvoR: TPanel;
    grpLoadingManual: TGroupBox;
    pnlLTLeft: TPanel;
    pnlLoadingManual: TPanel;
    grpControlMode: TGroupBox;
    pnlTgtSwap: TPanel;
    edtTgtSwap: TEdit;
    edtTgtSwapValue: TEdit;
    pnlTargetDepth: TPanel;
    edtTargetDepth: TEdit;
    edtTargetDepthValue: TEdit;
    scrlbrTagetDepth: TScrollBar;
    lbl0: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    btnCmManual: TFlatButton;
    btnCmAuto: TFlatButton;
    btnSalvo12L: TFlatButton;
    btnSalvo8L: TFlatButton;
    btnSalvo4L: TFlatButton;
    btnSingle11L: TFlatButton;
    btnSingle6L: TFlatButton;
    btnSingle12L: TFlatButton;
    btnNoSelectL: TFlatButton;
    btnNoSelectR: TFlatButton;
    btnSingle12R: TFlatButton;
    btnSingle6R: TFlatButton;
    btnSingle11R: TFlatButton;
    btnSalvo4R: TFlatButton;
    btnSalvo8R: TFlatButton;
    btnSalvo12R: TFlatButton;
    pnlShipHeading: TPanel;
    edtShipHeading: TEdit;
    edtShipHeadingValue: TEdit;
    btnGYR: TFlatButton;
    pnlRangeBearing: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtTargetRange: TEdit;
    edtTargetRangeValue: TEdit;
    scrlbrTargetRange: TScrollBar;
    edtBearingRelTarget: TEdit;
    edtBearingRelTargetVal: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    btnActual: TFlatButton;
    btnStandByPos: TFlatButton;
    btnExecute: TFlatButton;
    grpDirectPosisition: TGroupBox;
    pnlDirectPosisition: TPanel;
    edtTrainingValue: TEdit;
    edtElevationValue: TEdit;
    btnTrnElv: TFlatButton;
    trcbrTraining: TVrTrackBar;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    scrlbrBearingRelTarget: TScrollBar;
    trcbrElevation: TVrTrackBar;
    lbl14: TLabel;
    lbl15: TLabel;
    lbl17: TLabel;
    grpControlRoom: TGroupBox;
    grpRbuCorrection: TGroupBox;
    pnlRbuCorrection: TPanel;
    lbl16: TLabel;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    edtRbuTrngCorrection: TEdit;
    edtRbuTrngCorrectionValue: TEdit;
    scrlbrRbuTrngCorrection: TScrollBar;
    edtRbuElvCorrection: TEdit;
    edtRbuElvCorrectionValue: TEdit;
    scrlbrRbuElvCorrection: TScrollBar;
    pnlControlRoom: TPanel;
    btnBurya: TFlatButton;
    btnBridge: TFlatButton;
    grpUnitSelect: TGroupBox;
    grpEndProcess: TGroupBox;
    btnBurjaLama: TFlatButton;
    btnBurjaBaru: TFlatButton;
    btnExit: TFlatButton;
    pnlR1: TPanel;
    pnlR1L: TPanel;
    pnlR1R: TPanel;
    pnlR2: TPanel;
    pnlR2L: TPanel;
    pnlR2R: TPanel;
    pnlR3: TPanel;
    pnlR3L: TPanel;
    pnlR3R: TPanel;
    pnlR4: TPanel;
    pnlR4L: TPanel;
    pnlR4R: TPanel;
    pnlR5: TPanel;
    pnlR5L: TPanel;
    pnlR5R: TPanel;
    pnlRBottom: TPanel;
    edtTrgtRange: TEdit;
    edtTrgtRangeValue: TEdit;
    edtTrgtBearing: TEdit;
    edtTrgtBearingValue: TEdit;
    edtTimeProjectile: TEdit;
    edtTimeProjectileValue: TEdit;
    edtTrgtDepth: TEdit;
    edtTrgtDepthValue: TEdit;
    edtWindSpeed: TEdit;
    edtWindSpeedValue: TEdit;
    edtWindDirect: TEdit;
    edtWindDirectValue: TEdit;
    imgTrainingBg: TImage;
    imgElevationBg: TImage;
    imgRangeTrgtBg: TImage;
    imgBrngTrgtBG: TImage;
    imgHdngShpBg: TImage;
    imgBrngTrgt2Bg: TImage;
    imgShpTrgtBg: TImage;
    imgTrgtShpBg: TImage;
    imgShpSpeedBg: TImage;
    imgTrgtSpeedBg: TImage;
    edtLblTraining: TEdit;
    edtLblElevation: TEdit;
    edtLblRangeTrgt: TEdit;
    edtLblBrngTrgt: TEdit;
    edtLblHdngShp: TEdit;
    edtLblBrngTrgt2: TEdit;
    edtLblShpTrgt: TEdit;
    edtLblTrgtShp: TEdit;
    edtLblShpSpeed: TEdit;
    edtLblTrgtSpeed: TEdit;
    edtLblHdngTrgt: TEdit;
    edtValTrainingRelative: TEdit;
    edtValTrainingTrue: TEdit;
    edtValElevation: TEdit;
    edtValRangeTrgt: TEdit;
    edtValBrngTrgt: TEdit;
    edtValHdngShp: TEdit;
    edtValHdngTrgt: TEdit;
    edtValBrngTrgt2: TEdit;
    edtValShpTrgt: TEdit;
    edtValShpSpeed: TEdit;
    edtValTrgtShp: TEdit;
    edtValTrgtSpeed: TEdit;
    pnlTCP_PCOM: TPanel;
    imgTCP_PCOM: TImage;
    lbl21: TLabel;
    lblTCP_PCOMStatus: TLabel;
    pnlStatusTarget: TPanel;
    pnlStatusBalistik: TPanel;
    edtDate: TEdit;
    edtDateValue: TEdit;
    edtTime: TEdit;
    edtTimeValue: TEdit;
    tmrRotate: TTimer;
    imgBrngTrgt2Ndl: TImage;
    edtValBrngTrgt1: TEdit;
    tmr1: TTimer;
    imgTrainingNdl: TImage;
    imgElevationNdl: TImage;
    imgRangeTrgtNdl: TImage;
    imgShpTrgtNdl: TImage;
    imgTrgtShpNdl: TImage;
    imgShpSpeedNdl: TImage;
    imgTrgtSpeedNdl: TImage;
    imgBackgroundZone: TImage;
    timerControlMode: TTimer;
    VrRangeTarget: TVrAngularMeter;
    imgRangeTrgtBackground: TImage;
    imgBrngTrgtBackground: TImage;
    VrBrngTrgt: TVrAngularMeter;
    imgHdgShipBackground: TImage;
    VrHdgShip: TVrAngularMeter;
    imgBrngTrgt2Background: TImage;
    VrBrngTrgt2: TVrAngularMeter;
    imgShipTargetBackground: TImage;
    VrShipTarget: TVrAngularMeter;
    imgTrgtShipBackground: TImage;
    VrTargetShip: TVrAngularMeter;
    imgShipSpeedBackground: TImage;
    VrShipSpeed: TVrAngularMeter;
    imgTargetSpeedBackground: TImage;
    VrTargetSpeed: TVrAngularMeter;
    grpLauncherStatus: TGroupBox;
    grpLauncher1: TGroupBox;
    lbl55: TLabel;
    lbl56: TLabel;
    lbl57: TLabel;
    lbl58: TLabel;
    lbl59: TLabel;
    lbl60: TLabel;
    lbl61: TLabel;
    lbl62: TLabel;
    lbl63: TLabel;
    lbl64: TLabel;
    lbl65: TLabel;
    lbl66: TLabel;
    imgRBU1Load1: TImage;
    imgRBU1Load4: TImage;
    imgRBU1Load7: TImage;
    imgRBU1Load2: TImage;
    imgRBU1Load5: TImage;
    imgRBU1Load8: TImage;
    imgRBU1Load10: TImage;
    imgRBU1Load11: TImage;
    imgRBU1Load3: TImage;
    imgRBU1Load6: TImage;
    imgRBU1Load9: TImage;
    imgRBU1Load12: TImage;
    grpLauncher2: TGroupBox;
    lbl67: TLabel;
    lbl68: TLabel;
    lbl69: TLabel;
    lbl70: TLabel;
    lbl71: TLabel;
    lbl72: TLabel;
    lbl73: TLabel;
    lbl74: TLabel;
    lbl75: TLabel;
    lbl76: TLabel;
    lbl77: TLabel;
    lbl78: TLabel;
    imgRBU2Load1: TImage;
    imgRBU2Load2: TImage;
    imgRBU2Load3: TImage;
    imgRBU2Load4: TImage;
    imgRBU2Load5: TImage;
    imgRBU2Load6: TImage;
    imgRBU2Load7: TImage;
    imgRBU2Load8: TImage;
    imgRBU2Load9: TImage;
    imgRBU2Load10: TImage;
    imgRBU2Load11: TImage;
    imgRBU2Load12: TImage;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure scrlbrTagetDepthChange(Sender: TObject);
    procedure edtTargetDepthValueKeyPress(Sender: TObject; var Key: Char);
    procedure scrlbrTargetRangeChange(Sender: TObject);
    procedure scrlbrBearingRelTargetChange(Sender: TObject);
    procedure trcbrTrainingChange(Sender: TObject);
    procedure scrlbrRbuElvCorrectionChange(Sender: TObject);
    procedure trcbrElevationChange(Sender: TObject);
    procedure scrlbrRbuTrngCorrectionChange(Sender: TObject);
    procedure tmrRotateTimer(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure btnTrnElvClick(Sender: TObject);
    procedure btnUnitSelectClick(Sender: TObject);
    procedure FiringMode(Sender: TObject);
    procedure btnExecuteClick(Sender: TObject);
    procedure btnGYRClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnActualClick(Sender: TObject);
    procedure btnStandByPosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure timerControlModeTimer(Sender: TObject);
    procedure btnControlModeClick(Sender: TObject);
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd);
  protected
    procedure DrawAngle(aCnv: TCanvas);
    function MeterWidth: Integer;
    function MeterHeight: Integer;
    function Rotate(Width, Height, Radius: Integer; Degrees: Double): Winapi.Windows.TPoint;
    procedure DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;Color: TColor; Width: Integer);
  private
    { Private declarations }
    FBitmapBackground : TBitmap;
    FLyrDraw: CMapXLayer;
    FMapCanvas     : TCanvas;
    FMapConverter : TMapXUnitConverter;
    FFlag       : Byte;
    FIndexRange : Integer;
    FCurrentRange : Double;  // meter

    FRings       : TRadarRangeRings;
    AreaGunPoint   : TRadarDynamicSector;
    AreaPenembakan  : TRadarDynamicSector;
    AreaTracker  : TRadarDynamicSector;
    FBearing0    : TRadarBearing;
    FCircleRect  : TRect;
    FCircleCX    : Integer;
    FCircleCY    : Integer;
    FCircleR     : Integer; // radius pixel lingkaran peta

    FAngle: Extended;
    FOriginalPngTrainning,
    FOriginalPngElevation,
    FOriginalPngRangeTrgt,
    FOriginalPngBrngTrgt,
    ForiginalPngHdngShp,
    ForiginalPngBrngTrgt2,
    FOriginalPngShpTrgt,
    FOriginalPngTrgtShp,
    FOriginalPngShpSpeed,
    FOriginalPngTrgtSpeed: TPngImage;

    FVTgtTrainning,
    FVTgtElevation,
    FVTgtRangeTrgt,
    FVTgtBrngTrgt,
    FVTgtHdngShp,
    FVTgtHdngTrgt,
    FVTgtBrngTrgt2,
    FVTgtShpTrgt,
    FVTgtTrgtShp,
    FVTgtShpSpeed,
    FVTgtTrgtSpeed,
    FVCurTrainning,
    FVCurElevation,
    FVCurRangeTrgt,
    FVCurBrngTrgt,
    FVCurHdngShp,
//    FVCurHdngTrgt,
    FVCurBrngTrgt2,
    FVCurShpTrgt,
    FVCurTrgtShp,
    FVCurShpSpeed,
    FVCurTrgtSpeed,
    FVTgtTrgtDepth,
    FWindSpeed, FWindDirect,
    FVCurTrgtDepth : Double;

    FLauncherId,
    FFiringMode: Integer;   //NoSelect:0, Single12:1, Single6:2, Single11:3, Salvo4:4, Salvo8:5, Salvo12:6

    FLedGray, FLedGreen, FLedYellow, FLedRed : TBitmap;

    FTargetElevation, FTrueBearing : Double;

    procedure LoadGeoset(const aGst: string); virtual;
    procedure initializeForm;
    procedure RotateAndDisplayFixedSize(TargetImage: TImage; SourcePng: TPngImage; Angle: Extended);
    procedure setRegionCircle;
    procedure DrawAll(aCnv: TCanvas; aCvt: TCoordConverter; aFlag: Byte);
  public
    { Public declarations }
    TempSingleFireR,
    TempSingleFireL : Integer;
    IsReadyToFire : Boolean;
    rCX, rCY: integer;

    FControlMode: Byte; // Manual: 0, Auto:1

    function SendFireRBU(Lonchr: TLoncher; aCount: Integer; aMissileID: Integer): Boolean;
    function CalcTrueBearing(const aHeading, aRelativeBearing: Double): Double;
    function CalcRelativeBearing(const aHeading, aTrueBearing: Double): Double;
    function CheckMissileReady(LauncherID: Integer; MissileID: Integer): Boolean;
    function CheckFireCondition: Boolean;
    procedure RunLauncherRBU(Launcher : TLoncher; Mode : Word);
  end;

var
  frmMainDisplay: TfrmMainDisplay;

implementation

{$R *.dfm}

uses
  Vcl.Themes, uLibConst, uBaseConst, ufrmPasswordEntryCode, uTCPDatatype,
  ulibSettings, uScriptRBUDigital, uVehicleManager, uVehicle, uBaseFunction;

const
  CMin_Z = 0;
  CMax_Z = 14;

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

procedure SetComposited(WinControl: TWinControl; Value: Boolean);
var
  ExStyle, NewExStyle: DWORD;
begin
  ExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE);
  if Value then begin
    NewExStyle := ExStyle or WS_EX_COMPOSITED;
  end else begin
    NewExStyle := ExStyle and not WS_EX_COMPOSITED;
  end;
  if NewExStyle<>ExStyle then begin
    SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);
  end;
end;

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

procedure TfrmMainDisplay.btnActualClick(Sender: TObject);
var
  lncr: TLoncher;
  orderID: Word;
  trainVal: Double;
begin
  FVTgtTrgtDepth := StrToFloat(edtTargetDepthValue.Text);
  FVTgtRangeTrgt := StrToFloat(edtTargetRangeValue.Text);
  FVTgtBrngTrgt  := StrToFloat(edtBearingRelTargetVal.Text);

  FVTgtBrngTrgt2 := StrToFloat(edtBearingRelTargetVal.Text) + RBU_Manager.Heading;
  trainVal       := ValidateDegree(FVTgtBrngTrgt2);
  FVTgtElevation := StrToFloat(edtElevationValue.Text);

  // Setting launcher
  Lonch1.CorrElev := StrToFloat(edtRbuElvCorrectionValue.Text);
  Lonch2.CorrElev := Lonch1.CorrElev;

  Lonch1.CorrTraining := StrToFloat(edtRbuTrngCorrectionValue.Text);
  Lonch2.CorrTraining := Lonch1.CorrTraining;

  Lonch1.TrainingValue := FVTgtBrngTrgt;
  Lonch2.TrainingValue := FVTgtBrngTrgt;

  Lonch1.ElevationAngle :=StrToFloat(edtElevationValue.Text);
  Lonch2.ElevationAngle := Lonch1.ElevationAngle;

  Lonch1.TrainingOn := True;
  Lonch2.TrainingOn := True;

  Lonch1.ElevOn := True;
  Lonch2.ElevOn := True;

  FVTgtTrainning := FVTgtBrngTrgt;

  // Launcher selection
  if FLauncherId = 0 then
  begin
    ShowMessage('Silahkan pilih mode penembakan terlebih dahulu');
    Exit;
  end;

  if FLauncherId = 1 then
    lncr := Lonch1
  else
  if FLauncherId = 2 then
    lncr := Lonch2
  else
    Exit;

  // Auto / Assigned
  if RBU_Manager.IsSonarTracked then
    orderID := __ORD_RBU_AUTO
  else
    orderID := __ORD_RBU_ASSIGNED;

  RunLauncherRBU(lncr,orderID);

  // Bearing
  trcbrTraining.Position := scrlbrBearingRelTarget.Position * 10;

  // Elevation
  FTargetElevation := Power(scrlbrTargetRange.Position / 6000, Exp(1.0)) * 45;
  trcbrElevation.Position := Round(FTargetElevation) * 10;
  btnTrnElvClick(Sender);
end;

procedure TfrmMainDisplay.btnControlModeClick(Sender: TObject);
begin
  if TFlatButton(Sender).Tag = 1 then
  begin
    FControlMode := 0;
  end

  else if TFlatButton(Sender).Tag = 2 then
  begin
    FControlMode := 1;
  end;

end;

procedure TfrmMainDisplay.btnExecuteClick(Sender: TObject);
var
  i: Integer;
  aCount: Integer;
  range: Double;
  MissileID, FireMissileID: Integer;
  lncr: TLoncher;
begin
  if FFiringMode = 0 then
  begin
    ShowMessage('Silahkan pilih mode penembakan terlebih dahulu.');
    Exit;
  end;

  if not TryStrToFloat(edtTargetRangeValue.Text, range) then
  begin
    ShowMessage('Nilai range target tidak valid.');
    Exit;
  end;

  edtTrgtRangeValue.Text := edtTargetRangeValue.Text;

  BalistikMode := BlAuto;

  if not GetBalistik(BalistikMode, range, Use_Balistik) then
    Exit;

  if FLauncherId = 0 then
  begin
    ShowMessage('Silahkan pilih launcher terlebih dahulu.');
    Exit;
  end;

  if FLauncherId = 1 then
  begin
    { Launcher kanan }
    if not Assigned(Lonch1) then
    begin
      ShowMessage('Launcher kanan tidak tersedia.');
      Exit;
    end;

    if not Lonch1.Ready then
    begin
      ShowMessage('Launcher kanan belum READY.');
      Exit;
    end;

    lncr := Lonch1;
  end
  else
  if FLauncherId = 2 then
  begin
    { Launcher kiri }

    if not Assigned(Lonch2) then
    begin
      ShowMessage('Launcher kiri tidak tersedia.');
      Exit;
    end;

    if not Lonch2.Ready then
    begin
      ShowMessage('Launcher kiri belum READY.');
      Exit;
    end;

    lncr := Lonch2;
  end
  else
  begin
    ShowMessage('Launcher tidak valid.');
    Exit;
  end;

  aCount        := 0;
  MissileID     := 0;
  FireMissileID := 0;

  case FFiringMode of
    {$REGION 'Single 12'}
    1:
    begin
      MissileID     := 12;
      FireMissileID := MissileID;

      if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
      begin
        ShowMessage(Format('Missile %d pada launcher %d belum READY.',[MissileID, FLauncherId]));
        Exit;
      end;

      if FLauncherId = 1 then
        lncr.OrderFire.Add(ListMissileR[MissileID])
      else
        lncr.OrderFire.Add(ListMissileL[MissileID]);

      aCount := 1;
    end;
    {$ENDREGION}

    {$REGION 'single 6'}
    2:
    begin
      MissileID := 6;
      FireMissileID := MissileID;

      if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
      begin
        ShowMessage(Format('Missile %d pada launcher %d belum READY.', [MissileID, FLauncherId]));
        Exit;
      end;

      if FLauncherId = 1 then
        lncr.OrderFire.Add(ListMissileR[MissileID])
      else
        lncr.OrderFire.Add(ListMissileL[MissileID]);

      aCount := 1;
    end;
    {$ENDREGION}

    {$REGION 'Single 11'}
    3:
    begin
      MissileID := 11;
      FireMissileID := MissileID;

      if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
      begin
        ShowMessage(Format('Missile %d pada launcher %d belum READY.', [MissileID, FLauncherId]));
        Exit;
      end;

      if FLauncherId = 1 then
        lncr.OrderFire.Add(ListMissileR[MissileID])
      else
        lncr.OrderFire.Add(ListMissileL[MissileID]);

      aCount := 1;
    end;
    {$ENDREGION}

    {$REGION 'Salvo 4'}
    4:
    begin
      aCount := 4;
      FireMissileID := 0;

      for i := 1 to 4 do
      begin
        MissileID := SequenceMissile[i];

        if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
        begin
          ShowMessage(Format('Salvo 4 gagal.' + sLineBreak + 'Missile %d pada launcher %d belum READY.', [MissileID, FLauncherId]));
          Exit;
        end;
      end;

      for i := 1 to 4 do
      begin
        MissileID := SequenceMissile[i];

        if FLauncherId = 1 then
          lncr.OrderFire.Add(ListMissileR[MissileID])
        else
          lncr.OrderFire.Add(ListMissileL[MissileID]);
      end;
    end;
    {$ENDREGION}

    {$REGION 'Salvo 8'}
    5:
    begin
      aCount := 8;
      FireMissileID := 0;

      for i := 1 to 8 do
      begin
        MissileID := SequenceMissile[i];

        if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
        begin
          ShowMessage(Format('Salvo 8 gagal.' + sLineBreak +'Missile %d pada launcher %d belum READY.',
              [MissileID, FLauncherId]));
          Exit;
        end;
      end;

      for i := 1 to 8 do
      begin
        MissileID := SequenceMissile[i];

        if FLauncherId = 1 then
          lncr.OrderFire.Add(ListMissileR[MissileID])
        else
          lncr.OrderFire.Add(ListMissileL[MissileID]);
      end;
    end;
    {$ENDREGION}

    {$REGION 'Salvo 12'}
    6:
    begin
      aCount := 12;
      FireMissileID := 0;

      for i := 1 to 12 do
      begin
        MissileID := SequenceMissile[i];

        if not RBU_Manager.IsMissileReady(FLauncherId,MissileID) then
        begin
          ShowMessage(Format('Salvo 12 gagal.' + sLineBreak +'Missile %d pada launcher %d belum READY.',
                      [MissileID, FLauncherId]));
          Exit;
        end;
      end;

      for i := 1 to 12 do
      begin
        MissileID := SequenceMissile[i];

        if FLauncherId = 1 then
          lncr.OrderFire.Add(ListMissileR[MissileID])
        else
          lncr.OrderFire.Add(ListMissileL[MissileID]);
      end;
    end;
    {$ENDREGION}
  else
    begin
      ShowMessage('Mode penembakan tidak valid.');
      Exit;
    end;
  end;

  if lncr.OrderFire.Count = 0 then
    Exit;

  if not SendFireRBU(lncr, aCount, FireMissileID) then
  begin
    lncr.OrderFire.Clear;
//    ShowMessage('Perintah fire gagal dikirim.');
    Exit;
  end;

  lncr.OrderFire.Clear;

  trcbrTraining.Position  := scrlbrBearingRelTarget.Position * 10;
  FTargetElevation        := Power(scrlbrTargetRange.Position / 6000, Exp(1.0)) * 45;
  trcbrElevation.Position := Round(FTargetElevation) * 10;
//  btnTrnElvClick(Sender);
end;

procedure TfrmMainDisplay.btnExitClick(Sender: TObject);
var
  btnSelect: Integer;
begin
  btnSelect := MessageDlg('Are you sure want to Exit?', mtConfirmation,
                [mbYes, mbNo],0);
  if btnSelect = mrYes then
    Close;
end;

procedure TfrmMainDisplay.btnGYRClick(Sender: TObject);
begin
//  FVTgtHdngShp := StrToFloat(edtShipHeadingValue.Text);
//  edtValHdngShp.Text := FormatFloat('0.#',FVTgtHdngShp);
  FVTgtHdngTrgt := StrToFloat(edtShipHeadingValue.Text);
  edtValHdngTrgt.Text := FormatFloat('0.#',FVCurHdngShp);
end;

procedure TfrmMainDisplay.btnStandByPosClick(Sender: TObject);
var
  lncr : TLoncher;
begin
  if FLauncherId = 1 then //R
  begin
    lncr := Lonch1;
  end
  else if FLauncherId = 2 then //L
  begin
    lncr := Lonch2;
  end;
  Lonch1.TrainingOn := False;
  Lonch2.TrainingOn := False;
  Lonch1.ElevOn := False;
  Lonch2.ElevOn := False;

  RunLauncherRBU(lncr, __ORD_RBU_DEASSIGNED);
end;

procedure TfrmMainDisplay.btnTrnElvClick(Sender: TObject);
var
  TtrainVal: Double;
  lncr : TLoncher;
  orderID: Word;
begin
  FVTgtTrainning := StrToFloat(edtTrainingValue.Text);
//  edtValTrainingRelative.Text := FormatFloat('0,#', FVTgtTrainning);

  TtrainVal := ValidateDegree(FVTgtTrainning{+ heading});
//  edtValTrainingTrue.Text :=FormatFloat('0.#', TtrainVal);

  FVTgtElevation := StrToFloat(edtElevationValue.Text);
//  edtValElevation.Text := FormatFloat('0.#', FVTgtElevation);
  Lonch1.TrainingValue := FVTgtTrainning;
  Lonch2.TrainingValue := FVTgtTrainning;
  Lonch1.ElevationAngle := FVTgtElevation;
  Lonch2.ElevationAngle := FVTgtElevation;

  if FLauncherId = 1 then //R
  begin
    lncr := Lonch1;
  end
  else if FLauncherId = 2 then //L
  begin
    lncr := Lonch2;
  end;

  if RBU_MAnager.IsSonarTracked then
    orderID := __ORD_RBU_AUTO
  else
    orderID := __ORD_RBU_ASSIGNED;

  RunLauncherRBU(Lncr, orderID);
end;

procedure TfrmMainDisplay.btnUnitSelectClick(Sender: TObject);
begin
  if btnBurjaBaru.Down then
  begin
    ilLed.GetBitmap(1, imgSistemBurjaBaru.Picture.Bitmap);
    ilLed.GetBitmap(3, imgSistemBurjaLama.Picture.Bitmap);
    imgSistemBurjaBaru.Refresh;
    imgSistemBurjaLama.Refresh;
  end
  else
  begin
    ilLed.GetBitmap(3, imgSistemBurjaBaru.Picture.Bitmap);
    ilLed.GetBitmap(1, imgSistemBurjaLama.Picture.Bitmap);
    imgSistemBurjaBaru.Refresh;
    imgSistemBurjaLama.Refresh;
  end;
end;

function TfrmMainDisplay.CalcRelativeBearing(const aHeading,
  aTrueBearing: Double): Double;
begin
  Result := Validate180Degree(aTrueBearing - aHeading);
end;

function TfrmMainDisplay.CalcTrueBearing(const aHeading,
  aRelativeBearing: Double): Double;
begin
  Result := ValidateDegree(aRelativeBearing + aHeading);
end;

function TfrmMainDisplay.CheckFireCondition: Boolean;
var
  i: Integer;
  MissileID: Integer;
begin
  Result := False;

  if FLauncherId = 0 then
  begin
    ShowMessage('Silahkan pilih launcher terlebih dahulu.');
    Exit;
  end;

  if FFiringMode = 0 then
  begin
    ShowMessage('Silahkan pilih mode penembakan terlebih dahulu.');
    Exit;
  end;

  if FLauncherId = 1 then
  begin
    if not Lonch1.Enabled then
    begin
      ShowMessage('Launcher 1 tidak tersedia.');
      Exit;
    end;

    if not Lonch1.Ready then
    begin
      ShowMessage('Launcher 1 belum READY.');
      Exit;
    end;
  end
  else
  if FLauncherId = 2 then
  begin
    if not Lonch2.Enabled then
    begin
      ShowMessage('Launcher 2 tidak tersedia.');
      Exit;
    end;

    if not Lonch2.Ready then
    begin
      ShowMessage('Launcher 2 belum READY.');
      Exit;
    end;
  end;

  case FFiringMode of
    1:
    begin
      MissileID := 12;

      if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
      begin
        ShowMessage(Format('Missile %d pada Launcher %d belum READY.',[MissileID, FLauncherId]));
        Exit;
      end;
    end;
    2:
    begin
      MissileID := 6;

      if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
      begin
        ShowMessage(Format('Missile %d pada Launcher %d belum READY.',[MissileID, FLauncherId]));
        Exit;
      end;
    end;
    3:
    begin
      MissileID := 11;

      if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
      begin
        ShowMessage(Format('Missile %d pada Launcher %d belum READY.',[MissileID, FLauncherId]));
        Exit;
      end;
    end;
    4:
    begin
      for i := 1 to 4 do
      begin
        MissileID := SequenceMissile[i];

        if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
        begin
          ShowMessage(Format('Salvo 4 gagal. Missile %d pada Launcher %d belum READY.',[MissileID, FLauncherId]));
          Exit;
        end;
      end;
    end;
    5:
    begin
      for i := 1 to 8 do
      begin
        MissileID := SequenceMissile[i];

        if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
        begin
          ShowMessage(Format('Salvo 8 gagal. Missile %d pada Launcher %d belum READY.',[MissileID, FLauncherId]));
          Exit;
        end;
      end;
    end;
    6:
    begin
      for i := 1 to 12 do
      begin
        MissileID := SequenceMissile[i];

        if not RBU_Manager.IsMissileReady(FLauncherId, MissileID) then
        begin
          ShowMessage(Format('Salvo 12 gagal. Missile %d pada Launcher %d belum READY.',[MissileID, FLauncherId]));
          Exit;
        end;
      end;
    end;
  end;

  Result := True;
end;

function TfrmMainDisplay.CheckMissileReady(LauncherID,MissileID: Integer): Boolean;
begin
  Result := RBU_Manager.IsMissileReady(LauncherID, MissileID);
end;

procedure TfrmMainDisplay.DrawAll(aCnv: TCanvas; aCvt: TCoordConverter;
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

//  AreaPenembakan.CenterMode     := cmMapPosition;
//  AreaPenembakan.MapPosX        := FMap.CenterX;
//  AreaPenembakan.MapPosY        := FMap.CenterY;
//  AreaPenembakan.CoordConverter := aCvt;
//
//  AreaPenembakan.OuterRadiusPx  := FCircleR;
//  AreaPenembakan.CurrentRange_m := Self.FCurrentRange;
//
//  if Assigned(RBU_MAnager) then
//    AreaPenembakan.HeadingDeg    := RBU_MAnager.Heading;
//
//  AreaPenembakan.Draw(aCnv);

//  AreaGunPoint.CenterMode     := cmMapPosition;
//  AreaGunPoint.MapPosX        := FMap.CenterX;
//  AreaGunPoint.MapPosY        := FMap.CenterY;
//  AreaGunPoint.CoordConverter := aCvt;
//
//  AreaGunPoint.OuterRadiusPx  := FCircleR;
//  AreaGunPoint.CurrentRange_m := Self.FCurrentRange;
//
//  if Assigned(RBU_MAnager) then
//    AreaGunPoint.HeadingDeg    := RBU_MAnager.Heading;
//
//  AreaGunPoint.Draw(aCnv);

  AreaTracker.CenterMode     := cmMapPosition;
  AreaTracker.MapPosX        := FMap.CenterX;
  AreaTracker.MapPosY        := FMap.CenterY;
  AreaTracker.CoordConverter := aCvt;

  AreaTracker.OuterRadiusPx  := FCircleR;
  AreaTracker.CurrentRange_m := Self.FCurrentRange;

  if Assigned(RBU_MAnager) then
    AreaTracker.HeadingDeg    := RBU_MAnager.Heading;

  AreaTracker.Draw(aCnv);



  // BEARING 0°
  FBearing0.CircleRect := FCircleRect;
  FBearing0.ConvertCoord(aCvt);
  FBearing0.Draw(aCnv);

  // RANGE RINGS
  FRings.CircleRect    := FCircleRect;
  FRings.CurrentRange_m := 6000;
  FRings.ConvertCoord(aCvt);
//  FRings.Draw(aCnv);
  FRings.Draw(aCnv);

  VehicleMgr.DrawAll(aCnv);
end;

procedure TfrmMainDisplay.DrawAngle(aCnv: TCanvas);
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

  diffBeetwinWH := (pnlCenter.Width - pnlCenter.Height) div 2;

  top := 120;
  bottom := pnlCenter.Height - top;
  left := diffBeetwinWH + top;
  right := pnlCenter.Width - left;
  with aCnv do
  begin
		Pen.Color := CForegroundColor;

    Brush.Style := bsClear;
//    R := Rect(0,0, Map.Width, Map.Height);
    R := Rect(left,top, right, bottom);
//    AngleRadius := (R.right - R.left) div 2;
    AngleRadius := 280;
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
//      aCnv.Pen.Color := clRed;
      aCnv.Pen.Color := rgb(191, 80, 67);
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
             StrValue := Format(Mask, [CurValue - 360]) + '°'
          else
            StrValue := Format(Mask, [CurValue]) + '°';

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

procedure TfrmMainDisplay.DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;
  Color: TColor; Width: Integer);
begin
  Canvas.Pen.Color := Color;
  Canvas.Pen.Width := Width;
  Canvas.MoveTo(X1, Y1);
  Canvas.LineTo(X2, Y2);
end;

procedure TfrmMainDisplay.edtTargetDepthValueKeyPress(Sender: TObject;
  var Key: Char);
var
  iVal, iCode: Integer;
begin
  Val(Key, iVal, iCode);
  if (iCode <> 0)  and (KEY <> #13)then
  begin
    Key := #0;
    Exit;
  end;
  if Key = #13 then
  begin
    scrlbrTagetDepth.Position := StrToInt(edtTargetDepthValue.Text);
  end;
end;

procedure TfrmMainDisplay.FiringMode(Sender: TObject);
var
  lRec: TRec3dSetRBU;
  idLog: Integer;
begin
  if TFlatButton(Sender) = btnNoSelectL then
  begin
    FLauncherId := 2;
    FFiringMode := 0;
    lRec.ShipID          := RBU_MAnager.pShipID;
    lRec.mWeaponID       := C_DBID_RBU6000;
    lRec.mLauncherID     := 1;     // 1
    lRec.mMissileID      := 0;
    lRec.mMissileNumber  := 0;
    lRec.mCount          := 0;
    lRec.mMissileType    := 0;
    lRec.mTargetID       := 0;
    lRec.mLncrBearing    := 0;
    lRec.mLncRange       := 0;
    lRec.mTargetDepth    := 0;
    lRec.mCorrBearing    := 0;
    lRec.mCorrElev       := 0;
    lRec.OrderID         := __ORD_RBU_DEASSIGNED;

    if RBU_MAnager.Datcom <> nil then
    begin
      RBU_MAnager.Datcom.sendDataEx(REC_3D_RBU, @lRec);
    end;
  end
  else if TFlatButton(Sender) = btnSingle12L then
  begin
    FLauncherId := 2;
    FFiringMode := 1;
    btnNoSelectR.Down := True;
    idLog := 20;
  end
  else if TFlatButton(Sender) = btnSingle6L then
  begin
    FLauncherId := 2;
    FFiringMode := 2;
    btnNoSelectR.Down := True;
    idLog := 21;
  end
  else if TFlatButton(Sender) = btnSingle11L then
  begin
    FLauncherId := 2;
    FFiringMode := 3;
    btnNoSelectR.Down := True;
    idLog := 22;
  end
  else if TFlatButton(Sender) = btnSalvo4L then
  begin
    FLauncherId := 2;
    FFiringMode := 4;
    btnNoSelectR.Down := True;
    idLog := 23;
  end
  else if TFlatButton(Sender) = btnSalvo8L then
  begin
    FLauncherId := 2;
    FFiringMode := 5;
    btnNoSelectR.Down := True;
    idLog := 24;
  end
  else if TFlatButton(Sender) = btnSalvo12L then
  begin
    FLauncherId := 2;
    FFiringMode := 6;
    btnNoSelectR.Down := True;
    idLog := 25;
  end;
  if TFlatButton(Sender) = btnNoSelectR then
  begin
    FLauncherId := 1;
    FFiringMode := 0;
    lRec.ShipID          := RBU_MAnager.pShipID;
    lRec.mWeaponID       := C_DBID_RBU6000;
    lRec.mLauncherID     := 2;
    lRec.mMissileID      := 0;
    lRec.mMissileNumber  := 0;
    lRec.mCount          := 0;
    lRec.mMissileType    := 0;
    lRec.mTargetID       := 0;
    lRec.mLncrBearing    := 0;
    lRec.mLncRange       := 0;
    lRec.mTargetDepth    := 0;
    lRec.mCorrBearing    := 0;
    lRec.mCorrElev       := 0;
    lRec.OrderID         := __ORD_RBU_DEASSIGNED;

    if RBU_MAnager.Datcom <> nil then
    begin
      RBU_MAnager.Datcom.sendDataEx(REC_3D_RBU, @lRec);
    end;
  end
  else if TFlatButton(Sender) = btnSingle12R then
  begin
    FLauncherId := 1;
    FFiringMode := 1;
    btnNoSelectL.Down := True;
    idLog := 14;
  end
  else if TFlatButton(Sender) = btnSingle6R then
  begin
    FLauncherId := 1;
    FFiringMode := 2;
    btnNoSelectL.Down := True;
    idLog := 15;
  end
  else if TFlatButton(Sender) = btnSingle11R then
  begin
    FLauncherId := 1;
    FFiringMode := 3;
    btnNoSelectL.Down := True;
    idLog := 16;
  end
  else if TFlatButton(Sender) = btnSalvo4R then
  begin
    FLauncherId := 1;
    FFiringMode := 4;
    btnNoSelectL.Down := True;
    idLog := 17;
  end
  else if TFlatButton(Sender) = btnSalvo8R then
  begin
    FLauncherId := 1;
    FFiringMode := 5;
    btnNoSelectL.Down := True;
    idLog := 18;
  end
  else if TFlatButton(Sender) = btnSalvo12R then
  begin
    FLauncherId := 1;
    FFiringMode := 6;
    btnNoSelectL.Down := True;
    idLog := 19;
  end;

  if FFiringMode > 0 then
  begin
    RBU_MAnager.SendEvenRBU(idLog);
  end;
end;

procedure TfrmMainDisplay.FMapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
  FMapCanvas.Handle := hOutputDC;
  DrawAll(FMapCanvas, FMapConverter, FFlag);
end;

procedure TfrmMainDisplay.FMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  v : TVehicle;
  rangeX, dH, v0: Double;
  aLow, aHigh, aEnv: Double;
  ok: Boolean;
begin
  if Button <> mbLeft then Exit;

  v := VehicleMgr.SelectAt(X, Y);

  FMap.Refresh; // langsung repaint

  if Assigned(v) then
  begin
//    RBU_MAnager.selectedvehicle := v;
    rangeX := CalcRange(RBU_MAnager.Position.X, RBU_MAnager.Position.Y, v.PosX, v.PosY) * C_NauticalMile_To_Metre;   // 3 km
    dH     := v.PosZ;    // target 20 m lebih rendah
    v0     := 1035;    // m/s

//    TargetID := UniqueID_To_dbID(v.UniqueID);

    if Assigned(RBU_MAnager) then
    begin
      // 1) Tanpa environment (vakum)
//      ok := FCCManager.ComputeGunElevationVacuum(rangeX, dH, v0, aLow, aHigh);
//      edtLowPR.Text := FormatFloat('0.00', aLow);
//      edtHighPR.Text := FormatFloat('0.00', aHigh);
    end;
  end;
end;

procedure TfrmMainDisplay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  if not Assigned(frmPasswordEntryCode) then
//    frmPasswordEntryCode := TfrmPasswordEntryCode.Create(nil)
//  else
//    frmPasswordEntryCode.Show;
//  Action:= caNone;
//  Hide;
end;

procedure TfrmMainDisplay.FormCreate(Sender: TObject);
//var
//  PSource: TImage;
//  PicTgt: TPicture;
//  pngTemp: TPngImage;
//  btmTmp: TBitmap;
begin
  BeginGame_RBUD;
  RBU_MAnager := TRBUManager.Create;
  SimCenter := RBU_MAnager;
  SimCenter.FMap := FMap;

  FMapCanvas := TCanvas.Create;
  FMapConverter := TMapXUnitConverter.Create;
  FMapConverter.FMap := FMap;
  FIndexRange := 0;
  FCurrentRange := CRangeOperation[0];

  VehicleMgr := TVehicleManager.Create;
  VehicleMgr.CoordConverter := FMapConverter;

  FBitmapBackground := TBitmap.Create;
  FBitmapBackground.Height := imgBackgroundZone.Height;
  FBitmapBackground.Width := imgBackgroundZone.Width;
  FBitmapBackground.Canvas.Brush.Color := clBlack; // new color
  FBitmapBackground.Canvas.FillRect(
   Rect(
     0,
     0,
     FBitmapBackground.Width,
     FBitmapBackground.Height
    )
  );

  imgBackgroundZone.Picture.Assign(FBitmapBackground);
  // set tbitmap led di initialize form
  initializeForm;
  LoadGeoset('.\data\maps\IndonesiaNoGrid.gst');
  setRegionCircle;
  Application.ShowMainForm := False;
  FRings := TRadarRangeRings.Create;
  FRings.Visible := True;

  AreaGunPoint := TRadarDynamicSector.Create;
  AreaGunPoint.Color := RGB(237,83,93);
  AreaGunPoint.AddSlice(165,195, 0.0, 48000.0); // dari 1–3 km
  AreaGunPoint.Visible := True;
  AreaPenembakan := TRadarDynamicSector.Create;
  AreaPenembakan.Color := RGB(53,80,75);
  AreaPenembakan.AddSlice(45,315, 0.0, 6500.0); // dari 1–3 km
  AreaPenembakan.Visible := True;
  AreaTracker := TRadarDynamicSector.Create;
  AreaTracker.Color := RGB(32,70,145);
  AreaTracker.AddSlice(45,315, 6500.0, 17000.0);
  AreaTracker.Visible := True;
  FBearing0 := TRadarBearing.Create(0, clWhite, '');

  FOriginalPngTrainning := TPngImage.Create;
  FOriginalPngElevation := TPngImage.Create;

  FOriginalPngTrainning.LoadFromFile('.\data\images\launcher_top_148p.png');
  FOriginalPngElevation.LoadFromFile('.\data\images\launcher_side_148p.png');

  // set gambar bearing dan elevation di awal
  RotateAndDisplayFixedSize(imgTrainingNdl, FOriginalPngTrainning, 0);
  RotateAndDisplayFixedSize(imgElevationNdl, FOriginalPngElevation, 0);


//  FOriginalPngRangeTrgt := TPngImage.Create;
//  FOriginalPngBrngTrgt := TPngImage.Create;
//  ForiginalPngHdngShp := TPngImage.Create;
//  ForiginalPngBrngTrgt2 := TPngImage.Create;
//  FOriginalPngShpTrgt := TPngImage.Create;
//  FOriginalPngTrgtShp := TPngImage.Create;
//  FOriginalPngShpSpeed := TPngImage.Create;
//  FOriginalPngTrgtSpeed := TPngImage.Create;
//  FOriginalPngBrngTrgt := TPngImage.Create;
//  FOriginalPngBrngTrgt.LoadFromFile('.\data\images\jarum_panel_148p.png');

//  FOriginalPngRangeTrgt.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  FOriginalPngBrngTrgt.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  ForiginalPngHdngShp.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  ForiginalPngBrngTrgt2.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  FOriginalPngShpTrgt.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  FOriginalPngTrgtShp.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  FOriginalPngShpSpeed.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  FOriginalPngTrgtSpeed.LoadFromFile('.\data\images\jarum_panel_148p.png');

  // set to 0 in meter bar
//  RotateAndDisplayFixedSize(imgRangeTrgtNdl, FOriginalPngRangeTrgt, 240);
//  RotateAndDisplayFixedSize(imgShpSpeedNdl, FOriginalPngShpSpeed, 240);
//  RotateAndDisplayFixedSize(imgTrgtSpeedNdl, FOriginalPngTrgtSpeed, 240);

//  Psource := TImage.Create(nil);
//  PSource.Picture.LoadFromFile('.\data\images\jarum_panel.png');
//  PSource.Picture.Graphic.Transparent := True;

//  PicTgt := TPicture.Create;
//  btmTmp := TBitmap.Create;
//  pngTemp := TPngImage.Create;
//  pngTemp.LoadFromFile('.\data\images\jarum_panel.png');
//  btmTmp.Width := 148;
//  btmTmp.Height := 148;
//  btmTmp.PixelFormat := pf32bit;
//  btmTmp.Canvas.Brush.Style := bsClear;
//  btmTmp.Canvas.FillRect(Rect(0, 0, 148, 148));
//  PicTgt.Bitmap.Assign(btmTmp);
//  PicTgt.Graphic.Transparent := True;
//  PicTgt.Bitmap.SetSize(148, 148);
//  PicTgt.Bitmap.PixelFormat := pf32bit;
//  btmTmp.Transparent := True;
//  btmTmp.Canvas.StretchDraw(Rect(0, 0, 148, 148), pngTemp);
//  PicTgt.Bitmap.Canvas.StretchDraw(Rect(0, 0, 148, 148), pngTemp);

//  FOriginalPng.Assign(imgBrngTrgt2Ndl.Picture.Bitmap);
//  FOriginalPng.SaveToFile('C:\Users\user\Documents\hsl.png');

  FVTgtTrainning := 0;
  FVTgtElevation := 0;
  FVTgtRangeTrgt := 0;
  FVTgtBrngTrgt := 0;
  FVTgtHdngShp := 0;
  FVTgtBrngTrgt2 := 0;
  FVTgtShpTrgt := 0;
  FVTgtTrgtShp := 180;
  FVTgtShpSpeed := 0;
  FVTgtTrgtSpeed := 0;
  FVTgtHdngTrgt := 0;

  FVCurTrainning := 0;
  FVCurElevation := 0;
  FVCurRangeTrgt := 0;
  FVCurBrngTrgt := 0;
  FVCurHdngShp := 0;
  FVCurBrngTrgt2 := 0;
  FVCurShpTrgt := 0;
  FVCurTrgtShp := 180;
  FVCurShpSpeed := 0;
  FVCurTrgtSpeed := 0;

  FVTgtTrgtDepth := 0;
  FVCurTrgtDepth := 0;

  FWindSpeed  := 0;
  FWindDirect := 0;

//  FAngle := 0;
  tmrRotate.Interval := 25; // butuh diganti ke 25, biar jadi 40 degree/sec   aslinya 250
  tmrRotate.Enabled := True;

//  RBU_Manager := TRBUManager.Create;
  RBU_MAnager.BeginSimulation;

//  Lonch1 := TLoncher.Create;
//  Lonch1.ID := 1;
//  Lonch2 := TLoncher.Create;
//  Lonch2.ID := 2;
  IsReadyToFire := False;

//  SetComposited(pnlCenter, true);
  DoubleBuffered := False;
//  FMap.DoubleBuffered := False;
//  EnableComposited(pnlCenter);

end;

procedure TfrmMainDisplay.FormDestroy(Sender: TObject);
begin
  FLedGray.Free;
  FLedGreen.Free;
  FLedYellow.Free;
  FLedRed.Free;

  VehicleMgr.Free;

  FBearing0.Free;
  AreaGunPoint.Free;
  AreaPenembakan.Free;
  AreaTracker.Free;
  FRings.Free;

  FMapCanvas.Free;
  RBU_MAnager.EndSimulation;
end;

procedure TfrmMainDisplay.FormPaint(Sender: TObject);
begin
  DrawAngle(imgBackgroundZone.Canvas);
end;

procedure TfrmMainDisplay.FormResize(Sender: TObject);
begin
  pnlCenter.Width := pnlCenter.Height;

  edtDate.Top:= FMap.Height - 44;
  edtDateValue.Top := FMap.Height - 44;
  edtTime.Top := FMap.Height - 22;
  edtTimeValue.Top := FMap.Height - 22;
  edtDate.Left:= FMap.Width - 160;
  edtDateValue.Left := FMap.Width - 100;
  edtTime.Left := FMap.Width - 160;
  edtTimeValue.Left := FMap.Width - 100;

  pnlStatusTarget.Top := FMap.Height - FMap.Height;
  pnlStatusBalistik.Top := FMap.Height - (FMap.Height - 21);
  pnlStatusTarget.Left := FMap.Width - 75;
  pnlStatusBalistik.Left := FMap.Width - 75;

  pnlTCP_PCOM.Top := FMap.Height - (FMap.Height - 9);
  pnlTCP_PCOM.Left := FMap.Width - (FMap.Width - 8);
end;

procedure TfrmMainDisplay.FormShow(Sender: TObject);
begin

  pnlCenter.SendToBack;
end;

procedure TfrmMainDisplay.initializeForm;
begin
  //imagelist led index:
  //0 = abu-abu
  //1 = hijau
  //2 = kuning
  //3 = merah
  FLedGray := TBitmap.Create;
  FLedGreen := TBitmap.Create;
  FLedYellow:= TBitmap.Create;
  FLedRed := TBitmap.Create;
  ilLed.GetBitmap(0, FLedGray);
  ilLed.GetBitmap(1, FLedGreen);
  ilLed.GetBitmap(2, FLedYellow);
  ilLed.GetBitmap(3, FLedRed);

  imgRBUTrainLInRange.Picture.Bitmap := FLedGreen;
  imgRBUTrainRInRange.Picture.Bitmap := FLedGreen;
  imgRBUElevInRange.Picture.Bitmap := FLedGreen;
  imgRBUTargetDetected.Picture.Bitmap := FLedRed;

  imgPwr.Picture.Bitmap := FLedGreen;
  imgRef.Picture.Bitmap := FLedGreen;

  imgSistemBurjaLama.Picture.Bitmap := FLedRed;
  imgSistemBurjaBaru.Picture.Bitmap := FLedGreen;

  imgTCP_PCOM.Picture.Bitmap := FLedRed;

//
//  ilLed.GetBitmap(1, imgRBUTrainLInRange.Picture.Bitmap);
//  ilLed.GetBitmap(1, imgRBUTrainRInRange.Picture.Bitmap);
//  ilLed.GetBitmap(1, imgRBUElevInRange.Picture.Bitmap);
//  ilLed.GetBitmap(3, imgRBUTargetDetected.Picture.Bitmap);
//
//  ilLed.GetBitmap(1, imgPwr.Picture.Bitmap);
//  ilLed.GetBitmap(1, imgRef.Picture.Bitmap);
//
//  ilLed.GetBitmap(3, imgSistemBurjaLama.Picture.Bitmap);
//  ilLed.GetBitmap(1, imgSistemBurjaBaru.Picture.Bitmap);
//
//  ilLed.GetBitmap(3, imgTCP_PCOM.Picture.Bitmap);

  edtDateValue.Text := FormatDateTime('MM/DD/YYYY', Now);
  edtTimeValue.Text := FormatDateTime('hh:mm:ss ampm', Now);
end;

procedure TfrmMainDisplay.LoadGeoset(const aGst: string);
var
  i: Integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin
  if FMap = nil then
    Exit;

  InitOleVariant(z);
  FMap.Layers.RemoveAll;

  if (aGst <> '') and (FileExists(aGst)) then
  begin
    FMap.Geoset := aGst;
    for i := 1 to FMap.Layers.Count do
    begin
      FMap.Layers.Item(i).Selectable := False;
      FMap.Layers.Item(i).Editable := False;
    end;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'Animation');
    FLyrDraw := FMap.Layers.Add(mInfo, 1);
    FMap.Layers.AnimationLayer := FLyrDraw;
//    FMap.MapUnit := miUnitKilometer;
//    FMap.BackColor := CBackgroundMapColor;
    FMap.BackColor := rgb(101, 36, 42);
    FMap.MapUnit := miUnitMeter;
    FMap.CenterX := 112.75;
    fmap.CenterY := -7.2;
    FMap.ZoomTo(6400*2, FMap.CenterX, FMap.CenterY);
  end;
end;

function TfrmMainDisplay.MeterHeight: Integer;
begin
  Result := FMap.Height;
end;

function TfrmMainDisplay.MeterWidth: Integer;
begin
  Result := FMap.Width;
end;

function TfrmMainDisplay.Rotate(Width, Height, Radius: Integer;
  Degrees: Double): Winapi.Windows.TPoint;
var
  Angle: Double;
  W, H: Integer;
begin
  Angle := ConvCartesian_To_Compass(Degrees)*C_DegToRad;

  W := Width div 2;
  H := Height div 2;
  Result.X := W + Round(Cos(Angle) * Radius);
  Result.Y := H + Round(Sin(Angle) * Radius);
  Result.Y := (H * 2) - Result.Y;
end;

procedure TfrmMainDisplay.RotateAndDisplayFixedSize(TargetImage: TImage;
  SourcePng: TPngImage; Angle: Extended);
var
  Dst: TPngImage;
  x, y: Integer;
  fx, fy: Double;
  CenterSrcX, CenterSrcY: Double;
  CenterDstX, CenterDstY: Double;
  cosA, sinA: Double;
  SrcX, SrcY: Integer;
  PSrc, PAlphaSrc, PDst, PAlphaDst: PByteArray;
  BufferBmp: TBitmap;
  BufferCanvas: TCanvas;
begin
  Dst := TPngImage.Create;
  BufferBmp := TBitmap.Create;
  try
    Dst.CreateBlank(COLOR_RGBALPHA, 8, TargetImage.Width, TargetImage.Height);//SourcePng.Width, SourcePng.Height);  // set size

    CenterSrcX := SourcePng.Width / 2;
    CenterSrcY := SourcePng.Height / 2;
    CenterDstX := Dst.Width / 2;
    CenterDstY := Dst.Height / 2;

    cosA := Cos(DegToRad(Angle));
    SinA := Sin(DegToRad(Angle));

    for y := 0 to Dst.Height - 1 do
    begin
      PDst := Dst.Scanline[y];
      PAlphaDst := Dst.AlphaScanline[y];
      for x := 0 to Dst.Width - 1 do
      begin
        fx := (x - CenterDstX) * cosA + (y - CenterDstY) * sinA + CenterSrcX;
        fy := (y - CenterDstY) * cosA - (x - CenterDstX) * sinA + CenterSrcY;

        SrcX := Floor(fx);
        SrcY := Floor(fy);

        if (SrcX >= 0) and (SrcX < SourcePng.Width) and (SrcY >= 0) and (SrcY < SourcePng.Height) then
        begin
          PSrc := SourcePng.Scanline[SrcY];
          PAlphaSrc := SourcePng.AlphaScanline[SrcY];

          PDst[x * 3 + 0] := PSrc[SrcX * 3 + 0];  // Blue
          PDst[x * 3 + 1] := PSrc[SrcX * 3 + 1];  // Green
          PDst[x * 3 + 2] := PSrc[SrcX * 3 + 2];  // Red
          PAlphaDst[x] := PAlphaSrc[SrcX]        // Alpha

        end
        else
        begin
          PDst[x * 3 + 0] := 0;
          PDst[x * 3 + 1] := 0;
          PDst[x * 3 + 2] := 0;
          PAlphaDst[x] := 0;
        end;
      end;
    end;
    // Double Buffer ke target image
    BufferBmp.PixelFormat := pf32bit;
    BufferBmp.Width := TargetImage.Width;
    BufferBmp.Height := TargetImage.Height;

    BufferCanvas := BufferBmp.Canvas;
    BufferCanvas.Brush.Color := clBtnFace;
    BufferCanvas.FillRect(Rect(0, 0, BufferBmp.Width, BufferBmp.Height));

    BufferCanvas.Draw(0, 0, Dst);      //BufferCanvas.StretchDraw(Rect(0, 0, BufferBmp.Width, BufferBmp.Height), Dst);

    TargetImage.Picture.Bitmap.Assign(BufferBmp);
  finally
    BufferBmp.Free;
    Dst.Free;
  end;
end;

procedure TfrmMainDisplay.RunLauncherRBU(Launcher: TLoncher; Mode: Word);
var
  lRec : TRec3DSetRBU;
  s : string;
  Range : Double;
begin
  Range := StrToFloat(edtTargetRangeValue.Text);

  if Mode = __ORD_RBU_LOADING then
    Use_Balistik := 2
  else
    GetBalistik(BalistikMode, Range, Use_Balistik);

  lRec.ShipID         := RBU_MAnager.pShipID;
  lRec.mWeaponID      := C_DBID_RBU6000;
  lRec.mMissileID     := 1;
  lRec.mMissileNumber := lRec.mMissileID;
  lRec.mMissileType   := Use_Balistik;
  lRec.mTargetID      := TargetID;
  lRec.mCount         := 12;
  lRec.mLncrBearing   := FVTgtTrainning;//StrToFloat(edtValTrainingRelative.Text);//Launcher.TrainingValue;
  lRec.mLncRange      := FVTgtRangeTrgt;//StrToFloat(edtTrgtRangeValue.Text);
  lRec.mTargetDepth   := FVTgtTrgtDepth;////StrToFloat(edtTrgtDepthValue.Text);
  lRec.mCorrBearing   := StrToFloat(edtRbuTrngCorrectionValue.Text);
  lRec.mCorrElev      := StrToFloat(edtRbuElvCorrectionValue.Text);
  lRec.mLauncherID    := Launcher.ID;
  lRec.OrderID        := Mode;

  if Launcher.TrainingOn and Launcher.ElevOn then
  begin
    if (RBU_MAnager.Datcom <> nil) then
      RBU_MAnager.Datcom.sendDataEx(REC_3D_RBU, @lRec);

    if (Mode = __ORD_RBU_ASSIGNED) or (Mode = __ORD_RBU_AUTO) then
    begin
      s := 'ASSIGN';
      Launcher.IsLoading := False;
      if Launcher.ID = 1 then
        RBU_MAnager.SendEvenRBU(12)
      else
        RBU_MAnager.SendEvenRBU(13);
    end
    else if Mode = __ORD_RBU_LOADING then
    begin
      s := 'LOADING';
      Launcher.IsLoading := True;
      if Launcher.ID = 1 then
        RBU_MAnager.SendEvenRBU(10)
      else
        RBU_MAnager.SendEvenRBU(11);
    end;

  end;
end;

procedure TfrmMainDisplay.scrlbrBearingRelTargetChange(Sender: TObject);
begin
  edtBearingRelTargetVal.Text := scrlbrBearingRelTarget.Position.ToString;
end;

procedure TfrmMainDisplay.scrlbrRbuElvCorrectionChange(Sender: TObject);
begin
  edtRbuElvCorrectionValue.Text := (scrlbrRbuElvCorrection.Position/10).ToString;
end;

procedure TfrmMainDisplay.scrlbrRbuTrngCorrectionChange(Sender: TObject);
begin
  edtRbuTrngCorrectionValue.Text := (scrlbrRbuTrngCorrection.Position/10).ToString;
end;

procedure TfrmMainDisplay.scrlbrTagetDepthChange(Sender: TObject);
begin
  edtTargetDepthValue.Text := scrlbrTagetDepth.Position.ToString;
end;

procedure TfrmMainDisplay.scrlbrTargetRangeChange(Sender: TObject);
begin
  edtTargetRangeValue.Text := scrlbrTargetRange.Position.ToString;
end;

function TfrmMainDisplay.SendFireRBU(Lonchr: TLoncher;
  aCount: Integer; aMissileID: Integer): Boolean;
var
  lRec : TRec3DSetRBU;
  PktToFire : TRecMissile;
  RangeToFire,
  BearingToFire,
  BlindZone_Start,
  BlindZone_End : Double;
  i, Count : Integer;
  Order : Byte;
begin
  Result := False;

  if (Lonchr.IsLoading) then
    Exit;

  RangeToFire := StrToFloat(edtTrgtRangeValue.Text);
  BearingToFire := Lonchr.TrainingValue;

  if Lonchr.ID = 1 then
  begin
    BlindZone_Start := BlindZoneR_Start;
    BlindZone_End := BlindZoneR_End;
  end
  else if Lonchr.ID = 2 then
  begin
    BlindZone_Start := BlindZoneL_Start;
    BlindZone_End := BlindZoneL_End;
  end;

  if (ValidateDegree(BearingToFire) >= BlindZone_Start) and
    (ValidateDegree(BearingToFire) <= BlindZone_End) then
    Exit;

  if aMissileID < 0 then
    Exit;

  lRec.ShipID       := RBU_MAnager.pShipID;
  lRec.mWeaponID    := C_DBID_RBU6000;
  lRec.mMissileType := Use_Balistik;
  lRec.mTargetID    := TargetID;
  lRec.mTargetDepth := Abs(StrToFloat(edtTrgtDepthValue.Text));
  lRec.OrderID      := 0;

  Count := 0;

  for i := 0 to Lonchr.OrderFire.Count - 1 do
  begin
    PktToFire := Lonchr.OrderFire.Items[i];

    if (PktToFire.Available) and (PktToFire.Condition) then
      Count := Count + 1;

    PktToFire.Available := False;

  end;

  if Count <= 0 then
     Exit;

  if Count > 0 then
  begin
    if Count > 1 then
      Order := __ORD_RBU_FIRE_SALVO
    else
      Order := __ORD_RBU_FIRE;

//    lRec.mLauncherID := Lonchr.ID;
//    if Lonchr = Lonch1 then
//      lRec.mMissileID := TempSingleFireR
//    else
//      lRec.mMissileID := TempSingleFireL;

    lRec.mLauncherID := Lonchr.ID;
    lRec.mMissileID  := aMissileID;

    lRec.mMissileNumber := 1;
    lRec.mCount         := aCount;
    lRec.OrderID        := Order;
    lRec.mLncrBearing   := BearingToFire;
    lRec.mLncRange      := RangeToFire;
    lRec.mCorrBearing   := Lonchr.CorrTraining;
    lRec.mCorrElev      := Lonchr.CorrElev;

    if (RBU_MAnager.Datcom <> nil) then
    begin
      RBU_MAnager.Datcom.sendDataEx(REC_3D_RBU, @lRec);
      Result := True;
    end;
  end;
end;

procedure TfrmMainDisplay.setRegionCircle;
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
  diffBeetwinWH := (pnlCenter.Width - pnlCenter.Height) div 2;

  top := 120;
  bottom := pnlCenter.Height - top;
  left := diffBeetwinWH + top;
//  left := diffBeetwinWH;
  right := pnlCenter.Width - left;
//  right := 1050;

  FCircleRect  := Rect(left,top, right, bottom);

  eRgn := CreateEllipticRgn(FCircleRect.Left, FCircleRect.Top, FCircleRect.Right, FCircleRect.Bottom);
  SetWindowRgn(FMap.Handle, eRgn, true);

  // center & radius dalam koordinat FMap (DC yang dipakai DrawUserLayer)
  FCircleCX := (FCircleRect.Left + FCircleRect.Right) div 2;
  FCircleCY := (FCircleRect.Top  + FCircleRect.Bottom) div 2;
  FCircleR  := (FCircleRect.Right - FCircleRect.Left) div 2;

  //global Form Koord
  rCx := rcxMap - FMap.Left;
  rCy := rCYMap + FMap.Top;
end;

procedure TfrmMainDisplay.timerControlModeTimer(Sender: TObject);
var
rangeX, dH, bearing, targetBearing: Double;
v : TVehicle;
begin
//  RBU_MAnager.IsSonarTracked
  if (RBU_MAnager.IsSonarTracked) and (FControlMode = 1) then
  begin
    // ubah depth, bearing dan range disini dan ubah LED target detected jadi hijau,
//    v := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(TargetID));
    v := VehicleMgr.FindObjectByUid(TargetShip.ShipId);

    if Assigned(v) then
    begin
      rangeX := CalcRange(RBU_MAnager.Position.X, RBU_MAnager.Position.Y, v.PosX, v.PosY) * C_NauticalMile_To_Metre;   // 3 km
      scrlbrTargetRange.Position := Round(rangeX);
      scrlbrTagetDepth.Position := Round(v.PosZ);
      bearing := CalcBearing(RBU_MAnager.Position.X, RBU_MAnager.Position.Y, v.PosX, v.PosY);
      FTrueBearing := bearing;
      bearing := bearing - RBU_MAnager.Heading;

      targetBearing := bearing;

      if targetBearing > 180 then
        targetBearing := targetBearing - 360
      else if targetBearing < -180 then
        targetBearing := targetBearing + 360;

      scrlbrBearingRelTarget.Position := Round(targetBearing);

      imgRBUTargetDetected.Picture.Bitmap := FLedGreen;
//      FTargetElevation := Power(rangeX/6000, Exp(1.0)) * 45;  // perhitungan sama seperti di 3D

      FVTgtHdngTrgt := v.HeadingDeg;
      FVTgtTrgtDepth := v.PosZ;

      FVTgtShpSpeed := RBU_MAnager.Speed;
      FVTgtTrgtSpeed := v.Speed_mps * 1.944;
    end;
  end

  else
  begin
    imgRBUTargetDetected.Picture.Bitmap := FLedRed;
  end;

end;

procedure TfrmMainDisplay.tmr1Timer(Sender: TObject);
begin
  edtDateValue.Text := FormatDateTime('MM/DD/YYYY', Now);
  edtTimeValue.Text := FormatDateTime('hh:mm:ss ampm', Now);

  FVTgtHdngShp := RBU_MAnager.Heading;
//  Fmap.CenterX := OwnShip.position.X;
  Fmap.CenterX := RBU_MAnager.Position.X;

//  Fmap.CenterY := OwnShip.position.Y;
  Fmap.CenterY:= RBU_MAnager.Position.Y;
end;

procedure TfrmMainDisplay.tmrRotateTimer(Sender: TObject);
var
  convToDial, convToDial2, convToDial3: Double;
begin
//  if Abs(tgtAngle - curAngle) <= 180 then
//  begin
//  //rotate cw (r)
//  FAngle := FAngle + 2;
//  if FAngle >= 360 then
//    FAngle := 0;
//  end
//  else
//  begin
//    //rotate ccw (l)
//    FAngle := FAngle - 2;
//    if FAngle >= 360 then
//      FAngle := 0;
//  end;

//  RotateAndDisplayFixedSize(imgBrngTrgt2Ndl, FOriginalPngBrngTrgt, FAngle);

  // putar image bearing
  if Round(FVTgtTrainning) <> Round(FVCurTrainning) then
  begin
    if ((FVTgtTrainning - FVCurTrainning) <= 180) and ((FVTgtTrainning - FVCurTrainning) > 0) then
    begin
      //rotate cw (r)
      FVCurTrainning := FVCurTrainning + 1;
    end
    else
    begin
      //rotate ccw (l)
      FVCurTrainning := FVCurTrainning - 1;
    end;

    RotateAndDisplayFixedSize(imgTrainingNdl, FOriginalPngTrainning, FVCurTrainning);
  end
  else
    FVCurTrainning := FVTgtTrainning;
  edtValTrainingRelative.Text := FormatFloat('0.#', FVCurTrainning);
  edtValTrainingTrue.Text := FormatFloat('0.#',(FVCurTrainning + RBU_MAnager.Heading));

  // putar image elev
  if Round(FVTgtElevation) <> Round(FVCurElevation) then
  begin
    if ((FVTgtElevation - FVCurElevation) <= 180) and ((FVTgtElevation - FVCurElevation) > 0) then
    begin
      //rotate ccw (r)
      FVCurElevation := FVCurElevation + 1;
    end
    else
    begin
      //rotate cw (l)
      FVCurElevation := FVCurElevation - 1;
    end;

    RotateAndDisplayFixedSize(imgElevationNdl, FOriginalPngElevation, -FVCurElevation);
  end
  else
    FVCurElevation := FVTgtElevation;

  edtValElevation.Text := FormatFloat('0.#', FVCurElevation);

  // PUTAR RANGE TARGET
  VrRangeTarget.Position := Round(FVTgtRangeTrgt);
  edtValRangeTrgt.Text := FormatFloat('0.#', FVTgtRangeTrgt);

  // PUTAR BRNG TARGET
  VrBrngTrgt.Position := Round(FVTgtBrngTrgt);
  edtValBrngTrgt.Text := FormatFloat('0.#', FVTgtBrngTrgt);
  edtValBrngTrgt1.Text := FormatFloat('0.#', FVTgtBrngTrgt);

  edtTrgtBearingValue.Text := FormatFloat('0.#', FVTgtBrngTrgt);

  // TARGET DEPTH
  edtTargetDepthValue.Text := FormatFloat('0.#', FVTgtTrgtDepth);
  edtTrgtDepthValue.Text   := FormatFloat('0.#', FVTgtTrgtDepth);

  // PUTAR HEADING SHIP
  VrHdgShip.Position := Round(FVTgtHdngShp);
  edtValHdngShp.Text := FormatFloat('0.#', FVTgtHdngShp);
  edtValHdngTrgt.Text := FormatFloat('0.#', FVTgtHdngTrgt);

  edtShipHeadingValue.Text := FormatFloat('0.#', FVTgtHdngShp);

  // PUTAR BRNG TARGET 2 (real heading)
  VrBrngTrgt2.Position := Round(FTrueBearing);
  edtValBrngTrgt2.Text := FormatFloat('0.#', FTrueBearing);

  // SHP TARGET DAN TRGT SHP BELUM TAU FUNGSINYA BUAT APA

  // PUTAR SHIP SPEED
  VrShipSpeed.Position := Round(FVTgtShpSpeed);
  edtValShpSpeed.Text := FormatFloat('0.#', FVTgtShpSpeed);

  // PUTAR TRGET SPEED
  VrTargetSpeed.Position := Round(FVTgtTrgtSpeed);
  edtValTrgtSpeed.Text := FormatFloat('0.#', FVTgtTrgtSpeed);

  if (FVCurTrainning = FVTgtTrainning) and (FVCurElevation = FVTgtElevation)
    and (StrToFloat(edtTrgtRangeValue.Text) > 0) then
    IsReadyToFire := True
  else
    IsReadyToFire := False;

  if Round(FVTgtHdngShp) <> Round(FVCurHdngShp) then
  begin
    if ((FVTgtHdngShp - FVCurHdngShp) < 180) and ((FVTgtHdngShp - FVCurHdngShp) > 0) then
      FVCurHdngShp := FVCurHdngShp + 1//0.1
    else
      FVCurHdngShp := FVCurHdngShp - 1;//0.1;
//    RotateAndDisplayFixedSize(imgHeadPtr, FOriginalPngHeading, -FVCurHeading);
  end
  else
    FVCurHdngShp := FVTgtHdngShp;
  edtValHdngShp.Text := FormatFloat('0.#', FVCurHdngShp);
end;

procedure TfrmMainDisplay.trcbrElevationChange(Sender: TObject);
begin
  edtElevationValue.Text := FormatFloat('0.#',trcbrElevation.Position/10);
end;

procedure TfrmMainDisplay.trcbrTrainingChange(Sender: TObject);
begin
  edtTrainingValue.Text := (trcbrTraining.Position/10).ToString;
end;

procedure TfrmMainDisplay.WMEraseBkgnd(var Message: TWMEraseBkgnd);
begin
  Message.Result := 1; // tell Windows we handled it, no erase
end;

{ TGroupBox }

procedure TGroupBox.Paint;
var
  H: Integer;
  R: TRect;
  Flags: Longint;
  CaptionRect,
  OuterRect: TRect;
  Size: TSize;
  Box: TThemedButton;
  Details: TThemedElementDetails;
begin
  with Canvas do
  begin
    Font := Self.Font;

    if ThemeControl(Self) then
    begin
      if Text <> '' then
      begin
        GetTextExtentPoint32(Handle, PChar(Text), Length(Text), Size);
        CaptionRect := Rect(0, 0, Size.cx, Size.cy);
        if not UseRightToLeftAlignment then
          OffsetRect(CaptionRect, 8, 0)
        else
          OffsetRect(CaptionRect, Width - 8 - CaptionRect.Right, 0);
      end
      else
        CaptionRect := Rect(0, 0, 0, 0);

      OuterRect := ClientRect;
      OuterRect.Top := (CaptionRect.Bottom - CaptionRect.Top) div 2;
      with CaptionRect do
        ExcludeClipRect(Handle, Left, Top, Right, Bottom);
      if Enabled then
        Box := tbGroupBoxNormal
      else
        Box := tbGroupBoxDisabled;
      Details := ThemeServices.GetElementDetails(Box);
      //Draw the themed frame
      ThemeServices.DrawElement(Handle, Details, OuterRect);
      SelectClipRgn(Handle, 0);
      if Text <> '' then
      begin
         H := TextHeight('0');
         if not UseRightToLeftAlignment then
           R := Rect(8, 0, 0, H)
         else
           R := Rect(R.Right - Canvas.TextWidth(Text) - 8, 0, 0, H);
         Flags := DrawTextBiDiModeFlags(DT_SINGLELINE);
         //Now using the Windows.DrawText
         DrawText(Handle, PChar(Text), Length(Text), R, Flags or DT_CALCRECT);
         Brush.Color := Color;//background color of the caption
         Font.Color := clWhite;//the color of the caption.
         DrawText(Handle, PChar(Text), Length(Text), R, Flags);
      end;
    end
    else
    inherited;   //if the control is not themed then use the original paint method.
  end;
end;

end.
