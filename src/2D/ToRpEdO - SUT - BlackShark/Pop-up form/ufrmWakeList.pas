unit ufrmWakeList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, uSutBlacksharkManager;

type
  TfrmWakeList = class(TForm)
    pnlMain: TPanel;
    lvWakeList: TListView;
    lblReset: TLabel;
    lblClose: TLabel;
    procedure lblCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWakeList: TfrmWakeList;

implementation

{$R *.dfm}

procedure TfrmWakeList.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmWakeList);
end;

end.
