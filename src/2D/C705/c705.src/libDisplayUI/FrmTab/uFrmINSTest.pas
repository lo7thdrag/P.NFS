unit uFrmINSTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmINSTest = class(TForm)
    Bevel2: TBevel;
    Label51: TLabel;
    Label53: TLabel;
    Label1: TLabel;
    edtInputMissileNumINSTest: TEdit;
    Panel1: TPanel;
    Label9: TLabel;
    pnlMissileNumb1: TPanel;
    lblMissileNumVal: TLabel;
    pnlMissileNumb2: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    pnlSLong1: TPanel;
    pnlSLong2: TPanel;
    lblSLong2: TLabel;
    Panel3: TPanel;
    Label6: TLabel;
    pnlSLat1: TPanel;
    pnlSLat2: TPanel;
    Panel4: TPanel;
    Label10: TLabel;
    pnlMLong1: TPanel;
    pnlMLong2: TPanel;
    Panel5: TPanel;
    Label13: TLabel;
    pnlMLat1: TPanel;
    pnlMLat2: TPanel;
    Panel6: TPanel;
    Label16: TLabel;
    pnlNortwardErr1: TPanel;
    pnlNortwardErr2: TPanel;
    Panel7: TPanel;
    Label19: TLabel;
    pnlEastwardErr1: TPanel;
    pnlEastwardErr2: TPanel;
    Panel8: TPanel;
    Label22: TLabel;
    pnlPositionErr1: TPanel;
    pnlPositionErr2: TPanel;
    lblSLat2: TLabel;
    lblMLong2: TLabel;
    lblMLat2: TLabel;
    lblNortwardErr2: TLabel;
    lblEastwardErr2: TLabel;
    lblPositionErr2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmINSTest: TfrmINSTest;

implementation

{$R *.dfm}

procedure TfrmINSTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmINSTest.FormCreate(Sender: TObject);
begin
  Align := alClient;
end;

procedure TfrmINSTest.FormShow(Sender: TObject);
begin
  //
end;

end.
