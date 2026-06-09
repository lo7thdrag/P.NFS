unit ufrmTorpedoContactList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmTorpedoContactList = class(TForm)
    pnlMain: TPanel;
    lvTorpedoContactList: TListView;
    lblReset: TLabel;
    lblClose: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoContactList: TfrmTorpedoContactList;

implementation

{$R *.dfm}

end.
