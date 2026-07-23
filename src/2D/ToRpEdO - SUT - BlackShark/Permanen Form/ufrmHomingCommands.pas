unit ufrmHomingCommands;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, VrControls,
  VrButtons, uVehicleManager, uTorpedoTrack, uSutBlacksharkManager, uTCPDatatype,

  ufrmHomingStatusPlot;

type
  TfrmHomingCommands = class(TForm)
    pnlMain: TPanel;
    btnAutoAcoustic: TVrDemoButton;
    btnToSoPN: TVrDemoButton;
    btnToSoPN3D: TVrDemoButton;
    btnToSoDPC: TVrDemoButton;
    btnWake: TVrDemoButton;
    procedure btnToSoPNClick(Sender: TObject);
  private
    FfrmHomingStatusPlot : TfrmHomingStatusPlot;
  public
    { Public declarations }
  end;

var
  frmHomingCommands: TfrmHomingCommands;

implementation

uses
  ufrmTorpedoWP;

{$R *.dfm}

procedure TfrmHomingCommands.btnToSoPNClick(Sender: TObject);
var
  Torp: TTorpedoTrack;
  RecSend : TRecSetTorpedoSUT;
begin
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  if Torp <> nil then
  begin
    Torp.TorpGuidanceMode := gmHoming;

    RecSend.ShipID              := SutBlacksharkManager.ShipID;
    RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID         := SutBlacksharkManager.TorpedoTubeAllocNum; // allocated launcher/tube
    RecSend.mMissileID          := 1; // selalu 1
    RecSend.mMissileNumber      := 1; // selalu 1
    RecSend.mT_ID               := VehicleMgr.TrackControlled.ShipID;
    RecSend.OrderID             := __ORD_TORPEDOSUT_Homing;
    RecSend.mMissileType        := 0;
    RecSend.mTorpedoCourse      := TorpedoParam.ApproachCourse; // diambil dari torpedo param, automatis di set saat start analysis

    RecSend.mTorpedoSpeed       := 25;

    RecSend.mTorpedoDepth       := TorpedoParam.SearchDepth;
    RecSend.mTorpedoSafeDistance:= TorpedoParam.ProtectionRadius; // satuan meter
    RecSend.mTorpedoEnDis       := TorpedoParam.EnablingDist; // satuan Km
    RecSend.mpredm              := 0;
    RecSend.mTargetType         := VehicleMgr.TrackControlled.Domain;

    SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);

    Torp.SpeedMS := 25;
  end;


//  if not Assigned(frmHomingStatusPlot) then
//  begin
//    frmTorpedoWP.pnlTorpedoHomingStatusPlot.Caption := '';
//
//    frmHomingStatusPlot        := TfrmHomingStatusPlot.Create(Self);
//    frmHomingStatusPlot.Parent := frmTorpedoWP.pnlTorpedoHomingStatusPlot;
//    frmHomingStatusPlot.Align  := alClient;
//  end;
//
//  frmHomingStatusPlot.Show;
//  frmHomingStatusPlot.BringToFront;


end;

end.
