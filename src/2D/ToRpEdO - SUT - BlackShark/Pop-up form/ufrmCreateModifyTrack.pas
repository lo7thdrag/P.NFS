unit ufrmCreateModifyTrack;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,

  uVehicleManager, uSutBlacksharkManager, uSubSurfaceTrack, uSurfaceTrack, uSimulationTrack, uTCPDatatype;

type
  TfrmCreateModifyTrack = class(TForm)
    pnlMain: TPanel;
    lbl1: TLabel;
    edtTrackNo: TEdit;
    Label1: TLabel;
    lblSource: TLabel;
    Label2: TLabel;
    cbTrackType: TComboBox;
    Label3: TLabel;
    cbCategory: TComboBox;
    Label4: TLabel;
    cbIdentity: TComboBox;
    Label5: TLabel;
    cbPlatform: TComboBox;
    Label6: TLabel;
    cbType: TComboBox;
    Label7: TLabel;
    cbActivity: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    cbSubmarineConf: TComboBox;
    Label10: TLabel;
    cbDataReport: TComboBox;
    Label11: TLabel;
    cbEstimatedDepth: TComboBox;
    cbPositionFormat: TComboBox;
    Label12: TLabel;
    edtbearing: TEdit;
    Label13: TLabel;
    edtRange: TEdit;
    cbRange: TComboBox;
    Label14: TLabel;
    edtCourse: TEdit;
    Label16: TLabel;
    edtSpeed: TEdit;
    Label17: TLabel;
    edtDepth: TEdit;
    Label19: TLabel;
    edtFreeText: TEdit;
    lblApply: TLabel;
    lblReselect: TLabel;
    lblReset: TLabel;
    lblClose: TLabel;
    Panel1: TPanel;
    cbTrackQuality: TComboBox;
    lblTrackQuality: TLabel;
    lblDataValidTime: TLabel;
    edtDataValidTime: TEdit;
    procedure lblCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbIdentityChange(Sender: TObject);
    procedure lblApplyClick(Sender: TObject);
    procedure lblResetClick(Sender: TObject);
    procedure lblReselectClick(Sender: TObject);
  private
    { Private declarations }
    SelectedTrack : TSimulationTrack;
  public
    procedure CreateModifyTrackChange;
  end;

var
  frmCreateModifyTrack: TfrmCreateModifyTrack;

implementation

{$R *.dfm}

procedure TfrmCreateModifyTrack.FormShow(Sender: TObject);
begin
  CreateModifyTrackChange;
end;

procedure TfrmCreateModifyTrack.lblApplyClick(Sender: TObject);
var
  SubTrack: TSubSurfaceTrack;
begin
  if not VehicleMgr.IsAnyTrackControlled then
    Exit;

  with VehicleMgr.TrackControlled do
  begin
    MSITrackNumber := StrToIntDef(edtTrackNo.Text, MSITrackNumber);
    Bearing        := StrToFloatDef(edtbearing.Text, Bearing);
    Range          := StrToFloatDef(edtRange.Text, Range);
    HeadingDeg     := StrToFloatDef(edtCourse.Text, HeadingDeg);
    Speed_knot     := StrToFloatDef(edtSpeed.Text, Speed_knot * 0.514444444);
    PosZ           := -Abs(StrToFloatDef(edtDepth.Text, Abs(PosZ)));

    Identity := TIdentity(cbIdentity.ItemIndex);

    case cbCategory.ItemIndex of
      0: Domain := 1;   // surface
      1: Domain := 3;   // air
      2: Domain := 2;   // subsurface
    end;

    FreeText := edtFreeText.Text;
  end;

  if VehicleMgr.TrackControlled is TSubSurfaceTrack then
  begin
    SubTrack                    := TSubSurfaceTrack(VehicleMgr.TrackControlled);
    SubTrack.DataReportType     := TDataReportType(cbDataReport.ItemIndex);
    SubTrack.SubmarineConfLevel := TSubmarineConfLevel(cbSubmarineConf.ItemIndex);
    SubTrack.EstimatedDepth     := TEstimatedDepth(cbEstimatedDepth.ItemIndex);
  end;
  CreateModifyTrackChange;
end;

procedure TfrmCreateModifyTrack.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmCreateModifyTrack);
end;

procedure TfrmCreateModifyTrack.lblReselectClick(Sender: TObject);
begin
  edtTrackNo.Clear;
  edtbearing.Text := '0';
  edtRange.Text   := '0';
  edtCourse.Text  := '0';
  edtSpeed.Text   := '0';
  edtDepth.Text   := '0';
  edtFreeText.Clear;

  cbCategory.ItemIndex := 0;
  cbIdentity.ItemIndex := 0;

//  edtDatumTime.Text := FormatDateTime('dd/MMMM/yyyy hh:mm:ss', Now);

end;

procedure TfrmCreateModifyTrack.lblResetClick(Sender: TObject);
begin
  CreateModifyTrackChange;
end;

procedure TfrmCreateModifyTrack.cbIdentityChange(Sender: TObject);
begin
//  if VehicleMgr.IsAnyTrackControlled then
//    VehicleMgr.TrackControlled.Identity := TIdentity(cbIdentity.ItemIndex);
end;

procedure TfrmCreateModifyTrack.CreateModifyTrackChange;
begin
  if VehicleMgr.IsAnyTrackControlled then
  begin
    edtTrackNo.Text     := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
    edtbearing.Text     := FormatFloat('0.0', VehicleMgr.TrackControlled.Bearing);
    edtRange.Text       := FormatFloat('0.0', VehicleMgr.TrackControlled.Range);
    edtCourse.Text      := FormatFloat('0.0', VehicleMgr.TrackControlled.HeadingDeg);
    edtSpeed.Text       := FormatFloat('0.0', (VehicleMgr.TrackControlled.Speed_knot * 0.514444444));
    edtDepth.Text       := FormatFloat('0.0', Abs(VehicleMgr.TrackControlled.PosZ));
//    edtDatumTime.Text   := FormatDateTime('dd/MMMM/yyyy  hh:mm:ss', Now);

    case VehicleMgr.TrackControlled.Domain of
      1: cbCategory.ItemIndex := 0;
      2: cbCategory.ItemIndex := 2;
      3: cbCategory.ItemIndex := 1;
    end;

    cbIdentity.ItemIndex := Ord(VehicleMgr.TrackControlled.Identity);
  end
end;

end.
