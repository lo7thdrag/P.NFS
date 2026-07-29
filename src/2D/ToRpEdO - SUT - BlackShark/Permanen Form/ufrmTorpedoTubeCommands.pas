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
    tmrStatusTextTorpedo: TTimer;
    procedure lblTorpOnClick(Sender: TObject);
    procedure lblSendCmdClick(Sender: TObject);
    procedure tmrStatusTextTorpedoTimer(Sender: TObject);
  private

  public

  end;

var
  frmTorpedoTubeCommands: TfrmTorpedoTubeCommands;

implementation

uses
  ufrmTorpedoTubeStatusWindow, ufrmTorpedoTestResultWindow;

{$R *.dfm}

procedure TfrmTorpedoTubeCommands.lblSendCmdClick(Sender: TObject);
begin
  lblSendCmd.Font.Color := clLime;

  if (SutBlacksharkManager.FTubeIndex < 0) or (SutBlacksharkManager.FTubeIndex > 7) then
    Exit;

  if SutBlacksharkManager.FTorpedoArray[SutBlacksharkManager.FTubeIndex].Allocated then
  begin
    SutBlacksharkManager.FTorpedoArray[SutBlacksharkManager.FTubeIndex].TextStatus := stTesting;

    frmTorpedoTubeStatusWindow.UpdateTextStatus;

    lblTorpOn.Caption    := 'TORPEDO OFF';
    lblTorpOn.Font.Color := clLime;

    tmrStatusTextTorpedo.Enabled := True;
  end;
end;

procedure TfrmTorpedoTubeCommands.lblTorpOnClick(Sender: TObject);
var
  i : Integer;
begin
  lblTorpOn.Font.Color := clLime;

  for i := 0 to 7 do
  begin
    if SutBlacksharkManager.FTorpedoArray[i].Allocated then
    begin
      SutBlacksharkManager.FTorpedoArray[i].TorpedoOnOff := True;
      lblTorpOn.Caption    := 'TORPEDO ON';
      lblTorpOn.Font.Color := clLime;
    end;
  end;
end;

procedure TfrmTorpedoTubeCommands.tmrStatusTextTorpedoTimer(Sender: TObject);
begin
  tmrStatusTextTorpedo.Enabled := False;

  if (SutBlacksharkManager.FTubeIndex < 0) or (SutBlacksharkManager.FTubeIndex > 7) then
    Exit;

  if SutBlacksharkManager.FTorpedoArray[SutBlacksharkManager.FTubeIndex].Allocated then
  begin
    SutBlacksharkManager.FTorpedoArray[SutBlacksharkManager.FTubeIndex].TextStatus := stTorpReady;
    frmTorpedoTubeStatusWindow.UpdateTextStatus;
  end;
end;

end.
