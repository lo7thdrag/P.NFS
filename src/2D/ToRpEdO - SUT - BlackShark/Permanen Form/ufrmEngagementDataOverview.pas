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
begin
  //
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
end;

end.
