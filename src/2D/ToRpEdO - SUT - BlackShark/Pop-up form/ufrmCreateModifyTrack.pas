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
    edtDatumTime: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtSpeed: TEdit;
    Label17: TLabel;
    edtDepth: TEdit;
    Label18: TLabel;
    edtError: TEdit;
    Label19: TLabel;
    edtFreeText: TEdit;
    lblApply: TLabel;
    lblReselect: TLabel;
    lblReset: TLabel;
    lblClose: TLabel;
    Panel1: TPanel;
    procedure lblCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
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

procedure TfrmCreateModifyTrack.lblCloseClick(Sender: TObject);
begin
  FreeAndNil(frmCreateModifyTrack);
end;

procedure TfrmCreateModifyTrack.CreateModifyTrackChange;
begin
  if VehicleMgr.IsAnyTrackControlled then
  begin
    edtTrackNo.Text       := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
    edtTrackNo.Font.Color := clLime;

    edtbearing.Text       := FormatFloat('0.0', VehicleMgr.TrackControlled.Bearing);
    edtbearing.Font.Color := clLime;

    edtRange.Text       := FormatFloat('0.0', VehicleMgr.TrackControlled.Range);
    edtRange.Font.Color := clLime;

    edtCourse.Text       := FormatFloat('0.0', VehicleMgr.TrackControlled.HeadingDeg);
    edtCourse.Font.Color := clLime;

    edtSpeed.Text       := FormatFloat('0.0', (VehicleMgr.TrackControlled.Speed_knot * 0.514444444));
    edtSpeed.Font.Color := clLime;

    edtDepth.Text       := FormatFloat('0.0', Abs(VehicleMgr.TrackControlled.PosZ));
    edtDepth.Font.Color := clLime;

    edtDatumTime.Text       := FormatDateTime('dd/MMMM/yyyy  hh:mm:ss', Now);
    edtDatumTime.Font.Color := clLime;

    case VehicleMgr.TrackControlled.Domain of
      1: cbCategory.ItemIndex := 0;
      2: cbCategory.ItemIndex := 2;
      3: cbCategory.ItemIndex := 1;
    end;
  end
end;

end.
