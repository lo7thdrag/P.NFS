unit ufrmPasswordEntryCode;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmPasswordEntryCode = class(TForm)
    pnlBackground: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtPassword: TEdit;
    btnOk: TButton;
    procedure edtPasswordChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FisEnter: Boolean;
  public
    { Public declarations }
  end;

var
  frmPasswordEntryCode: TfrmPasswordEntryCode;

implementation

{$R *.dfm}

uses
  ufrmMainDisplay;

procedure TfrmPasswordEntryCode.btnOkClick(Sender: TObject);
begin
  if btnOk.Enabled then
  begin
    FisEnter := True;
    frmMainDisplay.Show;
    Close;
  end;
end;

procedure TfrmPasswordEntryCode.edtPasswordChange(Sender: TObject);
begin
  if Length(edtPassword.Text) > 0 then
    btnOk.Enabled := True
  else
    btnOk.Enabled := False;
end;

procedure TfrmPasswordEntryCode.edtPasswordKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    btnOk.Click;
end;

procedure TfrmPasswordEntryCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not FisEnter then
  begin
    Application.Terminate;
  end;
  FisEnter := False;
  Action := caNone;
  Hide;
end;

procedure TfrmPasswordEntryCode.FormShow(Sender: TObject);
begin
  frmPasswordEntryCode.Activate;
  edtPassword.Text := '';
  edtPassword.SetFocus;
  PostMessage(frmPasswordEntryCode.Handle, WM_SETFOCUS, 0, 0);
  edtPassword.SelStart :=0;
  edtPassword.SelLength := 0;
end;

end.
