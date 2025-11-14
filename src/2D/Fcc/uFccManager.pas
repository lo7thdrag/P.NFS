unit uFccManager;

interface
uses
  Forms,
  Graphics,
  Classes, Sysutils,
  windows, uSimulationManager, uTCPDatatype, uBaseSimulationObject, uLibClientObject,
  uBridgeSet, uTestShip, uBaseFunction, uClassDatabase, System.Uitypes, uVehicleManager,
  uVehicle, System.Math;

type
  TFCCManager = class(TSimulationManager)
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
  protected
    procedure  EventOnReceiveDataPosition(apRec: PAnsiChar; aSize: integer);
    procedure  EventonRecMissilePosAvailable(apRec: PAnsiChar; aSize: integer);
    procedure  EventonReceiveSplashPoint(apRec: PAnsiChar; aSize: integer);
  public
    procedure Get57WeaponAssigned;

    constructor Create;
    destructor Destroy; override;

    procedure InitializeSimulation;     override;

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

    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    function ComputeGunElevationVacuum(const RangeX, DeltaHeight, V0: Double;
      out AngleLowDeg, AngleHighDeg: Double): Boolean;
  end;

var
  FCCManager : TFCCManager;

const
  G0 = 9.80665; // gravitasi standar (m/s^2)

implementation

uses
  uDataModule;

{ TFCCManager }

function TFCCManager.ComputeGunElevationVacuum(const RangeX, DeltaHeight,
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

constructor TFCCManager.Create;
begin
  inherited;
  FIsStandAlone := False;
  FIsTrueMotion := False;
end;

destructor TFCCManager.Destroy;
begin

  inherited;

  if not IsStandAlone then
    Net_DisConnect;

  if Assigned(xShip) then
    xShip.Free;

  if Assigned(FAssignedWeapon) then
    FAssignedWeapon.Free;
end;

procedure TFCCManager.EventOnReceiveDataPosition(apRec: PAnsiChar;
  aSize: integer);
var  sc  : TSimulationClass;
     obj : TClientObject;
     aRec: ^TRecData3DPosition;

     TestHeading : Double;
     V : TVehicle;
     vdomain : Integer;
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


      V := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));

      if not Assigned(v) then
      begin
        V := VehicleMgr.AddVehicle(FxShip.PositionX, FxShip.PositionY, '');
      //  V.Symbol.SetFontSymbol('Segoe UI Symbol', '▲', clLime, clYellow, 10);
        V.UniqueID := dbID_to_UniqueID(aRec.ShipID);
        v.Domain := DataModule1.GetShipDomain(aRec.ShipID);
        V.SetSpeedKts(FxShip.Speed);
        V.HeadingDeg := FxShip.Heading; // NE
      end;
  end
  else begin
    sc := MainObjList.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));
    V := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));

    if sc = nil then begin
     obj := TClientObject.Create;
     obj.UniqueID := dbID_to_UniqueID(aRec.ShipID);
     obj.Enabled := TRUE;

     MainObjList.AddObject(obj);
    end
    else
     obj := sc as TClientObject;

    obj.PositionX := aRec.X;
    obj.PositionY := aRec.Y;
    obj.PositionZ := aRec.Z;
    obj.Speed     := aRec.speed;

    obj.Heading  := ConvCompass_To_Cartesian(aRec.heading);

    if Assigned(V) then
    begin
      v.PosX := aRec.X;
      v.PosY := aRec.Y;
      v.PosZ := aRec.Z;
      v.SetSpeedKts(aRec.speed);

      v.HeadingDeg  := aRec.heading;
    end
    else
    begin
      vdomain := DataModule1.GetShipDomain(aRec.ShipID);

      if (vdomain = 1) or (vdomain = 2) then
      begin
        V := VehicleMgr.AddVehicle(aRec.X, aRec.Y, obj.UniqueID);
        V.UniqueID := dbID_to_UniqueID(aRec.ShipID);
        v.Domain := vdomain;
        // pakai bitmap tint: hitam -> kuning
        case v.Domain of
          1://surface
          begin
            V.Symbol.LoadBitmapFromFile('.\data\Bitmap\SurfaceUnknown.bmp');
          end;
          2://air
          begin
            V.Symbol.LoadBitmapFromFile('.\data\Bitmap\AirUnknown.bmp');
          end;
          3://subsurface
          begin
            V.Symbol.LoadBitmapFromFile('.\data\Bitmap\SubsurfaceUnknown.bmp');
          end;
        end;

        V.Symbol.BitmapTintColor := RGB(255,255,0); // kuning
      end;
    end;
  end;
end;

procedure TFCCManager.EventonReceiveSplashPoint(apRec: PAnsiChar;
  aSize: integer);
begin

end;

procedure TFCCManager.EventonRecMissilePosAvailable(apRec: PAnsiChar;
  aSize: integer);
begin

end;

procedure TFCCManager.FMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TFCCManager.Get57WeaponAssigned;
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
      if WeaponAssigned.IDWeapon = C_DBID_CANNON57 then begin
        FAssignedWeapon := TWeaponGetList.Create;
        FAssignedWeapon := TWeaponGetList(ListWeaponAssigned.Items[I]);
        Break;
      end;

       WeaponAssigned.Free;
    end;
  end;
  ListWeaponAssigned.Free;
end;

procedure TFCCManager.InitializeSimulation;
begin
  inherited;
    NetComm.RegisterProcedure(
      REC_3D_POSITION, EventonReceiveDataPosition, SizeOf(TRecData3DPosition));

  FxShip       := TXShip.Create;
  FxShip.PositionX := 112.75;
  FxShip.PositionY := -7.2;
  FxShip.Heading := 0;
  FxShip.CreateDefaultView(Fmap);

  if not IsStandAlone then
    Net_Connect;
end;

end.
