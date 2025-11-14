unit uFccManager;

interface
uses
  Forms,
  Graphics,
  Classes, Sysutils,
  windows, uSimulationManager, uTCPDatatype, uBaseSimulationObject, uLibClientObject,
  uBridgeSet, uTestShip, uBaseFunction, uClassDatabase, System.Uitypes, uVehicleManager,
  uVehicle;

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
  end;

var
  FCCManager : TFCCManager;

implementation

uses
  uDataModule;

{ TFCCManager }

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
  end
  else begin
    sc := MainObjList.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));

    if sc = nil then begin
     obj := TClientObject.Create;
     obj.UniqueID := dbID_to_UniqueID(aRec.ShipID);
     obj.Enabled := TRUE;

     MainObjList.AddObject(obj);

      V := VehicleMgr.AddVehicle(aRec.X, aRec.Y, obj.UniqueID);
      // pakai bitmap tint: hitam -> kuning
      V.Symbol.LoadBitmapFromFile('.\data\Bitmap\SurfaceUnknown.bmp');
      V.Symbol.BitmapTintColor := RGB(255,255,0); // kuning
    end
    else
     obj := sc as TClientObject;

    obj.PositionX := aRec.X;
    obj.PositionY := aRec.Y;
    obj.PositionZ := aRec.Z;
    obj.Speed     := aRec.speed;

    obj.Heading  := ConvCompass_To_Cartesian(aRec.heading);
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
