unit ufrmDepthPlot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmDepthPlot = class(TForm)
    pnlMain: TPanel;
    lbl1: TLabel;
    edtMin: TEdit;
    Label1: TLabel;
    edtMax: TEdit;
    Label2: TLabel;
    edtSet: TEdit;
    Label3: TLabel;
    lblSpeedScaleFactor: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDepthPlot: TfrmDepthPlot;

implementation

{$R *.dfm}

end.
