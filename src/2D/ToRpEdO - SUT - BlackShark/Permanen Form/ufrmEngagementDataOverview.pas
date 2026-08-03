unit ufrmEngagementDataOverview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.Math, Vcl.Graphics,
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
    pnlValueMin: TPanel;
    pbMinuteTick: TPaintBox;
    procedure pbTrackBarPaint(Sender: TObject);
    procedure tmrUpdateTorpInfoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pbMinuteTickPaint(Sender: TObject);
  private
    { Private declarations }
    FElapsedMin, FRemainingMin : Double;
  public
    { Public declarations }
  end;

var
  frmEngagementDataOverview: TfrmEngagementDataOverview;

implementation

{$R *.dfm}

procedure TfrmEngagementDataOverview.FormCreate(Sender: TObject);
begin
  FElapsedMin := 0;
  FRemainingMin := 35;
end;

procedure TfrmEngagementDataOverview.pbMinuteTickPaint(Sender: TObject);
var
  aCnv : TCanvas;
  i, pbWidth, pbHeight : Integer;
  currTickX, CurrMin : Integer;
  TotalMin, TickSpacing : Double;
begin
  currTickX := 0;
  aCnv := pbMinuteTick.Canvas;
  pbWidth := pbTrackBar.Width;
  pbHeight := pbTrackBar.Height;

  TotalMin := FElapsedMin + FRemainingMin;
  TickSpacing := pbWidth / TotalMin; // jarak antar tick

  aCnv.Pen.Color := clWhite;
  aCnv.Pen.Style := psSolid;
  aCnv.Pen.Width := 1;
  aCnv.Brush.Color := clWhite;
  acnv.Brush.Style := bsClear;
  aCnv.Font.Color := clWhite;
  aCnv.Font.Size := 10;

  for i := 0 to System.Math.Floor(FElapsedMin) do
  begin
    CurrMin := System.Math.Floor(FElapsedMin) - i;
    if i = 0 then
    begin
      currTickX := currTickX + round(TickSpacing * System.Math.FMod(FElapsedMin, 1));
      aCnv.MoveTo(currTickX, 0);
      aCnv.LineTo(currTickX, 4);
    end
    else
    begin
      currTickX := currTickX + Round(TickSpacing);
      aCnv.MoveTo(currTickX, 0);
      aCnv.LineTo(currTickX, 4);
    end;

    if (CurrMin mod 5) = 0 then
    begin
      aCnv.TextOut(currTickX - 3, 6, IntToStr(-CurrMin));
    end;
  end;

  for i := 1 to System.Math.Ceil(FRemainingMin) do
  begin
    CurrMin := i;

    currTickX := currTickX + Round(TickSpacing);
    aCnv.MoveTo(currTickX, 0);
    aCnv.LineTo(currTickX, 4);

    if (CurrMin mod 5) = 0 then
    begin
      aCnv.TextOut(currTickX - 3, 6, IntToStr(CurrMin));
    end;
  end;
end;

procedure TfrmEngagementDataOverview.pbTrackBarPaint(Sender: TObject);
var
  Torp: TTorpedoTrack;
  aCnv: TCanvas;
  ElapsedMin, RemainingMin, TotalMin : Double;
  BarWidth, BarHeight, MidHeight : Integer;
  ElapsedWidth, RemainingWidth : Integer;
begin
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  aCnv := pbTrackBar.Canvas;
  BarWidth := pbTrackBar.Width;
  BarHeight := pbTrackBar.Height;
  MidHeight := Round(BarHeight/2);
  if (Torp <> nil) and (Torp.SearchTime <> 0) then
  begin
    ElapsedMin := (Now - Torp.TimeLaunch) * 1440;
    RemainingMin := Torp.SearchTime / 60;
    TotalMin := Round(ElapsedMin + RemainingMin);

    FElapsedMin := ElapsedMin;
    FRemainingMin := RemainingMin;
//    advrSliderTorpRuntime1.Min := -Round(ElapsedMin);

    ElapsedWidth := Round(ElapsedMin / TotalMin * BarWidth);
    RemainingWidth := Round(RemainingMin / TotalMin * BarWidth);

    {$REGION 'Elapsed Trial'}
    aCnv.Pen.Color := clBlack;
    aCnv.Pen.Style := psClear;
    aCnv.Pen.Width := 1;
    aCnv.Brush.Color := RGB(181, 122, 63); // Coklat
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(0, 0, ElapsedWidth, MidHeight -1);
    {$ENDREGION}

    {$REGION 'Remaining Trial'}
    aCnv.Brush.Color := clYellow;
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(ElapsedWidth, 0, BarWidth, MidHeight -1);
    {$ENDREGION}

    {$REGION 'Elapsed Official'}
    aCnv.Brush.Color := RGB(181, 122, 63);; // Coklat
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(0, MidHeight +1, ElapsedWidth, BarHeight);
    {$ENDREGION}

    {$REGION 'Remaining Official'}
    aCnv.Brush.Color := clGreen;
    aCnv.Brush.Style := bsSolid;

    aCnv.Rectangle(ElapsedWidth, MidHeight +1, BarWidth, BarHeight);
    {$ENDREGION}

  end
  else
  begin
    FElapsedMin := 0;
    FRemainingMin := 11.2;

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
  pbMinuteTick.Invalidate;
end;

end.
