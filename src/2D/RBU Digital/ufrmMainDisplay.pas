unit ufrmMainDisplay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.OleCtrls, MapXLib_TLB,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons, TFlatButtonUnit,
  Vcl.ComCtrls, VrControls, VrTrackBar, acPNG, Vcl.Imaging.pngimage,
  System.Math, uRBU_Manager, uLibRBU, uBridgeSet, uSimulationManager, uBaseFunctionRBUD,
  uMapXUnitConverter, uRadarVisual, uCoordConverter, uRadarDynamicSector;

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
    FVCurTrgtDepth : Double;

    FLauncherId,
    FFiringMode: Integer;   //NoSelect:0, Single12:1, Single6:2, Single11:3, Salvo4:4, Salvo8:5, Salvo12:6

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

    function SendFireRBU(Lonchr: TLoncher; aCount: Integer): Boolean;
    function CalcTrueBearing(const aHeading, aRelativeBearing: Double): Double;
    function CalcRelativeBearing(const aHeading, aTrueBearing: Double): Double;
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
  i : Integer;
  lncr: TLoncher;
  orderID: Word;
  trainVal: Double;
begin
  FVTgtTrgtDepth := StrToFloat(edtTargetDepthValue.Text);
  FVTgtRangeTrgt := StrToFloat(edtTargetRangeValue.Text);
  FVTgtBrngTrgt := StrToFloat(edtBearingRelTargetVal.Text);
  FVTgtBrngTrgt2 := StrToFloat(edtBearingRelTargetVal.Text) + RBU_MAnager.Heading;    //true bearing
  trainVal := ValidateDegree(FVTgtBrngTrgt2);
  FVTgtElevation := StrToFloat(edtElevationValue.Text);


  Lonch1.CorrElev := StrToFloat(edtRbuElvCorrectionValue.Text);
  Lonch2.CorrElev := Lonch1.CorrElev;
  Lonch1.CorrTraining := StrToFloat(edtRbuTrngCorrectionValue.Text);
  Lonch2.CorrTraining := Lonch1.CorrTraining;
  Lonch1.TrainingValue := FVTgtBrngTrgt;
  Lonch2.TrainingValue := FVTgtBrngTrgt;
  Lonch1.ElevationAngle := StrToFloat(edtElevationValue.Text);
  Lonch2.ElevationAngle := Lonch1.ElevationAngle;
  Lonch1.TrainingOn := True;
  Lonch2.TrainingOn := True;
  Lonch1.ElevOn := True;
  Lonch2.ElevOn := True;

  FVTgtTrainning := FVTgtBrngTrgt;


  for i := 1 to 12 do
  begin
    ListMissileR[i].Available := True;
    ListMissileL[i].Available := True;
  end;

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

procedure TfrmMainDisplay.btnExecuteClick(Sender: TObject);
var
  i, aCount: Integer;
  range: Double;
begin
  if FFiringMode = 0 then
    Exit;

  edtTrgtRangeValue.Text := edtTargetRangeValue.Text;
  range := StrToFloat(edtTrgtRangeValue.Text);

  if not GetBalistik(BalistikMode, range, Use_Balistik) then
    Exit;

  if IsReadyToFire then //IsReadyToFire
  begin
    case FFiringMode of
      0: //no select
      begin

      end;
      1: //Single12
      begin
        if FLauncherId = 1 then  //R
        begin
          Lonch1.OrderFire.Add(ListMissileR[12]);
          TempSingleFireR := 12;
        end
        else if FLauncherId = 2 then //L
        begin
          Lonch2.OrderFire.Add(ListMissileL[12]);
          TempSingleFireL := 12;
        end;

      end;
      2: //Single6
      begin
        if FLauncherId = 1 then  //R
        begin
          Lonch1.OrderFire.Add(ListMissileR[6]);
          TempSingleFireR := 6;
        end
        else if FLauncherId = 2 then //L
        begin
          Lonch2.OrderFire.Add(ListMissileL[6]);
          TempSingleFireL := 6;
        end;

      end;
      3: //Single11
      begin
        if FLauncherId = 1 then  //R
        begin
          Lonch1.OrderFire.Add(ListMissileR[11]);
          TempSingleFireR := 11;
        end
        else if FLauncherId = 2 then //L
        begin
          Lonch2.OrderFire.Add(ListMissileL[11]);
          TempSingleFireL := 11;
        end;

      end;
      4: //Salvo4
      begin
        for i := 1 to 4 do
        begin
          if FLauncherId = 1 then  //R
          begin
            Lonch1.OrderFire.Add(ListMissileR[SequenceMissile[i]]);
            TempSingleFireR := 1;
          end
          else if FLauncherId = 2 then //L
          begin
            Lonch2.OrderFire.Add(ListMissileL[SequenceMissile[i]]);
            TempSingleFireL := 1;
          end;
        end;
        aCount := 4;

      end;
      5: //Salvo8
      begin
        for i := 1 to 8 do
        begin
          if FLauncherId = 1 then  //R
          begin
            Lonch1.OrderFire.Add(ListMissileR[SequenceMissile[i]]);
            TempSingleFireR := 1;
          end
          else if FLauncherId = 2 then //L
          begin
            Lonch2.OrderFire.Add(ListMissileL[SequenceMissile[i]]);
            TempSingleFireL := 1;
          end;
        end;
        aCount := 8;

      end;
      6: //Salvo12
      begin
        for i := 1 to 12 do
        begin
          if FLauncherId = 1 then  //R
          begin
            Lonch1.OrderFire.Add(ListMissileR[SequenceMissile[i]]);
            TempSingleFireR := 1;
          end
          else if FLauncherId = 2 then //L
          begin
            Lonch2.OrderFire.Add(ListMissileL[SequenceMissile[i]]);
            TempSingleFireL := 1;
          end;
        end;
        aCount := 12;

      end;
    end;

    if (Lonch1.OrderFire.Count < 1) and (Lonch2.OrderFire.Count < 1) then
      Exit;

    SendFireRBU(Lonch1, aCount);
    SendFireRBU(Lonch2, aCount);

    Lonch1.OrderFire.Clear;
    Lonch2.OrderFire.Clear;
  end;
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

  // RANGE RINGS
  FRings.CircleRect    := FCircleRect;
  FRings.CurrentRange_m := FCurrentRange;
  FRings.ConvertCoord(aCvt);
  FRings.Draw(aCnv);

  // BEARING 0°
  FBearing0.CircleRect := FCircleRect;
  FBearing0.ConvertCoord(aCvt);
  FBearing0.Draw(aCnv);

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

  top := 50;
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
    lRec.mLauncherID     := 1;
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
    rangeX := CalcRange(RBU_MAnager.Position.X, RBU_MAnager.Position.Y, v.PosX, v.PosY) * C_NauticalMile_To_Metre;   // 3 km
    dH     := v.PosZ;    // target 20 m lebih rendah
    v0     := 1035;    // m/s

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
  if not Assigned(frmPasswordEntryCode) then
    frmPasswordEntryCode := TfrmPasswordEntryCode.Create(nil)
  else
    frmPasswordEntryCode.Show;
  Action:= caNone;
  Hide;
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

  EnableComposited(pnlCenter);
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
  FOriginalPngRangeTrgt := TPngImage.Create;
//  FOriginalPngBrngTrgt := TPngImage.Create;
//  ForiginalPngHdngShp := TPngImage.Create;
  ForiginalPngBrngTrgt2 := TPngImage.Create;
  FOriginalPngShpTrgt := TPngImage.Create;
  FOriginalPngTrgtShp := TPngImage.Create;
  FOriginalPngShpSpeed := TPngImage.Create;
  FOriginalPngTrgtSpeed := TPngImage.Create;
//  FOriginalPngBrngTrgt := TPngImage.Create;
//  FOriginalPngBrngTrgt.LoadFromFile('.\data\images\jarum_panel_148p.png');
  FOriginalPngTrainning.LoadFromFile('.\data\images\launcher_top_148p.png');
  FOriginalPngElevation.LoadFromFile('.\data\images\launcher_side_148p.png');
  FOriginalPngRangeTrgt.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  FOriginalPngBrngTrgt.LoadFromFile('.\data\images\jarum_panel_148p.png');
//  ForiginalPngHdngShp.LoadFromFile('.\data\images\jarum_panel_148p.png');
  ForiginalPngBrngTrgt2.LoadFromFile('.\data\images\jarum_panel_148p.png');
  FOriginalPngShpTrgt.LoadFromFile('.\data\images\jarum_panel_148p.png');
  FOriginalPngTrgtShp.LoadFromFile('.\data\images\jarum_panel_148p.png');
  FOriginalPngShpSpeed.LoadFromFile('.\data\images\jarum_panel_148p.png');
  FOriginalPngTrgtSpeed.LoadFromFile('.\data\images\jarum_panel_148p.png');

  // set to 0 in meter bar
  RotateAndDisplayFixedSize(imgRangeTrgtNdl, FOriginalPngRangeTrgt, 240);
  RotateAndDisplayFixedSize(imgShpSpeedNdl, FOriginalPngShpSpeed, 240);
  RotateAndDisplayFixedSize(imgTrgtSpeedNdl, FOriginalPngTrgtSpeed, 240);

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
  FVTgtRangeTrgt := 240;
  FVTgtBrngTrgt := 0;
  FVTgtHdngShp := 0;
  FVTgtBrngTrgt2 := 0;
  FVTgtShpTrgt := 0;
  FVTgtTrgtShp := 0;
  FVTgtShpSpeed := 240;
  FVTgtTrgtSpeed := 240;
  FVTgtHdngTrgt := 0;

  FVCurTrainning := 0;
  FVCurElevation := 0;
  FVCurRangeTrgt := 0;
  FVCurBrngTrgt := 0;
  FVCurHdngShp := 0;
  FVCurBrngTrgt2 := 0;
  FVCurShpTrgt := 0;
  FVCurTrgtShp := 0;
  FVCurShpSpeed := 240;
  FVCurTrgtSpeed := 240;
  FVTgtTrgtDepth := 0;
  FVCurTrgtDepth := 0;

//  FAngle := 0;
  tmrRotate.Interval := 250;
  tmrRotate.Enabled := True;

//  RBU_Manager := TRBUManager.Create;
  RBU_MAnager.BeginSimulation;

  Lonch1 := TLoncher.Create;
  Lonch1.ID := 1;
  Lonch2 := TLoncher.Create;
  Lonch2.ID := 2;
  IsReadyToFire := False;

end;

procedure TfrmMainDisplay.FormDestroy(Sender: TObject);
begin
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

  ilLed.GetBitmap(1, imgRBUTrainLInRange.Picture.Bitmap);
  ilLed.GetBitmap(1, imgRBUTrainRInRange.Picture.Bitmap);
  ilLed.GetBitmap(1, imgRBUElevInRange.Picture.Bitmap);
  ilLed.GetBitmap(3, imgRBUTargetDetected.Picture.Bitmap);

  ilLed.GetBitmap(1, imgPwr.Picture.Bitmap);
  ilLed.GetBitmap(1, imgRef.Picture.Bitmap);

  ilLed.GetBitmap(3, imgSistemBurjaLama.Picture.Bitmap);
  ilLed.GetBitmap(1, imgSistemBurjaBaru.Picture.Bitmap);

  ilLed.GetBitmap(3, imgTCP_PCOM.Picture.Bitmap);

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
    FMap.BackColor := CBackgroundMapColor;
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
  aCount: Integer): Boolean;
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

  lRec.ShipID       := RBU_MAnager.pShipID;
  lRec.mWeaponID    := C_DBID_RBU6000;
  lRec.mMissileType := Use_Balistik;
  lRec.mTargetID    := TargetID;
  lRec.mTargetDepth := Abs(StrToFloat(edtTrgtDepthValue.Text));

  Count := 0;

  for i := 0 to Lonchr.OrderFire.Count - 1 do
  begin
    PktToFire := Lonchr.OrderFire.Items[i];

    if (PktToFire.Available) and (PktToFire.Condition) then
      Count := Count + 1;

    PktToFire.Available := False;

  end;

  if Count > 0 then
  begin
    if Count > 1 then
      Order := __ORD_RBU_FIRE_SALVO
    else
      Order := __ORD_RBU_FIRE;

    lRec.mLauncherID := Lonchr.ID;
    if Lonchr = Lonch1 then
      lRec.mMissileID := TempSingleFireR
    else
      lRec.mMissileID := TempSingleFireL;

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

  top := 50;
  bottom := pnlCenter.Height - top;
  left := diffBeetwinWH + top;
  right := pnlCenter.Width - left;

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

procedure TfrmMainDisplay.tmr1Timer(Sender: TObject);
begin
  edtDateValue.Text := FormatDateTime('MM/DD/YYYY', Now);
  edtTimeValue.Text := FormatDateTime('hh:mm:ss ampm', Now);

  FVTgtHdngShp := RBU_MAnager.Heading;
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

  convToDial := (FVTgtRangeTrgt / 1000.0) * 15;
  if Round((convToDial + 240)) <> Round(FVCurRangeTrgt) then
  begin
    if (((convToDial + 240) - FVCurRangeTrgt) <= 480) and (((convToDial + 240) - FVCurRangeTrgt) > 240) then
    begin
      //rotate ccw (r)
      FVCurRangeTrgt := 240 + convToDial;
    end ;
//    else
//    begin
//      //rotate cw (l)
//      FVCurRangeTrgt := FVCurRangeTrgt - convToDial;
//    end;

    RotateAndDisplayFixedSize(imgRangeTrgtNdl, FOriginalPngRangeTrgt, (convToDial + 240){FVCurRangeTrgt});
//    FVCurRangeTrgt := FVCurRangeTrgt + FVTgtRangeTrgt;
  end
  else
    FVCurRangeTrgt := FVTgtRangeTrgt;

  edtValRangeTrgt.Text := FormatFloat('0.#', FVTgtRangeTrgt);

  if Round(FVTgtBrngTrgt2) <> Round(FVCurBrngTrgt2) then
  begin
    if ((FVTgtBrngTrgt2 - FVCurBrngTrgt2) <= 180) and ((FVTgtBrngTrgt2 - FVCurBrngTrgt2) > 0) then
    begin
      //rotate ccw (r)
      FVCurBrngTrgt2 := FVCurBrngTrgt2 + 1;
    end
    else
    begin
      //rotate cw (l)
      FVCurBrngTrgt2 := FVCurBrngTrgt2 - 1;
    end;

    RotateAndDisplayFixedSize(imgBrngTrgt2Ndl, ForiginalPngBrngTrgt2, FVCurBrngTrgt2);
  end
  else
    FVCurBrngTrgt2 := FVTgtBrngTrgt2;

  if Round(FVTgtShpTrgt) <> Round(FVCurShpTrgt) then
  begin
    if ((FVTgtShpTrgt - FVCurShpTrgt) <= 180) and ((FVTgtShpTrgt - FVCurShpTrgt) > 0) then
    begin
      //rotate ccw (r)
      FVCurShpTrgt := FVCurShpTrgt + 1;
    end
    else
    begin
      //rotate cw (l)
      FVCurShpTrgt := FVCurShpTrgt - 1;
    end;

    RotateAndDisplayFixedSize(imgShpTrgtNdl, FOriginalPngShpTrgt, FVCurShpTrgt);
  end
  else
    FVCurShpTrgt := FVTgtShpTrgt;

  if Round(FVTgtTrgtShp) <> Round(FVCurTrgtShp) then
  begin
    if ((FVTgtTrgtShp - FVCurTrgtShp) <= 180) and ((FVTgtTrgtShp - FVCurTrgtShp) > 0) then
    begin
      //rotate ccw (r)
      FVCurTrgtShp := FVCurTrgtShp + 1;
    end
    else
    begin
      //rotate cw (l)
      FVCurTrgtShp := FVCurTrgtShp - 1;
    end;

    RotateAndDisplayFixedSize(imgTrgtShpNdl, FOriginalPngTrgtShp, FVCurTrgtShp);
  end
  else
    FVCurTrgtShp := FVTgtTrgtShp;

//  convToDial2 := (FVTgtShpSpeed -240) * 30;
//  if Round(240 + convToDial2) <> Round(FVCurShpSpeed) then
//  begin
//    if (((240 + convToDial2) - FVCurShpSpeed) <= 480) and (((240 + convToDial2) - FVCurShpSpeed) > 240) then
//    begin
//      //rotate ccw (r)
//      FVCurShpSpeed := 240 + convToDial2;
//    end;
////    else
////    begin
////      //rotate cw (l)
////      FVCurShpSpeed := FVCurShpSpeed - 1;
////    end;
//
//    RotateAndDisplayFixedSize(imgShpSpeedNdl, FOriginalPngShpSpeed, (240 + convToDial2){FVCurShpSpeed});
//  end
//  else
//    FVCurShpSpeed := FVTgtShpSpeed;
//
//  edtValShpSpeed.Text := FormatFloat('0.#', convToDial2);

//  convToDial3 := (FVTgtShpSpeed / 5.0) * 30;
//  if Round(240 + convToDial3) <> Round(FVCurTrgtSpeed) then
//  begin
//    if (((240 + convToDial3) - FVCurTrgtSpeed) <= 480) and (((240 + convToDial3) - FVCurTrgtSpeed) > 240) then
//    begin
//      //rotate ccw (r)
//      FVCurTrgtSpeed := (240 + convToDial3);
//    end;
////    else
////    begin
////      //rotate cw (l)
////      FVCurTrgtSpeed := FVCurTrgtSpeed - 1;
////    end;
//
//    RotateAndDisplayFixedSize(imgTrgtSpeedNdl, FOriginalPngTrgtSpeed, (240 + convToDial3){FVCurTrgtSpeed});
//  end
//  else
//    FVCurTrgtSpeed := FVTgtTrgtSpeed;
//
//  edtValTrgtSpeed.Text := FormatFloat('0.#', convToDial3);

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
