unit ufrmHomingStatusPlot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, AdvSmoothTabPager,
  Vcl.ExtCtrls;

type
  TfrmHomingStatusPlot = class(TForm)
    pnlMain: TPanel;
    TabHomingStatusPlot: TAdvSmoothTabPager;
    TabHomingStatus: TAdvSmoothTabPage;
    TabToSoCoverage: TAdvSmoothTabPage;
    Label1: TLabel;
    lblValTorpedo: TLabel;
    Label2: TLabel;
    lblValContact: TLabel;
    lblToSoHomingPN3D: TLabel;
    lblTgtLostSub: TLabel;
    lblLongRangeAttack: TLabel;
    lblToSotargetacquiredclose: TLabel;
    lblCloseInSub: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHomingStatusPlot: TfrmHomingStatusPlot;

implementation

{$R *.dfm}

end.
