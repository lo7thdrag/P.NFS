unit ufrmInformationTorpedo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uSutBlacksharkManager,

  uVehicleManager, ufrmTorpedoParameterDepthSettings;

type
  TfrmInformationTorpedo = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblTorpedoValue: TLabel;
    lblBearing: TLabel;
    lblRange: TLabel;
    lblCourse: TLabel;
    lblSpeed: TLabel;
    lblDepth: TLabel;
    Label7: TLabel;
    lblSalvoValue: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    tmrInformationTorpedo: TTimer;
    procedure tmrInformationTorpedoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformationTorpedo: TfrmInformationTorpedo;

implementation

{$R *.dfm}

procedure TfrmInformationTorpedo.tmrInformationTorpedoTimer(Sender: TObject);
begin
  if VehicleMgr.IsAnyTrackControlled then
  begin
    lblTorpedoValue.Caption    := IntToStr(SutBlacksharkManager.TorpedoIndex);
    lblTorpedoValue.Font.Color := clLime;

    lblSalvoValue.Caption    := IntToStr(SutBlacksharkManager.SalvoIndex);
    lblSalvoValue.Font.Color := clLime;

    lblBearing.Caption    := FormatFloat('0.0', VehicleMgr.TrackControlled.Bearing);
    lblBearing.Font.Color := clLime;

    lblRange.Caption    := FormatFloat('0.0', VehicleMgr.TrackControlled.Range);
    lblRange.Font.Color := clLime;

    lblCourse.Caption    := FormatFloat('0.0', VehicleMgr.TrackControlled.HeadingDeg);
    lblCourse.Font.Color := clLime;

    lblSpeed.Caption    := FormatFloat('0.0', (VehicleMgr.TrackControlled.Speed_knot * 0.514444444));
    lblSpeed.Font.Color := clLime;

    lblDepth.Caption    := FormatFloat('0.0', Abs(VehicleMgr.TrackControlled.PosZ));
    lblDepth.Font.Color := clLime;
  end
  else
  begin
    lblTorpedoValue.Caption    := '0.0';
    lblTorpedoValue.Font.Color := clWhite;

    lblSalvoValue.Caption    := '0.0';
    lblSalvoValue.Font.Color := clWhite;

    lblBearing.Caption    := '0.0';
    lblBearing.Font.Color := clWhite;

    lblRange.Caption    := '0.0';
    lblRange.Font.Color := clWhite;

    lblCourse.Caption    := '0.0';
    lblCourse.Font.Color := clWhite;

    lblSpeed.Caption    := '0.0';
    lblSpeed.Font.Color := clWhite;

    lblDepth.Caption    := '0.0';
    lblDepth.Font.Color := clWhite;
  end;
end;

end.
