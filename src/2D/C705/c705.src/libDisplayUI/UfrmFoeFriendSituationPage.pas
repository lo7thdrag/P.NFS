unit UfrmFoeFriendSituationPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvPageControl, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, VrControls, VrLights,
  AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.Buttons, uLibConst,
  uFrmMissileInformation,
  uFrmFireDistribution,
  uFrmMissileMonitor,
  uFrmLaunchData,
  uFrmChannelSelect,
  uFrmINSTest,
  uFrmParamSetting,
  UfrmRadar;

type
  TfrmFoeFriendSituationPage = class(TForm)
    {$REGION 'Components'}
    advpgcFunctionMenuFoe: TAdvPageControl;
    advtsSituation: TAdvTabSheet;
    advtsFireDistr: TAdvTabSheet;
    advtsMInfo: TAdvTabSheet;
    advtsParSetting: TAdvTabSheet;
    advtsChSelect: TAdvTabSheet;
    advtsMControl: TAdvTabSheet;
    advtsMMonitor: TAdvTabSheet;
    advtsINSTest: TAdvTabSheet;
    advtsLaunchData: TAdvTabSheet;
    advtsExit: TAdvTabSheet;
    pnlExitTab: TPanel;
    Bevel3: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    pnlHeaderSE: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlLeft_Situation: TPanel;
    pnlRight_Situation: TPanel;
    pnlMap_Situation: TPanel;
    pnlArea5_Situation: TPanel;
    pnlArea3B_Situation: TPanel;
    pnlArea3A_Situation: TPanel;
    pnlArea4_Situation: TPanel;
    pnlArea2_Situation: TPanel;
    pnlArea5_FireDist: TPanel;
    pnlLeft_FireDist: TPanel;
    pnlArea1_FireDist: TPanel;
    pnlArea2_FireDist: TPanel;
    pnlRight_FireDist: TPanel;
    pnlArea3B_FireDist: TPanel;
    pnlArea3A_FireDist: TPanel;
    pnlArea4_FireDist: TPanel;
    pnlArea3A: TPanel;
    Image1: TImage;
    pnl3ATop: TPanel;
    pnlTrget3A: TPanel;
    pnlTargetNmb3A: TPanel;
    pnlTargetName3A: TPanel;
    pnlTarget3A: TPanel;
    vrlInitState: TVrLights;
    lblInitState3A: TLabel;
    lblInsGnss3A: TLabel;
    lblMNormal3A: TLabel;
    lblCalFinished3A: TLabel;
    lblNavigate3A: TLabel;
    lblIgnition3A: TLabel;
    lblTakeOff3A: TLabel;
    lblParaSetting3A: TLabel;
    lblInsideSector3A: TLabel;
    lblSeaTgt3A: TLabel;
    lblEngine3A: TLabel;
    lblPowerOn3A: TLabel;
    lblInitChk3A: TLabel;
    lblWarmup3A: TLabel;
    lblLandTgt3A: TLabel;
    lblFullOpen3A: TLabel;
    lblParaLocking3A: TLabel;
    lblBusSupply3A: TLabel;
    lblPlcChk3A: TLabel;
    lblInsAlign3A: TLabel;
    lblSeeker3A: TLabel;
    lblBoosterArm3A: TLabel;
    lblBatteryAct3A: TLabel;
    lblLnchRdy3A: TLabel;
    lblPwrSwitch3A: TLabel;
    pnlArea3B: TPanel;
    lblInitState3B: TLabel;
    lblInsGnss3B: TLabel;
    lblMNormal3B: TLabel;
    lblCalFinished3B: TLabel;
    lblNavigate3B: TLabel;
    lblIgnition3B: TLabel;
    lblTakeOff3B: TLabel;
    lblParaSetting3B: TLabel;
    lblInsideSector3B: TLabel;
    lblSeaTgt3B: TLabel;
    lblEngine3B: TLabel;
    lblPowerOn3B: TLabel;
    lblInitChk3B: TLabel;
    lblWarmup3B: TLabel;
    lblLandTgt3B: TLabel;
    lblFullOpen3B: TLabel;
    lblParaLocking3B: TLabel;
    lblBusSupply3B: TLabel;
    lblPlcChk3B: TLabel;
    lblInsAlign3B: TLabel;
    lblSeeker3B: TLabel;
    lblBoosterArm3B: TLabel;
    lblBatteryAct3B: TLabel;
    lblLnchRdy3B: TLabel;
    lblPwrSwitch3B: TLabel;
    Panel4: TPanel;
    Image2: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pnl3ABtm: TPanel;
    pnlStatus3A: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    pnlChn3A: TPanel;
    lblWarmUpTime3A: TLabel;
    lblAlignmentStatus3A: TLabel;
    pnl3BBtm: TPanel;
    pnlStatus3B: TPanel;
    Panel13: TPanel;
    lblAligmentStatus3B: TLabel;
    Panel14: TPanel;
    lblWarmupTime3B: TLabel;
    pnlChn3B: TPanel;
    pnlArea2: TPanel;
    pnlArea2Btm: TPanel;
    pnlArea2Top: TPanel;
    Panel3: TPanel;
    Panel12: TPanel;
    Label7: TLabel;
    edtSRoll: TEdit;
    Panel15: TPanel;
    Panel16: TPanel;
    Label33: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    Label34: TLabel;
    edtSSpd: TEdit;
    Label35: TLabel;
    edtSHdg: TEdit;
    pnlParam2Top: TPanel;
    pnlParam2Btm: TPanel;
    pnlLongParamHeader: TPanel;
    pnlLongParam: TPanel;
    pnlESpdParamHeader: TPanel;
    pnlESpdParam: TPanel;
    pnlSeaStateParamHeader: TPanel;
    pnlSeaStateParam: TPanel;
    lblLongParam: TLabel;
    lblESpdParam: TLabel;
    lblSeaStateParam: TLabel;
    pnlLatParamHeader: TPanel;
    pnlLatParam: TPanel;
    lblLatParam: TLabel;
    pnlNSpdParamHeader: TPanel;
    pnlNSpdParam: TPanel;
    lblNSpdParam: TLabel;
    pnlPDOMParamHeader: TPanel;
    pnlPDOPParam: TPanel;
    lblPDOPParam: TLabel;
    edtSPitch: TEdit;
    pnlArea4: TPanel;
    pnlLeft_Area4: TPanel;
    pnlRight_Area4: TPanel;
    pnlArea4_Row10_L: TPanel;
    pnlArea4_Row8_L: TPanel;
    pnlArea4_Row6_L: TPanel;
    pnlArea4_Row4_L: TPanel;
    pnlArea4_Row2_L: TPanel;
    pnlArea4_Row9_L: TPanel;
    pnlArea4_Row7_L: TPanel;
    pnlArea4_Row5_L: TPanel;
    pnlArea4_Row3_L: TPanel;
    pnlArea4_Row1_L: TPanel;
    pnlTgtNbHeader_L: TPanel;
    pnlDirtAttackHeader_L: TPanel;
    pnlHeader_L: TPanel;
    lblTgtNbHeader_L: TLabel;
    Label37: TLabel;
    Panel33: TPanel;
    Label38: TLabel;
    pnlRon2Val_L: TPanel;
    pnlRon1Val_L: TPanel;
    lblRon1Val_L: TLabel;
    Panel36: TPanel;
    Label40: TLabel;
    pnlRMaxVal2_L: TPanel;
    pnlRMaxVal1_L: TPanel;
    lblRMaxVal_L: TLabel;
    Panel39: TPanel;
    Label42: TLabel;
    pnlRMinVal2_L: TPanel;
    pnlRMinVal1_L: TPanel;
    lblRMinVal_L: TLabel;
    Panel42: TPanel;
    Label44: TLabel;
    pnlBVal2_L: TPanel;
    pnlBVal1_L: TPanel;
    lblBVal_L: TLabel;
    Panel45: TPanel;
    Label46: TLabel;
    pnlA1Val2: TPanel;
    pnlA1Val1: TPanel;
    lblA1Val: TLabel;
    Panel48: TPanel;
    Label48: TLabel;
    pnlA2Val2_L: TPanel;
    pnlA2Val1_L: TPanel;
    lblA2Val_L: TLabel;
    Panel51: TPanel;
    Label50: TLabel;
    pnlBrgVal2_L: TPanel;
    pnlBrgVal1_L: TPanel;
    lblBrgVal_L: TLabel;
    Panel54: TPanel;
    Label52: TLabel;
    pnlPthVal2_L: TPanel;
    pnlPthVal1_L: TPanel;
    lblPthVal1_L: TLabel;
    Panel57: TPanel;
    Label54: TLabel;
    pnlHdgVal2_L: TPanel;
    pnlHdgVal1_L: TPanel;
    lblHdgVal1_L: TLabel;
    Label56: TLabel;
    lblPthVal2_L: TLabel;
    lblHdgVal2_L: TLabel;
    Panel60: TPanel;
    Label59: TLabel;
    lblRon2Val_L: TLabel;
    pnlArea4_Row1_R: TPanel;
    pnlTgtNbHeader_R: TPanel;
    lblTgtNbHeader_R: TLabel;
    pnlDirtAttackHeader_R: TPanel;
    Label41: TLabel;
    pnlHeader_R: TPanel;
    pnlArea4_Row10_R: TPanel;
    Panel23: TPanel;
    lblCCSVal: TLabel;
    pnlHdgVal2_R: TPanel;
    lblRPSVal: TLabel;
    pnlHdgVal1_R: TPanel;
    lblIpdVal: TLabel;
    pnlArea4_Row2_R: TPanel;
    Panel27: TPanel;
    Label49: TLabel;
    pnlRon2Val_R: TPanel;
    lblRon2Val_R: TLabel;
    Panel29: TPanel;
    lblRon1Val_R: TLabel;
    Panel30: TPanel;
    Label55: TLabel;
    pnlArea4_Row3_R: TPanel;
    Panel32: TPanel;
    Label57: TLabel;
    pnlRMaxVal2_R: TPanel;
    pnlRMaxVal1_R: TPanel;
    lblRMaxVal_R: TLabel;
    pnlArea4_Row4_R: TPanel;
    Panel38: TPanel;
    Label60: TLabel;
    pnlRMinVal2_R: TPanel;
    pnlRMinVal1_R: TPanel;
    lblRMinVal_R: TLabel;
    pnlArea4_Row5_R: TPanel;
    Panel44: TPanel;
    Label62: TLabel;
    pnlBVal2_R: TPanel;
    pnlBVal1_R: TPanel;
    lblBVal_R: TLabel;
    pnlArea4_Row6_R: TPanel;
    Panel50: TPanel;
    Label64: TLabel;
    Panel52: TPanel;
    Panel53: TPanel;
    Label65: TLabel;
    pnlArea4_Row7_R: TPanel;
    Panel56: TPanel;
    Label66: TLabel;
    pnlA2Val2_R: TPanel;
    pnlA2Val1_R: TPanel;
    lblA2Val_R: TLabel;
    pnlArea4_Row8_R: TPanel;
    Panel62: TPanel;
    Label68: TLabel;
    pnlBrgVal2_R: TPanel;
    pnlBrgVal1_R: TPanel;
    lblBrgVal_R: TLabel;
    pnlArea4_Row9_R: TPanel;
    Panel66: TPanel;
    Label70: TLabel;
    pnlPthVal2_R: TPanel;
    lblPthVal2_R: TLabel;
    pnlPthVal1_R: TPanel;
    lblPthVal1_R: TLabel;
    pnlArea5_MInfo: TPanel;
    pnlLeft_MInfo: TPanel;
    pnlArea1_MInfo: TPanel;
    pnlArea2_MInfo: TPanel;
    pnlRight_MInfo: TPanel;
    pnlArea3B_MInfo: TPanel;
    pnlArea3A_MInfo: TPanel;
    pnlArea4_MInfo: TPanel;
    pnlArea5: TPanel;
    pnlTimeClock: TPanel;
    pnlFCSTrng: TPanel;
    pnlIPDNav: TPanel;
    pnlRPSPlan: TPanel;
    tmrClock: TTimer;
    pnlArea5_ParSetting: TPanel;
    pnlLeft_ParSetting: TPanel;
    pnlArea1_ParSetting: TPanel;
    pnlArea2_ParSetting: TPanel;
    pnlRight_ParSetting: TPanel;
    pnlArea3B_ParSetting: TPanel;
    pnlArea3A_ParSetting: TPanel;
    pnlArea4_ParSetting: TPanel;
    pnlArea5_ChSelect: TPanel;
    pnlLeft_ChSelect: TPanel;
    pnlArea1_ChSelect: TPanel;
    pnlArea2_ChSelect: TPanel;
    pnlRight_ChSelect: TPanel;
    pnlArea3B_ChSelect: TPanel;
    pnlArea3A_ChSelect: TPanel;
    pnlArea4_ChSelect: TPanel;
    pnlArea5_MControl: TPanel;
    pnlLeft_MControl: TPanel;
    pnlArea1_MControl: TPanel;
    pnlArea2_MControl: TPanel;
    pnlRight_MControl: TPanel;
    pnlArea3B_MControl: TPanel;
    pnlArea3A_MControl: TPanel;
    pnlArea4_MControl: TPanel;
    pnlArea5_MMonitor: TPanel;
    pnlLeft_MMonitor: TPanel;
    pnlArea1_MMonitor: TPanel;
    pnlArea2_MMonitor: TPanel;
    pnlRight_MMonitor: TPanel;
    pnlArea3B_MMonitor: TPanel;
    pnlArea3A_MMonitor: TPanel;
    pnlArea4_MMonitor: TPanel;
    pnlArea5_InsTest: TPanel;
    pnlLeft_InsTest: TPanel;
    pnlArea1_InsTest: TPanel;
    pnlArea2_InsTest: TPanel;
    pnlRight_InsTest: TPanel;
    pnlArea3B_InsTest: TPanel;
    pnlArea3A_InsTest: TPanel;
    pnlArea4_InsTest: TPanel;
    pnlArea5_LaunchData: TPanel;
    pnlLeft_LaunhData: TPanel;
    pnlArea1_LaunchData: TPanel;
    pnlArea2_LaunchData: TPanel;
    pnlRight_LaunchData: TPanel;
    pnlArea3B_LaunchData: TPanel;
    pnlArea3A_LaunchData: TPanel;
    pnlArea4_LaunchData: TPanel;
    pnlArea5_Exit: TPanel;
    pnlLeft_Exit: TPanel;
    pnlArea1_Exit: TPanel;
    pnlArea2_Exit: TPanel;
    pnlRight_Exit: TPanel;
    pnlArea3B_Exit: TPanel;
    pnlArea3A_Exit: TPanel;
    pnlArea4_Exit: TPanel;
    pnlInsTestTab: TPanel;
    Bevel1: TBevel;
    Label36: TLabel;
    Label39: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    Panel2: TPanel;
    pnlMissileControl: TPanel;
    Bevel2: TBevel;
    Label51: TLabel;
    Label53: TLabel;
    pnlMCtrlHeader: TPanel;
    pnlPowerOnContentMCtrl: TPanel;
    Label58: TLabel;
    Panel19: TPanel;
    pnlPowerOnMCtrl: TPanel;
    pnlReCheckMCtrl: TPanel;
    pnlINSAlignMCtrl: TPanel;
    pnlPowerOffMCtrl: TPanel;
    pnlReCheckContentMCtrl: TPanel;
    Label61: TLabel;
    pnlINSAlignContentMCtrl: TPanel;
    Label63: TLabel;
    pnlPowerOffContentMCtrl: TPanel;
    Label67: TLabel;
    pnlVrlInitState3A: TPanel;
    pnlVrlInsGnss3A: TPanel;
    pnlVrlMNormal3A: TPanel;
    pnlVrlCalFinished3A: TPanel;
    pnlVrlNavigate3A: TPanel;
    pnlVrlIgnition3A: TPanel;
    pnlVrlSeaTgt3A: TPanel;
    pnlVrlInsideSector3A: TPanel;
    pnlVrlParaSetting: TPanel;
    pnlVrlTakeOff3A: TPanel;
    pnlVrlPowerOn3A: TPanel;
    pnlVrlEngine3A: TPanel;
    pnlVrlFullOpen3A: TPanel;
    pnlVrlParaLocking3A: TPanel;
    pnlVrlLandTgt3A: TPanel;
    pnlVrlInitChk3A: TPanel;
    pnlVrlWarmUp3A: TPanel;
    pnlVrlBusSupply3A: TPanel;
    pnlVrlPlcChk3A: TPanel;
    pnlVrlBoosterArm3A: TPanel;
    pnlVrlBatteryAct3A: TPanel;
    pnlVrlSeeker3A: TPanel;
    pnlVrlInsAlign3A: TPanel;
    pnlVrlLnchRdy3A: TPanel;
    pnlVrlPwrSwitch3A: TPanel;
    pnlVrlInitState3B: TPanel;
    pnlVrlInsGnss3B: TPanel;
    pnlVrlMNormal3B: TPanel;
    pnlVrlCalFinished3B: TPanel;
    pnlVrlNavigate3B: TPanel;
    pnlVrlIgnition3B: TPanel;
    pnlVrlTakeOff3B: TPanel;
    pnlVrlParaSetting3B: TPanel;
    pnlVrlInsideSector3B: TPanel;
    pnlVrlSeaTgt3B: TPanel;
    pnlVrlEngine3B: TPanel;
    pnlVrlPowerOn3B: TPanel;
    pnlVrlInitChk3B: TPanel;
    pnlVrlWarmUp3B: TPanel;
    pnlVrlLandTgt3B: TPanel;
    pnlVrlFullOpen3B: TPanel;
    pnlVrlParaLocking3B: TPanel;
    pnlVrlBusSupply3B: TPanel;
    pnlVrlPlcChk3B: TPanel;
    pnlVrlBoosterArm3B: TPanel;
    pnlVrlBatteryAct3B: TPanel;
    pnlVrlSeeker3B: TPanel;
    pnlVrlInsAlign3B: TPanel;
    pnlVrlLnchRdy3B: TPanel;
    pnlVrlPwrSwitch3B: TPanel;
    {$ENDREGION}
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure advpgcFunctionMenuFoeChange(Sender: TObject);
    procedure tmrClockTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    FFormRadar: TfrmRadar;
    FFormFireDist: TfrmFireDistribution;
    FFormMissileInfo: TfrmMissileInformation;
    FFormParSetting: TfrmParamSetting; //done UI
    FFormChSelect: TfrmChannelSelect; //done UI
    FFormMissileControl: TfrmRadar; //done UI
    FFormMissileMonitor: TfrmMissileMonitor; //done UI
    FFormINSTest: TfrmINSTest; //done UI
    FFormLaunchData: TfrmLaunchData; //done UI
    FFormExit: TfrmRadar; // done UI

    // For tab M. Control (Missile Control)
    FarrHeaderPnlMCtrl: array[0..3] of TPanel;
    FActivePnlIdxMCtrl: Integer;

    procedure AttachPanelTo(aPanel, aParent: TWinControl);
    procedure HidePanels(const aPanels: array of TPanel);
    procedure UpdateLayoutTab;

    procedure HandleTabShortcut(Key: Word);

    procedure UpdateClock;

    // Set form lain ke panel Tabsheet
    procedure EnsureAreas;
    procedure EmbedAreaForm(aFrm: TForm; aParent: TWinControl);

    // Set Keybind Navigasi tab Missile Control
    procedure SetActiveHeaderMCtrl(idx: Integer);
    procedure ShowActiveContentMCtrl;
    procedure CloseAllContentMCtrl;
  public
    { Public declarations }
  end;

var
  frmFoeFriendSituationPage: TfrmFoeFriendSituationPage;

implementation

{$R *.dfm}

uses
  UfrmWCC;

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

{$REGION 'Panel Management'}
procedure TfrmFoeFriendSituationPage.advpgcFunctionMenuFoeChange(
  Sender: TObject);
begin
  UpdateLayoutTab;

//  if advpgcFunctionMenuFoe.ActivePageIndex <> advtsChSelect then
//  begin
//    if Assigned(FFormChSelect) then
//      frmChannelSelect.HideFrmChSelect; // inactive keyboard di form Ch Select
//  end;
end;

procedure TfrmFoeFriendSituationPage.EmbedAreaForm(aFrm: TForm; aParent: TWinControl);
begin
  if not Assigned(aFrm) or not Assigned(aParent) then Exit;

  aFrm.Parent := aParent;
  aFrm.Align := alClient;
  aFrm.Show;
end;

procedure TfrmFoeFriendSituationPage.EnsureAreas;
begin
  if not Assigned(FFormRadar) then
    FFormRadar := TfrmRadar.Create(Self);

  if not Assigned(FFormFireDist) then
    FFormFireDist := TfrmFireDistribution.Create(Self);

  if not Assigned(FFormMissileInfo) then
    FFormMissileInfo := TfrmMissileInformation.Create(Self);

  if not Assigned(FFormParSetting) then
    FFormParSetting := TfrmParamSetting.Create(Self);

  if not Assigned(FFormChSelect) then
    FFormChSelect := TfrmChannelSelect.Create(Self);

  if not Assigned(FFormMissileControl) then
    FFormMissileControl := TfrmRadar.Create(Self);

  if not Assigned(FFormMissileMonitor) then
    FFormMissileMonitor := TfrmMissileMonitor.Create(Self);

  if not Assigned(FFormINSTest) then
    FFormINSTest := TfrmINSTest.Create(Self);

  if not Assigned(FFormLaunchData) then
    FFormLaunchData := TfrmLaunchData.Create(Self);

  if not Assigned (FFormExit) then
    FFormExit := TfrmRadar.Create(Self);
end;

procedure TfrmFoeFriendSituationPage.AttachPanelTo(aPanel, aParent: TWinControl);
begin
  aPanel.Visible := True;
  aPanel.Parent := aParent;
  aPanel.Align := alClient;
end;

procedure TfrmFoeFriendSituationPage.HidePanels(const aPanels: array of TPanel);
var
  pnl : TPanel;
begin
  for pnl in aPanels do
    pnl.Visible := False;
end;

procedure TfrmFoeFriendSituationPage.UpdateLayoutTab;
begin
  EnsureAreas;

  if Assigned(FFormChSelect) then
    FFormChSelect.DeactivateFrmChSelect;  // inactive keyboard di form Ch Select

  if advpgcFunctionMenuFoe.ActivePage = advtsSituation then
  begin
    {$REGION 'Situation'}
    AttachPanelTo(pnlArea2, pnlArea2_Situation);
    AttachPanelTo(pnlArea3A, pnlArea3A_Situation);
    AttachPanelTo(pnlArea3B, pnlArea3B_Situation);
    AttachPanelTo(pnlArea4, pnlArea4_Situation);
    AttachPanelTo(pnlArea5, pnlArea5_Situation);

    EmbedAreaForm(FFormRadar, pnlMap_Situation);
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsFireDistr then
  begin
    {$REGION 'Fire Distr'}
    AttachPanelTo(pnlArea2, pnlArea2_FireDist);
    AttachPanelTo(pnlArea3A, pnlArea3A_FireDist);
    AttachPanelTo(pnlArea3B, pnlArea3B_FireDist);
    AttachPanelTo(pnlArea4, pnlArea4_FireDist);
    AttachPanelTo(pnlArea5, pnlArea5_FireDist);

    EmbedAreaForm(FFormFireDist, pnlArea1_FireDist);
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsMInfo then
  begin
    {$REGION 'M Info'}
    AttachPanelTo(pnlArea2, pnlArea2_MInfo);
    AttachPanelTo(pnlArea3A, pnlArea3A_MInfo);
    AttachPanelTo(pnlArea3B, pnlArea3B_MInfo);
    AttachPanelTo(pnlArea4, pnlArea4_MInfo);
    AttachPanelTo(pnlArea5, pnlArea5_MInfo);

    EmbedAreaForm(FFormMissileInfo, pnlArea1_MInfo);
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsParSetting then
  begin
    {$REGION 'Par Setting'}
    AttachPanelTo(pnlArea2, pnlArea2_ParSetting);
    AttachPanelTo(pnlArea3A, pnlArea3A_ParSetting);
    AttachPanelTo(pnlArea3B, pnlArea3B_ParSetting);
    AttachPanelTo(pnlArea4, pnlArea4_ParSetting);
    AttachPanelTo(pnlArea5, pnlArea5_ParSetting);

    EmbedAreaForm(FFormParSetting, pnlArea1_ParSetting);
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsChSelect then
  begin
    {$REGION 'Ch Select'}
    AttachPanelTo(pnlArea2, pnlArea2_ChSelect);
    AttachPanelTo(pnlArea3A, pnlArea3A_ChSelect);
    AttachPanelTo(pnlArea3B, pnlArea3B_ChSelect);
    AttachPanelTo(pnlArea4, pnlArea4_ChSelect);
    AttachPanelTo(pnlArea5, pnlArea5_ChSelect);

    EmbedAreaForm(FFormChSelect, pnlArea1_ChSelect);
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsMControl then
  begin
    {$REGION 'M control'}
    AttachPanelTo(pnlArea2, pnlArea2_MControl);
    AttachPanelTo(pnlArea3A, pnlArea3A_MControl);
    AttachPanelTo(pnlArea3B, pnlArea3B_MControl);
    AttachPanelTo(pnlArea4, pnlArea4_MControl);
    AttachPanelTo(pnlArea5, pnlArea5_MControl);

    EmbedAreaForm(FFormMissileControl, pnlArea1_MControl);
    //pnlMissileControl.Visible := True;
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsMMonitor then
  begin
    {$REGION 'M Monitor'}
    AttachPanelTo(pnlArea2, pnlArea2_MMonitor);
    AttachPanelTo(pnlArea3A, pnlArea3A_MMonitor);
    AttachPanelTo(pnlArea3B, pnlArea3B_MMonitor);
    AttachPanelTo(pnlArea4, pnlArea4_MMonitor);
    AttachPanelTo(pnlArea5, pnlArea5_MMonitor);

    EmbedAreaForm(FFormMissileMonitor, pnlArea1_MMonitor);
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsINSTest then
  begin
    {$REGION 'INS Test'}
    if Assigned(FFormINSTest) then
      FFormINSTest.Hide;

    pnlInsTestTab.Visible := True;
    pnlInsTestTab.BringToFront;

    AttachPanelTo(pnlArea2, pnlArea2_InsTest);
    AttachPanelTo(pnlArea3A, pnlArea3A_InsTest);
    AttachPanelTo(pnlArea3B, pnlArea3B_InsTest);
    AttachPanelTo(pnlArea4, pnlArea4_InsTest);
    AttachPanelTo(pnlArea5, pnlArea5_InsTest);
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsLaunchData then
  begin
    {$REGION 'Launch Data'}
    AttachPanelTo(pnlArea2, pnlArea2_LaunchData);
    AttachPanelTo(pnlArea3A, pnlArea3A_LaunchData);
    AttachPanelTo(pnlArea3B, pnlArea3B_LaunchData);
    AttachPanelTo(pnlArea4, pnlArea4_LaunchData);
    AttachPanelTo(pnlArea5, pnlArea5_LaunchData);

    EmbedAreaForm(FFormLaunchData, pnlArea1_LaunchData);
    {$ENDREGION}
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsExit then
  begin
    {$REGION 'Exit'}
    pnlExitTab.Visible := True;

    AttachPanelTo(pnlArea2, pnlArea2_Exit);
    AttachPanelTo(pnlArea3A, pnlArea3A_Exit);
    AttachPanelTo(pnlArea3B, pnlArea3B_Exit);
    AttachPanelTo(pnlArea4, pnlArea4_Exit);
    AttachPanelTo(pnlArea5, pnlArea5_Exit);

    EmbedAreaForm(FFormExit, pnlArea1_Exit);
    {$ENDREGION}
  end
  else begin
    HidePanels([pnlArea3A, pnlArea3B, pnlArea4, pnlArea5, pnlInsTestTab, pnlExitTab]);
  end;

end;

procedure TfrmFoeFriendSituationPage.HandleTabShortcut(Key: Word);
begin
  case Key of
    Ord('1'): advpgcFunctionMenuFoe.ActivePage := advtsSituation;
    Ord('2'): advpgcFunctionMenuFoe.ActivePage := advtsFireDistr;
    Ord('3'): advpgcFunctionMenuFoe.ActivePage := advtsMInfo;
    Ord('4'): advpgcFunctionMenuFoe.ActivePage := advtsParSetting;
    Ord('5'): advpgcFunctionMenuFoe.ActivePage := advtsChSelect;
    Ord('6'): advpgcFunctionMenuFoe.ActivePage := advtsMControl;
    Ord('7'): advpgcFunctionMenuFoe.ActivePage := advtsMMonitor;
    Ord('8'): advpgcFunctionMenuFoe.ActivePage := advtsINSTest;
    Ord('9'): advpgcFunctionMenuFoe.ActivePage := advtsLaunchData;
    Ord('0'): advpgcFunctionMenuFoe.ActivePage := advtsExit;
  end;
end;
{$ENDREGION}

procedure TfrmFoeFriendSituationPage.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  KeyPreview := True; // UNtuk bisa KeyDown ketika fokus ke PageControl

  // Hilangin caption TPanel
  for i := 0 to ComponentCount - 1 do
  if Components[i] is TPanel then
  begin
    if TPanel(Components[i]).Tag < 10  then
      TPanel(Components[i]).Caption := '';
  end;

  // For tab M. Control purpose
  FarrHeaderPnlMCtrl[0] := pnlPowerOnMCtrl;
  FarrHeaderPnlMCtrl[1] := pnlReCheckMCtrl;
  FarrHeaderPnlMCtrl[2] := pnlINSAlignMCtrl;
  FarrHeaderPnlMCtrl[3] := pnlPowerOffMCtrl;

  FActivePnlIdxMCtrl := 0;
  SetActiveHeaderMCtrl(FActivePnlIdxMCtrl);
  CloseAllContentMCtrl;

  // For tab Sitation purpose
  EnableComposited(pnlMap_Situation);
  EnableComposited(pnlArea1_MControl);
  EnableComposited(pnlArea1_Exit);
  EnableComposited(pnlArea1_InsTest);
end;

procedure TfrmFoeFriendSituationPage.FormShow(Sender: TObject);
begin
  HidePanels([pnlArea3A, pnlArea3B, pnlArea4, pnlArea5, pnlInsTestTab, pnlExitTab]);

  advpgcFunctionMenuFoe.ActivePage := advtsSituation;
  UpdateLayoutTab;

  UpdateClock; // Update Clock, tidak nunggu 1 detik
  tmrClock.Enabled := True;
end;

procedure TfrmFoeFriendSituationPage.FormHide(Sender: TObject);
begin
  tmrClock.Enabled := False;
end;

procedure TfrmFoeFriendSituationPage.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {$REGION 'Case untuk Form Ch Select'}
  // case ketika di tab Ch Select, jadi navigasi untuk form Ch Select only
  {
    form Ch Select sudah assigned
  }
  if (advpgcFunctionMenuFoe.ActivePage = advtsChSelect) and
    (Assigned(FFormChSelect)) then
  begin
    {
      form Ch Select BELUM aktif
    }
    if not FFormChSelect.isChSelectFrmActive then begin
      case Key of
        VK_RETURN: begin
          FFormChSelect.ActivateFrmChSelect;
          Key := 0;
          Exit;
        end;

        VK_ESCAPE: begin
          FFormChSelect.DeactivateFrmChSelect;
          Key := 0;
          Exit;
        end;
      end;

      HandleTabShortcut(Key);
      advpgcFunctionMenuFoeChange(Sender);
      //UpdateLayoutTab;

      Exit; // stop shortcut global
    end;

    {
      form Ch Select SUDAH aktif
    }
    case Key of
      VK_ESCAPE:
      begin
        FFormChSelect.HandleKeyDown(Key, Shift);
        Key := 0;
        Exit;
      end;

      VK_UP, VK_DOWN,
        VK_RETURN:
      begin
        FFormChSelect.HandleKeyDown(Key, Shift);
        Key := 0;
        Exit;
      end;
    end;

    Exit;
  end;
  {$ENDREGION}

  {$REGION 'Case untuk Form Missile Control'}
  { case ketika di tab M. Control (Missile Control) }
  if (advpgcFunctionMenuFoe.ActivePage = advtsMControl) and
    (Assigned(FFormMissileControl)) then
  begin
    if pnlMissileControl.Visible = False then
    begin
      if Key = VK_RETURN then
        pnlMissileControl.Visible := True;
        pnlMissileControl.BringToFront;

      //Exit;
    end
    else begin
      case Key of
        VK_UP: begin
          if FActivePnlIdxMCtrl > 0 then
            SetActiveHeaderMCtrl(FActivePnlIdxMCtrl - 1);
          Exit;
        end;

        VK_DOWN: begin
          if FActivePnlIdxMCtrl < High(FarrHeaderPnlMCtrl) then
            SetActiveHeaderMCtrl(FActivePnlIdxMCtrl + 1);

          Exit;
        end;

        VK_RETURN: begin
          ShowActiveContentMCtrl;
          Exit;
        end;

        VK_ESCAPE: begin
          pnlMissileControl.Visible := False;
          Exit;
        end;
      end;

      Exit;
    end;

  end;
  {$ENDREGION}

  {$REGION 'Case untuk Form Parameter Setting'}
  // case ketika di tab Par. Setting (Parameter Setting), jadi navigasi untuk form Par Setting only
  {
    form Parameter Setting sudah assigned
  }
  if (advpgcFunctionMenuFoe.ActivePage = advtsParSetting) and
    (Assigned(FFormParSetting)) then
  begin
    {
      form Par Setting BELUM aktif
    }
    if not FFormParSetting.isParSettingFrmActive then begin
      case Key of
        VK_RETURN: begin
          FFormParSetting.ActivateFrmParSetting;
          Key := 0;
          Exit;
        end;

        VK_ESCAPE: begin
          FFormParSetting.DeactivateFrmParSetting;
          Key := 0;
          Exit;
        end;
      end;

      HandleTabShortcut(Key);
      advpgcFunctionMenuFoeChange(Sender);
      //UpdateLayoutTab;

      Exit; // stop shortcut global
    end;

    {
      form Par Setting SUDAH aktif
    }
    case Key of
      VK_ESCAPE:
      begin
        FFormParSetting.HandleKeyDownParSetting(Key, Shift);
        Key := 0;
        Exit;
      end;

      VK_UP, VK_DOWN,
        VK_RETURN:
      begin
        FFormParSetting.HandleKeyDownParSetting(Key, Shift);
        Key := 0;
        Exit;
      end;
    end;

    Exit;
  end;
  {$ENDREGION}

  {
    Global Form Foe Friend Situation shortcuts
  }
  HandleTabShortcut(Key);

  case Key of
    VK_ESCAPE:
    begin
      frmWCC.show;
    end;
  end;

  advpgcFunctionMenuFoeChange(Sender);
  //UpdateLayoutTab;

  {$REGION 'Case untuk form INS Test'}
  // case ketika di tab INS Test, jadi navigasi untuk form INS Test only
  if (advpgcFunctionMenuFoe.ActivePage = advtsINSTest) and (Assigned(FFormINSTest)) then begin
    case Key of
      VK_RETURN: begin
        EmbedAreaForm(FFormINSTest, pnlArea1_InsTest);
        Exit;
      end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'Panel Exit Form Enter to Exit'}
  if pnlExitTab.Visible = True then
  begin
    case Key of
      VK_ESCAPE:
        begin
          pnlExitTab.Visible := False;
          //frmWCC.show;
          //frmWCC.KeyPreview := False;
        end;

      VK_RETURN:
        begin
          frmWCC.show;
          //Application.Terminate;
        end;
    end;
  end;
  {$ENDREGION}

end;

{$REGION 'Semua Tab Sheet'}

{$REGION 'Tab Situation'}

{$ENDREGION}

{$REGION 'Tab Fire Distr.'}

{$ENDREGION}

{$REGION 'Tab M. Info'}
// Missile Information Tab
{$ENDREGION}

{$REGION 'Tab Par. Setting'}

{$ENDREGION}

{$REGION 'Tab Ch. Select'}

{$ENDREGION}

{$REGION 'Tab M. Control}
procedure TfrmFoeFriendSituationPage.SetActiveHeaderMCtrl(idx: Integer);
var
  i: Integer;
begin
  // Helper Set panel mana yang Lowered (Panel Down)

  // Set panel Not Selected
  for i := 0 to High(FarrHeaderPnlMCtrl) do
  begin
    FarrHeaderPnlMCtrl[i].BevelInner := bvRaised;
    FarrHeaderPnlMCtrl[i].BevelOuter := bvRaised;
    FarrHeaderPnlMCtrl[i].Font.Color := clWindowText;
  end;

  FarrHeaderPnlMCtrl[idx].BevelInner := bvLowered;
  FarrHeaderPnlMCtrl[idx].BevelOuter := bvLowered;
  FarrHeaderPnlMCtrl[idx].Font.Color := CBlueColor;

  FActivePnlIdxMCtrl:= idx;
end;

procedure TfrmFoeFriendSituationPage.ShowActiveContentMCtrl;
begin
  CloseAllContentMCtrl;

  case FActivePnlIdxMCtrl of
    0: begin
      pnlPowerOnContentMCtrl.Visible := True;
      pnlPowerOnContentMCtrl.BringToFront;
    end;
    1: begin
      pnlReCheckContentMCtrl.Visible := True;
      pnlReCheckContentMCtrl.BringToFront;
    end;
    2: begin
      pnlINSAlignContentMCtrl.Visible := True;
      pnlINSAlignContentMCtrl.BringToFront;
    end;
    4: begin
      pnlPowerOffContentMCtrl.Visible := True;
      pnlPowerOffContentMCtrl.BringToFront;
    end;
  end;
end;

procedure TfrmFoeFriendSituationPage.CloseAllContentMCtrl;
begin
  pnlPowerOnContentMCtrl.Visible := False;
  pnlReCheckContentMCtrl.Visible := False;
  pnlINSAlignContentMCtrl.Visible := False;
  pnlPowerOffContentMCtrl.Visible := False;

//  FarrHeaderPnlMCtrl[0] := nil;
//  FarrHeaderPnlMCtrl[1] := nil;
//  FarrHeaderPnlMCtrl[2] := nil;
//  FarrHeaderPnlMCtrl[3] := nil;
end;
{$ENDREGION}

{$REGION 'Tab M. Monitor}

{$ENDREGION}

{$REGION 'Tab INS Test'}

{$ENDREGION}

{$REGION 'Tab Launch Data'}

{$ENDREGION}

{$REGION 'Tab Exit'}

{$ENDREGION}

{$ENDREGION}

procedure TfrmFoeFriendSituationPage.UpdateClock;
begin
  pnlTimeClock.Caption := FormatDateTime('hh:nn:ss', Now);
end;

procedure TfrmFoeFriendSituationPage.tmrClockTimer(Sender: TObject);
begin
  UpdateClock;
end;

end.
