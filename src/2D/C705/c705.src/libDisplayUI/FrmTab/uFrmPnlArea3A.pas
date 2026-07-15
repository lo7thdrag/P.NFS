unit uFrmPnlArea3A;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VrControls, VrLights,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  uC705SimManager;

type
  TfrmPnlArea3A = class(TForm)
    {$REGION 'Comps'}
    lblBatteryAct3A: TLabel;
    lblBoosterArm3A: TLabel;
    lblBusSupply3A: TLabel;
    lblCalFinished3A: TLabel;
    lblEngine3A: TLabel;
    lblFullOpen3A: TLabel;
    lblIgnition3A: TLabel;
    lblInitChk3A: TLabel;
    lblInitState3A: TLabel;
    lblInsAlign3A: TLabel;
    lblInsGnss3A: TLabel;
    lblInsideSector3A: TLabel;
    lblLandTgt3A: TLabel;
    lblLnchRdy3A: TLabel;
    lblMNormal3A: TLabel;
    lblNavigate3A: TLabel;
    lblParaLocking3A: TLabel;
    lblParaSetting3A: TLabel;
    lblPlcChk3A: TLabel;
    lblPowerOn3A: TLabel;
    lblPwrSwitch3A: TLabel;
    lblSeaTgt3A: TLabel;
    lblSeeker3A: TLabel;
    lblTakeOff3A: TLabel;
    lblWarmup3A: TLabel;
    pnl3ABtm: TPanel;
    pnlStatus3A: TPanel;
    Panel10: TPanel;
    lblAlignmentStatus3A: TLabel;
    Panel11: TPanel;
    lblWarmUpTime3A: TLabel;
    pnlChn3A: TPanel;
    pnl3ATop: TPanel;
    Image1: TImage;
    pnlTrget3A: TPanel;
    pnlTargetNmb3A: TPanel;
    pnlTargetName3A: TPanel;
    pnlTarget3A: TPanel;
    pnlVrlBatteryAct3A: TPanel;
    pnlVrlBoosterArm3A: TPanel;
    pnlVrlBusSupply3A: TPanel;
    pnlVrlCalFinished3A: TPanel;
    pnlVrlEngine3A: TPanel;
    pnlVrlFullOpen3A: TPanel;
    pnlVrlIgnition3A: TPanel;
    pnlVrlInitChk3A: TPanel;
    pnlVrlInitState3A: TPanel;
    pnlVrlInsAlign3A: TPanel;
    pnlVrlInsGnss3A: TPanel;
    pnlVrlInsideSector3A: TPanel;
    pnlVrlLandTgt3A: TPanel;
    pnlVrlLnchRdy3A: TPanel;
    pnlVrlMNormal3A: TPanel;
    pnlVrlNavigate3A: TPanel;
    pnlVrlParaLocking3A: TPanel;
    pnlVrlParaSetting3A: TPanel;
    pnlVrlPlcChk3A: TPanel;
    pnlVrlPowerOn3A: TPanel;
    pnlVrlPwrSwitch3A: TPanel;
    pnlVrlSeaTgt3A: TPanel;
    pnlVrlSeeker3A: TPanel;
    pnlVrlTakeOff3A: TPanel;
    pnlVrlWarmUp3A: TPanel;
    vrlInitState: TVrLights;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    {$ENDREGION}
  private
    { Private declarations }
    //PanelArea3A
    procedure SetAll3ALedOff;

    procedure UpdateStatusPanel3A;
  public
    { Public declarations }
    procedure InitSimulation;
    procedure StatusWeaponConsoleChanged(Sender:TObject; aStatus: TC705StatusType);
  end;

var
  frmPnlArea3A: TfrmPnlArea3A;

implementation

{$R *.dfm}

{ TfrmPnlArea3A }

procedure TfrmPnlArea3A.FormCreate(Sender: TObject);
begin
  SetAll3ALedOff;
end;

procedure TfrmPnlArea3A.FormDestroy(Sender: TObject);
begin
  if Assigned(SimManager) then
    SimManager.UnregisterStatusWeaponEvent(StatusWeaponConsoleChanged);
end;

procedure TfrmPnlArea3A.FormShow(Sender: TObject);
begin
  //
end;

procedure TfrmPnlArea3A.InitSimulation;
begin
  SimManager.RegisterStatusWeaponEvent(StatusWeaponConsoleChanged);
  UpdateStatusPanel3A;
end;

procedure TfrmPnlArea3A.StatusWeaponConsoleChanged(Sender: TObject;
  aStatus: TC705StatusType);
begin
  UpdateStatusPanel3A;
end;

procedure TfrmPnlArea3A.SetAll3ALedOff;
begin
  {$REGION 'SetAll3ALedOff'}
  pnlVrlInitState3A.Color := clGray;
  pnlVrlInsGnss3A.Color := clGray;
  pnlVrlMNormal3A.Color := clGray;
  pnlVrlCalFinished3A.Color := clGray;
  pnlVrlNavigate3A.Color := clGray;
  pnlVrlIgnition3A.Color := clGray;

  pnlVrlPowerOn3A.Color := clGray;
  pnlVrlEngine3A.Color := clGray;
  pnlVrlSeaTgt3A.Color := clGray;
  pnlVrlInsideSector3A.Color := clGray;
  pnlVrlParaSetting3A.Color := clGray;
  pnlVrlTakeOff3A.Color := clGray;

  pnlVrlInitChk3A.Color := clGray;
  pnlVrlWarmUp3A.Color := clGray;
  pnlVrlLandTgt3A.Color := clGray;
  pnlVrlFullOpen3A.Color := clGray;
  pnlVrlParaLocking3A.Color := clGray;

  pnlVrlBusSupply3A.Color := clGray;
  pnlVrlPlcChk3A.Color := clGray;

  pnlVrlBoosterArm3A.Color := clGray;
  pnlVrlBatteryAct3A.Color := clGray;

  pnlVrlSeeker3A.Color := clGray;
  pnlVrlInsAlign3A.Color := clGray;

  pnlVrlLnchRdy3A.Color := clRed;
  pnlVrlPwrSwitch3A.Color := clGray;
  {$ENDREGION}
end;

procedure TfrmPnlArea3A.UpdateStatusPanel3A;
begin
  // POWER
  if SimManager.C705Status.EnableWeapon then begin
    pnlVrlPowerOn3A.Color := clLime;
    pnlVrlBusSupply3A.Color := clLime;
    pnlVrlPwrSwitch3A.Color := clLime;
  end
  else begin
    pnlVrlPowerOn3A.Color := clRed;
    pnlVrlBusSupply3A.Color := clRed;
    pnlVrlPwrSwitch3A.Color := clRed;
  end;

  // SAFETY IGNITION BOOSTER ARM
  if SimManager.C705Status.SafetyIgnition then
    pnlVrlBoosterArm3A.Color := clLime
  else
    pnlVrlBoosterArm3A.Color := clRed;

  // Warm Up; WarmUp
  if SimManager.C705Status.WarmUpDone then
    pnlVrlWarmUp3A.Color := clLime
  else begin
    // Sedang proses Warm-up
    if SimManager.C705Status.EnableWeapon then
      pnlVrlWarmUp3A.Color := clYellow
    else
      pnlVrlWarmUp3A.Color := clGray;
  end;

  // SEEKER
  if SimManager.C705Status.SeekerReady then
    pnlVrlSeeker3A.Color := clLime
  else
  begin
    if SimManager.C705Status.EnableWeapon then
      pnlVrlSeeker3A.Color := clRed
    else
      pnlVrlSeeker3A.Color := clGray;
  end;

end;

end.
