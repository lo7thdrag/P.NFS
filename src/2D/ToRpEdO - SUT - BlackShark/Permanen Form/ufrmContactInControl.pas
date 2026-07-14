unit ufrmContactInControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,

  uSutBlacksharkManager, uTorpedoLauncher, ufrmTorpedoAllocation;

type
  TfrmContactInControl = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    lblTorpedoValue: TLabel;
    Label7: TLabel;
    lblContact: TLabel;
    Label2: TLabel;
    lblBearing: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    lblRange: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    lblVerticalBearing: TLabel;
    Label10: TLabel;
    lblValueRange: TLabel;
    tmrContactInControl: TTimer;
    procedure tmrContactInControlTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContactInControl: TfrmContactInControl;

implementation

{$R *.dfm}

procedure TfrmContactInControl.tmrContactInControlTimer(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to 7 do
  begin
    if SutBlacksharkManager.FTorpedoArray[i].FireRelease then
    begin
      case i of
        0:
        begin
          lblTorpedoValue.caption    := '1';
          lblTorpedoValue.Font.Color := clLime;
        end;
        1:
        begin
          lblTorpedoValue.caption    := '2';
          lblTorpedoValue.Font.Color := clLime;
        end;
        2:
        begin
          lblTorpedoValue.caption    := '3';
          lblTorpedoValue.Font.Color := clLime;
        end;
        3:
        begin
          lblTorpedoValue.caption    := '4';
          lblTorpedoValue.Font.Color := clLime;
        end;
        4:
        begin
          lblTorpedoValue.caption    := '5';
          lblTorpedoValue.Font.Color := clLime;
        end;
        5:
        begin
          lblTorpedoValue.caption    := '6';
          lblTorpedoValue.Font.Color := clLime;
        end;
        6:
        begin
          lblTorpedoValue.caption    := '7';
          lblTorpedoValue.Font.Color := clLime;
        end;
        7:
        begin
          lblTorpedoValue.caption    := '8';
          lblTorpedoValue.Font.Color := clLime;
        end;
      end;
    end;
  end;
end;

end.
