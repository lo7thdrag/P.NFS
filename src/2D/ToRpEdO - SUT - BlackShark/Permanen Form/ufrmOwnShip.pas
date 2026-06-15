unit ufrmOwnShip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmOwnShip = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblTorpedoValue: TLabel;
    lblBearing: TLabel;
    lblRange: TLabel;
    lblCourse: TLabel;
    lblSpeed: TLabel;
    lblDepth: TLabel;
    Label7: TLabel;
    lblSalvoValue: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOwnShip: TfrmOwnShip;

implementation

{$R *.dfm}

end.
