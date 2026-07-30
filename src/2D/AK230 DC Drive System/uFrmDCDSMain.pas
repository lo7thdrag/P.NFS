unit uFrmDCDSMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  SpeedButtonImage, Vcl.Buttons, TFlatSpeedButtonUnit, TFlatButtonUnit,
  ImageButton, RzBmpBtn, VrControls, VrTrackBar, {acPNG,} Vcl.FileCtrl, Vcl.Grids,
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
    btnStartLog: TFlatButton;
    btnStopLog: TFlatButton;
    btnOpenFile: TFlatButton;
    btnClearList: TFlatButton;
    btnSaveAsFile: TFlatButton;
    btnSaveFile: TFlatButton;
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
    tmrAmmo: TTimer;
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
    procedure btnSaveAsFileClick(Sender: TObject);
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
    procedure btnOmKolonkaClick(Sender: TObject);
    procedure btnCStartClick(Sender: TObject);
    procedure btnStartLogClick(Sender: TObject);
    procedure btnOpenFileClick(Sender: TObject);
    procedure btnSaveFileClick(Sender: TObject);
    procedure btnClearListClick(Sender: TObject);
    procedure btnNoBulltMgznClick(Sender: TObject);
    procedure tmrAmmoTimer(Sender: TObject);
    procedure btnStopLogClick(Sender: TObject);
    procedure drvcbb1Change(Sender: TObject);
    procedure fllst1Change(Sender: TObject);
    procedure edtFileTypeChange(Sender: TObject);
    procedure edtElevationValueKeyPress(Sender: TObject; var Key: Char);
    procedure edtTrainingValueKeyPress(Sender: TObject; var Key: Char);
    procedure edtElevationValueChange(Sender: TObject);
    procedure edtTrainingValueChange(Sender: TObject);
    procedure btnBrakeOnClick(Sender: TObject);
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
    FFileName : String;

    LeftMagazine, RightMagazine : Integer;
    LeftShot, RightShot : Integer;
    IsFiring : Boolean;

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
    procedure SetFireRate;
    procedure AddLog;
    procedure ApplyFilter;
    procedure LoadFileToMemo(const AFileName: string);

  end;

var
  frmDCDSMain: TfrmDCDSMain;

implementation

{$R *.dfm}

uses
  ulibSettings, uScriptSimAK230, uBridgeSet, uDataModule, uAK230Manager,
  uBaseConstan, uBaseFunction;

procedure TfrmDCDSMain.btnSaveAsFileClick(Sender: TObject);
begin
  if dlgSave1.Execute then
  begin
    FFileName := dlgSave1.FileName;
    mmoLogger.Lines.SaveToFile(FFileName);
  end;
end;

procedure TfrmDCDSMain.btnSaveFileClick(Sender: TObject);
begin
  if FFileName = '' then
  begin
    btnSaveAsFileClick(Sender);
    Exit;
  end;

  mmoLogger.Lines.SaveToFile(FFileName);
end;

procedure TfrmDCDSMain.btnStartLogClick(Sender: TObject);
begin
  mmoLogger.Visible := True;
  mmoLogger.Lines.Add('DATE   TIME    TRAIN   ELEV   LF MG  RG MG  Blt.lft. Blt.Rgt.');
  mmoLogger.Lines.Add('--------------------------------------------------------------------------');
  mmoLogger.Lines.Clear;
  mmoLogger.Font.Color := clGreen;
  btnStopLog.Down := False;
end;

procedure TfrmDCDSMain.btnStopLogClick(Sender: TObject);
begin
 mmoLogger.Font.Color := clGray;
 tmrAmmo.Enabled := False;
 btnStartLog.Down := False;
end;

procedure TfrmDCDSMain.drvcbb1Change(Sender: TObject);
begin
  dirlst1.Drive := drvcbb1.Drive;
end;

procedure TfrmDCDSMain.edtElevationValueChange(Sender: TObject);
var
  elev: Integer;
begin
  if (edtElevationValue.Text = '') or (edtElevationValue.Text = '-') then Exit;

  elev := StrToIntDef(edtElevationValue.Text, 0);

//  if elev > 85 then
//    edtElevationValue.Text := '85'
//  else if elev < -10 then
//    edtElevationValue.Text := '-10';
end;

procedure TfrmDCDSMain.edtElevationValueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', '-', '.', #8]) then
    Key := #0;
end;

procedure TfrmDCDSMain.edtFileTypeChange(Sender: TObject);
begin
  ApplyFilter;
end;

procedure TfrmDCDSMain.edtTrainingValueChange(Sender: TObject);
var
  training: Integer;
begin
  if (edtTrainingValue.Text = '') or (edtTrainingValue.Text = '-') then Exit;

  training := StrToIntDef(edtTrainingValue.Text, 0);

//  if training > 180 then
//    edtTrainingValue.Text := '180'
//  else if training < -180 then
//    edtTrainingValue.Text := '-180';
end;

procedure TfrmDCDSMain.edtTrainingValueKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', '-','.', #8]) then
    Key := #0;
end;

procedure TfrmDCDSMain.fllst1Change(Sender: TObject);
begin
  fllst1.Drive := dirlst1.Drive;
end;

procedure TfrmDCDSMain.AddLog;
var
  logText : String;
begin
  logText := Format('%-20s %-7s %-7s %-8s %-8s %-7s %-6s',
  [FormatDateTime('dd/mm/yyyy hh:nn:ss', Now),
   edtTrainingValue.Text,
   edtElevationValue.Text,
   edtBulCntLf2.Text,
   edtBulCntRg2.Text,
   edtBulCntLf1.Text,
   edtBulCntRg1.Text]);

  mmoLogger.Lines.Add(logText);
end;

procedure TfrmDCDSMain.ApplyFilter;
var
  filterText: string;
begin
  filterText := StringReplace(edtFileType.Text, ',', ';', [rfReplaceAll]);

  fllst1.Mask := filterText;
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

procedure TfrmDCDSMain.btnBrakeOnClick(Sender: TObject);
var
  canFire : Boolean;
  Elevation: Double;
  MaxRan: Double;
begin
  Elevation := StrToFloat(edtValueElevation.Text);
  MaxRan := 1.62;

  // Tentukan maximum range berdasarkan elevation
  if (Elevation >= -10) and (Elevation < 0) then
    MaxRan := 0
  else if (Elevation >= 0) and (Elevation < 15) then
    MaxRan := 1.62
  else if (Elevation >= 15) and (Elevation < 30) then
    MaxRan := 1.80
  else if (Elevation >= 30) and (Elevation < 45) then
    MaxRan := 1.98
  else if Elevation = 45 then
    MaxRan := 2.16
  else if (Elevation > 45) and (Elevation < 60) then
    MaxRan := 1.98
  else if (Elevation >= 60) and (Elevation < 75) then
    MaxRan := 1.80
  else if (Elevation >= 75) and (Elevation <= 85) then
    MaxRan := 1.62
  else
    MaxRan := 0;

  canFire :=  btnBrakeOn.Down and
              (FVTgtElevation >= -10) and
              (FVTgtElevation <= 85) and
              ((FVTgtTraining <= 120) or (FVTgtTraining >= 240)) and
              ((LeftMagazine <> 0) or (RightMagazine <> 0)) and
              (StrToFloat(edtOmRangeValue.Text) >= 0.16) and
              (StrToFloat(edtOmRangeValue.Text) <= MaxRan);

  if CanFire then
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath +
      '\buttonAK230\bttn_firingon.bmp')
  else
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath +
      '\buttonAK230\bttn_firingoff.bmp');

  btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
  btnFiring.Enabled := CanFire;

end;

procedure TfrmDCDSMain.btnClearListClick(Sender: TObject);
begin
  mmoLogger.Clear;
end;

procedure TfrmDCDSMain.btnCmAggregateClick(Sender: TObject);
begin
  if btnCmAggregate.Down then
  begin
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
    btnAggregate.Glyph.Assign(FimgTemp.Picture.Graphic);
  end
  else
  begin
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenoff.bmp');
    btnAggregate.Glyph.Assign(FimgTemp.Picture.Graphic);
  end;
end;

procedure TfrmDCDSMain.btnCStartClick(Sender: TObject);
begin
  ShowMessage('Tidak terhubung dengan kamera');
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
  lRec : TRec3DSetWCC;
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

  if ((FVTgtElevation < -10) or (FVTgtElevation > 85)) or
  ((FVTgtTraining > 120) and (FVTgtTraining < 240 )) then
  begin
//    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingoff.bmp');
//    btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//    btnFiring.Enabled := False;

    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
    btnTaboZone.Glyph.Assign(FimgTemp.Picture.Graphic);

    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenoff.bmp');
    btnPlunger.Glyph.Assign(FimgTemp.Picture.Graphic);
  end
  else
  begin
//    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingon.bmp');
//    btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//    btnFiring.Enabled := True;

    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenoff.bmp');
    btnTaboZone.Glyph.Assign(FimgTemp.Picture.Graphic);

    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
    btnPlunger.Glyph.Assign(FimgTemp.Picture.Graphic);
  end;

  if (FVTgtTraining >= 180) and (FVTgtTraining < 240) then
  begin
    imgTrainingLeftLimitStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\merah_S.png');
    imgTrainingRightLimitStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\hijau_S.png');
  end
  else if (FVTgtTraining > 120) and (FVTgtTraining <= 180) then
  begin
    imgTrainingRightLimitStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\merah_S.png');
    imgTrainingLeftLimitStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\hijau_S.png');
  end
  else
  begin
    imgTrainingLeftLimitStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\hijau_S.png');
    imgTrainingRightLimitStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\hijau_S.png');
  end;

  if (FVTgtElevation < -10) then
  begin
    imgElevationLowStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\merah_S.png');
    imgElevationHighStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\hijau_S.png');
  end
  else if (FVTgtElevation > 85) then
  begin
    imgElevationHighStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\merah_S.png');
    imgElevationLowStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\hijau_S.png');
  end
  else
  begin
    // NORMAL ZONE (-10 s/d 80)
    imgElevationLowStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\hijau_S.png');
    imgElevationHighStatus.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\led\hijau_S.png');
  end;

  lRec.ShipID := AK230Manager.ShipID;
  lRec.mWeaponID := AK230Manager.AssignedWeapon.IDWeapon;
  lRec.mLauncherID     := 0;
  lRec.mMissileID      := 0;
  lRec.mMissileNumber  := 0;
  lRec.mOrderID        := 0;

  lRec.mUpDown             := 0;
  lRec.mTargetID           := AK230Manager.Target2D;

  if AK230Manager.isDesig then    // jika di desig, maka modeID 1 dan 3d akan auto lock
    lRec.mModeID             := 3
  else                               // jika tidak desig, maka modeID 0 dan 3d akan menembak sesuai bearing dan elev
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
  if tVal <= 360  then
//    Inc(intVal);
    dblVal := dblVal + 0.1;

//  if tVal <= 180  then
//    Inc(intVal);
//    dblVal := dblVal + 0.1;
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
  if dblVal+10 <= 360 then
    dblVal := dblVal + 10;
//  if dblVal+10 <= 180 then
//    dblVal := dblVal + 10;
//  if dblVal+10 > 180 then
//    dblVal := 180;
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
  dblVal := dblVal - 10;
  if dblVal < 0 then
    dblVal := dblVal + 360;

//  if dblVal-10 >= -180 then
//    dblVal := dblVal - 10;
//  if dblVal-10 < -180 then
//    dblVal := -180;
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
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
    btnPlunger.Glyph.Assign(FimgTemp.Picture.Graphic);

//    if FisPowerOn and TryStrToFloat(edtOmRangeValue.Text, dblVal) then
//    begin
//      if dblVal > 0 then
//      begin
//        FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingon.bmp');
////        btnFiring.Glyph := FimgTemp.Picture.Bitmap;
//        btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//        btnFiring.Enabled := True;
//      end
//      else
//      begin
//        FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingoff.bmp');
////        btnFiring.Glyph := FimgTemp.Picture.Bitmap;
//        btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//        btnFiring.Enabled := False;
//      end;
//    end;
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
//    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingoff.bmp');
////    btnFiring.Glyph := FimgTemp.Picture.Bitmap;
//    btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//    btnFiring.Enabled := False;
    tmrRotate.Enabled := False;
  end;
end;

procedure TfrmDCDSMain.btnFiringMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if IsFiring then Exit;

  StartCannonFire(1);
  tmrAmmo.Enabled := True;
  IsFiring := True;

  SetFireRate;

end;

procedure TfrmDCDSMain.btnFiringMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not IsFiring then Exit;

  StopCannonFire(1);
  IsFiring := False;
  tmrAmmo.Enabled := False;
end;

procedure TfrmDCDSMain.btnNoBulltMgznClick(Sender: TObject);
begin
  LeftMagazine := StrToIntDef(edtNoLeftMgzn.Text, 0);
  RightMagazine := StrToIntDef(edtNoRightMgzn.Text, 0);

  LeftShot := 0;
  RightShot := 0;

  edtBulCntLf1.Text := '0';
  edtBulCntRg1.Text := '0';

  edtBulCntLf2.Text := IntToStr(LeftMagazine);
  edtBulCntRg2.Text := IntToStr(RightMagazine);

//  FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingon.bmp');
//  btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//  btnFiring.Enabled := True;
end;

procedure TfrmDCDSMain.btnOmKolonkaClick(Sender: TObject);
begin
  ShowMessage('Tidak terhubung dengan Kolonka');
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

//  if btnfirevolt.down then
//  begin
//    if FisPowerOn and TryStrToFloat(edtOmRangeValue.Text, ranVal) then
//    begin
//      if (ranVal >= 0.16) and (ranVal <= maxRan) then
//      begin
//        FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingon.bmp');
////        btnFiring.Glyph := FimgTemp.Picture.Bitmap;
//        btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//        btnFiring.Enabled := True;
//      end
//      else
//      begin
//        FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingoff.bmp');
////        btnFiring.Glyph := FimgTemp.Picture.Bitmap;
//        btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//        btnFiring.Enabled := False;
//        ShowMessage('Out of Range!');
//      end;
//    end;
//  end
//  else
//  begin
//    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingoff.bmp');
////    btnFiring.Glyph := FimgTemp.Picture.Bitmap;
//    btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
//    btnFiring.Enabled := False;
//  end;
end;

procedure TfrmDCDSMain.btnOpenFileClick(Sender: TObject);
var
  filePath : string;
begin
  if fllst1.ItemIndex = -1 then
  begin
    ShowMessage('Pilih file dulu');
    Exit;
  end;

  filePath := IncludeTrailingPathDelimiter(fllst1.Directory) +
              fllst1.Items[fllst1.ItemIndex];

  LoadFileToMemo(filePath);
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
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_pwr on.bmp');
//    btnPwrSwt.Glyph := FimgTemp.Picture.Bitmap;
    btnPwrSwt.Glyph.Assign(FimgTemp.Picture.Graphic);
    tmr1.Enabled := True;//not tmr1.Enabled;
//    tmrRotate.Enabled := True;
  end
  else
  begin
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_pwr off.bmp');
//    btnPwrSwt.Glyph := FimgTemp.Picture.Bitmap;
    btnPwrSwt.Glyph.Assign(FimgTemp.Picture.Graphic);
    pnlScreen.Visible := False;
    tmr1.Enabled := False;
    FbootTime := 0;
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenoff.bmp');
//    btnSynchron.Glyph := FimgTemp.Picture.Bitmap;
    btnSynchron.Glyph.Assign(FimgTemp.Picture.Graphic);
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

  BeginGame_AK230;



//  FOriginalPngTraining.LoadFromFile('.\data\images\AK230_Turret_Top 180p.png');
//  FOriginalPngElevation.LoadFromFile('.\data\images\AK230_Turret_Side 180p.png');
//  FOriginalPngHeading.LoadFromFile('.\data\images\AK230_heading+num 170p.png');


  FOriginalPngTraining.LoadFromFile(vPathImageSetting.ImgPath + 'AK230_Turret_Top 180p.png');
  FOriginalPngElevation.LoadFromFile(vPathImageSetting.ImgPath + 'AK230_Turret_Side 180p.png');
  FOriginalPngHeading.LoadFromFile(vPathImageSetting.ImgPath + 'AK230_heading+num 170p.png');

  RotateAndDisplayFixedSize(imgTrainPtr, FOriginalPngTraining, 0);
  RotateAndDisplayFixedSize(imgElevPtr, FOriginalPngElevation, 0);

  tmrRotate.Interval := 250;
  tmrRotate.Enabled := False;

  FVTgtTraining := 0;
  FVTgtElevation := 0;
  FVTgtHeading := 0;
  FVCurTraining := 0;
  FVCurElevation := 0;
  FVCurHeading := 0;

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

  pnlLmHeading.DoubleBuffered := True;
  pnlLmTraining.DoubleBuffered := True;
  pnlLmElevation.DoubleBuffered := True;

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

procedure TfrmDCDSMain.LoadFileToMemo(const AFileName: string);
begin
  try
    mmoLogger.Lines.LoadFromFile(AFileName);
    FFileName := AFileName;
  except
    on E: Exception do
      ShowMessage('Gagal membuka file: ' + E.Message);
  end;
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

procedure TfrmDCDSMain.SetFireRate;
var
  intervalMs : Integer;
begin
  intervalMs := Round(60000/1000);
  tmrAmmo.Interval := intervalMs;
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

  FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_pwr off.bmp');
//  btnPwrSwt.Glyph := FimgTemp.Picture.Bitmap;
  btnPwrSwt.Glyph.Assign(FimgTemp.Picture.Graphic);
  FisPwrSwtOn := False;

  FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenoff.bmp');
//  btn26Vdc.Glyph := FimgTemp.Picture.Bitmap;
//  btnUnformer.Glyph := FimgTemp.Picture.Bitmap;
//  btnAggregate.Glyph := FimgTemp.Picture.Bitmap;
//  btnPlunger.Glyph := FimgTemp.Picture.Bitmap;
//  btn115400Hz.Glyph := FimgTemp.Picture.Bitmap;
//  btnTaboZone.Glyph := FimgTemp.Picture.Bitmap;
//  btnSynchron.Glyph := FimgTemp.Picture.Bitmap;

  btn26Vdc.Glyph.Assign(FimgTemp.Picture.Graphic);
  btnUnformer.Glyph.Assign(FimgTemp.Picture.Graphic);
  btnAggregate.Glyph.Assign(FimgTemp.Picture.Graphic);
  btnPlunger.Glyph.Assign(FimgTemp.Picture.Graphic);
  btn115400Hz.Glyph.Assign(FimgTemp.Picture.Graphic);
  btnTaboZone.Glyph.Assign(FimgTemp.Picture.Graphic);
  btnSynchron.Glyph.Assign(FimgTemp.Picture.Graphic);

  edtBulCntLf2.Text := '0';
  edtBulCntRg2.Text := '0';

  FisReady := False;
end;

procedure TfrmDCDSMain.StartCannonFire(Gun_ID: word);
var
  lRec: TRec3DSetWCC;
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
    lRec.mTargetID := AK230Manager.Target2D;

    if AK230Manager.isDesig then    // jika di desig, maka modeID 1 dan 3d akan auto lock
      lRec.mModeID             := 3
    else                               // jika tidak desig, maka modeID 0 dan 3d akan menembak sesuai bearing dan elev
      lRec.mModeID             := 0;

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
  lRec: TRec3DSetWCC;
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
    lRec.mTargetID := AK230Manager.Target2D;
    if AK230Manager.isDesig then    // jika di desig, maka modeID 1 dan 3d akan auto lock
      lRec.mModeID             := 3
    else                               // jika tidak desig, maka modeID 0 dan 3d akan menembak sesuai bearing dan elev
      lRec.mModeID             := 0;
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
  if (not FisReady) then
  begin
    // Step 1: 26 VDC
    if (FbootTime >= 1) and (FbootTime < 2) then
    begin
      FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
      btn26Vdc.Glyph.Assign(FimgTemp.Picture.Graphic);
    end;

    // Step 2: UNFORMER
    if (FbootTime >= 2) and (FbootTime < 3) then
    begin
      FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
      btnUnformer.Glyph.Assign(FimgTemp.Picture.Graphic);
    end;

    // Step 3: 115/400Hz
    if (FbootTime >= 3) and (FbootTime < 4) then
    begin
      FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
      btn115400Hz.Glyph.Assign(FimgTemp.Picture.Graphic);
    end;

    // Setelah semua indikator menyala
    if FbootTime >= 4 then
    begin
      FisReady := True;
      FbootTime := 0;
      tmr1.Enabled := False;  // matikan timer
    end;
  end

  // Jika PWR SWT ditekan setelah boot, nyalakan SYNCHRON
  else if FisPwrSwtOn then
  begin
    tmr1.Enabled := False;
    pnlScreen.Visible := True;
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
    btnSynchron.Glyph.Assign(FimgTemp.Picture.Graphic);
  end;



//  if (FbootTime >= 1) and (FbootTime < 2) and (not FisReady) then
//  begin
//    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
////    btnUnformer.Glyph := FimgTemp.Picture.Bitmap;
//    btnUnformer.Glyph.Assign(FimgTemp.Picture.Graphic);
//    btn26Vdc.Glyph.Assign(FimgTemp.Picture.Graphic);
//    btn115400Hz.Glyph.Assign(FimgTemp.Picture.Graphic);
//  end
//  else if (FbootTime >= 2) and (FbootTime < 3) and (not FisReady) then
//  begin
//    tmr1.Enabled := False;
//    FbootTime := 0;
//    FisReady := True;
//  end
//  else if (FbootTime >= 3) and (FisPwrSwtOn) then
//  begin
//    tmr1.Enabled := False;
//    pnlScreen.Visible := True;
//    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_greenon.bmp');
////    btnSynchron.Glyph := FimgTemp.Picture.Bitmap;
//    btnSynchron.Glyph.Assign(FimgTemp.Picture.Graphic);
//  end;
end;

procedure TfrmDCDSMain.tmrAmmoTimer(Sender: TObject);
begin
  if not IsFiring then Exit;


  if (LeftMagazine <= 0) and (RightMagazine <=0) then
  begin
    btnFiringMouseUp(nil, mbLeft, [], 0, 0);
    FimgTemp.Picture.LoadFromFile(vPathImageSetting.ImgPath + '\buttonAK230\bttn_firingoff.bmp');
    btnFiring.Glyph.Assign(FimgTemp.Picture.Graphic);
    btnFiring.Enabled := False;
    Exit;
  end;

  if LeftMagazine > 0 then
  begin
    Dec(LeftMagazine);
    Inc(LeftShot);

    edtBulCntLf1.Text := IntToStr(LeftShot);
    edtNoLeftMgzn.Text := IntToStr(LeftMagazine);
  end;

  if RightMagazine > 0 then
  begin
    Dec(RightMagazine);
    Inc(RightShot);

    edtBulCntRg1.Text := IntToStr(RightShot);
    edtNoRightMgzn.Text := IntToStr(RightMagazine);
  end;

  if btnStartLog.Down then
    AddLog;
end;

procedure TfrmDCDSMain.tmrRotateTimer(Sender: TObject);
begin
//  FVCurTraining := FVCurTraining + 2;
//  if FVCurTraining >= 360 then
//    FVCurTraining := 0;
  if Round(FVTgtTraining) <> Round(FVCurTraining) then
  begin
//    if ((FVTgtTraining - FVCurTraining) < 180) and ((FVTgtTraining - FVCurTraining) > 0)  then
//      FVCurTraining := FVCurTraining + 1
//    else
//      FVCurTraining := FVCurTraining - 1;
//    RotateAndDisplayFixedSize(imgTrainPtr, FOriginalPngTraining, FVCurTraining);

    if FVCurTraining < 0 then
      FVCurTraining := FVCurTraining + 360
    else if FVCurTraining >= 360 then
      FVCurTraining := FVCurTraining - 360;

    if FVTgtTraining > FVCurTraining then
    begin
      // Cek apakah lebih dekat lewat wrap-around
      if (FVTgtTraining - FVCurTraining) <= 180 then
        FVCurTraining := FVCurTraining + 1
      else
        FVCurTraining := FVCurTraining - 1;
    end
    else
    begin
      if (FVCurTraining - FVTgtTraining) <= 180 then
        FVCurTraining := FVCurTraining - 1
      else
        FVCurTraining := FVCurTraining + 1;
    end;

    // Wrap ke 0–360
    if FVCurTraining >= 360 then
      FVCurTraining := FVCurTraining - 360
    else if FVCurTraining < 0 then
      FVCurTraining := FVCurTraining + 360;

    // Update display
    RotateAndDisplayFixedSize(imgTrainPtr, FOriginalPngTraining, FVCurTraining);

  end
  else
    FVCurTraining := FVTgtTraining;

  if Round(FVTgtElevation) <> Round(FVCurElevation) then
  begin
    if ((FVTgtElevation - FVCurElevation) <= 85) and ((FVTgtElevation - FVCurElevation) > 0) then
      FVCurElevation := FVCurElevation + 1
    else
    begin
      //if ((FVTgtElevation - FVCurElevation) < -10) then

      FVCurElevation := FVCurElevation - 1;
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
  begin
    FVTgtHeading := AK230Manager.xShip.Heading;
  end;

  edtValueTraining.Text := FormatFloat('0.#', FVCurTraining);
  edtValueElevation.Text := FormatFloat('0.#', FVCurElevation);
  edtValueHeding.Text := FormatFloat('0.#', FVCurHeading);
end;

procedure TfrmDCDSMain.tmrTimeTimer(Sender: TObject);
begin
  edtDateValue.Text := FormatDateTime('MM/DD/YYYY', Now);
  edtTimeValue.Text := FormatDateTime('hh:mm:ss ampm', Now);

  if (AK230Manager.isDesig) and (AK230Manager.TargetAssigned) then
  begin
    edtElevationValue.Text := FormatFloat('0.0', AK230Manager.Elevation);
    edtTrainingValue.Text := FormatFloat('0.0', AK230Manager.Bearing);
    edtOmRangeValue.Text := FormatFloat('0.0', AK230Manager.Range);

    btnDcdcExecuteClick(nil);
    AK230Manager.TargetAssigned := False;

//    if AK230Manager.TargetAssigned then
//    begin
//      btnDcdcExecuteClick(nil);
//      AK230Manager.TargetAssigned := False;
//    end;
  end
  else
  begin
    edtElevationValue.Text := IntToStr(0);
    edtTrainingValue.Text := IntToStr(0);
    edtOmRangeValue.Text := IntToStr(0);

    btnDcdcExecuteClick(nil);
  end;

  FVTgtHeading := AK230Manager.xShip.Heading;
end;

end.
