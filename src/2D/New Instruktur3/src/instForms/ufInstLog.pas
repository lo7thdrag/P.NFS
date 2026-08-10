unit ufInstLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmMainLog = class(TForm)
    mmoLog: TMemo;
    mmoConnection: TMemo;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainLog: TfrmMainLog;

implementation

{$R *.dfm}

procedure TfrmMainLog.FormShow(Sender: TObject);
begin
  Self.Caption := 'Instruktur Network Log (v1.2 20260810 1554 LOC SBY)';
end;

end.
