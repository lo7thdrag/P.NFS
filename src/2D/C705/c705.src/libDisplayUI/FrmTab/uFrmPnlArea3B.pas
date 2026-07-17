unit uFrmPnlArea3B;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,
  uC705SimManager;

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
    lblAligmentStatus3B: TLabel;
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
    {$ENDREGION}
  private
    { Private declarations }
    //PanelArea3B
    procedure SetAll3BLedOff;
    procedure UpdateStatusPanel3B;
  public
    { Public declarations }
    procedure InitSimulation;
    procedure StatusWeaponConsoleChanged(Sender:TObject; aStatus: TC705StatusType);
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

procedure TfrmPnlArea3B.StatusWeaponConsoleChanged(Sender: TObject;
  aStatus: TC705StatusType);
begin
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
begin
  // POWER
  if SimManager.C705Status.EnableWeapon then begin
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
  if SimManager.C705Status.SafetyIgnition then
    pnlVrlBoosterArm3B.Color := clLime
  else
    pnlVrlBoosterArm3B.Color := clRed;

  // Warm Up; WarmUp
  if SimManager.C705Status.WarmUpDone then
    pnlVrlWarmUp3B.Color := clLime
  else begin
    // Sedang proses Warm-up
    if SimManager.C705Status.EnableWeapon then
      pnlVrlWarmUp3B.Color := clYellow
    else
      pnlVrlWarmUp3B.Color := clGray;
  end;

  // SEEKER
  if SimManager.C705Status.SeekerReady then
    pnlVrlSeeker3B.Color := clLime
  else
  begin
    if SimManager.C705Status.EnableWeapon then
      pnlVrlSeeker3B.Color := clRed
    else
      pnlVrlSeeker3B.Color := clGray;
  end;
end;

end.
