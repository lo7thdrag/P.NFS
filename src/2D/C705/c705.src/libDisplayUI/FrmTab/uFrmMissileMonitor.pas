unit uFrmMissileMonitor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmMissileMonitor = class(TForm)
  {$REGION 'Components'}
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    pnlMMonitorHeader: TPanel;
    Panel8: TPanel;
    Label1: TLabel;
    edtInputMissileNumMMon: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    lblMissileState: TLabel;
    lblINSState: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblMissileStep: TLabel;
    lblInPort1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lblINSGNSS: TLabel;
    lblInPort2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblSeerCheck: TLabel;
    lblOutPort1: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lblPLCCHK: TLabel;
    lblOutPort2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  {$ENDREGION}
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMissileMonitor: TfrmMissileMonitor;

implementation

{$R *.dfm}

procedure TfrmMissileMonitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmMissileMonitor.FormCreate(Sender: TObject);
begin
  Align := alClient;
end;

procedure TfrmMissileMonitor.FormShow(Sender: TObject);
begin
  //
end;

end.
