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
    pbTrackBar: TPaintBox;
    procedure pbTrackBarPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEngagementDataOverview: TfrmEngagementDataOverview;

implementation

{$R *.dfm}

procedure TfrmEngagementDataOverview.pbTrackBarPaint(Sender: TObject);
const
  GraphLeft    = 30;
  GraphTop     = 2;
  RightMargin  = 25;
  BottomMargin = 13;

  XLabels : array[0..14] of string   = ('0','','','','','5','','','','','10','','','','min');
  XPos    : array[0..14] of Integer  = (10,35,70,105,140,175,210,245,280,315,350,385,420,452,480);
var
  i : Integer;

  GraphWidth  : Integer;
  GraphHeight : Integer;
begin
  GraphWidth  := pbTrackBar.ClientWidth  - GraphLeft - RightMargin;
  GraphHeight := pbTrackBar.ClientHeight - GraphTop  - BottomMargin;

  with pbTrackBar.Canvas do
  begin
    Brush.Color := clBlack;
    FillRect(pbTrackBar.ClientRect);

    Font.Color := clSilver;
    Font.Size  := 7;

    Pen.Color := clSilver;
    Pen.Width := 1;

    MoveTo(GraphLeft, GraphTop + GraphHeight);
    LineTo(GraphLeft + GraphWidth, GraphTop + GraphHeight);

    for I := Low(XLabels) to High(XLabels) do
    begin
      MoveTo(GraphLeft + XPos[I], GraphTop + GraphHeight - 3);
      LineTo(GraphLeft + XPos[I], GraphTop + GraphHeight + 3);
      TextOut(GraphLeft + XPos[I] - 2, GraphTop + GraphHeight + 2, XLabels[I]);
    end;

    {$REGION 'Bar Top'}
    Brush.Color := clYellow;
    FillRect(Rect(180, 3, 470, 15));

    Brush.Color := clRed;
    FillRect(Rect(450, 3, 480, 15));

    Brush.Color := clGray;
    FillRect(Rect(40, 3, 180, 15));

    //Yellow Bar
    MoveTo(20, 55);
    LineTo(20, 62);

    //Red Bar
    MoveTo(250, 55);
    LineTo(250, 62);

    //Gray Bar
    MoveTo(5, 55);
    LineTo(100, 62);

    {$ENDREGION}

    {$REGION 'Bar Bottom'}
    Brush.Color := clLime;
    FillRect(Rect(160, 20, 500, 30));

    Brush.Color := clRed;
    FillRect(Rect(490, 20, 510, 30));

    Brush.Color := clGray;
    FillRect(Rect(40, 20, 160, 30));

    //Lime Bar
    MoveTo(480, 55);
    LineTo(480, 62);

    //Red Bar
    MoveTo(480, 55);
    LineTo(480, 62);

    //Gray Bar
    MoveTo(480, 55);
    LineTo(480, 62);
    {$ENDREGION}
  end;
end;

end.
