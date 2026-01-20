unit uFrmDCDSMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  SpeedButtonImage, Vcl.Buttons, TFlatSpeedButtonUnit, TFlatButtonUnit,
  ImageButton, RzBmpBtn, VrControls, VrTrackBar, acPNG, Vcl.FileCtrl, Vcl.Grids,
  Vcl.Samples.DirOutln, VrDesign, RzButton, Vcl.Imaging.pngimage, System.Math,
  uTCPDatatype, uBaseDataType, {uLibAK230,} uLibTDCClass;

type
//  tbrData = record
//    b, r: double;
//  end;

  TfrmDCDSMain = class(TForm)
    pnlBackground: TPanel;
    tmr1: TTimer;
    img115_400Hz: TImage;
    img26VDC: TImage;
    imgAggregate: TImage;
    imgPlunger: TImage;
    imgPwrSwt: TImage;
    imgSynchron: TImage;
    imgTaboZone: TImage;
    imgUnformer: TImage;
    pnlBlackScreen: TPanel;
    pnlScreen: TPanel;
    pnlScreenTitle: TPanel;
    pnlScreenSpaceLeft: TPanel;
    pnlScreenSpaceRight: TPanel;
    pnlContent: TPanel;
    pnlCLeft: TPanel;
    grpControlMode: TGroupBox;
    pnlCMSwap: TPanel;
    btnCmAggregate: TFlatButton;
    btnCmDCDrive: TFlatButton;
    btnCMEmergency: TFlatButton;
    grpDCDriveControl: TGroupBox;
    grpOperatingMode: TGroupBox;
    pnlControlMode: TPanel;
    btnOmKolonka: TFlatButton;
    btnOmAnjungan: TFlatButton;
    pnlTargetDepth: TPanel;
    pnlCRight: TPanel;
    grpLayingMonitor: TGroupBox;
    lblLM: TLabel;
    pnlLmTraining: TPanel;
    imgTrainingBg: TImage;
    pnlLmElevation: TPanel;
    imgElevationBg: TImage;
    edtLblElevation: TEdit;
    pnlLmHeading: TPanel;
    imgHeadingBg: TImage;
    edtLblHeading: TEdit;
    edtValueElevation: TEdit;
    edtValueHeding: TEdit;
    edtLblTraining: TEdit;
    edtValueTraining: TEdit;
    pnlCCenter: TPanel;
    grpStatusCondition: TGroupBox;
    pnlSCTop: TPanel;
    edtLblSC: TEdit;
    pnlSCHeader: TPanel;
    grpLoggerMenu: TGroupBox;
    dirlst1: TDirectoryListBox;
    drvcbb1: TDriveComboBox;
    fllst1: TFileListBox;
    pnlCCBottom: TPanel;
    grpStatus: TGroupBox;
    grpBackSideMonitor: TGroupBox;
    btnLclRmt: TFlatButton;
    btnRemote: TFlatButton;
    pnlRadarExtSyn: TPanel;
    pnlLblRadar: TPanel;
    imgLblRadar: TImage;
    pnlLblExtSyn: TPanel;
    imgLblExtSyn: TImage;
    pnlOMRangeBearing: TPanel;
    edtOmRangeValue: TEdit;
    edtOmBearingValue: TEdit;
    lbl0: TLabel;
    lbl1: TLabel;
    lbl16: TLabel;
    lbl2: TLabel;
    btnOmRangeBearingEnter: TFlatButton;
    pnlDCDC: TPanel;
    btnDcdcExecute: TFlatButton;
    pnlDCDCElevationCtrl: TPanel;
    edtElevationValue: TEdit;
    pnlDCDCTrainingCtrl: TPanel;
    edtTrainingValue: TEdit;
    pnlDcdcLblTraining: TPanel;
    pnlDcdcLblElevation: TPanel;
    lbl13: TLabel;
    lbl17: TLabel;
    btnDcdcTrainIncrease: TButton;
    btnDcdcTrainDecrease: TButton;
    btnDcdcTrainMax: TButton;
    btnDcdcTrainMin: TButton;
    btnDcdcElevationIncrease: TButton;
    btnDcdcElevationDecrease: TButton;
    btnDcdcElevationMax: TButton;
    btnDcdcElevationMin: TButton;
    pnlExit: TPanel;
    pnlBullet: TPanel;
    grpAngleCorrection: TGroupBox;
    btnBrakeOn: TRzBmpButton;
    btnFiring: TVrBitmapButton;
    pnlACTraining: TPanel;
    pnlAcLblTaining: TPanel;
    edtAcTrainValue: TEdit;
    lbl3: TLabel;
    pnlACElevation: TPanel;
    pnlAcLblElevation: TPanel;
    lblAcElevation: TLabel;
    edtAcElevationValue: TEdit;
    btnExit: TFlatButton;
    grpBulltInMgzn: TGroupBox;
    grpBulletsCount: TGroupBox;
    edtBulCntLf1: TEdit;
    edtBulCntLf2: TEdit;
    edtBulCntRg1: TEdit;
    edtBulCntRg2: TEdit;
    lbl4: TLabel;
    lbl5: TLabel;
    edtNoLeftMgzn: TEdit;
    edtNoRightMgzn: TEdit;
    btnNoBulltMgzn: TFlatButton;
    lbl6: TLabel;
    lbl7: TLabel;
    pnlFrame: TPanel;
    edtFileType: TEdit;
    edtLogDura: TEdit;
    fltcbb1: TFilterComboBox;
    edtLogDuraValue: TEdit;
    lblSC: TLabel;
    lblCM: TLabel;
    lblOM: TLabel;
    lblDCDC: TLabel;
    lblAC: TLabel;
    lblNBIM: TLabel;
    lblBC: TLabel;
    lblBSM: TLabel;
    lblS: TLabel;
    pnlBackSideMonitorContent: TPanel;
    btnAcTrainingIncrease: TButton;
    btnAcTrainingDecrease: TButton;
    btnAcElevationIncrease: TButton;
    btnAcElevationDecrease: TButton;
    btn3: TFlatButton;
    btn4: TFlatButton;
    btn5: TFlatButton;
    btn6: TFlatButton;
    btn7: TFlatButton;
    btn8: TFlatButton;
    pnlTCPPCB: TPanel;
    grpSCamera: TGroupBox;
    grpSPowerStatus: TGroupBox;
    grpSLayingStatus: TGroupBox;
    pnlFrameTop: TPanel;
    pnlFrameBottom: TPanel;
    pnlFrameRight: TPanel;
    pnlFrameLeft: TPanel;
    pnlFrameContent: TPanel;
    imgBackground: TImage;
    pnlDateTime: TPanel;
    lblSCamera: TLabel;
    edtTime: TEdit;
    edtDate: TEdit;
    edtDateValue: TEdit;
    edtTimeValue: TEdit;
    lblSPowerStatus: TLabel;
    lblSLaingStatus: TLabel;
    lbl8: TLabel;
    lblTCPPCBStatus: TLabel;
    imgTCPPCBStatus: TImage;
    btnCStart: TFlatButton;
    btnCStop: TFlatButton;
    lbl9: TLabel;
    imgPower380V60HzStatus: TImage;
    lbl10: TLabel;
    imgVRef220V500HzStatus: TImage;
    lbl11: TLabel;
    imgTrainingRightLimitStatus: TImage;
    lbl12: TLabel;
    imgTrainingLeftLimitStatus: TImage;
    lbl14: TLabel;
    imgElevationLowStatus: TImage;
    lbl15: TLabel;
    imgElevationHighStatus: TImage;
    btnPwrSwt: TSpeedButtonImage;
    imgPowerSwitchBg: TImage;
    imgPowerSwt: TImage;
    btn26Vdc: TSpeedButtonImage;
    btn115400Hz: TSpeedButtonImage;
    btnUnformer: TSpeedButtonImage;
    btnTaboZone: TSpeedButtonImage;
    btnAggregate: TSpeedButtonImage;
    btnSynchron: TSpeedButtonImage;
    btnPlunger: TSpeedButtonImage;
    imgBrakeOn: TImage;
    btnPowerSwitch: TRzBmpButton;
    btnFireVolt: TRzBmpButton;
    imgFiring: TImage;
    imgFireVolt: TImage;
    lbl18: TLabel;
    lbl19: TLabel;
    lbl20: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    lbl24: TLabel;
    lbl25: TLabel;
    mmoLogger: TMemo;
    dlgSave1: TSaveDialog;
    imgElevPtr: TImage;
    imgTrainPtr: TImage;
    imgHeadPtr: TImage;
    tmrTime: TTimer;
    tmrRotate: TTimer;
    procedure tmr1Timer(Sender: TObject);
    procedure btnPowerSwitchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnFireVoltClick(Sender: TObject);
    procedure btnAcTrainingIncreaseClick(Sender: TObject);
    procedure btnAcTrainingDecreaseClick(Sender: TObject);
    procedure btnAcElevationIncreaseClick(Sender: TObject);
    procedure btnAcElevationDecreaseClick(Sender: TObject);
    procedure btnDcdcTrainIncreaseClick(Sender: TObject);
    procedure btnDcdcTrainDecreaseClick(Sender: TObject);
    procedure btnDcdcTrainMaxClick(Sender: TObject);
    procedure btnDcdcTrainMinClick(Sender: TObject);
    procedure btnDcdcElevationIncreaseClick(Sender: TObject);
    procedure btnDcdcElevationDecreaseClick(Sender: TObject);
    procedure btnDcdcElevationMaxClick(Sender: TObject);
    procedure btnDcdcElevationMinClick(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPwrSwtClick(Sender: TObject);
    procedure btnOmRangeBearingEnterClick(Sender: TObject);
    procedure btnDcdcExecuteClick(Sender: TObject);
    procedure tmrTimeTimer(Sender: TObject);
    procedure tmrRotateTimer(Sender: TObject);
    procedure btnCmAggregateClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFiringMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnFiringMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    FbootTime : Integer;
    FisPowerOn,
    FisReady : Boolean;
    FimgTemp : TImage;
    FisPwrSwtOn: Boolean;
    FOriginalPngTraining,
    FOriginalPngElevation,
    FOriginalPngHeading: TPngImage;
    FVTgtTraining,
    FVTgtElevation,
    FVTgtHeading,
    FVCurTraining,
    FVCurElevation,
    FVCurHeading: Double;

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

    procedure setPowerOffState;
    procedure RotateAndDisplayFixedSize(TargetImage: TImage; SourcePng: TPngImage; Angle: Extended);
//    procedure SetGunReady;
//    function GetModeID_Fire(TheGun : TGUN):byte;
//    function FindTOFandPHPpoint(Gun_numb: Word; TgtCourse, TgtSpeed:
//      Single;var oX, oY, oZ: Double): Single;
//    function GetTOF(Gun_numb :Word; X1,Y1,X2,Y2,Z2: Double): Single;
  public
    { Public declarations }
//    MslNumb : Integer;
//    {ActiveGUN, }GunL, GunR: TGun;
//    TGM_Marker  : TTDC_Symbol; // Tracking Gate Marker
//    SIM_Marker  : TTDC_Symbol;
//    EMark       : TElevationMark;
//    IsTGMMoveable: boolean;
//    OffsetPoint_Marker  : TTDC_Symbol;
//    IndBombData : tbrData;



//    Gun1Pressed, Gun2Pressed, Gun3Pressed : boolean;
//    ActiveFC    : TFireControl;

    procedure StartCannonFire(Gun_ID: word);
    procedure StopCannonFire(Gun_ID: word);

  end;

var
  frmDCDSMain: TfrmDCDSMain;

implementation

{$R *.dfm}

uses
  ulibSettings, uScriptSimAK230, uBridgeSet, uDataModule, uAK230Manager,
  uBaseConstan, uBaseFunction;

procedure TfrmDCDSMain.btn7Click(Sender: TObject);
begin
  if dlgSave1.Execute then
  begin

  end;
end;

procedure TfrmDCDSMain.btnAcElevationDecreaseClick(Sender: TObject);
var
  dblVal: Double;
begin
  dblVal := StrToFloat(edtAcElevationValue.Text);
  if dblVal > -3 then
//    Dec(intVal);
    dblVal := dblVal - 0.1;
  if (dblVal > -0.1) and (dblVal < 0.1) then
    dblVal := 0;
  edtAcElevationValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnAcElevationIncreaseClick(Sender: TObject);
var
  dblVal: Double;
begin
  dblVal := StrToFloat(edtAcElevationValue.Text);
  if dblVal < 3 then
//    Inc(intVal);
    dblVal := dblVal + 0.1;
  if (dblVal > -0.1) and (dblVal < 0.1) then
    dblVal := 0;
  edtAcElevationValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnAcTrainingDecreaseClick(Sender: TObject);
var
  dblVal: Double;
begin
  dblVal := StrToFloat(edtAcTrainValue.Text);
  if dblVal > -3 then
//    Dec(intVal);
    dblVal := dblVal - 0.1;
  if (dblVal > -0.1) and (dblVal < 0.1) then
    dblVal := 0;
  edtAcTrainValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnAcTrainingIncreaseClick(Sender: TObject);
var
  dblVal: Double;
begin
  dblVal := StrToFloat(edtAcTrainValue.Text);
  if dblVal < 3 then
//    Inc(intVal);
    dblVal := dblVal + 0.1;
  if (dblVal > -0.1) and (dblVal < 0.1) then
    dblVal := 0;
  edtAcTrainValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnCmAggregateClick(Sender: TObject);
begin
  if btnCmAggregate.Down then
  begin
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_greenon.png');
    btnAggregate.Glyph := FimgTemp.Picture.Bitmap;
  end
  else
  begin
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_greenoff.png');
    btnAggregate.Glyph := FimgTemp.Picture.Bitmap;
  end;
end;

procedure TfrmDCDSMain.btnDcdcElevationDecreaseClick(Sender: TObject);
var
  dblVal, tVal: Double;
begin
  dblVal := StrToFloat(edtElevationValue.Text);
  tVal := dblVal-0.1;
  if tVal >= -10 then
//   Dec(intVal);
    dblVal := dblVal - 0.1;
  if (tVal > -0.1) and (tVal < 0.1) then
    dblVal := 0;
//  if intVal < 0 then
//    intVal := intVal + 360;
  edtElevationValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnDcdcElevationIncreaseClick(Sender: TObject);
var
  dblVal, tVal: Double;
begin
  dblVal := StrToFloat(edtElevationValue.Text);
  tVal := dblVal+0.1;
  if tVal <= 85 then
//    Inc(intVal);
    dblVal := dblVal + 0.1;
  if (tVal > -0.1) and (tVal < 0.1) then
    dblVal := 0;
//  if intVal >= 360 then
//    intVal := intVal - 360;
  edtElevationValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnDcdcElevationMaxClick(Sender: TObject);
var
  dblVal: Double;
begin
  dblVal := StrToFloat(edtElevationValue.Text);
  if dblVal+10 <= 85 then
    dblVal := dblVal + 10;
  if dblVal+10 > 85 then
    dblVal := 85;
  if (dblVal > -0.1) and (dblVal < 0.1) then
    dblVal := 0;
//  if intVal >= 360 then
//    intVal := intVal - 360;
  edtElevationValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnDcdcElevationMinClick(Sender: TObject);
var
  dblVal: Double;
begin
  dblVal := StrToFloat(edtElevationValue.Text);
  if dblVal-10 >= -10 then
    dblVal := dblVal - 10;
  if dblVal-10 < -10 then
    dblVal := -10;
  if (dblVal > -0.1) and (dblVal < 0.1) then
    dblVal := 0;
//  if intVal < 0 then
//    intVal := intVal + 360;
  edtElevationValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnDcdcExecuteClick(Sender: TObject);
var
  elevVal, trainVal, acElevVal, acTrainVal: Double;
  lRec : TRec3DSetAK230;
begin
  if edtElevationValue.Text = '' then
  begin
    ShowMessage('Elevation value is empty!');
    Exit;
  end;
  if edtTrainingValue.Text = '' then
  begin
    ShowMessage('Training value is empty!');
    Exit;
  end;

  if not TryStrToFloat(edtElevationValue.Text, elevVal) then
  begin
    ShowMessage('Elevation value is incorrect!');
    Exit;
  end;
  if not TryStrToFloat(edtTrainingValue.Text, trainVal) then
  begin
    ShowMessage('Training value is incorrect!');
    Exit;
  end;

  if edtAcTrainValue.Text = '' then
  begin
    ShowMessage('Angle correction training value is empty!');
    Exit;
  end;
  if edtAcElevationValue.Text = '' then
  begin
    ShowMessage('Angle correction elevation value is empty!');
    Exit;
  end;

  if not TryStrToFloat(edtAcTrainValue.Text, acTrainVal) then
  begin
    ShowMessage('Angle correction training value is incorrect!');
    Exit;
  end;
  if not TryStrToFloat(edtAcElevationValue.Text, acElevVal) then
  begin
    ShowMessage('Angle correction elevation value is incorrect!');
    Exit;
  end;

  FVTgtTraining := trainVal+acTrainVal;
  FVTgtElevation := elevVal+acElevVal;
//  edtValueTraining.Text := FormatFloat('0.#', FVTgtTraining);
//  edtValueElevation.Text := FormatFloat('0.#', FVTgtElevation);

  lRec.ShipID := AK230Manager.ShipID;
  lRec.mWeaponID := AK230Manager.AssignedWeapon.IDWeapon;
  lRec.mLauncherID     := 0;
  lRec.mMissileID      := 0;
  lRec.mMissileNumber  := 0;
  lRec.mOrderID        := 0;

  lRec.mUpDown             := 0;
  lRec.mTargetID           := 0;
  lRec.mModeID             := 0;
  lRec.mAutoCorrectElev    := FVTgtElevation;
  lRec.mAutoCorrectBearing := FVTgtTraining;

  lRec.mBalistikID         := 0;
  lRec.mSalvoRate          := 30;


  lRec.mOrderID := __ORD_CANNON_ASSIGNED;
  AK230Manager.NetSendTo3D_OrderCannon(lRec);
end;

procedure TfrmDCDSMain.btnDcdcTrainDecreaseClick(Sender: TObject);
var
  dblVal, tVal: Double;
begin
  dblVal := StrToFloat(edtTrainingValue.Text);
  tVal:= dblVal-0.1;
  if tVal >= -180 then
//    Dec(intVal);
    dblVal := dblVal - 0.1;
  if (tVal > -0.1) and (tVal < 0.1) then
    dblVal := 0;
//  if intVal < 0 then
//    intVal := intVal + 360;
  edtTrainingValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnDcdcTrainIncreaseClick(Sender: TObject);
var
  dblVal, tVal: Double;
begin
  dblVal := StrToFloat(edtTrainingValue.Text);
  tVal:= dblVal+0.1;
  if tVal <= 180  then
//    Inc(intVal);
    dblVal := dblVal + 0.1;
  if (tVal > -0.1) and (tVal < 0.1) then
    dblVal := 0;
//  if intVal >= 360 then
//    intVal := intVal - 360;
  edtTrainingValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnDcdcTrainMaxClick(Sender: TObject);
var
  dblVal: Double;
begin
  dblVal := StrToFloat(edtTrainingValue.Text);
  if dblVal+10 <= 180 then
    dblVal := dblVal + 10;
  if dblVal+10 > 180 then
    dblVal := 180;
  if (dblVal > -0.1) and (dblVal < 0.1) then
    dblVal := 0;
//  if intVal >= 360 then
//    intVal := intVal - 360;
  edtTrainingValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnDcdcTrainMinClick(Sender: TObject);
var
  dblVal: Double;
begin
  dblVal := StrToFloat(edtTrainingValue.Text);
  if dblVal-10 >= -180 then
    dblVal := dblVal - 10;
  if dblVal-10 < -180 then
    dblVal := -180;
  if (dblVal > -0.1) and (dblVal < 0.1) then
    dblVal := 0;
//  if intVal < 0 then
//    intVal := intVal + 360;
  edtTrainingValue.Text := FloatToStr(dblVal);
end;

procedure TfrmDCDSMain.btnExitClick(Sender: TObject);
var
  btnSelect: Integer;
begin
  btnSelect := MessageDlg('Are you sure want to Exit?', mtConfirmation,
                [mbYes, mbNo],0);
  if btnSelect = mrYes then
    btnPwrSwtClick(btnPwrSwt);//pnlScreen.Visible := False;
end;

procedure TfrmDCDSMain.btnFireVoltClick(Sender: TObject);
var
  dblVal: Double;
begin

  if btnfirevolt.down then
  begin
    pnlLmTraining.Visible := True;
    pnlLmElevation.Visible := True;
    pnlLmHeading.Visible := True;

    if FisPowerOn and TryStrToFloat(edtOmRangeValue.Text, dblVal) then
    begin
      if dblVal > 0 then
      begin
        FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_firingon.png');
        btnFiring.Glyph := FimgTemp.Picture.Bitmap;
        btnFiring.Enabled := True;
      end
      else
      begin
        FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_firingoff.png');
        btnFiring.Glyph := FimgTemp.Picture.Bitmap;
        btnFiring.Enabled := False;
      end;
    end;
    if FisPowerOn then
      tmrRotate.Enabled := True
    else
      tmrRotate.Enabled := False;
  end
  else
  begin
    pnlLmHeading.Visible := False;
    pnlLmElevation.Visible := False;
    pnlLmTraining.Visible := False;
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_firingoff.png');
    btnFiring.Glyph := FimgTemp.Picture.Bitmap;
    tmrRotate.Enabled := False;
  end;
end;

procedure TfrmDCDSMain.btnFiringMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StartCannonFire(1);
end;

procedure TfrmDCDSMain.btnFiringMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  StopCannonFire(1);
end;

procedure TfrmDCDSMain.btnOmRangeBearingEnterClick(Sender: TObject);
var
  ranVal, bearVal, maxRan: Double;
begin
  if edtOmRangeValue.Text = '' then
  begin
    ShowMessage('Range value is empty!');
    Exit;
  end;
  if edtOmBearingValue.Text = '' then
  begin
    ShowMessage('Bearing value is empty!');
    Exit;
  end;

  if not TryStrToFloat(edtOmRangeValue.Text, ranVal) then
  begin
    ShowMessage('Range value is incorrect!');
    Exit;
  end;
  if not TryStrToFloat(edtOmBearingValue.Text, bearVal) then
  begin
    ShowMessage('Bearing value is incorrect!');
    Exit;
  end;

  //min range surf target : 500m = 0.27Nm; air target : 300m = 0.16Nm;
  //max range surf target : 4000m = 2.16Nm; air target : 3000m = 1.62Nm;
  maxRan := 1.62;
  if StrToFloat(edtValueElevation.Text) = 45 then
    maxRan := 2.16;
  if (StrToFloat(edtValueElevation.Text) >= -10) and (StrToFloat(edtValueElevation.Text) < 0) then
    maxRan := 0;
  if (StrToFloat(edtValueElevation.Text) >= 0) and (StrToFloat(edtValueElevation.Text) < 15) then
    maxRan := 1.62;
  if (StrToFloat(edtValueElevation.Text) >= 15) and (StrToFloat(edtValueElevation.Text) < 30) then
    maxRan := 1.80;
  if (StrToFloat(edtValueElevation.Text) >= 30) and (StrToFloat(edtValueElevation.Text) < 45) then
    maxRan := 1.98;
  if (StrToFloat(edtValueElevation.Text) > 45) and (StrToFloat(edtValueElevation.Text) < 60) then
    maxRan := 1.98;
  if (StrToFloat(edtValueElevation.Text) >= 60) and (StrToFloat(edtValueElevation.Text) < 75) then
    maxRan := 1.80;
  if (StrToFloat(edtValueElevation.Text) >= 75) and (StrToFloat(edtValueElevation.Text) <= 85) then
    maxRan := 1.62;
  if (StrToFloat(edtValueElevation.Text) > 85) then
    maxRan := 0;
//  edtValueHeding.Text := FormatFloat('0.#', bearVal);

  if btnfirevolt.down then
  begin
    if FisPowerOn and TryStrToFloat(edtOmRangeValue.Text, ranVal) then
    begin
      if (ranVal >= 0.16) and (ranVal <= maxRan) then
      begin
        FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_firingon.png');
        btnFiring.Glyph := FimgTemp.Picture.Bitmap;
      end
      else
      begin
        FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_firingoff.png');
        btnFiring.Glyph := FimgTemp.Picture.Bitmap;
        ShowMessage('Out of Range!');
      end;
    end;
  end
  else
  begin
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_firingoff.png');
    btnFiring.Glyph := FimgTemp.Picture.Bitmap;
  end;
end;

procedure TfrmDCDSMain.btnPowerSwitchClick(Sender: TObject);
//var
//  imVar: TImage;
begin
//  imVar := TImage.Create(nil);

  if btnPowerSwitch.Down then
  begin
    FisPowerOn := True;
    tmr1.Enabled := True;
//    imVar.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_pwr on.png');
//    btnPwrSwt.Glyph := imVar.Picture.Bitmap;
//    edtTimeValue.Text := FormatDateTime('hh:mm:ss ampm', Now);
//    edtDateValue.Text := FormatDateTime('mm/dd/yyyy', Now);
  end
  else
  begin
    FisPowerOn := False;
    FbootTime := 0;
    tmr1.Enabled := False;
//    pnlScreen.Visible := False;
//    imVar.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_pwr off.png');
//    btnPwrSwt.Glyph := imVar.Picture.Bitmap;
    setPowerOffState;
  end;
end;

procedure TfrmDCDSMain.btnPwrSwtClick(Sender: TObject);
begin
  if (not FisPowerOn) then
    Exit;
  if  (not FisReady) then
    Exit;

  FisPwrSwtOn := not FisPwrSwtOn;
  if FisPwrSwtOn then
  begin
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_pwr on.png');
    btnPwrSwt.Glyph := FimgTemp.Picture.Bitmap;
    tmr1.Enabled := True;//not tmr1.Enabled;
//    tmrRotate.Enabled := True;
  end
  else
  begin
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_pwr off.png');
    btnPwrSwt.Glyph := FimgTemp.Picture.Bitmap;
    pnlScreen.Visible := False;
    tmr1.Enabled := False;
    FbootTime := 0;
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_greenoff.png');
    btnSynchron.Glyph := FimgTemp.Picture.Bitmap;
    tmrRotate.Enabled := False;
  end;
end;

//function TfrmDCDSMain.FindTOFandPHPpoint(Gun_numb: Word; TgtCourse,
//  TgtSpeed: Single; var oX, oY, oZ: Double): Single;
//var lastrange, range, movement, brg, toleran,
//    tmpX, tmpY,
//    iX, iY, iZ : Double;
//    CurTgtPos : tDouble2DPoint;
//    Tof  : Single;
//    i :integer;
//begin
//  i  := 0;
//  iX := oX;
//  iY := oY;
//
//  toleran   := 1 * C_Meter_To_NauticalMiles;
//  lastrange := 0;
//  range     := 0;
//  repeat
//    inc(i);
//    lastrange := range;
//    Tof       := GetTOF(Gun_numb,AK230Manager.xSHIP.PositionX, AK230Manager.xSHIP.PositionY, oX, oY, oZ);
//    movement  := (Tof/3600) * TgtSpeed;                        // Range pergerakan kapal  target (Nm)
//    RangeBearingToCoord(movement,TgtCourse,tmpX, tmpY);        // titik pergerakan kapal target
//    oX := 0;
//    oY := 0;
//    oX := iX + tmpX * C_NauticalMile_To_Degree;               //posisi X,Y terakhir pada saat TOF
//    oY := iY + tmpY * C_NauticalMile_To_Degree;
//    range := CalcRange(AK230Manager.xSHIP.PositionX, AK230Manager.xSHIP.PositionY, oX, oY);
//
//    Result := Tof;
//  until(Lastrange > (range - toleran)) and (Lastrange < (range + toleran)) or (i=100);
//end;

procedure TfrmDCDSMain.FormCreate(Sender: TObject);
var
  n : Integer;
  ShipClassName : string;
begin
  FbootTime := 0;
  tmr1.Enabled := False;

  pnlBlackScreen.Width := Round(0.875 * pnlBackground.Width);
  pnlBlackScreen.Left := (pnlBackground.Width - pnlBlackScreen.Width) div 2;

//  DoubleBuffered := True;
//  pnlCRight.DoubleBuffered := True;
//  pnlLmTraining.DoubleBuffered := True;
//  pnlLmElevation.DoubleBuffered := True;
//  pnlLmHeading.DoubleBuffered := True;

  pnlLmTraining.Visible := False;
  pnlLmElevation.Visible := False;
  pnlLmHeading.Visible := False;

  FimgTemp := TImage.Create(nil);
  FOriginalPngTraining := TPngImage.Create;
  FOriginalPngElevation := TPngImage.Create;
  FOriginalPngHeading := TPngImage.Create;

  FOriginalPngTraining.LoadFromFile('.\data\images\AK230_Turret_Top 180p.png');
  FOriginalPngElevation.LoadFromFile('.\data\images\AK230_Turret_Side 180p.png');
  FOriginalPngHeading.LoadFromFile('.\data\images\AK230_heading+num 170p.png');

  tmrRotate.Interval := 250;
  tmrRotate.Enabled := False;

  FVTgtTraining := 0;
  FVTgtElevation := 0;
  FVTgtHeading := 0;
  FVCurTraining := 0;
  FVCurElevation := 0;
  FVCurHeading := 0;

  BeginGame_AK230;

  AK230Manager := TAK230Manager.Create;

  n := ParamCount;
  if n < max_param then
  begin
    AK230Manager.IsStandAlone := True;
  end;

  if not AK230Manager.IsStandAlone then
  begin
    InitDefault_AllConfigFromInstruktur(pServer_Ip,pServer_Port,
    pDBServer, pDBProto, pDBName, pDBUser,
    pDBPass, pShipID, pCurrentScenID);

    AK230Manager.CurrentScenID := pCurrentScenID;
    AK230Manager.Server_Ip := pServer_Ip;
    AK230Manager.Server_Port := pServer_Port;               //TriD_IP, TriD_Port,
    AK230Manager.DBServer := pDBServer;
    AK230Manager.DBProto := pDBProto;
    AK230Manager.DBName := pDBName;
    AK230Manager.DBUser := pDBUser;
    AK230Manager.DBPass := pDBPass;
    AK230Manager.ShipID := pShipID;
    AK230Manager.ClassID := pClassID;

    AK230Manager.ServerIp := vBridgeServer.m2D_IP;
    AK230Manager.ServerPort := vBridgeServer.m2D_Port;

    if DataModule1.InitZDB(vDbServer.mDBServer, vDbServer.mDBProto, vDbServer.mDBName, vDbServer.mDBUser, vDbServer.mDBPass, vDbServer.mDBPort) then
    begin
      AK230Manager.ShipClassID  := DataModule1.GetShipType(AK230Manager.ShipID, ShipClassName);
      AK230Manager.ShipName     := DataModule1.GetShipName(AK230Manager.ShipID);
      AK230Manager.ShipNumber := DataModule1.GetShipNoById(AK230Manager.ShipID);
      AK230Manager.ShipCallSign := DataModule1.GetShipCallsignByID(AK230Manager.ShipID);

    end;

    AK230Manager.Env_Map := DataModule1.GetMapById(AK230Manager.CurrentScenID);

    AK230Manager.Get230WeaponAssigned;

    if Assigned(AK230Manager.AssignedWeapon) then
    begin
      FVTgtTraining := AK230Manager.AssignedWeapon.Pos_H;

      edtValueTraining.Text := FormatFloat('0.#', FVTgtTraining);
    end;

    AK230Manager.Running := True;
  end;

  AK230Manager.InitializeSimulation;

//  GunL := TGun.Create(1);
//  GunR := TGun.Create(1);
end;

procedure TfrmDCDSMain.FormDestroy(Sender: TObject);
begin
  AK230Manager.FinalizeSimulation;
end;

procedure TfrmDCDSMain.FormResize(Sender: TObject);
begin
  pnlBlackScreen.Width := Round(0.875 * pnlBackground.Width);
  pnlBlackScreen.Left := (pnlBackground.Width - pnlBlackScreen.Width) div 2;

end;

//function TfrmDCDSMain.GetModeID_Fire(TheGun: TGUN): byte;
//begin
////
//end;

//function TfrmDCDSMain.GetTOF(Gun_numb: Word; X1, Y1, X2, Y2,
//  Z2: Double): Single;
//var TargetRange : Double;
//begin
//  if DataModule1.GetStatusconDB then begin
////    TargetRange := Sqrt(Sqr(CalcRange(X1, Y1, X2, Y2) * C_NauticalMiles_TO_Meter) + Sqr(Z2));
//    TargetRange := CalcRange(X1, Y1, X2, Y2) * C_NauticalMiles_TO_Meter;
//    Result := DataModule1.GetCanonTOFbyRange(Gun_numb, TargetRange);
//  end
//  else
//    Result := 3;   // Konstanta TOF
//
//end;

procedure TfrmDCDSMain.RotateAndDisplayFixedSize(TargetImage: TImage;
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

//procedure TfrmDCDSMain.SetGunReady;
//begin
//  GunL.ReadyToFire := (GunL.AssignTo <> nil) and (GunL.AssignTo.TrackedTarget <> nil)
//    and GunL.PowerOn and (GunL.IsBlind = false) and GunL.IsInRange;
//  GunR.ReadyToFire := (GunR.AssignTo <> nil) and (GunR.AssignTo.TrackedTarget <> nil)
//    and GunR.PowerOn and (GunR.IsBlind = false) and GunR.IsInRange;
//end;

procedure TfrmDCDSMain.setPowerOffState;
begin
  pnlScreen.Visible := False;

  FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_pwr off.png');
  btnPwrSwt.Glyph := FimgTemp.Picture.Bitmap;
  FisPwrSwtOn := False;

  FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_greenoff.png');
  btn26Vdc.Glyph := FimgTemp.Picture.Bitmap;
  btnUnformer.Glyph := FimgTemp.Picture.Bitmap;
  btnAggregate.Glyph := FimgTemp.Picture.Bitmap;
  btnPlunger.Glyph := FimgTemp.Picture.Bitmap;
  btn115400Hz.Glyph := FimgTemp.Picture.Bitmap;
  btnTaboZone.Glyph := FimgTemp.Picture.Bitmap;
  btnSynchron.Glyph := FimgTemp.Picture.Bitmap;

  edtBulCntLf2.Text := '0';
  edtBulCntRg2.Text := '0';

  FisReady := False;
end;

procedure TfrmDCDSMain.StartCannonFire(Gun_ID: word);
var
  lRec: TRec3DSetAK230;
  isValidB, isValidE : boolean;
  cBearing, cElevation : Double;
begin
  isValidB := TryStrToFloat(edtValueTraining.Text, cBearing);
  isValidE := TryStrToFloat(edtValueElevation.Text, cElevation);

  if isValidB and isValidE then
  begin
    lRec.ShipID := AK230Manager.ShipID;
    lRec.mWeaponID := AK230Manager.AssignedWeapon.IDWeapon;
    lRec.mLauncherID := 0;
    lRec.mMissileID := 0;
    lRec.mMissileNumber := 0;
    lRec.mOrderID := 0;

    lRec.mUpDown :=  0;
    lRec.mTargetID := 0;
    lRec.mModeID := 0;
    lRec.mAutoCorrectElev := cElevation;//elev correct
    lRec.mAutoCorrectBearing := cBearing;//bearing correct

    lRec.mBalistikID := 0;
    lRec.mSalvoRate := 30;

    lrec.mOrderID := __ORD_CANNON_START_F;
    AK230Manager.NetSendTo3D_OrderCannon(lRec);
  end;
end;

procedure TfrmDCDSMain.StopCannonFire(Gun_ID: word);
var
  lRec: TRec3DSetAK230;
  isValidB, isValidE : boolean;
  cBearing, cElevation : Double;
begin
  isValidB := TryStrToFloat(edtValueTraining.Text, cBearing);
  isValidE := TryStrToFloat(edtValueElevation.Text, cElevation);

  if isValidB and isValidE then
  begin
    lRec.ShipID := AK230Manager.ShipID;
    lRec.mWeaponID := AK230Manager.AssignedWeapon.IDWeapon;
    lRec.mLauncherID := 0;
    lRec.mMissileID := 0;
    lRec.mMissileNumber := 0;
    lRec.mOrderID := 0;

    lRec.mUpDown :=  0;
    lRec.mTargetID := 0;
    lRec.mModeID := 0;
    lRec.mAutoCorrectElev := cElevation;//elev correct
    lRec.mAutoCorrectBearing := cBearing;//bearing correct

    lRec.mBalistikID := 0;
    lRec.mSalvoRate := 30;

    lrec.mOrderID := __ORD_CANNON_STOP_F;
    AK230Manager.NetSendTo3D_OrderCannon(lRec);
  end;
end;

procedure TfrmDCDSMain.tmr1Timer(Sender: TObject);
begin
  Inc(FbootTime);
  if (FbootTime >= 1) and (FbootTime < 2) and (not FisReady) then
  begin
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_greenon.png');
    btnUnformer.Glyph := FimgTemp.Picture.Bitmap;
  end
  else if (FbootTime >= 2) and (FbootTime < 3) and (not FisReady) then
  begin
    tmr1.Enabled := False;
    FbootTime := 0;
    FisReady := True;
  end
  else if (FbootTime >= 3) and (FisPwrSwtOn) then
  begin
    tmr1.Enabled := False;
    pnlScreen.Visible := True;
    FimgTemp.Picture.LoadFromFile('.\data\images\buttonAK230\bttn_greenon.png');
    btnSynchron.Glyph := FimgTemp.Picture.Bitmap;
  end;
end;

procedure TfrmDCDSMain.tmrRotateTimer(Sender: TObject);
begin
//  FVCurTraining := FVCurTraining + 2;
//  if FVCurTraining >= 360 then
//    FVCurTraining := 0;
  if Round(FVTgtTraining) <> Round(FVCurTraining) then
  begin
    if ((FVTgtTraining - FVCurTraining) < 180) and ((FVTgtTraining - FVCurTraining) > 0)  then
      FVCurTraining := FVCurTraining + 0.1
    else
      FVCurTraining := FVCurTraining - 0.1;
    RotateAndDisplayFixedSize(imgTrainPtr, FOriginalPngTraining, FVCurTraining);
  end
  else
    FVCurTraining := FVTgtTraining;

  if Round(FVTgtElevation) <> Round(FVCurElevation) then
  begin
    if ((FVTgtElevation - FVCurElevation) < 85) and ((FVTgtElevation - FVCurElevation) > 0) then
      FVCurElevation := FVCurElevation + 0.1
    else
    begin
      //if ((FVTgtElevation - FVCurElevation) < -10) then

      FVCurElevation := FVCurElevation - 0.1;
    end;
    RotateAndDisplayFixedSize(imgElevPtr, FOriginalPngElevation, FVCurElevation);
  end
  else
    FVCurElevation := FVTgtElevation;

  if Round(FVTgtHeading) <> Round(FVCurHeading) then
  begin
    if ((FVTgtHeading - FVCurHeading) < 180) and ((FVTgtHeading - FVCurHeading) > 0) then
      FVCurHeading := FVCurHeading + 1//0.1
    else
      FVCurHeading := FVCurHeading - 1;//0.1;
    RotateAndDisplayFixedSize(imgHeadPtr, FOriginalPngHeading, -FVCurHeading);
  end
  else
    FVCurHeading := FVTgtHeading;

  edtValueTraining.Text := FormatFloat('0.#', FVCurTraining);
  edtValueElevation.Text := FormatFloat('0.#', FVCurElevation);
  edtValueHeding.Text := FormatFloat('0.#', FVCurHeading);
end;

procedure TfrmDCDSMain.tmrTimeTimer(Sender: TObject);
begin
  edtDateValue.Text := FormatDateTime('MM/DD/YYYY', Now);
  edtTimeValue.Text := FormatDateTime('hh:mm:ss ampm', Now);

  FVTgtHeading := AK230Manager.xShip.Heading;
end;

end.
