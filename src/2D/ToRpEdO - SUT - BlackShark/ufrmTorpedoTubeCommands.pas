unit ufrmTorpedoTubeCommands;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTorpedoTubeCommands = class(TForm)
    pnlMain: TPanel;
    lblTorpCmds: TLabel;
    lblTubeCmds: TLabel;
    lblUnload: TLabel;
    lblTorpOn: TLabel;
    lblSetReady: TLabel;
    lblSendCmd: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoTubeCommands: TfrmTorpedoTubeCommands;

implementation

{$R *.dfm}

end.
