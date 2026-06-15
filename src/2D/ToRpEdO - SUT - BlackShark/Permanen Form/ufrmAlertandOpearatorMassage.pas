unit ufrmAlertandOpearatorMassage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmAlertsandOpearatorMassage = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    lblOperatorMassage: TLabel;
    pnlAlerts: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlertsandOpearatorMassage: TfrmAlertsandOpearatorMassage;

implementation

{$R *.dfm}

end.
