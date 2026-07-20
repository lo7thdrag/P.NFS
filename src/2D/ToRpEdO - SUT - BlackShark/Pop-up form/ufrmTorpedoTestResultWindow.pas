unit ufrmTorpedoTestResultWindow;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  AdvPageControl, Vcl.ComCtrls,

  uSutBlacksharkManager, uTorpedoLauncher, uVehicleManager;

type
  TfrmTorpedoStatusResultsWindow = class(TForm)
    pnlMain: TPanel;
    AdvPageTorpedoCheck: TAdvPageControl;
    advTorp1: TAdvTabSheet;
    AdvTorp2: TAdvTabSheet;
    AdvTorp3: TAdvTabSheet;
    AdvTorp4: TAdvTabSheet;
    AdvTorp5: TAdvTabSheet;
    AdvTorp6: TAdvTabSheet;
    AdvTorp7: TAdvTabSheet;
    advTorp8: TAdvTabSheet;
    AdvTBI: TAdvTabSheet;
    Label1: TLabel;
    lblClose: TLabel;
    AdvTorpedoCheckTBI: TAdvPageControl;
    AdvPort: TAdvTabSheet;
    lblCPUPS: TLabel;
    lblInternalPS: TLabel;
    lblFP1PS: TLabel;
    lblFP2PS: TLabel;
    lblInternalEthernetlPS: TLabel;
    lblCMCRaconPS: TLabel;
    lblCMCPortPS: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label24: TLabel;
    Label4: TLabel;
    AdvStartboard: TAdvTabSheet;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    lblSensor1PS: TLabel;
    lblSensor2PS: TLabel;
    Label22: TLabel;
    lblSensor3PS: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    lblTBI115PS: TLabel;
    lblTBITRLPS: TLabel;
    lblExternalTorpPS: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    lblACPS: TLabel;
    Label38: TLabel;
    lbl24VPS: TLabel;
    Label40: TLabel;
    lbl28VPS: TLabel;
    Label42: TLabel;
    lbl48VPS: TLabel;
    Label44: TLabel;
    lbl220VDCPS: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    lblCPUSB: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    lblInternalSB: TLabel;
    lblFP1SB: TLabel;
    lblFP2SB: TLabel;
    lblInternalEthernetlSB: TLabel;
    lblCMCRaconSB: TLabel;
    lblCMCPortSB: TLabel;
    Label53: TLabel;
    lblSensor2SB: TLabel;
    lblSensor3SB: TLabel;
    lblTBI115SB: TLabel;
    lblTBITRLSB: TLabel;
    lblExternalTorpSB: TLabel;
    lblACSB: TLabel;
    lbl24VSB: TLabel;
    lbl28VSB: TLabel;
    lbl48VSB: TLabel;
    lbl220VDCSB: TLabel;
    AdvTorpedoCheckStatus: TAdvPageControl;
    AdvTorpedoStatus: TAdvTabSheet;
    AdvWCMOnlineStatus: TAdvTabSheet;
    Label8: TLabel;
    lblCPUWCM: TLabel;
    Label47: TLabel;
    lblInputOutputBoard1: TLabel;
    Label48: TLabel;
    lblInputOutputBoard2: TLabel;
    Label49: TLabel;
    lblCommunicationBoard: TLabel;
    Label50: TLabel;
    lblBatteryMonitor: TLabel;
    Label51: TLabel;
    lblTorpedoVDC: TLabel;
    Label52: TLabel;
    lblTorpedoVAC: TLabel;
    Label54: TLabel;
    lbl48V: TLabel;
    Label55: TLabel;
    lbl24V: TLabel;
    AdvWCMOfflineStatus: TAdvTabSheet;
    Label56: TLabel;
    lblCPUWCMOffline: TLabel;
    Label57: TLabel;
    lblInputOutputBoard1Offline: TLabel;
    Label58: TLabel;
    lblInputOutputBoard2Offline: TLabel;
    Label59: TLabel;
    lblPowerSupply5V: TLabel;
    Label60: TLabel;
    lblBatteryWCMOffline: TLabel;
    Label61: TLabel;
    lblVDCOffline: TLabel;
    Label62: TLabel;
    lblVACOffline: TLabel;
    Label63: TLabel;
    lbl48VOffline: TLabel;
    Label64: TLabel;
    lbl24VOffline: TLabel;
    Label65: TLabel;
    lblTimeWCMOffline: TLabel;
    Label66: TLabel;
    lblPowerSupply12V: TLabel;
    Label67: TLabel;
    lblWatchDog: TLabel;
    lbl1: TLabel;
    lblSerialLines: TLabel;
    Label68: TLabel;
    lbl24VCommBoard: TLabel;
    AdvTorpedoCheckReport: TAdvPageControl;
    AdvBISTReport: TAdvTabSheet;
    lblAfterBody: TLabel;
    lblMotorSection: TLabel;
    lblGuidance: TLabel;
    lblBattery: TLabel;
    lblAFI: TLabel;
    lblFuse: TLabel;
    lblAcousticHead: TLabel;
    lblTorpedoRunning: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    AdvSynthesisReport: TAdvTabSheet;
    Label77: TLabel;
    lblABSynthesis: TLabel;
    Label78: TLabel;
    lblMSSynthesis: TLabel;
    Label79: TLabel;
    lblGuidanceSynthesis: TLabel;
    Label80: TLabel;
    lblAFISynthesis: TLabel;
    Label81: TLabel;
    lblFuseSynthesis: TLabel;
    Label82: TLabel;
    lblAHSynthesis: TLabel;
    Label83: TLabel;
    lblTRSynthesis: TLabel;
    Label84: TLabel;
    lblBatterySynthesis: TLabel;
    Label85: TLabel;
    lblTimeSynthesis: TLabel;
    Label86: TLabel;
    lblTorpedoHead: TLabel;
    Label87: TLabel;
    lblExerciseHead: TLabel;
    procedure lblCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  frmTorpedoStatusResultsWindow: TfrmTorpedoStatusResultsWindow;

implementation


uses
  ufrmTorpedoTubeStatusWindow;

{$R *.dfm}

procedure TfrmTorpedoStatusResultsWindow.FormShow(Sender: TObject);
begin
  lblTimeSynthesis.Caption    := FormatDateTime('dd/MMMM/yyyy     hh:mm:ss', Now);
  lblTimeSynthesis.Font.Color := clLime;
  lblTimeSynthesis.Visible    := True;

  {$REGION 'Synthesis Report'}
  lblBatterySynthesis.Visible  := True;
  lblTorpedoHead.Visible       := True;
  lblABSynthesis.Visible       := True;
  lblMSSynthesis.Visible       := True;
  lblGuidanceSynthesis.Visible := True;
  lblAFISynthesis.Visible      := True;
  lblFuseSynthesis.Visible     := True;
  lblAHSynthesis.Visible       := True;
  lblTRSynthesis.Visible       := True;
  lblExerciseHead.Visible      := True;
  {$ENDREGION}

  {$REGION 'BIST Report'}
  lblAfterBody.Visible      := True;
  lblMotorSection.Visible   := True;
  lblGuidance.Visible       := True;
  lblBattery.Visible        := True;
  lblAFI.Visible            := True;
  lblFuse.Visible           := True;
  lblAcousticHead.Visible   := True;
  lblTorpedoRunning.Visible := True;
  {$ENDREGION}

  {$REGION 'WCM Online Status'}
  lblBatteryMonitor.Visible     := True;
  lblCommunicationBoard.Visible := True;
  lblCPUWCM.Visible             := True;
  lblInputOutputBoard1.Visible  := True;
  lblInputOutputBoard2.Visible  := True;
  lblTorpedoVAC.Visible         := True;
  lblTorpedoVDC.Visible         := True;
  {$ENDREGION}

  {$REGION 'WCM Online Offline'}
  lbl24VCommBoard.Visible             := True;
  lbl24VOffline.Visible               := True;
  lbl48VOffline.Visible               := True;
  lblBatteryWCMOffline.Visible        := True;
  lblCPUWCMOffline.Visible            := True;
  lblInputOutputBoard1Offline.Visible := True;
  lblInputOutputBoard2Offline.Visible := True;
  lblPowerSupply12V.Visible           := True;
  lblPowerSupply5V.Visible            := True;
  lblSerialLines.Visible              := True;
  lblTimeWCMOffline.Visible           := True;
  lblVACOffline.Visible               := True;
  lblVDCOffline.Visible               := True;
  lblWatchDog.Visible                 := True;
  {$ENDREGION}
end;

procedure TfrmTorpedoStatusResultsWindow.lblCloseClick(Sender: TObject);
begin
  Close;
end;
end.
