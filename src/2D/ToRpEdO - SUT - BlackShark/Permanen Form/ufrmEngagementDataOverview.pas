unit ufrmEngagementDataOverview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uSutBlacksharkManager,
  uTorpedoTrack, uVehicleManager;

type
  TfrmEngagementDataOverview = class(TForm)
    pnlMain: TPanel;
    rbBBRFSolution: TRadioGroup;
    Panel1: TPanel;
    Label1: TLabel;
    lblTimeBBRF: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblRunTime: TLabel;
    lblRunLength: TLabel;
    lblApproachTime: TLabel;
    lblApproachLength: TLabel;
    lblSearchTime: TLabel;
    lblSearchLength: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblBatteryCapacity: TLabel;
    lblWireLeft: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    pbTrackBar: TPaintBox;
    tmrUpdateTorpInfo: TTimer;
    procedure pbTrackBarPaint(Sender: TObject);
    procedure tmrUpdateTorpInfoTimer(Sender: TObject);
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
  XPos    : array[0..14] of Integer  = (10,47,94,148,188,235,282,329,376,423,470,517,564,611,695);
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
    FillRect(Rect(230, 3, 610, 15));

    Brush.Color := clRed;
    FillRect(Rect(610, 3, 650, 15));

    Brush.Color := clGray;
    FillRect(Rect(40, 3, 230, 15));

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
    FillRect(Rect(210, 20, 690, 30));

    Brush.Color := clRed;
    FillRect(Rect(690, 20, 725, 30));

    Brush.Color := clGray;
    FillRect(Rect(40, 20, 210, 30));

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

procedure TfrmEngagementDataOverview.tmrUpdateTorpInfoTimer(Sender: TObject);
var
  Torp: TTorpedoTrack;
begin
 //
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  if Torp <> nil then
  begin
    lblruntime.Caption := FormatDateTime('hh:nn:ss', (Now - Torp.TimeLaunch));
    lblRunLength.Caption := FormatFloat('0.0', Torp.RunLength / 1000);

    lblApproachTime.Caption := FormatDateTime('hh:nn:ss', Torp.ApproachTime/86400);
    lblApproachLength.Caption := FormatFloat('0.0', Torp.ApproachLength);

    lblBatteryCapacity.Caption := FormatFloat('0.0', Torp.BatteryCapacity);
//    lblWireLeft.Caption := FormatFloat('0.0', Torp.CurrentWireLeft / 1000);
  end;
end;

end.
