unit ufrmContactInControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmContactInControl: TfrmContactInControl;

implementation

{$R *.dfm}

end.
