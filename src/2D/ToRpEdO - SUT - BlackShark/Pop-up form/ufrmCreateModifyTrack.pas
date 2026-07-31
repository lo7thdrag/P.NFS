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
    lblSubmarineConfLevel: TLabel;
    cbSubmarineConf: TComboBox;
    lblDataReportType: TLabel;
    cbDataReportType: TComboBox;
    lblEstimatedDepth: TLabel;
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
    lblDepth: TLabel;
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
    procedure edtTrackNoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FSelectedTrack : TSimulationTrack;
    FisSelected : Boolean;
  public
    procedure CreateModifyTrackChange(Track : TSimulationTrack);
  end;

var
  frmCreateModifyTrack: TfrmCreateModifyTrack;

implementation

{$R *.dfm}

procedure TfrmCreateModifyTrack.FormShow(Sender: TObject);
begin
  FisSelected := False;

  if VehicleMgr.IsAnyTrackControlled then
  begin
    CreateModifyTrackChange(VehicleMgr.TrackControlled);
  end;
end;

procedure TfrmCreateModifyTrack.lblApplyClick(Sender: TObject);
var
  SubTrack: TSubSurfaceTrack;
begin
  with FSelectedTrack do
  begin
    Bearing        := StrToFloatDef(edtbearing.Text, Bearing);
    Range          := StrToFloatDef(edtRange.Text, Range);
    HeadingDeg     := StrToFloatDef(edtCourse.Text, HeadingDeg);
    Speed_knot     := StrToFloatDef(edtSpeed.Text, Speed_knot * 0.514444444);
    PosZ           := -Abs(StrToFloatDef(edtDepth.Text, Abs(PosZ)));

    Identity := TIdentity(cbIdentity.ItemIndex);

    case cbCategory.ItemIndex of
      0: Domain := 1;   // surface
      1: Domain := 3;   // Subsurface
//      2: Domain := 2;   // air gaada
    end;

    FreeText := edtFreeText.Text;
  end;

  if FSelectedTrack is TSubSurfaceTrack then
  begin
    SubTrack                    := TSubSurfaceTrack(FSelectedTrack);
//    SubTrack.DataReportType     := TDataReportType(cbDataReportType.ItemIndex);
    SubTrack.SubmarineConfLevel := TSubmarineConfLevel(cbSubmarineConf.ItemIndex);
    SubTrack.EstimatedDepth     := TEstimatedDepth(cbEstimatedDepth.ItemIndex);
  end;
//  CreateModifyTrackChange;
end;

procedure TfrmCreateModifyTrack.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmCreateModifyTrack);
end;

procedure TfrmCreateModifyTrack.lblReselectClick(Sender: TObject);
begin
  edtTrackNo.Clear;
  edtTrackNo.ReadOnly := False;
  edtbearing.Text := '0';
  edtRange.Text   := '0';
  edtCourse.Text  := '0';
  edtSpeed.Text   := '0';
  edtFreeText.Clear;

  cbCategory.ItemIndex := 0;
  cbIdentity.ItemIndex := 0;

  // invis yang submarine
  lblSubmarineConfLevel.Visible := False;
  cbSubmarineConf.Visible := False;
  lblDataReportType.Visible := False;
  cbDataReportType.Visible := False;
  lblEstimatedDepth.Visible := False;
  cbEstimatedDepth.Visible := false;
  lblDepth.Visible := False;
  edtDepth.Visible := false;

  // invis yang surface
  lblTrackQuality.Visible := False;
  cbTrackQuality.Visible := False;
  lblDataValidTime.Visible := False;
  edtDataValidTime.Visible := False;

  // matikan apply dan reset
  FisSelected := False;
  edtTrackNo.ReadOnly := false;
  lblApply.OnClick := nil;
  lblApply.Font.Color := clGray;
  lblReset.OnClick := nil;
  lblReset.Font.Color := clGray;

//  edtDatumTime.Text := FormatDateTime('dd/MMMM/yyyy hh:mm:ss', Now);

end;

procedure TfrmCreateModifyTrack.lblResetClick(Sender: TObject);
begin
  CreateModifyTrackChange(FSelectedTrack);
end;

procedure TfrmCreateModifyTrack.cbIdentityChange(Sender: TObject);
begin
//  if VehicleMgr.IsAnyTrackControlled then
//    VehicleMgr.TrackControlled.Identity := TIdentity(cbIdentity.ItemIndex);
end;

procedure TfrmCreateModifyTrack.CreateModifyTrackChange(Track : TSimulationTrack);
var
  SubTrack : TSubSurfaceTrack;
  SurfTrack : TSurfaceTrack;
begin
  FSelectedTrack := Track;
  edtTrackNo.Text     := IntToStr(FSelectedTrack.MSITrackNumber);
  edtbearing.Text     := FormatFloat('0.0', FSelectedTrack.Bearing);
  edtRange.Text       := FormatFloat('0.0', FSelectedTrack.Range);
  edtCourse.Text      := FormatFloat('0.0', FSelectedTrack.HeadingDeg);
  edtSpeed.Text       := FormatFloat('0.0', (FSelectedTrack.Speed_knot * 0.514444444));

  case FSelectedTrack.Domain of
    1: cbCategory.ItemIndex := 0;
    3: cbCategory.ItemIndex := 1;
  end;

  cbIdentity.ItemIndex := Ord(FSelectedTrack.Identity);
  edtFreeText.Text := FSelectedTrack.FreeText;

  FisSelected := True;
  edtTrackNo.ReadOnly := True;
  lblApply.OnClick := lblApplyClick;
  lblApply.Font.Color := clWhite;
  lblReset.OnClick := lblResetClick;
  lblReset.Font.Color := clWhite;

  if FSelectedTrack.Domain = 1 then
  begin
    // invis yang submarine
    lblSubmarineConfLevel.Visible := False;
    cbSubmarineConf.Visible := False;
    lblDataReportType.Visible := False;
    cbDataReportType.Visible := False;
    lblEstimatedDepth.Visible := False;
    cbEstimatedDepth.Visible := false;
    lblDepth.Visible := False;
    edtDepth.Visible := false;

    // visible yang surface
    lblTrackQuality.Visible := True;
    cbTrackQuality.Visible := True;
    lblDataValidTime.Visible := True;
    edtDataValidTime.Visible := True;

    edtDataValidTime.Text := FormatDateTime('dd/mmm/yy hh:nn:ss', Now);
  end
  else if FSelectedTrack.Domain = 3 then
  begin
    // invis yang surface
    lblTrackQuality.Visible := false;
    cbTrackQuality.Visible := false;
    lblDataValidTime.Visible := false;
    edtDataValidTime.Visible := false;

    // visible yang subsurface
    lblSubmarineConfLevel.Visible := True;
    cbSubmarineConf.Visible := True;
    lblDataReportType.Visible := True;
    cbDataReportType.Visible := True;
    lblEstimatedDepth.Visible := True;
    cbEstimatedDepth.Visible := True;
    lblDepth.Visible := True;
    edtDepth.Visible := True;

    SubTrack := FSelectedTrack as TSubSurfaceTrack;
    cbSubmarineConf.ItemIndex  := Integer(SubTrack.SubmarineConfLevel);
    cbDataReportType.ItemIndex := Integer(SubTrack.DataReportType);
    cbEstimatedDepth.ItemIndex := Integer(SubTrack.EstimatedDepth);
    edtDepth.Text              := FormatFloat('0.0', Abs(SubTrack.PosZ));
  end;
end;

procedure TfrmCreateModifyTrack.edtTrackNoKeyPress(Sender: TObject;
  var Key: Char);

begin
  if not FisSelected then
  begin
    if Key = #13 then // on enter, cari vehicle dengan track tersebut
    begin
      FSelectedTrack := VehicleMgr.FindTrackByTrackNumber(StrToInt(edtTrackNo.Text));
      if FSelectedTrack = nil then
      begin
        SutBlacksharkManager.OperatorMessages := 'Track Number is Invalid';

        Exit;
      end;
      CreateModifyTrackChange(FSelectedTrack);
    end;
  end;
end;

end.
