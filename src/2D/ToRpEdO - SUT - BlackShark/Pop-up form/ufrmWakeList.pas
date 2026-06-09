unit ufrmWakeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmWakeList = class(TForm)
    pnlMain: TPanel;
    lvWakeList: TListView;
    lblReset: TLabel;
    lblClose: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWakeList: TfrmWakeList;

implementation

{$R *.dfm}

end.
