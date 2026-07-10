unit ufrmTorpedoTubeCommands;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,

  uSutBlacksharkManager, uTorpedoLauncher;

type
  TfrmTorpedoTubeCommands = class(TForm)
    pnlMain: TPanel;
    lblTorpCmds: TLabel;
    lblTubeCmds: TLabel;
    lblUnload: TLabel;
    lblTorpOn: TLabel;
    lblSetReady: TLabel;
    lblSendCmd: TLabel;
    procedure lblTorpOnClick(Sender: TObject);
    procedure lblSendCmdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoTubeCommands: TfrmTorpedoTubeCommands;

implementation

uses
  ufrmTorpedoTubeStatusWindow;

{$R *.dfm}

procedure TfrmTorpedoTubeCommands.lblSendCmdClick(Sender: TObject);
begin
  lblSendCmd.Font.Color := clLime;


end;

procedure TfrmTorpedoTubeCommands.lblTorpOnClick(Sender: TObject);
var
  i : Integer;
begin
  lblTorpOn.Font.Color := clLime;

  for i := 0 to 7 do
  begin
    if SutBlacksharkManager.FTorpedoArray[i].Allocated then
      SutBlacksharkManager.FTorpedoArray[i].TextStatus := stTesting;
  end;
  frmTorpedoTubeStatusWindow.UpdateTextStatus;
end;

end.
