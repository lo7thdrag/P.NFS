unit ufrmHomingCommands;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, VrControls,
  VrButtons;

type
  TfrmHomingCommands = class(TForm)
    pnlMain: TPanel;
    btnAutoAcoustic: TVrDemoButton;
    btnToSoPN: TVrDemoButton;
    btnToSoPN3D: TVrDemoButton;
    btnToSoDPC: TVrDemoButton;
    btnWake: TVrDemoButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHomingCommands: TfrmHomingCommands;

implementation

{$R *.dfm}

end.
