unit ufrmTorpedoGuidance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  AdvSmoothTabPager, AdvPageControl, Vcl.ComCtrls, uSutBlacksharkManager, uVehicleManager, uTorpedoTrack,
  uTCPDatatype, ufrmHomingCommands, ufrmManualGuidance;

type
  TfrmTorpedoGuidanceWindow = class(TForm)
    pnlMain: TPanel;
    rbTorpedo: TRadioButton;
    lbl1: TLabel;
    rbSalvo: TRadioButton;
    Label1: TLabel;
    AdvTorpedoGuidance: TAdvPageControl;
    AdvTabTorpedoControl: TAdvTabSheet;
    AdvTabSpecialSettings: TAdvTabSheet;
    lblHoming: TLabel;
    lblManGuidance: TLabel;
    lblMSIGuidance: TLabel;
    lblTorpIntGuidance: TLabel;
    lblFuseOff: TLabel;
    lblFuseOn: TLabel;
    lblSurftoSubmode: TLabel;
    lblTosoActImmed: TLabel;
    lblToSoActOff: TLabel;
    procedure lblHomingClick(Sender: TObject);
    procedure lblManGuidanceClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFrmTorpedoHomingCommand  : TfrmHomingCommands;
    FFrmManualGuidance        : TfrmManualGuidance;

  public
    { Public declarations }
  end;

var
  frmTorpedoGuidanceWindow: TfrmTorpedoGuidanceWindow;

implementation

{$R *.dfm}

uses
  ufrmTorpedoWP;

procedure TfrmTorpedoGuidanceWindow.FormCreate(Sender: TObject);
var
  Torp : TTorpedoTrack;
begin
  //
end;

procedure TfrmTorpedoGuidanceWindow.lblHomingClick(Sender: TObject);
begin
  if not Assigned(FFrmTorpedoHomingCommand) then
  begin
    frmTorpedoWP.pnlTorpedoHomingCmd.Caption := '';

    FFrmTorpedoHomingCommand        := TfrmHomingCommands.Create(Self);
    FFrmTorpedoHomingCommand.Parent := frmTorpedoWP.pnlTorpedoHomingCmd;
    FFrmTorpedoHomingCommand.Align  := alClient;
  end;

  FFrmTorpedoHomingCommand.Show;
  FFrmTorpedoHomingCommand.BringToFront;
end;

procedure TfrmTorpedoGuidanceWindow.lblManGuidanceClick(Sender: TObject);
var
  Torp: TTorpedoTrack;
  RecSend : TRecSetTorpedoSUT;
begin
  if not Assigned(FFrmManualGuidance) then
  begin
    frmTorpedoWP.pnlTorpedoHomingCmd.Caption := '';

    FFrmManualGuidance        := TfrmManualGuidance.Create(Self);
    FFrmManualGuidance.Parent := frmTorpedoWP.pnlTorpedoHomingCmd;
    FFrmManualGuidance.Align  := alClient;
  end;

  FFrmManualGuidance.Show;
  FFrmManualGuidance.BringToFront;
end;

end.
