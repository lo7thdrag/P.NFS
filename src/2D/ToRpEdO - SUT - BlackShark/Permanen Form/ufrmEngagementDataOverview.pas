unit ufrmEngagementDataOverview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmEngagementDataOverview = class(TForm)
    pnlMain: TPanel;
    rbBBRFSolution: TRadioGroup;
    Panel1: TPanel;
    Label1: TLabel;
    lblTimeBBRF: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblTime: TLabel;
    lblLength: TLabel;
    lblTime1: TLabel;
    lblLength1: TLabel;
    lblTime2: TLabel;
    lblLength2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblDistance: TLabel;
    lblDistanceLength: TLabel;
    Label6: TLabel;
    Label7: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEngagementDataOverview: TfrmEngagementDataOverview;

implementation

{$R *.dfm}

end.
