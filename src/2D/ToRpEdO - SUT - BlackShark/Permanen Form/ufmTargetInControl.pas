unit ufmTargetInControl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uVehicleManager;

type
  TfrmTargetInControl = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblTargetTrack: TLabel;
    lblModeTarget: TLabel;
    lblValue: TLabel;
    Label8: TLabel;
    lblBearing: TLabel;
    Label9: TLabel;
    lblDepth: TLabel;
    Label11: TLabel;
    lblRange: TLabel;
    lblCourse: TLabel;
    lblSpeed: TLabel;
    Label7: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lblValue1: TLabel;
    Label15: TLabel;
    lblValue2: TLabel;
    Label17: TLabel;
    lblValue3: TLabel;
    Label19: TLabel;
    lblValue6: TLabel;
    Label21: TLabel;
    lblValue5: TLabel;
    Label23: TLabel;
    lblValue4: TLabel;
    Label25: TLabel;
    tmrUpdateTIC: TTimer;
    procedure tmrUpdateTICTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTargetInControl: TfrmTargetInControl;

implementation

{$R *.dfm}

procedure TfrmTargetInControl.tmrUpdateTICTimer(Sender: TObject);
begin
  if Assigned(VehicleMgr.TrackControlled) then
  begin
    lblTargetTrack.Caption := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
    lblBearing.Caption := FormatFloat('0.0', VehicleMgr.TrackControlled.Bearing);
    lblRange.Caption := FormatFloat('0.0', VehicleMgr.TrackControlled.Range);
    lblCourse.Caption := FormatFloat('0.0', VehicleMgr.TrackControlled.HeadingDeg);
    lblSpeed.Caption := FormatFloat('0.0', (VehicleMgr.TrackControlled.HeadingDeg * 0.514444444));
    lblDepth.Caption := FormatFloat('0.0', Abs(VehicleMgr.TrackControlled.PosZ));
  end

  else
  begin
    lblTargetTrack.Caption := '000000';
    lblBearing.Caption := '0.0';
    lblRange.Caption := '0.0';
    lblCourse.Caption := '0.0';
    lblSpeed.Caption := '0.0';
    lblDepth.Caption := '0.0';
  end;

end;

end.
