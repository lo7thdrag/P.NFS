unit ufrmTorpedoParameterSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmTorpedoParameterSetting = class(TForm)
    pnlMain: TPanel;
    pbTorpedoParameter: TPaintBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoParameterSetting: TfrmTorpedoParameterSetting;

implementation

{$R *.dfm}

end.
