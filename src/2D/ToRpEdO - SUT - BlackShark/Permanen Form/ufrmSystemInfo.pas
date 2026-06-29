unit ufrmSystemInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmSystemInfo = class(TForm)
    pnlMain: TPanel;
    lvEngagementList: TListView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSystemInfo: TfrmSystemInfo;

implementation

{$R *.dfm}

end.
