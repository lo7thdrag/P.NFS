unit ufrmTackHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmTrackHistory = class(TForm)
    pnlMain: TPanel;
    lbl1: TLabel;
    lblTNo: TLabel;
    Label1: TLabel;
    lblCategory: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblPlatform: TLabel;
    Label5: TLabel;
    lblObsTime: TLabel;
    Label7: TLabel;
    lblSpeed: TLabel;
    Label9: TLabel;
    lblCourse: TLabel;
    Label12: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    cbPositionFormat: TComboBox;
    lblLatt: TLabel;
    lblLong: TLabel;
    Label11: TLabel;
    lblCurrentTime: TLabel;
    trkCurrentTime: TTrackBar;
    Label13: TLabel;
    lblStartTime: TLabel;
    Label15: TLabel;
    lblEndTime: TLabel;
    lblRefresh: TLabel;
    lblClose: TLabel;
    Panel2: TPanel;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrackHistory: TfrmTrackHistory;

implementation

{$R *.dfm}

end.
