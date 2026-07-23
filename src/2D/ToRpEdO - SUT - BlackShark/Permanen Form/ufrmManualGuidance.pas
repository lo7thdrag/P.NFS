unit ufrmManualGuidance;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, uTorpedoTrack, uTCPDatatype, uVehicleManager,
  uSutBlacksharkManager;

type
  TfrmManualGuidance = class(TForm)
    pnlMain: TPanel;
    lblcourse: TLabel;
    edtCourse: TEdit;
    pnlManualGuidance: TPanel;
    pnlDegMinus: TPanel;
    pnlDegPlus: TPanel;
    lblCourseVal: TLabel;
    tmrUpdateTorpCourse: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure pnlManualGuidanceClick(Sender: TObject);
    procedure ChangeCourseDegree(Sender: TObject);
    procedure edtCourseEnter(Sender: TObject);
    procedure tmrUpdateTorpCourseTimer(Sender: TObject);
  private
    { Private declarations }
    FManualGuidance : Boolean;
  public
    { Public declarations }
  end;

var
  frmManualGuidance: TfrmManualGuidance;

implementation

{$R *.dfm}

procedure TfrmManualGuidance.ChangeCourseDegree(Sender: TObject);
var
  Torp: TTorpedoTrack;
  RecSend : TRecSetTorpedoSUT;
begin
  // kirim 3d perintah manual guidance
  if not FManualGuidance then Exit;

  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  if Torp <> nil then
  begin
    if TPanel(Sender).Tag = 0 then
    begin
      edtCourse.Text := FloatToStr(StrToFloat(edtCourse.Text) -1);
    end
    else if TPanel(Sender).Tag = 1 then
    begin
      edtCourse.Text := FloatToStr(StrToFloat(edtCourse.Text) +1);
    end;

    RecSend.ShipID              := SutBlacksharkManager.ShipID;
    RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID         := SutBlacksharkManager.TorpedoTubeAllocNum; // allocated launcher/tube
    RecSend.mMissileID          := 1; // selalu 1
    RecSend.mMissileNumber      := 1; // selalu 1
    RecSend.mT_ID               := VehicleMgr.TrackControlled.ShipID;
    RecSend.OrderID             := __ORD_TORPEDOSUT_NAVIGATE;
    RecSend.mMissileType        := 0;
    RecSend.mTorpedoCourse      := StrToFloat(edtCourse.Text); // diambil dari torpedo param, automatis di set saat start analysis

    RecSend.mTorpedoSpeed       := TorpedoParam.SearchSpeed;

    RecSend.mTorpedoDepth       := TorpedoParam.SearchDepth;
    RecSend.mTorpedoSafeDistance:= TorpedoParam.ProtectionRadius; // satuan meter
    RecSend.mTorpedoEnDis       := TorpedoParam.EnablingDist; // satuan Km
    RecSend.mpredm              := 0;
    RecSend.mTargetType         := VehicleMgr.TrackControlled.Domain;

    SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);
  end;
end;

procedure TfrmManualGuidance.edtCourseEnter(Sender: TObject);
var
  Torp: TTorpedoTrack;
  RecSend : TRecSetTorpedoSUT;
begin
  // kirim 3d perintah manual guidance
  Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
  if Torp <> nil then
  begin
    RecSend.ShipID              := SutBlacksharkManager.ShipID;
    RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID         := SutBlacksharkManager.TorpedoTubeAllocNum; // allocated launcher/tube
    RecSend.mMissileID          := 1; // selalu 1
    RecSend.mMissileNumber      := 1; // selalu 1
    RecSend.mT_ID               := VehicleMgr.TrackControlled.ShipID;
    RecSend.OrderID             := __ORD_TORPEDOSUT_NAVIGATE;
    RecSend.mMissileType        := 0;
    RecSend.mTorpedoCourse      := StrToFloat(edtCourse.Text); // diambil dari torpedo param, automatis di set saat start analysis

    RecSend.mTorpedoSpeed       := TorpedoParam.SearchSpeed;

    RecSend.mTorpedoDepth       := TorpedoParam.SearchDepth;
    RecSend.mTorpedoSafeDistance:= TorpedoParam.ProtectionRadius; // satuan meter
    RecSend.mTorpedoEnDis       := TorpedoParam.EnablingDist; // satuan Km
    RecSend.mpredm              := 0;
    RecSend.mTargetType         := VehicleMgr.TrackControlled.Domain;

    SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);

    Torp.SpeedMS := TorpedoParam.SearchSpeed;
  end;
end;

procedure TfrmManualGuidance.FormCreate(Sender: TObject);
begin
  FManualGuidance := false;
end;

procedure TfrmManualGuidance.pnlManualGuidanceClick(Sender: TObject);
var
  Torp: TTorpedoTrack;
  RecSend : TRecSetTorpedoSUT;
begin
  FManualGuidance := not FManualGuidance;
  if FManualGuidance then
  begin
    pnlManualGuidance.Color := clLime;
    edtCourse.Visible := True;
    lblCourseVal.Visible := False;

    edtCourse.Text := lblCourseVal.Caption;
    // kirim 3d perintah manual guidance
    Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
    if Torp <> nil then
    begin
      Torp.TorpGuidanceMode := gmManual;

      RecSend.ShipID              := SutBlacksharkManager.ShipID;
      RecSend.mWeaponID           := SutBlacksharkManager.AssignedWeapon.IDWeapon;
      RecSend.mLauncherID         := SutBlacksharkManager.TorpedoTubeAllocNum; // allocated launcher/tube
      RecSend.mMissileID          := 1; // selalu 1
      RecSend.mMissileNumber      := 1; // selalu 1
      RecSend.mT_ID               := VehicleMgr.TrackControlled.ShipID;
      RecSend.OrderID             := __ORD_TORPEDOSUT_ManualGuide;
      RecSend.mMissileType        := 0;
      RecSend.mTorpedoCourse      := TorpedoParam.ApproachCourse; // diambil dari torpedo param, automatis di set saat start analysis

      RecSend.mTorpedoSpeed       := TorpedoParam.SearchSpeed;

      RecSend.mTorpedoDepth       := TorpedoParam.SearchDepth;
      RecSend.mTorpedoSafeDistance:= TorpedoParam.ProtectionRadius; // satuan meter
      RecSend.mTorpedoEnDis       := TorpedoParam.EnablingDist; // satuan Km
      RecSend.mpredm              := 0;
      RecSend.mTargetType         := VehicleMgr.TrackControlled.Domain;

      SutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(RecSend);
    end;
  end
  else
  begin
    pnlManualGuidance.Color := clBlack;
    edtCourse.Visible := false;
    lblCourseVal.Visible := True;
  end;

end;

procedure TfrmManualGuidance.tmrUpdateTorpCourseTimer(Sender: TObject);
var
  Torp: TTorpedoTrack;
begin
  // update torpedo course untuk edt course
  if lblCourseVal.Visible then
  begin
    Torp := VehicleMgr.FindTorpedoByLauncherID(SutBlacksharkManager.TorpedoTubeAllocNum);
    if Torp <> nil then
    begin
      lblCourseVal.Caption := FormatFloat('0',Torp.HeadingDeg);
    end;
  end;
end;

end.
