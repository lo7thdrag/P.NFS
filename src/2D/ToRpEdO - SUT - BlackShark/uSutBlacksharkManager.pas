unit uSutBlacksharkManager;

interface
uses
  Forms,
  Graphics,
  Classes, Sysutils,
  windows, uSimulationManager, uTCPDatatype, uBaseSimulationObject, uLibClientObject,
  uBridgeSet, uTestShip, uBaseFunction, uClassDatabase, System.Uitypes, uVehicleManager,
  uVehicle, System.Math, OverbyteIcsWSocket, uTorpedoLauncher, uSimulationTrack, uSubSurfaceTrack, uSurfaceTrack,
  uBaseConst;

type
  TSearchPattern = (spAuto, spRight, spLeft, spCenter, spExtl, spHxsn, spOct, spTri, spTrsn);

  TTorpedoParameterSetting = class
  private
    // torpedo parameter
    FTargetTrackID, FSalvoNum, FNoTorp, FLOSDeviation, FSearchSpeed, FCeiling, FAttackDepth, FSearchDepth, FApproachDepth,
    FFloor, FApproachSpeed, FApproachCourse, FTosoRangePAS, FTosoRangeACT, FProtectionRadius : Integer;
    FEnablingDist, FCenterOS, FSALength, FSAWidth, FCenterSSP, FDPCAngle : Double;
    FProtectionRadiusEnable : Boolean; // untuk FSAUpdating False : Circle, True : Vect (search area kotak)
    FTosoMode, FGuidance , FSAUpdating, FASH: Byte;
    FSearchPattern : TSearchPattern;

  public
    constructor Create;
    destructor Destroy; override;

    property TargetTrackID : Integer read FTargetTrackID write FTargetTrackID;
    property SalvoNum : Integer read FSalvoNum write FSalvoNum;
    property NoTorp : Integer read FNoTorp write FNoTorp;
    property LOSDeviation : Integer read FLOSDeviation write FLOSDeviation;
    property SearchSpeed : Integer read FSearchSpeed write FSearchSpeed;
    property Ceiling : Integer read FCeiling write FCeiling;
    property AttackDepth : Integer read FAttackDepth write FAttackDepth;
    property SearchDepth : Integer read FSearchDepth write FSearchDepth;
    property ApproachDepth : Integer read FApproachDepth write FApproachDepth;
    property Floor : Integer read FFloor write FFloor;
    property ApproachSpeed : Integer read FApproachSpeed write FApproachSpeed;
    property ApproachCourse : Integer read FApproachCourse write FApproachCourse;
    property TosoRangePAS : Integer read FTosoRangePAS write FTosoRangePAS;
    property TosoRangeACT : Integer read FTosoRangeACT write FTosoRangeACT;
    property ProtectionRadius : Integer read FProtectionRadius write FProtectionRadius;
    property EnablingDist : double read FEnablingDist write FEnablingDist;
    property CenterOS : double read FCenterOS write FCenterOS;
    property SALength : double read FSALength write FSALength;
    property SAWidth : double read FSAWidth write FSAWidth;
    property CenterSSP : double read FCenterSSP write FCenterSSP;
    property DPCAngle : double read FDPCAngle write FDPCAngle;
    property TosoMode : byte read FTosoMode write FTosoMode;
    property Guidance : Byte read FGuidance write FGuidance;
    property SearchPattern : TSearchPattern read FSearchPattern write FSearchPattern;
    property SAUpdating : Byte read FSAUpdating write FSAUpdating;
    property ProtectionRadiusEnable : Boolean read FProtectionRadiusEnable write FProtectionRadiusEnable;
    property ASH : Byte read FASH write FASH;

  end;

  TSutBlacksharkManager = class(TSimulationManager)
  private
    FIsStandAlone: boolean;
    FxShip       : TXShip;
    FIsTrueMotion: boolean;
    FServer_Port: string;
    FCurrentScenID: integer;
    FShipID: Integer;
    FDBPass: string;
    FDBProto: string;
    FServer_Ip: string;
    FDBUser: string;
    FDBServer: string;
    FDBName: string;
    FClassID: Integer;
    FAssignedWeapon: TWeaponGetList;
    FShipNumber: Integer;
    FShipClassID: Integer;
    FShipName: string;
    FShipCallSign: string;
    FShipClassName: string;
    FEnv_Map: Integer;

    FSelectedVehicle: TVehicle;
    FSelectedTrack: TVehicle;
    FisTrackSelected: Boolean;
    FisTorpedoAllocShow: Boolean;
    FOperatorMessages: string;

    FCursorX, FCursorY : Double;

  protected
    procedure  EventOnReceiveDataPosition(apRec: PAnsiChar; aSize: integer);
    procedure  EventonRecMissilePosAvailable(apRec: PAnsiChar; aSize: integer);
    procedure  EventonReceiveSplashPoint(apRec: PAnsiChar; aSize: integer);
    procedure  Event_OrderRecognizer(apRec: PAnsiChar; aSize: integer);
    procedure  Event_OnReceiveStatusConsole(apRec: PAnsiChar; aSize: integer);
  public
    FTorpedoArray : array[0..7] of TTorpedoLauncher;
    FTBIFireAuth : Boolean;

    procedure GetTorpedoWeaponAssigned;

    constructor Create;
    destructor Destroy; override;

    procedure InitializeSimulation;     override;
    procedure initEvent;

    //send to network
    procedure NetSendTo3D_OrderCannon(rec : TRec3DSetWCC);

    procedure NetSendTo3D_OrderSutTorpedo(rec : TRecSetTorpedoSUT);

    // property from/to another form
    property SelectedTrack : TVehicle read FSelectedTrack;
    property isTrackSelected : Boolean read FisTrackSelected;
    property isTorpedoAllocShow : Boolean read FisTorpedoAllocShow write FisTorpedoAllocShow;
    property CursorX : Double read FCursorX write FCursorX;
    property CursorY : Double read FCursorY write FCursorY;
    property TBIFireAuth : Boolean read FTBIFireAuth write FTBIFireAuth;

    property OperatorMessages: string read FOperatorMessages write FOperatorMessages;
//    property isTorpedoAllocShow : Boolean read FisTorpedoAllocShow write FisTorpedoAllocShow;

    // procedure to get and set from another form
    function SelectTrackbyID(const TrackID:string):Boolean;

    property IsStandAlone:boolean read FIsStandAlone write FIsStandAlone;
    property IsTrueMotion: boolean read FIsTrueMotion write FIsTrueMotion;
    property xShip : TXShip read FxShip;

    property CurrentScenID  : integer read FCurrentScenID write FCurrentScenID;
    property Server_Ip : string read FServer_Ip write FServer_Ip;
    property Server_Port : string read FServer_Port write FServer_Port;               //TriD_IP, TriD_Port,
    property DBServer : string read FDBServer write FDBServer;
    property DBProto : string read FDBProto write FDBProto;
    property DBName : string read FDBName write FDBName;
    property DBUser : string read FDBUser write FDBUser;
    property DBPass     : string read FDBPass write FDBPass;
    property ShipID: Integer read FShipID write FShipID;
    property ClassID        : Integer read FClassID write FClassID;
    property AssignedWeapon : TWeaponGetList read FAssignedWeapon;

    property Env_Map: Integer read FEnv_Map write FEnv_Map;
    property ShipClassID: Integer read FShipClassID write FShipClassID;
    property ShipNumber: Integer read FShipNumber write FShipNumber;

    property ShipName: string read FShipName write FShipName;
    property ShipClassName: string read FShipClassName write FShipClassName;
    property ShipCallSign: string read FShipCallSign write FShipCallSign;

    property SelectedVehicle : TVehicle read FSelectedVehicle write FSelectedVehicle;

    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    function ComputeGunElevationVacuum(const RangeX, DeltaHeight, V0: Double;
      out AngleLowDeg, AngleHighDeg: Double): Boolean;
  end;

var
  SutBlacksharkManager : TSutBlacksharkManager;
  TorpedoParam : TTorpedoParameterSetting;

const
  G0 = 9.80665; // gravitasi standar (m/s^2)

implementation

uses
  uDataModule, ulibSettings,
    uShipModel, ufrmTorpedoAllocation, ufrmSystemStatus;

{ TSutBlacksharkManager }

function TSutBlacksharkManager.ComputeGunElevationVacuum(const RangeX, DeltaHeight,
  V0: Double; out AngleLowDeg, AngleHighDeg: Double): Boolean;
var
  g, x, y, v2, v4, D, tanThetaLow, tanThetaHigh: Double;
begin
  Result := False;
  AngleLowDeg := 0;
  AngleHighDeg := 0;

  g := G0;
  x := RangeX;
  y := DeltaHeight;

  if (V0 <= 0) or (x <= 0) then
    Exit;

  v2 := Sqr(V0);
  v4 := Sqr(v2);

  // Discriminant:
  // D = v0^4 - g * (g x^2 + 2 y v0^2)
  D := v4 - g * (g * Sqr(x) + 2 * y * v2);

  if D < 0 then
    Exit; // target tidak terjangkau

  D := Sqrt(D);

  // Dua solusi tan(theta)
  tanThetaLow  := (v2 - D) / (g * x);
  tanThetaHigh := (v2 + D) / (g * x);

  // Konversi ke derajat
  AngleLowDeg  := RadToDeg(ArcTan(tanThetaLow));
  AngleHighDeg := RadToDeg(ArcTan(tanThetaHigh));

  Result := True;
end;

constructor TSutBlacksharkManager.Create;
var
  i : Integer;
begin
  inherited;

  FIsStandAlone := False;
  FIsTrueMotion := False;
  FTBIFireAuth  := False;

  for i := 0 to High(FTorpedoArray) do
    FTorpedoArray[i] := TTorpedoLauncher.Create;
end;

destructor TSutBlacksharkManager.Destroy;
var
  i : Integer;
begin
  for i := 0 to 7 do
    FTorpedoArray[i].Free;

  inherited;

  if not IsStandAlone then
    Net_DisConnect;

  if Assigned(xShip) then
    xShip.Free;

  if Assigned(FAssignedWeapon) then
    FAssignedWeapon.Free;
end;

procedure TSutBlacksharkManager.EventOnReceiveDataPosition(apRec: PAnsiChar;
  aSize: integer);
var  sc  : TSimulationClass;
     obj : TClientObject;
     aRec: ^TRecData3DPosition;

     TestHeading : Double;
     Trck : TSimulationTrack;
     vdomain : Integer;
     Ship: TShipContact;
     range, rangem, bearing, azimuth : Double;
begin
  aRec := @apRec^;

  aRec.X := aRec.X;
  aRec.Y := aRec.Y;
  AddToMemoLog(' _pos: ' + dbID_to_UniqueID(aRec.ShipID) + ' ' + Format('%2.6f, %2.6f',[aRec.X, aRec.Y]));

  if aRec.ShipID = UniqueID_To_dbID(FxShip.UniqueID) then begin
    FxShip.PositionX := aRec.X;
    FxShip.PositionY := aRec.Y;
    FxShip.PositionZ := aRec.Z;

    FxShip.Speed    := aRec.speed;
    FxShip.Heading  := aRec.heading;
    FxShip.Pitch := aRec.pitch;
    FxShip.Roll := aRec.roll;


    Trck := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));

    if not Assigned(Trck) then
    begin
      Trck := VehicleMgr.AddOwnShip(FxShip.PositionX, FxShip.PositionY);
      Trck.UniqueID := dbID_to_UniqueID(aRec.ShipID);
      Trck.Domain := DataModule1.GetShipDomain(aRec.ShipID);
      Trck.Speed_knot := FxShip.Speed;
      Trck.HeadingDeg := FxShip.Heading; // NE
    end

    else
    begin
      Trck.PosX := FxShip.PositionX;
      Trck.PosY := FxShip.PositionY;
      Trck.PosZ := FxShip.PositionZ;
    end;
  end
  else begin
    Trck := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));

    if Assigned(Trck) then
    begin
      Trck.PosX := aRec.X;
      Trck.PosY := aRec.Y;
      Trck.PosZ := aRec.Z;
      Trck.Speed_knot := aRec.speed;
//      Trck.ShipID := aRec.ShipID;

      azimuth := CalcBearing(FxShip.PositionX, FxShip.PositionY, Trck.PosX, Trck.PosY);
      Trck.Azimuth := azimuth;
      bearing := azimuth - FxShip.Heading;
      if bearing < 0 then
      bearing := bearing + 360;
      Trck.Bearing := bearing;

      range := CalcRange(FxShip.PositionX, FxShip.PositionY, Trck.PosX, Trck.PosY);
      Trck.Range := rangem;

      Trck.HeadingDeg  := aRec.heading;
    end
    else
    begin
      vdomain := DataModule1.GetShipDomain(aRec.ShipID);

      if vdomain = 1 then
      begin
        Trck := VehicleMgr.AddVehicleSurface(aRec.X, aRec.Y);
        Trck.UniqueID := dbID_to_UniqueID(aRec.ShipID);
        Trck.ShipID := aRec.ShipID;
        Trck.Domain := vdomain;

        // pakai bitmap tint: hitam -> kuning
//        Trck.Symbol.LoadBitmapFromFile('..\data\Bitmap\SurfaceUnknown.bmp');

//        Trck.Symbol.BitmapTintColor := RGB(255,255,0); // kuning
      end

      else if vdomain = 3 then
      begin
        Trck := VehicleMgr.AddVehicleSubSurf(aRec.X, aRec.Y);
        Trck.UniqueID := dbID_to_UniqueID(aRec.ShipID);
        Trck.ShipID := aRec.ShipID;
        Trck.Domain := vdomain;

        // pakai bitmap tint: hitam -> kuning
//        Trck.Symbol.LoadBitmapFromFile('..\data\Bitmap\SubsurfaceUnknown.bmp');
//
//        Trck.Symbol.BitmapTintColor := RGB(255,255,0); // kuning
      end;
    end;
  end;
end;

procedure TSutBlacksharkManager.EventonReceiveSplashPoint(apRec: PAnsiChar;
  aSize: integer);
begin

end;

procedure TSutBlacksharkManager.EventonRecMissilePosAvailable(apRec: PAnsiChar;aSize: integer);
var
  Rec: ^TRec3DMissilePos;
begin
  Rec := Pointer(apRec);

  if (Rec^.ShipID <> ShipID) or
     (Rec^.WeaponID <> C_DBID_TORPEDO_BLACKSHARK) then
    Exit;

  if Rec^.Status <> ST_MISSILE_LOADED then
    Exit;

  if (Rec^.LauncherID < 1) or (Rec^.LauncherID > 8) then
    Exit;

  FTorpedoArray[Rec^.LauncherID - 1].Loaded := True;
end;

procedure TSutBlacksharkManager.Event_OnReceiveStatusConsole(apRec: PAnsiChar;
  aSize: integer);
var
  rec: ^TRecStatus_Console;
begin
  rec := @apRec^;

  if rec.OWN_SHIP_UID = xShip.UniqueID then
  begin
    if rec.ErrorID =  __STAT_BLACKSHARK_TBI_FIRE_AUTHORIZE then
    begin
      if rec.ParamError = __PARAM_BLACKSHARK_ON  then
      begin
        frmSystemStatus.__stateFire := True;
        frmSystemStatus.lblFireAuthorization.Caption    := 'ON';
        frmSystemStatus.lblFireAuthorization.Font.Color := clLime;
      end
      else if rec.ParamError = __PARAM_BLACKSHARK_OFF then
      begin
        frmSystemStatus.__stateFire := False;
        frmSystemStatus.lblFireAuthorization.Caption    := 'OFF';
        frmSystemStatus.lblFireAuthorization.Font.Color := clLime;
      end;
    end;
  end;
end;

procedure TSutBlacksharkManager.Event_OrderRecognizer(apRec: PAnsiChar; aSize: integer);
begin

end;

procedure TSutBlacksharkManager.FMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TSutBlacksharkManager.GetTorpedoWeaponAssigned;
var WeaponAssigned : TWeaponGetList;
    ListWeaponAssigned : TList;
    I : Integer;
begin
  ListWeaponAssigned := TList.Create;
  if DataModule1.GetListWeaponOnShip(FShipID , ListWeaponAssigned) > 0 then
  begin
    for I := 0 to ListWeaponAssigned.Count - 1 do begin
      WeaponAssigned := TWeaponGetList.Create;
      WeaponAssigned := TWeaponGetList(ListWeaponAssigned.Items[I]);
      case vSutBlacksharkSetting.ConsoleMode of
      1 : //Console 1 Mode
        begin
          if WeaponAssigned.IDWeapon = C_DBID_TORPEDO_BLACKSHARK then begin
            FAssignedWeapon := TWeaponGetList.Create;
            FAssignedWeapon := TWeaponGetList(ListWeaponAssigned.Items[I]);
            Break;
          end;
        end;
        2 : //Console 2 Mode
        begin
          if WeaponAssigned.IDWeapon = C_DBID_TORPEDO_SUT then begin
          FAssignedWeapon := TWeaponGetList.Create;
          FAssignedWeapon := TWeaponGetList(ListWeaponAssigned.Items[I]);
          Break;
          end;
        end;
      end;
       WeaponAssigned.Free;
    end;
  end;
  ListWeaponAssigned.Free;
end;

procedure TSutBlacksharkManager.initEvent;
begin

end;

procedure TSutBlacksharkManager.InitializeSimulation;
begin
  inherited;
    NetComm.RegisterProcedure(
      REC_3D_POSITION, EventonReceiveDataPosition, SizeOf(TRecData3DPosition));

  NetComm.RegisterProcedure(
    C_REC_CANNON          ,Event_OrderRecognizer, sizeof(TRecMeriam));

  NetComm.RegisterProcedure(
    REC_3D_TORPEDO_SUT          ,Event_OrderRecognizer, sizeof(TRecSetTorpedoSUT));

  NetComm.RegisterProcedure(
    REC_MISSILEPOS        ,EventonRecMissilePosAvailable,  sizeof(TRecMissilePos));

  NetComm.RegisterProcedure(
    REC_STAT_CANNON_SPLASH  ,EventonReceiveSplashPoint  ,  sizeof(TRecSplashCannon));

  NetComm.RegisterProcedure(
    REC_STAT_ORDER_CONSOLE  ,EventonReceiveSplashPoint  ,  sizeof(TRecStatus_Console));

  NetComm.RegisterProcedure(
    REC_STAT_ORDER_CONSOLE  ,Event_OnReceiveStatusConsole,  sizeof(TRecStatus_Console));

  FxShip       := TXShip.Create;
  FxShip.PositionX := 112.75;
  FxShip.PositionY := -7.2;
  FxShip.Heading := 0;
  FxShip.CreateDefaultView(Fmap);

  if not IsStandAlone then
    Net_Connect;
end;

procedure TSutBlacksharkManager.NetSendTo3D_OrderCannon(rec: TRec3DSetWCC);
begin
  if (TCPClient <> nil) and (TCPClient.State in [wsConnected]) then
      TCPClient.sendDataEx(C_REC_CANNON, @Rec);
end;

procedure TSutBlacksharkManager.NetSendTo3D_OrderSutTorpedo(
  rec: TRecSetTorpedoSUT);
begin
  if (TCPClient <> nil) and (TCPClient.State in [wsConnected]) then
      TCPClient.sendDataEx(REC_3D_TORPEDO_SUT, @Rec);
end;

function TSutBlacksharkManager.SelectTrackbyID(const TrackID: string): Boolean;
begin
  //

end;

{ TTorpedoParameterSetting }

constructor TTorpedoParameterSetting.Create;
begin
  FGuidance := 1; // 0 : CC, 1 : LOS; (normalnya di video pakai CC)
  FTargetTrackID := 0;
  FSalvoNum := 0;
  FNoTorp := 0;
  FLOSDeviation := 0;
  FSearchSpeed := 18;

  FCeiling := 6;
  FAttackDepth := 11;
  FSearchDepth := 26;
  FApproachDepth := 26;
  FFloor := 70;

  FEnablingDist := 1.0;
  FApproachSpeed := 18;
  FApproachCourse := 0;

  FSAUpdating := 0;  // defaultya 0 (circle) namun di video selalu pakai 1 (Vect)
  FCenterOS := 15.0;
  FSALength := 20.0;
  FSAWidth := 2.0;
  FCenterSSP := 1.0;

  FSearchPattern := spAuto;
  FDPCAngle := 0;

  FTosoMode := 1; // 0: off, 1: Pass, 2: Mix, 3 : Act
  FTosoRangePAS := 1000;
  FTosoRangeACT := 1000;

  FProtectionRadius := 300;
  FASH := 1;

end;

destructor TTorpedoParameterSetting.Destroy;
begin

  inherited;
end;

end.
