unit ufrmTorpedoGuidance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  AdvSmoothTabPager, AdvPageControl, Vcl.ComCtrls;

type
  TfrmTorpedoGuidanceWindow = class(TForm)
    pnlMain: TPanel;
    rbTorpedo: TRadioButton;
    lbl1: TLabel;
    rbSalvo: TRadioButton;
    Label1: TLabel;
    AdvTorpedoGuidance: TAdvPageControl;
    AdvTabTorpedoControl: TAdvTabSheet;
    AdvTabSpecialSettings: TAdvTabSheet;
    lblHoming: TLabel;
    lblMainGuidance: TLabel;
    lblMSIGuidance: TLabel;
    lblTorpIntGuidance: TLabel;
    lblFuseOff: TLabel;
    lblFuseOn: TLabel;
    lblSurftoSubmode: TLabel;
    lblTosoActImmed: TLabel;
    lblToSoActOff: TLabel;
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
