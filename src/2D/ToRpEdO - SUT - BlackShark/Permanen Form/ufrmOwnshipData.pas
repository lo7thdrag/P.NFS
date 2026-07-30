unit ufrmOwnshipData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uTCPDatatype, uBaseFunction,

  uSutBlacksharkManager, uVehicleManager, uTorpedoTrack, uTrackFunction, uSimulationTrack;

type
  TfrmOwnshipData = class(TForm)
    pnlMain: TPanel;
    lblTime: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblHeading: TLabel;
    lblSOG: TLabel;
    lblDepth: TLabel;
    lblLatt: TLabel;
    lblLong: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    tmrOwnshipData: TTimer;
    procedure tmrOwnshipDataTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOwnshipData: TfrmOwnshipData;

implementation

{$R *.dfm}

procedure TfrmOwnshipData.tmrOwnshipDataTimer(Sender: TObject);
var
  i: Integer;
  OwnShip: TSimulationTrack;
begin
  OwnShip := nil;

  for i := 0 to VehicleMgr.ObjectList.Count - 1 do
  begin
    if TSimulationTrack(VehicleMgr.ObjectList[i]).ShipID = UniqueID_To_dbID(SutBlacksharkManager.xShip.UniqueID) then
    begin
      OwnShip := TSimulationTrack(VehicleMgr.ObjectList[i]);
      Break;
    end;
  end;

  if Assigned(OwnShip) then
  begin
    lblTime.Caption := FormatDateTime('dd/MMMM/yyyy   hh:mm:ss', Now);

    lblLatt.Caption    := dmsLatitude(OwnShip.PosY);
    lblLatt.Font.Color := clLime;

    lblLong.Caption    := dmsLongitude(OwnShip.PosX);
    lblLong.Font.Color := clLime;

    lblDepth.Caption    := FormatFloat('0.0', OwnShip.PosZ);
    lblDepth.Font.Color := clLime;

    lblSOG.Caption     := FormatFloat('0.0', OwnShip.Speed_knot);
    lblSOG.Font.Color  := clLime;

    lblHeading.Caption := FormatFloat('0.0', OwnShip.HeadingDeg);
    lblHeading.Font.Color := clLime;
  end;
end;

end.
