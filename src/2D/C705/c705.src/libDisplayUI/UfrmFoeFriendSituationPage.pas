unit UfrmFoeFriendSituationPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvPageControl, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage, VrControls, VrLights,
  AdvUtil, Vcl.Grids, AdvObj, BaseGrid, AdvGrid, Vcl.Buttons,
  uFrmMissileInformation,
  uFrmFireDistribution,
  uFrmMissileMonitor,
  uFrmLaunchData,
  uFrmChannelSelect,
  uFrmINSTest;

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
    lblInitState: TLabel;
    vrlINSGNSS: TVrLights;
    Label4: TLabel;
    vrlMNormal: TVrLights;
    lblMNormal: TLabel;
    vrlCalFinished: TVrLights;
    lblCalFinished: TLabel;
    vrlNavigate: TVrLights;
    lblNavigation: TLabel;
    vrlIgnition: TVrLights;
    lblIgnition: TLabel;
    vrlPowerOn: TVrLights;
    lblTakeOff: TLabel;
    vrlTakeOff: TVrLights;
    lblParaSetting: TLabel;
    vrlParaSetting: TVrLights;
    lblInsideSector: TLabel;
    vrlInsideSector: TVrLights;
    lblSeaTgt: TLabel;
    vrlSeaTgt: TVrLights;
    lblEngine: TLabel;
    vrlEngine: TVrLights;
    lblPowerOn: TLabel;
    vrlInitChk: TVrLights;
    lblInitChk: TLabel;
    lblWarmup: TLabel;
    vrlWarmup: TVrLights;
    vrlLandTgt: TVrLights;
    lblLandTgt: TLabel;
    vrlFullOpen: TVrLights;
    lblFullOpen: TLabel;
    vrlParaLocking: TVrLights;
    lblParaLocking: TLabel;
    vrlBusSupply: TVrLights;
    lblBusSupply: TLabel;
    vrlPlcChk: TVrLights;
    lblPlcChk: TLabel;
    vrlSeeker: TVrLights;
    vrlInsAlign: TVrLights;
    lblInsAlign: TLabel;
    lblSeeker: TLabel;
    vrlBoosterArm: TVrLights;
    lblBoosterArm: TLabel;
    vrlBatteryAct: TVrLights;
    lblBatteryAct: TLabel;
    vrlLnchRdy: TVrLights;
    lblLnchRdy: TLabel;
    vrlPwrSwitch: TVrLights;
    lblPwrSwitch: TLabel;
    pnlArea3B: TPanel;
    VrLights1: TVrLights;
    Label3: TLabel;
    VrLights2: TVrLights;
    Label5: TLabel;
    VrLights3: TVrLights;
    Label6: TLabel;
    VrLights4: TVrLights;
    Label8: TLabel;
    VrLights5: TVrLights;
    Label9: TLabel;
    VrLights6: TVrLights;
    Label10: TLabel;
    VrLights7: TVrLights;
    Label11: TLabel;
    VrLights8: TVrLights;
    Label12: TLabel;
    VrLights9: TVrLights;
    Label13: TLabel;
    VrLights10: TVrLights;
    Label14: TLabel;
    VrLights11: TVrLights;
    Label18: TLabel;
    VrLights12: TVrLights;
    Label19: TLabel;
    VrLights13: TVrLights;
    Label20: TLabel;
    Label21: TLabel;
    VrLights14: TVrLights;
    VrLights15: TVrLights;
    Label22: TLabel;
    VrLights16: TVrLights;
    Label23: TLabel;
    VrLights17: TVrLights;
    Label24: TLabel;
    VrLights18: TVrLights;
    Label25: TLabel;
    VrLights19: TVrLights;
    Label26: TLabel;
    VrLights20: TVrLights;
    VrLights21: TVrLights;
    Label27: TLabel;
    Label28: TLabel;
    VrLights22: TVrLights;
    Label29: TLabel;
    VrLights23: TVrLights;
    Label30: TLabel;
    VrLights24: TVrLights;
    Label31: TLabel;
    VrLights25: TVrLights;
    Label32: TLabel;
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
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel5: TPanel;
    pnlPowerOn: TPanel;
    Label58: TLabel;
    Panel19: TPanel;
    {$ENDREGION}
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure advpgcFunctionMenuFoeChange(Sender: TObject);
    procedure tmrClockTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    FFormFireDist: TfrmFireDistribution;
    FFormMissileInfo: TfrmMissileInformation;
    FFormParSetting: TfrmMissileInformation; //belum
    FFormChSelect: TfrmChannelSelect; //done UI
    FFormMissileControl: TfrmMissileInformation; //belum
    FFormMissileMonitor: TfrmMissileMonitor; //done UI
    FFormINSTest: TfrmINSTest; //belum
    FFormLaunchData: TfrmLaunchData; //done UI

    procedure AttachPanelTo(aPanel, aParent: TWinControl);
    procedure HidePanels(const aPanels: array of TPanel);
    procedure UpdateLayoutTab;

    procedure HandleTabShortcut(Key: Word);

    procedure UpdateClock;

    // Set form lain ke panel Tabsheet
    procedure EnsureAreas;
    procedure EmbedAreaForm(aFrm: TForm; aParent: TWinControl);
  public
    { Public declarations }
  end;

var
  frmFoeFriendSituationPage: TfrmFoeFriendSituationPage;

implementation

{$R *.dfm}

uses
  UfrmWCC;

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
  if not Assigned(FFormFireDist) then
    FFormFireDist := TfrmFireDistribution.Create(Self);

  if not Assigned(FFormMissileInfo) then
    FFormMissileInfo := TfrmMissileInformation.Create(Self);

  if not Assigned(FFormParSetting) then
    FFormParSetting := TfrmMissileInformation.Create(Self);

  if not Assigned(FFormChSelect) then
    FFormChSelect := TfrmChannelSelect.Create(Self);

  if not Assigned(FFormMissileControl) then
    FFormMissileControl := TfrmMissileInformation.Create(Self);

  if not Assigned(FFormMissileMonitor) then
    FFormMissileMonitor := TfrmMissileMonitor.Create(Self);

  if not Assigned(FFormINSTest) then
    FFormINSTest := TfrmINSTest.Create(Self);

  if not Assigned(FFormLaunchData) then
    FFormLaunchData := TfrmLaunchData.Create(Self);
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
    {$ENDREGION}
  end
  else begin
    HidePanels([pnlArea3A, pnlArea3B, pnlArea4, pnlArea5, pnlInsTestTab, pnlExitTab]);
  end;

end;
{$ENDREGION}

procedure TfrmFoeFriendSituationPage.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  KeyPreview := True; // UNtuk bisa KeyDown ketika fokus ke PageControl

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TPanel then
    begin
      if TPanel(Components[i]).Tag < 10  then
        TPanel(Components[i]).Caption := '';
    end;
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
  // case ketika di tab Ch Select, jadi navigasi untuk form Ch Select only

  // ==============================
  // Selector Page ACTIVE
  // ==============================
  if (advpgcFunctionMenuFoe.ActivePage = advtsChSelect) and (Assigned(FFormChSelect)) then begin
    // ==========================
    // Selector BELUM aktif
    // ==========================
    if not FFormChSelect.isChSelectFrmActive then begin
      case Key of
        VK_RETURN: begin
          FFormChSelect.ActivateFrmChSelect;
          Key := 0;
          Exit;
        end;

        VK_ESCAPE: begin
          FFormChSelect.DeactivateFrmChSelect;
          //advpgcFunctionMenuFoe.ActivePage := advtsParSetting;
          Key := 0;
          Exit;
        end;
      end;

      HandleTabShortcut(Key);

      Exit; // stop shortcut global
    end;

    // ==========================
    // Selector SUDAH aktif
    // ==========================
    case Key of
      VK_ESCAPE:
        begin
          FFormChSelect.HandleKeyDown(Key, Shift);
          //FFormChSelect.DeactivateFrmChSelect;
          Key := 0;
          Exit;
        end;

      VK_UP, VK_DOWN, VK_RETURN:
        begin
          FFormChSelect.HandleKeyDown(Key, Shift);
          Key := 0;
          Exit;
        end;
    end;

    Exit;
  end;

  // ==============================
  // Global Form Foe Friend Situation shortcuts
  // ==============================
  HandleTabShortcut(Key);

//  case Key of
//    VK_ESCAPE:
//    begin
//      frmWCC.show;
//    end;
//  end;

  UpdateLayoutTab;

  // case ketika di tab INS Test, jadi navigasi untuk form INS Test only
  if (advpgcFunctionMenuFoe.ActivePage = advtsINSTest) and (Assigned(FFormINSTest)) then begin
    case Key of
      VK_RETURN: begin
        EmbedAreaForm(FFormINSTest, pnlArea1_InsTest);
      end;
    end;
  end;

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
