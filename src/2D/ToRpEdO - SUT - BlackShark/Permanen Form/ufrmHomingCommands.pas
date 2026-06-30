unit ufrmHomingCommands;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, VrControls,
  VrButtons,

  ufrmHomingStatusPlot;

type
  TfrmHomingCommands = class(TForm)
    pnlMain: TPanel;
    btnAutoAcoustic: TVrDemoButton;
    btnToSoPN: TVrDemoButton;
    btnToSoPN3D: TVrDemoButton;
    btnToSoDPC: TVrDemoButton;
    btnWake: TVrDemoButton;
    procedure btnToSoPNClick(Sender: TObject);
  private
    FfrmHomingStatusPlot : TfrmHomingStatusPlot;
  public
    { Public declarations }
  end;

var
  frmHomingCommands: TfrmHomingCommands;

implementation

uses
  ufrmTorpedoWP;

{$R *.dfm}

procedure TfrmHomingCommands.btnToSoPNClick(Sender: TObject);
begin
  if not Assigned(FfrmHomingStatusPlot) then
  begin
    frmTorpedoWP.pnlTorpedoHomingStatusPlot.Caption := '';

    FfrmHomingStatusPlot        := TfrmHomingStatusPlot.Create(Self);
    FfrmHomingStatusPlot.Parent := frmTorpedoWP.pnlTorpedoHomingStatusPlot;
    FfrmHomingStatusPlot.Align  := alClient;
  end;

  FfrmHomingStatusPlot.Show;
  FfrmHomingStatusPlot.BringToFront;
end;

end.
