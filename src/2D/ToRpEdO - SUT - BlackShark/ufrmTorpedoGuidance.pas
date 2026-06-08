unit ufrmTorpedoGuidance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  AdvSmoothTabPager;

type
  TfrmTorpedoGuidanceWindow = class(TForm)
    pnlMain: TPanel;
    TabTorpedoGuidance: TAdvSmoothTabPager;
    TabTorpedoControl: TAdvSmoothTabPage;
    TabSpecialSettings: TAdvSmoothTabPage;
    rbTorpedo: TRadioButton;
    lbl1: TLabel;
    rbSalvo: TRadioButton;
    Label1: TLabel;
    lblMSIGuidance: TLabel;
    lblTorpIntGuidance: TLabel;
    lblMainGuidance: TLabel;
    lblHoming: TLabel;
    lblSurftoSubmode: TLabel;
    lblTosoActImmed: TLabel;
    lblToSoActOff: TLabel;
    lblFuseOn: TLabel;
    lblFuseOff: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoGuidanceWindow: TfrmTorpedoGuidanceWindow;

implementation

{$R *.dfm}

end.
