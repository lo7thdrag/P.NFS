unit ufrmEngagementDataOverview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmEngagementDataOverview = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    lblTime: TLabel;
    Label2: TLabel;
    lblLength: TLabel;
    lblTime1: TLabel;
    lblTime2: TLabel;
    lblLength1: TLabel;
    lblLength2: TLabel;
    Label3: TLabel;
    lblDistance: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    lblDistanceLength: TLabel;
    Label7: TLabel;
    TrackBar1: TTrackBar;
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
