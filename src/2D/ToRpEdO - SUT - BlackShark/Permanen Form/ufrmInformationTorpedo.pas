unit ufrmInformationTorpedo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uSutBlacksharkManager, uTCPDatatype, uBaseFunction,

  uVehicleManager, ufrmTorpedoParameterDepthSettings, uTorpedoTrack, uTrackFunction, uSimulationTrack, uTestShip, uSubSurfaceTrack;

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

  public
  end;

var
  frmInformationTorpedo: TfrmInformationTorpedo;

implementation

{$R *.dfm}

procedure TfrmInformationTorpedo.tmrInformationTorpedoTimer(Sender: TObject);
var
  i : Integer;
  Torp   : TTorpedoTrack;
  OwnShip: TSimulationTrack;
  rangeTorpedo, bearingTorpedo  : Double;
begin
  Torp := nil;
  OwnShip := nil;

  for i := 0 to VehicleMgr.ObjectList.Count - 1 do
  begin
    if VehicleMgr.ObjectList[i] is TTorpedoTrack then
    begin
      if TTorpedoTrack(VehicleMgr.ObjectList[i]).LauncherID = TorpedoParam.TorpedoIdx then
      begin
        Torp := TTorpedoTrack(VehicleMgr.ObjectList[i]);
        Break;
      end;
    end;
  end;

  for i := 0 to VehicleMgr.ObjectList.Count - 1 do
  begin
    if VehicleMgr.ObjectList[i] is TSimulationTrack then
    begin
      if TSimulationTrack(VehicleMgr.ObjectList[i]).ShipID =
         UniqueID_To_dbID(SutBlacksharkManager.xShip.UniqueID) then
      begin
        OwnShip := TSimulationTrack(VehicleMgr.ObjectList[i]);
        Break;
      end;
    end;
  end;

  if Assigned(TorpedoParam) then
  begin
    lblTorpedoValue.Caption    := IntToStr(TorpedoParam.TorpedoIdx);
    lblTorpedoValue.Font.Color := clLime;

    lblSalvoValue.Caption    := IntToStr(SutBlacksharkManager.SalvoIndex);
    lblSalvoValue.Font.Color := clLime;
  end;

  if Assigned(Torp) then
  begin
    rangeTorpedo   := CalcRange(OwnShip.PosX, OwnShip.PosY,Torp.PosX, Torp.PosY);
    bearingTorpedo := CalcBearing(OwnShip.PosX, OwnShip.PosY,Torp.PosX, Torp.PosY);

    lblBearing.Caption    := FormatFloat('0.0', bearingTorpedo);
    lblBearing.Font.Color := clLime;

    lblRange.Caption    := FormatFloat('0.0', rangeTorpedo * 1.852);
    lblRange.Font.Color := clLime;

    lblCourse.Caption    := FormatFloat('0.0', Torp.HeadingDeg);
    lblCourse.Font.Color := clLime;

    lblSpeed.Caption         := FormatFloat('0.0', Torp.Speed_knot * 0.514444444);
//    TorpedoParam.SearchSpeed := StrToInt(lblSpeed.Caption);
    lblSpeed.Font.Color      := clLime;

    lblDepth.Caption    := FormatFloat('0.0', Abs(Torp.PosZ));
    lblDepth.Font.Color := clLime;
  end;
end;

end.
