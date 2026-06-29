unit ufrmCursor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmCursor = class(TForm)
    pnlMain: TPanel;
    cbCursorPosition: TComboBox;
    lblLat: TLabel;
    lblLong: TLabel;
    Label3: TLabel;
    lblDepth: TLabel;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCursor: TfrmCursor;

implementation

{$R *.dfm}

end.
