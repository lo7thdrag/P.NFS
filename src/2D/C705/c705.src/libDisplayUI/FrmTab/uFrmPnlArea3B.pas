unit uFrmPnlArea3B;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  uC705SimManager, uC705Launcher;

type
  TfrmPnlArea3B = class(TForm)
    {$REGION 'Comps'}
    lblBatteryAct3B: TLabel;
    lblBoosterArm3B: TLabel;
    lblBusSupply3B: TLabel;
    lblCalFinished3B: TLabel;
    lblEngine3B: TLabel;
    lblFullOpen3B: TLabel;
    lblIgnition3B: TLabel;
    lblInitChk3B: TLabel;
    lblInitState3B: TLabel;
    lblInsAlign3B: TLabel;
    lblInsGnss3B: TLabel;
    lblInsideSector3B: TLabel;
    lblLandTgt3B: TLabel;
    lblLnchRdy3B: TLabel;
    lblMNormal3B: TLabel;
    lblNavigate3B: TLabel;
    lblParaLocking3B: TLabel;
    lblParaSetting3B: TLabel;
    lblPlcChk3B: TLabel;
    lblPowerOn3B: TLabel;
    lblPwrSwitch3B: TLabel;
    lblSeaTgt3B: TLabel;
    lblSeeker3B: TLabel;
    lblTakeOff3B: TLabel;
    lblWarmup3B: TLabel;
    Panel4: TPanel;
    Image2: TImage;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    pnl3BBtm: TPanel;
    pnlStatus3B: TPanel;
    Panel13: TPanel;
    lblAlignmentStatus3B: TLabel;
    Panel14: TPanel;
    lblWarmupTime3B: TLabel;
    pnlChn3B: TPanel;
    pnlVrlBatteryAct3B: TPanel;
    pnlVrlBoosterArm3B: TPanel;
    pnlVrlBusSupply3B: TPanel;
    pnlVrlCalFinished3B: TPanel;
    pnlVrlEngine3B: TPanel;
    pnlVrlFullOpen3B: TPanel;
    pnlVrlIgnition3B: TPanel;
    pnlVrlInitChk3B: TPanel;
    pnlVrlInitState3B: TPanel;
    pnlVrlInsAlign3B: TPanel;
    pnlVrlInsGnss3B: TPanel;
    pnlVrlInsideSector3B: TPanel;
    pnlVrlLandTgt3B: TPanel;
    pnlVrlLnchRdy3B: TPanel;
    pnlVrlMNormal3B: TPanel;
    pnlVrlNavigate3B: TPanel;
    pnlVrlParaLocking3B: TPanel;
    pnlVrlParaSetting3B: TPanel;
    pnlVrlPlcChk3B: TPanel;
    pnlVrlPowerOn3B: TPanel;
    pnlVrlPwrSwitch3B: TPanel;
    pnlVrlSeaTgt3B: TPanel;
    pnlVrlSeeker3B: TPanel;
    pnlVrlTakeOff3B: TPanel;
    pnlVrlWarmUp3B: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lblAlignmentStatus3BClick(Sender: TObject);
    {$ENDREGION}
  private
    { Private declarations }
    //PanelArea3B
    procedure SetAll3BLedOff;
    procedure UpdateStatusPanel3B;
  public
    { Public declarations }
    procedure InitSimulation;
    //procedure StatusWeaponConsoleChanged(Sender:TObject; aStatus: TC705StatusType);
    procedure StatusWeaponConsoleChanged(Sender:TObject);
  end;

var
  frmPnlArea3B: TfrmPnlArea3B;

implementation

{$R *.dfm}

{ TfrmPnlArea3B }

procedure TfrmPnlArea3B.FormCreate(Sender: TObject);
begin
  SetAll3BLedOff;
end;

procedure TfrmPnlArea3B.FormDestroy(Sender: TObject);
begin
  if Assigned(SimManager) then
    SimManager.UnregisterStatusWeaponEvent(StatusWeaponConsoleChanged);
end;

procedure TfrmPnlArea3B.FormShow(Sender: TObject);
begin
  //
end;

procedure TfrmPnlArea3B.InitSimulation;
begin
  SimManager.RegisterStatusWeaponEvent(StatusWeaponConsoleChanged);
  UpdateStatusPanel3B;
end;

procedure TfrmPnlArea3B.lblAlignmentStatus3BClick(Sender: TObject);
var
  Launcher : TC705Launcher;
begin
  Launcher := SimManager.GetLauncher(2);
  Launcher.FinishINSAlignInstant;
end;

//procedure TfrmPnlArea3B.StatusWeaponConsoleChanged(Sender: TObject; aStatus: TC705StatusType);
procedure TfrmPnlArea3B.StatusWeaponConsoleChanged(Sender: TObject);
var
  Launcher: TC705Launcher;
begin
  Launcher := TC705Launcher(Sender);

  if Launcher.LauncherID <> lchLeft then
    Exit;

  UpdateStatusPanel3B;
end;

procedure TfrmPnlArea3B.SetAll3BLedOff;
begin
  {$REGION 'SetAll3BLedOff'}
  pnlVrlInitState3B.Color := clGray;
  pnlVrlInsGnss3B.Color := clGray;
  pnlVrlMNormal3B.Color := clGray;
  pnlVrlCalFinished3B.Color := clGray;
  pnlVrlNavigate3B.Color := clGray;
  pnlVrlIgnition3B.Color := clGray;

  pnlVrlPowerOn3B.Color := clGray;
  pnlVrlEngine3B.Color := clGray;
  pnlVrlSeaTgt3B.Color := clGray;
  pnlVrlInsideSector3B.Color := clGray;
  pnlVrlParaSetting3B.Color := clGray;
  pnlVrlTakeOff3B.Color := clGray;

  pnlVrlInitChk3B.Color := clGray;
  pnlVrlWarmUp3B.Color := clGray;
  pnlVrlLandTgt3B.Color := clGray;
  pnlVrlFullOpen3B.Color := clGray;
  pnlVrlParaLocking3B.Color := clGray;

  pnlVrlBusSupply3B.Color := clGray;
  pnlVrlPlcChk3B.Color := clGray;

  pnlVrlBoosterArm3B.Color := clGray;
  pnlVrlBatteryAct3B.Color := clGray;

  pnlVrlSeeker3B.Color := clGray;
  pnlVrlInsAlign3B.Color := clGray;

  pnlVrlLnchRdy3B.Color := clRed;
  pnlVrlPwrSwitch3B.Color := clGray;
  {$ENDREGION}
end;

procedure TfrmPnlArea3B.UpdateStatusPanel3B;
var
  Launcher: TC705Launcher;
begin
  Launcher := SimManager.GetLauncher(2);

  if Launcher.C705Status.EnableWeapon then
    pnlVrlPowerOn3B.Color := clLime
  else
    pnlVrlPowerOn3B.Color := clGray;

  if Launcher.C705Status.InitStateRdy then
    pnlVrlInitState3B.Color := clLime
  else
    pnlVrlInitState3B.Color := clGray;

  if Launcher.C705Status.BusSupplyRdy then
    pnlVrlBusSupply3B.Color := clLime
  else
    pnlVrlBusSupply3B.Color := clGray;

  if Launcher.C705Status.SeekerRdy then
    pnlVrlSeeker3B.Color := clLime
  else
    pnlVrlSeeker3B.Color := clGray;

  if Launcher.C705Status.INSGNSSRdy then
    pnlVrlInsGnss3B.Color := clLime
  else
    pnlVrlInsGnss3B.Color := clGray;

  if Launcher.C705Status.EngineRdy then
    pnlVrlEngine3B.Color := clLime
  else
    pnlVrlEngine3B.Color := clGray;

  if Launcher.C705Status.INSAlignRunning then begin
    //lblAlignmentStatus3A.Caption := 'Aligment 00:00'
    lblAlignmentStatus3B.Caption :=
    Format('Alignment %2.2d:%2.2d',
      [Launcher.INSAlignElapsed div 60,
       Launcher.INSAlignElapsed mod 60]);
  end
  else if Launcher.C705Status.INSAlignDone then begin
    lblAlignmentStatus3B.Caption := 'Alignment Complete';
    pnlVrlInsAlign3B.Color := clLime;
  end
  else begin
    lblAlignmentStatus3B.Caption := 'Waiting Aligment';
    pnlVrlInsAlign3B.Color := clGray;
  end;

  if Launcher.C705Status.MNormalRdy then
  begin
    pnlVrlMNormal3B.Color := clLime;
  end
  else begin
    pnlVrlMNormal3B.Color := clGray;
  end;

  if Launcher.C705Status.CalFinishRdy then
  begin
    pnlVrlCalFinished3B.Color := clLime;
  end
  else
  begin
    pnlVrlCalFinished3B.Color := clGray;
  end;

  if Launcher.C705Status.InsideSectorRdy then
  begin
    pnlVrlInsideSector3B.Color := clLime;
  end
  else begin
    pnlVrlInsideSector3B.Color := clGray;
  end;

  if Launcher.C705Status.OpenCoverLauncher and
    Launcher.C705Status.SelfLatch then begin
    pnlVrlFullOpen3B.Color := clLime;
  end
  else begin
    pnlVrlFullOpen3B.Color := clGray
  end;

  if Launcher.C705Status.SafetyIgnition then begin
    pnlVrlBoosterArm3B.Color := clGray
  end
  else begin
    pnlVrlBoosterArm3B.Color := clLime;
  end;

  // SEA TARGET
  if Launcher.C705Status.SeaTargetRdy then
    pnlVrlSeaTgt3B.Color := clLime
  else
    pnlVrlSeaTgt3B.Color := clGray;

  // PLC CHECK
  if Launcher.C705Status.PLCChkRdy then
    pnlVrlPlcChk3B.Color := clLime
  else
    pnlVrlPlcChk3B.Color := clGray;

  if Launcher.C705Status.TakeOffRdy then
    pnlVrlTakeOff3B.Color := clLime
  else
    pnlVrlTakeOff3B.Color := clGray;

  if Launcher.C705Status.LaunchRdy then
    pnlVrlLnchRdy3B.Color := clLime
  else
    pnlVrlLnchRdy3B.Color := clGray;

  {$REGION 'Old concept'}
  {
  // POWER
  if Launcher.C705Status.EnableWeapon then begin
    pnlVrlPowerOn3B.Color := clLime;
    pnlVrlBusSupply3B.Color := clLime;
    pnlVrlPwrSwitch3B.Color := clLime;
  end
  else begin
    pnlVrlPowerOn3B.Color := clRed;
    pnlVrlBusSupply3B.Color := clRed;
    pnlVrlPwrSwitch3B.Color := clRed;
  end;

  // SAFETY IGNITION BOOSTER ARM
  if Launcher.C705Status.SafetyIgnition then
    pnlVrlBoosterArm3B.Color := clLime
  else
    pnlVrlBoosterArm3B.Color := clRed;

  // Warm Up; WarmUp
  if Launcher.C705Status.WarmUpDone then
    pnlVrlWarmUp3B.Color := clLime
  else begin
    // Sedang proses Warm-up
    if Launcher.C705Status.EnableWeapon then
      pnlVrlWarmUp3B.Color := clYellow
    else
      pnlVrlWarmUp3B.Color := clGray;
  end;

  // SEEKER
  if Launcher.C705Status.SeekerRdy then
    pnlVrlSeeker3B.Color := clLime
  else
  begin
    if Launcher.C705Status.EnableWeapon then
      pnlVrlSeeker3B.Color := clRed
    else
      pnlVrlSeeker3B.Color := clGray;
  end;

  // SEA TARGET
  if Launcher.C705Status.SeaTargetRdy then
    pnlVrlSeaTgt3B.Color := clLime
  else
    pnlVrlSeaTgt3B.Color := clRed;

  // INSIDE SECTOR
  if Launcher.C705Status.InsideSectorRdy then
    pnlVrlInsideSector3B.Color := clLime
  else
    pnlVrlInsideSector3B.Color := clRed;

  // PARA SETTING
  if Launcher.C705Status.ParaSettingRdy then
    pnlVrlParaSetting3B.Color := clLime
  else
    pnlVrlParaSetting3B.Color := clRed;

  // INIT CHK
  if Launcher.C705Status.INITChkRdy then
    pnlVrlInitChk3B.Color := clLime
  else
    pnlVrlInitChk3B.Color := clRed;

  // INIT STATE
  if Launcher.C705Status.INITStateRdy then
    pnlVrlInitState3B.Color := clLime
  else
    pnlVrlInitState3B.Color := clRed;

  // INS GNSS
  if Launcher.C705Status.INSGNSSRdy then
    pnlVrlInsGnss3B.Color := clLime
  else
    pnlVrlInsGnss3B.Color := clRed;

  // M. NORMAL
  if Launcher.C705Status.MNormalRdy then
    pnlVrlMNormal3B.Color := clLime
  else
    pnlVrlInsGnss3B.Color := clRed;

  // Cal. Finished
  if Launcher.C705Status.CalFinishRdy then
    pnlVrlCalFinished3B.Color := clLime
  else
    pnlVrlCalFinished3B.Color := clRed;

  // PARA LOCKING
  if Launcher.C705Status.ParaLockRdy then
    pnlVrlParaLocking3B.Color := clLime
  else
    pnlVrlParaLocking3B.Color := clRed;

  // FULL OPEN
  if Launcher.C705Status.FullOpenRdy then
    pnlVrlFullOpen3B.Color := clLime
  else
    pnlVrlFullOpen3B.Color := clRed;
          }
  {$ENDREGION}

end;

end.
