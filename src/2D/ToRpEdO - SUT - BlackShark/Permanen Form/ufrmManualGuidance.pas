unit ufrmManualGuidance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmManualGuidance = class(TForm)
    pnlMain: TPanel;
    lblManualGuidance: TLabel;
    lblDegMinus: TLabel;
    lblDegPlus: TLabel;
    lblcourse: TLabel;
    edtCourse: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManualGuidance: TfrmManualGuidance;

implementation

{$R *.dfm}

end.
