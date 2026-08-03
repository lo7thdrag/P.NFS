unit ufrmEngagementDataOverview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uSutBlacksharkManager,
  uTorpedoTrack, uVehicleManager, AdvTrackBar;

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
    Label8: TLabel;
    lblRunDist: TLabel;
    Label10: TLabel;
    advrSliderTorpRuntime1: TAdvRangeSlider;
    advrSliderTorpRuntime2: TAdvRangeSlider;
    Panel2: TPanel;
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
var
  Torp: TTorpedoTrack;
  aCnv: TCanvas;
  ElapsedMin, RemainingMin, TotalMin : Double;
  BarWidth, BarHeight, MidHeight : Integer;
  ElapsedWidth, RemainingWidth : Integer;
begin
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);

  if Torp <> nil then
  begin
    aCnv := pbTrackBar.Canvas;

    ElapsedMin := (Now - Torp.TimeLaunch) / 1440;
    RemainingMin := Torp.SearchTime / 1440;
    TotalMin := Round(ElapsedMin + RemainingMin);
    advrSliderTorpRuntime1.Min := -Round(ElapsedMin);
    advrSliderTorpRuntime1.Max := Round(RemainingMin);
    advrSliderTorpRuntime2.Min := -Round(ElapsedMin);
    advrSliderTorpRuntime2.Max := Round(RemainingMin);

    BarWidth := pbTrackBar.Width;
    BarHeight := pbTrackBar.Height;
    MidHeight := Round(BarHeight/2);

    ElapsedWidth := Round(ElapsedMin / TotalMin * BarWidth);
    RemainingWidth := Round(RemainingMin / TotalMin * BarWidth);

    {$REGION 'Elapsed Trial'}
    aCnv.Pen.Color := clBlack;
    aCnv.Pen.Style := psClear;
    aCnv.Pen.Width := 1;
    aCnv.Brush.Color := RGB(150,75,0); // Coklat
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(0, 0, ElapsedWidth, MidHeight -1);
    {$ENDREGION}

    {$REGION 'Remaining Trial'}
    aCnv.Brush.Color := clYellow;
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(ElapsedWidth, 0, RemainingWidth, MidHeight -1);
    {$ENDREGION}

    {$REGION 'Elapsed Official'}
    aCnv.Brush.Color := RGB(150,75,0);; // Coklat
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(0, MidHeight +1, ElapsedWidth, BarHeight);
    {$ENDREGION}

    {$REGION 'Remaining Official'}
    aCnv.Brush.Color := clGreen;
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(ElapsedWidth, MidHeight +1, RemainingWidth, BarHeight);
    {$ENDREGION}
  end
  else
  begin
    advrSliderTorpRuntime1.Min := 0;
    advrSliderTorpRuntime1.Max := 35;
    advrSliderTorpRuntime2.Min := 0;
    advrSliderTorpRuntime2.Max := 35;

    {$REGION 'Trial'}
    aCnv.Pen.Color := clBlack;
    aCnv.Pen.Style := psClear;
    aCnv.Pen.Width := 1;
    aCnv.Brush.Color := clYellow;
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(0, 0, BarWidth, MidHeight -1);
    {$ENDREGION}

    {$REGION 'Official'}
    aCnv.Brush.Color := clGreen;
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(0, MidHeight +1, BarWidth, BarHeight);
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

    lblSearchTime.Caption := FormatDateTime('hh:nn:ss', Torp.SearchTime/86400);
    lblSearchLength.Caption := FormatFloat('0.0', Torp.SearchLength/1000);

    lblRunDist.Caption := FormatFloat('0.0', Torp.RunDistance - (Torp.RunLength / 1000));
//    lblWireLeft.Caption := FormatFloat('0.0', Torp.CurrentWireLeft / 1000);
  end;

  pbTrackBar.Invalidate;
end;

end.
