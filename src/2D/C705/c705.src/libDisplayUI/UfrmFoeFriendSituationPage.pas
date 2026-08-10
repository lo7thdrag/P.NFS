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
  UfrmRadar,
  uFrmPnlArea3A, uFrmPnlArea3B,
  uShipModel, uC705SimManager, uKeyboardManager,
  uC705Launcher,
  uFrmKeyboardCalcLaunch;

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
    pnlArea3B: TPanel;
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
    pnlPowerOnMCtrl: TPanel;
    pnlReCheckMCtrl: TPanel;
    pnlINSAlignMCtrl: TPanel;
    pnlPowerOffMCtrl: TPanel;
    pnlReCheckContentMCtrl: TPanel;
    Label61: TLabel;
    pnlINSAlignContentMCtrl: TPanel;
    lblStateINSAlign: TLabel;
    pnlPowerOffContentMCtrl: TPanel;
    Label67: TLabel;
    edtPwrOnMissile: TEdit;
    edtRecheckMissile: TEdit;
    Label3: TLabel;
    edtINSAlignMissile: TEdit;
    Label4: TLabel;
    edtPwrOffMissile: TEdit;
    Label5: TLabel;
    {$ENDREGION}
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure advpgcFunctionMenuFoeChange(Sender: TObject);
    procedure tmrClockTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure edtPwrOnMissileClick(Sender: TObject);
    procedure edtRecheckMissileClick(Sender: TObject);
    procedure edtINSAlignMissileClick(Sender: TObject);
    procedure edtPwrOffMissileClick(Sender: TObject);
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
    FFormPnlArea3A: TfrmPnlArea3A;
    FFormPnlArea3B: TfrmPnlArea3B;

    // For tab M. Control (Missile Control)
    FarrHeaderPnlMCtrl: array[0..3] of TPanel;
    FActivePnlIdxMCtrl: Integer;

    procedure AttachPanelTo(aPanel, aParent: TWinControl);
    procedure HidePanels(const aPanels: array of TPanel);

    procedure HandleTabShortcut(Key: Word);

    procedure UpdateClock;

    // Set form lain ke panel Tabsheet
    procedure EnsureAreas;
    procedure EmbedAreaForm(aFrm: TForm; aParent: TWinControl);

    // Set Keybind Navigasi tab Missile Control
    procedure SetActiveHeaderMCtrl(idx: Integer);
    procedure ShowActiveContentMCtrl;
    procedure CloseAllContentMCtrl;

    function SeaStateToStr(aState: Word): string;
    procedure EnvironmentChanged(Sender: TObject);

    procedure MissileCtrlKeyboardEnterMissile(Sender: TObject);
    procedure MissileCtrlKeyboardEnterINSAlign(Sender: TObject);

    procedure UpdateMissileControl;
  public
    { Public declarations }
    procedure SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
    procedure SetTopMonitor(aMoniHeight: Integer);

    procedure RegisterEvents;
    procedure TargetSelectedEvents(Sender: TObject; aTgt: TShipContact; aRng: Double);

    procedure UpdateLayoutTab;
    procedure UpdatePnlSituationData(aObjTgt: TShipContact; aRange: Double);

    procedure HandleKeyboardDown(var Key: Word; Shift: TShiftState);

    procedure StatusWeaponBtnChanged(Sender: TObject);
  end;

var
  frmFoeFriendSituationPage: TfrmFoeFriendSituationPage;

implementation

{$R *.dfm}

uses
  UfrmWCC, uLibSettings;

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

procedure TfrmFoeFriendSituationPage.RegisterEvents;
begin
  SimManager.OnEnvironmentChanged := EnvironmentChanged;
  SimManager.OnTargetSelectedAction := TargetSelectedEvents;

  EnvironmentChanged(Self);

  // Multicast Notify Event
  SimManager.RegisterStatusWeaponEvent(StatusWeaponBtnChanged);
end;

procedure TfrmFoeFriendSituationPage.TargetSelectedEvents(Sender: TObject; aTgt: TShipContact; aRng: Double);
begin
  UpdatePnlSituationData(aTgt, aRng);
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

  if not Assigned(FFormExit) then
    FFormExit := TfrmRadar.Create(Self);

  if not Assigned(FFormPnlArea3A) then begin
    FFormPnlArea3A := TfrmPnlArea3A.Create(Self);
    FFormPnlArea3A.InitSimulation;
  end;

  if not Assigned(FFormPnlArea3B) then begin
    FFormPnlArea3B := TfrmPnlArea3B.Create(Self);
    FFormPnlArea3B.InitSimulation;
  end;

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

  if Assigned(KeyboardMgr) then
    KeyboardMgr.SetContext(kbFFSMenu);

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
    KeyboardMgr.SetActiveAreaForm(FFormParSetting);
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
    KeyboardMgr.SetActiveAreaForm(FFormChSelect);
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
    pnlMissileControl.Visible := True;

    KeyboardMgr.SetActiveAreaForm(FFormMissileControl);
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
    1: advpgcFunctionMenuFoe.ActivePage := advtsSituation;
    2: advpgcFunctionMenuFoe.ActivePage := advtsFireDistr;
    3: advpgcFunctionMenuFoe.ActivePage := advtsMInfo;
    4: advpgcFunctionMenuFoe.ActivePage := advtsParSetting;
    5: advpgcFunctionMenuFoe.ActivePage := advtsChSelect;
    6: advpgcFunctionMenuFoe.ActivePage := advtsMControl;
    7: advpgcFunctionMenuFoe.ActivePage := advtsMMonitor;
    8: advpgcFunctionMenuFoe.ActivePage := advtsINSTest;
    9: advpgcFunctionMenuFoe.ActivePage := advtsLaunchData;
    0: advpgcFunctionMenuFoe.ActivePage := advtsExit;
  end;
  {
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
  end;}
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
  EmbedAreaForm(FFormPnlArea3A, pnlArea3A);
  EmbedAreaForm(FFormPnlArea3B, pnlArea3B);

  UpdateClock; // Update Clock, tidak nunggu 1 detik
  tmrClock.Enabled := True;

  // For tab M. Control purpose
  FarrHeaderPnlMCtrl[0] := pnlPowerOnMCtrl;
  FarrHeaderPnlMCtrl[1] := pnlReCheckMCtrl;
  FarrHeaderPnlMCtrl[2] := pnlINSAlignMCtrl;
  FarrHeaderPnlMCtrl[3] := pnlPowerOffMCtrl;

  FActivePnlIdxMCtrl := 0;
  SetActiveHeaderMCtrl(FActivePnlIdxMCtrl);
  CloseAllContentMCtrl;

  if Assigned(KeyboardMgr) then
    KeyboardMgr.SetContext(kbFFSMenu);
end;

procedure TfrmFoeFriendSituationPage.FormHide(Sender: TObject);
begin
  tmrClock.Enabled := False;
end;

procedure TfrmFoeFriendSituationPage.HandleKeyboardDown(var Key: Word; Shift: TShiftState);
var
  S: string;
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

          if Assigned(KeyboardMgr) then
            KeyboardMgr.SetContext(kbAreaFormFFS);

          Exit;
        end;

        VK_ESCAPE: begin
          FFormChSelect.DeactivateFrmChSelect;
          Key := 0;

          if Assigned(KeyboardMgr) then
            KeyboardMgr.SetContext(kbFFSMenu);

          Exit;
        end;
      end;

      HandleTabShortcut(Key); // move to Keyboard Form
      advpgcFunctionMenuFoeChange(nil);
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
      {$REGION 'Case untuk Missile Control sedang melakukan input dari frmKeyboard '}
      if Key = VK_ESCAPE then
        frmKeyboardCalcLaunch.ActiveEdit := nil;
      
      //if edtPwrOnMissile.Focused then
      if frmKeyboardCalcLaunch.ActiveEdit = edtPwrOnMissile then
      begin
        case Key of
          1: edtPwrOnMissile.Text := '1';
          2: edtPwrOnMissile.Text := '2';
          VK_BACK: begin
            //edtPwrOnMissile.Clear;
            S := edtPwrOnMissile.Text;

            if S <> '' then
            begin
              Delete(S, Length(S), 1);
              edtPwrOnMissile.Text := S;
            end;
          end;
          VK_RETURN : begin
            MissileCtrlKeyboardEnterMissile(Self);
            Exit;
          end;
        end;

        Exit;
      end;

      //if edtRecheckMissile.Focused then
      if frmKeyboardCalcLaunch.ActiveEdit = edtRecheckMissile then
      begin
        case Key of
          1: edtRecheckMissile.Text := '1';
          2: edtRecheckMissile.Text := '2';
          VK_BACK: begin
            //edtPwrOnMissile.Clear;
            S := edtRecheckMissile.Text;

            if S <> '' then
            begin
              Delete(S, Length(S), 1);
              edtRecheckMissile.Text := S;
            end;
          end;
          VK_RETURN : begin
            MissileCtrlKeyboardEnterMissile(Self);
            Exit;
          end;
        end;

        Exit;
      end;

      //if edtINSAlignMissile.Focused then
      if frmKeyboardCalcLaunch.ActiveEdit = edtINSAlignMissile then
      begin
        case Key of
          1: edtINSAlignMissile.Text := '1';
          2: edtINSAlignMissile.Text := '2';
          VK_BACK: begin
            //edtPwrOnMissile.Clear;
            S := edtINSAlignMissile.Text;

            if S <> '' then
            begin
              Delete(S, Length(S), 1);
              edtINSAlignMissile.Text := S;
            end;
          end;
          VK_RETURN : begin
            MissileCtrlKeyboardEnterINSAlign(Self);
            Exit;
          end;
        end;

        Exit;
      end;

      //if edtPwrOffMissile.Focused then
      if frmKeyboardCalcLaunch.ActiveEdit = edtPwrOffMissile then
      begin
        case Key of
          1: edtPwrOffMissile.Text := '1';
          2: edtPwrOffMissile.Text := '2';
          VK_BACK: begin
            //edtPwrOnMissile.Clear;
            S := edtPwrOffMissile.Text;

            if S <> '' then
            begin
              Delete(S, Length(S), 1);
              edtPwrOffMissile.Text := S;
            end;
          end;
          VK_RETURN : begin
            MissileCtrlKeyboardEnterMissile(Self);
            Exit;
          end;
        end;

        Exit;
      end;
      {$ENDREGION}

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
          //pnlMissileControl.Visible := False;
          pnlPowerOnContentMCtrl.Visible := False;
          pnlReCheckContentMCtrl.Visible := False;
          pnlPowerOffContentMCtrl.Visible := False;
          pnlINSAlignContentMCtrl.Visible := False;
          Exit;
        end;

        VK_BACK: begin
          if frmKeyboardCalcLaunch.ActiveEdit = nil then
            Exit;
        end;
      end;

      //ShowActiveContentMCtrl;
      //Exit;
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

      HandleTabShortcut(Key); // move to Keyboard Form
      advpgcFunctionMenuFoeChange(nil);
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
  HandleTabShortcut(Key); // move to Keyboard Form

  case Key of
    VK_ESCAPE:
    begin
      frmWCC.show;
    end;
  end;

  advpgcFunctionMenuFoeChange(nil);
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
          frmWCC.Show;
          frmFoeFriendSituationPage.Hide;
          frmKeyboardCalcLaunch.BringToFront;
          //Application.Terminate;
        end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'Case handle keyboard Navigation'}
//  case Key of
//    0: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsExit;
//    end;
//    1: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsSituation;
//    end;
//    2: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsFireDistr;
//    end;
//    3: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsMInfo;
//    end;
//    4: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsParSetting;
//    end;
//    5: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsChSelect;
//    end;
//    6: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsMControl;
//    end;
//    7: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsMMonitor;
//    end;
//    8: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsINSTest;
//    end;
//    9: begin
//      advpgcFunctionMenuFoe.ActivePage := frmFoeFriendSituationPage.advtsLaunchData;
//    end;
//  end;
//  UpdateLayoutTab;

  {$ENDREGION}

end;

procedure TfrmFoeFriendSituationPage.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  HandleKeyboardDown(Key, Shift);
end;

{$REGION 'Semua Tab Sheet'}

{$REGION 'Tab Situation'}
function TfrmFoeFriendSituationPage.SeaStateToStr(aState: Word): string;
begin
  case aState of
    0: Result:= 'Low';
    1: Result:= 'Low';
    2: Result:= 'Low';
    3: Result:= 'Low';
    4: Result:= 'High';
    5: Result:= 'High';
  end;
end;

procedure TfrmFoeFriendSituationPage.EnvironmentChanged(Sender: TObject);
begin
  lblSeaStateParam.Caption := SeaStateToStr(SimManager.Environment.SeaState);//IntToStr(SimManager.Environment.SeaState);
end;

procedure TfrmFoeFriendSituationPage.UpdatePnlSituationData(aObjTgt: TShipContact; aRange: Double);
begin
  lblLongParam.Caption := FormatFloat('0.00', aObjTgt.Lon);
  lblLatParam.Caption := FormatFloat('0.00', aObjTgt.Lat);
  lblESpdParam.Caption := '';
  lblNSpdParam.Caption := '';
end;
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

{$REGION 'Tab M. Control'}
procedure TfrmFoeFriendSituationPage.UpdateMissileControl;
var
  Launcher: TC705Launcher;
  LauncherID: Integer;
begin
  LauncherID := StrToInt(edtINSAlignMissile.Text);
  if (LauncherID < 1) or (LauncherID > 2) then
    Exit;

  Launcher:= SimManager.GetLauncher(LauncherID);

  if Launcher.C705Status.INSAlignDone then begin
    lblStateINSAlign.Caption := 'Allow';
    lblStateINSAlign.Visible := True;
  end;
end;

procedure TfrmFoeFriendSituationPage.MissileCtrlKeyboardEnterINSAlign(Sender: TObject);
var
  LauncherID: Integer;
  Launcher: TC705Launcher;
begin
  LauncherID := StrToIntDef(frmKeyboardCalcLaunch.ActiveEdit.Text,0);

  Launcher := SimManager.GetLauncher(LauncherID);

  if Launcher = nil then
    Exit;

  if not Launcher.C705Status.EnableMissile then
  begin
    ShowMessage('Missile belum Power ON');
    Exit;
  end;

  Launcher.StartINSAlign;
end;

procedure TfrmFoeFriendSituationPage.MissileCtrlKeyboardEnterMissile(Sender: TObject);
var
  LauncherID: Integer;
  Launcher: TC705Launcher;
begin
  // 1 = LauncherRight; 2 = LauncherLeft;
  LauncherID := StrToIntDef(frmKeyboardCalcLaunch.ActiveEdit.Text, 0);
  Launcher := SimManager.GetLauncher(LauncherID);

  if Launcher = nil then
    Exit;

  if not Launcher.C705Status.EnableWeapon then
  begin
    ShowMessage('Launcher belum ON');;
    Exit;
  end;

  if frmKeyboardCalcLaunch.ActiveEdit = edtRecheckMissile then
    Launcher.SetEnableMissile(False); // di reset jadi False dulu

  if (frmKeyboardCalcLaunch.ActiveEdit.Text = '1') then
    Launcher.SetEnableMissile(True)
  else if (frmKeyboardCalcLaunch.ActiveEdit.Text = '2') then
    Launcher.SetEnableMissile(True);

end;

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

      edtPwrOnMissile.Focused;
    end;
    1: begin
      pnlReCheckContentMCtrl.Visible := True;
      pnlReCheckContentMCtrl.BringToFront;

      edtRecheckMissile.Focused;
    end;
    2: begin
      pnlINSAlignContentMCtrl.Visible := True;
      pnlINSAlignContentMCtrl.BringToFront;

      edtINSAlignMissile.Focused;
    end;
    3: begin
      pnlPowerOffContentMCtrl.Visible := True;
      pnlPowerOffContentMCtrl.BringToFront;

      edtPwrOffMissile.Focused;
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

procedure TfrmFoeFriendSituationPage.edtINSAlignMissileClick(Sender: TObject);
begin
  // beritau frmKeyboard bahwa TEdit ini adalah yang sedang diedit
  frmKeyboardCalcLaunch.ActiveEdit := edtINSAlignMissile;

  // set mode Keyboard ke input
  frmKeyboardCalcLaunch.KeyboardMode := mdInput;
end;

procedure TfrmFoeFriendSituationPage.edtPwrOffMissileClick(Sender: TObject);
begin
  // beritau frmKeyboard bahwa TEdit ini adalah yang sedang diedit
  frmKeyboardCalcLaunch.ActiveEdit := edtPwrOffMissile;

  // set mode Keyboard ke input
  frmKeyboardCalcLaunch.KeyboardMode := mdInput;
end;

procedure TfrmFoeFriendSituationPage.edtPwrOnMissileClick(Sender: TObject);
begin
  // beritau frmKeyboard bahwa TEdit ini adalah yang sedang diedit
  frmKeyboardCalcLaunch.ActiveEdit := edtPwrOnMissile;

  // set mode Keyboard ke input
  frmKeyboardCalcLaunch.KeyboardMode := mdInput;
end;

procedure TfrmFoeFriendSituationPage.edtRecheckMissileClick(Sender: TObject);
begin
  // beritau frmKeyboard bahwa TEdit ini adalah yang sedang diedit
  frmKeyboardCalcLaunch.ActiveEdit := edtRecheckMissile;

  // set mode Keyboard ke input
  frmKeyboardCalcLaunch.KeyboardMode := mdInput;
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

procedure TfrmFoeFriendSituationPage.StatusWeaponBtnChanged(Sender: TObject);
begin

  UpdateMissileControl;

end;

procedure TfrmFoeFriendSituationPage.UpdateClock;
begin
  pnlTimeClock.Caption := FormatDateTime('hh:nn:ss', Now);
end;

procedure TfrmFoeFriendSituationPage.tmrClockTimer(Sender: TObject);
begin
  UpdateClock;
end;

procedure TfrmFoeFriendSituationPage.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
  Position := poDesigned;
  WindowState := wsNormal;

  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop;

  if VIdentSetting.ModeDebug then
    ShowMessage(Format('WCC di Monitor %d Top=%d',[aMonitorIdx,Screen.Monitors[aMonitorIdx].Top]));
end;

procedure TfrmFoeFriendSituationPage.SetTopMonitor(aMoniHeight: Integer);
var
  idxMainMoni: Integer;
  R: TRect;
begin
//  Position := poDesigned;
//  WindowState := wsNormal;

  idxMainMoni := 0;

  Left := Screen.Monitors[idxMainMoni].WorkareaRect.Left;
  Top := aMoniHeight;

  if VIdentSetting.ModeDebug then
    ShowMessage('WCC form Top=' + IntToStr(frmWCC.Top));
end;

end.
