unit uAK230Manager;

interface
uses
  Forms, classes, Windows, uSimulationManager, uClassDatabase, Sysutils, uLibClientObject,
  uBaseSimulationObject, uTestShip, uBaseFunction, uTCPDatatype, OverbyteIcsWSocket;

type
  TAK230Manager = class(TSimulationManager)
  private
    FIsStandAlone: boolean;
      FEnv_Map,
      FShipClassID,
      FShipNumber  : Integer;
      FShipName,
      FShipClassName,
      FShipCallSign: string;

      FCurrentScenID  : integer;
      FServer_Ip,
      FServer_Port,               //TriD_IP, TriD_Port,
      FDBServer,
      FDBProto,
      FDBName,
      FDBUser,
      FDBPass     : string;
      FShipID,
      FClassID        : Integer;
      FAssignedWeapon : TWeaponGetList;
    protected
      procedure EventOnMainTimer(const dt: double); override;

      procedure  EventOnReceiveDataPosition(apRec: PAnsiChar; aSize: integer);
      procedure  Event_OrderRecognizer(apRec: PAnsiChar; aSize: integer);
      procedure  EventonRecMissilePosAvailable(apRec: PAnsiChar; aSize: integer);
      procedure  EventonReceiveSplashPoint(apRec: PAnsiChar; aSize: integer);
    public
      xShip       : TXShip;         // kapal tempat Radar berada

      procedure Get230WeaponAssigned;
      constructor Create;
      destructor Destroy; override;

      procedure InitializeSimulation;     override;

      procedure NetSendTo3D_OrderCannon(rec: TRec3DSetAK230);

      property IsStandAlone: boolean read FIsStandAlone write FIsStandAlone;

      property Env_Map: Integer read FEnv_Map write FEnv_Map;
      property ShipClassID: Integer read FShipClassID write FShipClassID;
      property ShipNumber: Integer read FShipNumber write FShipNumber;

      property ShipName: string read FShipName write FShipName;
      property ShipClassName: string read FShipClassName write FShipClassName;
      property ShipCallSign: string read FShipCallSign write FShipCallSign;

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
  end;

var
  AK230Manager : TAK230Manager;

implementation

uses
  uDataModule;
{ TAK230Manager }

constructor TAK230Manager.Create;
begin
  inherited;
  FIsStandAlone := False;
end;

destructor TAK230Manager.Destroy;
begin

  inherited;

  if Assigned(xShip) then
    xShip.Free;

  if Assigned(FAssignedWeapon) then
    FAssignedWeapon.Free;
end;

procedure TAK230Manager.EventOnMainTimer(const dt: double);
begin
  inherited;

  UpdateMember;
end;

procedure TAK230Manager.EventOnReceiveDataPosition(apRec: PAnsiChar;
  aSize: integer);
var  sc  : TSimulationClass;
     obj : TClientObject;
     aRec: ^TRecData3DPosition;

     TestHeading : Double;
begin
  aRec := @apRec^;

  aRec.X := aRec.X;
  aRec.Y := aRec.Y;
  AddToMemoLog(' _pos: ' + dbID_to_UniqueID(aRec.ShipID) + ' ' + Format('%2.6f, %2.6f',[aRec.X, aRec.Y]));

  if aRec.ShipID = UniqueID_To_dbID(xShip.UniqueID) then begin
      xShip.PositionX := aRec.X;
      xShip.PositionY := aRec.Y;
      xShip.PositionZ := aRec.Z;

      xShip.Speed    := aRec.speed;
      xShip.Heading  := aRec.heading;
  end
  else begin
    sc := MainObjList.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));

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
  end;
end;

procedure TAK230Manager.EventonReceiveSplashPoint(apRec: PAnsiChar;
  aSize: integer);
begin

end;

procedure TAK230Manager.EventonRecMissilePosAvailable(apRec: PAnsiChar;
  aSize: integer);
begin

end;

procedure TAK230Manager.Event_OrderRecognizer(apRec: PAnsiChar; aSize: integer);
begin

end;

procedure TAK230Manager.Get230WeaponAssigned;
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
      if WeaponAssigned.IDWeapon = C_DBID_CANNON30 then begin
        FAssignedWeapon := TWeaponGetList.Create;
        FAssignedWeapon := TWeaponGetList(ListWeaponAssigned.Items[I]);
        Break;
      end;

       WeaponAssigned.Free;
    end;
  end;
  ListWeaponAssigned.Free;
end;

procedure TAK230Manager.InitializeSimulation;
begin
  inherited;
  NetComm.RegisterProcedure(
      REC_3D_POSITION, EventonReceiveDataPosition, SizeOf(TRecData3DPosition));

  NetComm.RegisterProcedure(
    C_REC_CANNON          ,Event_OrderRecognizer, sizeof(TRecMeriam));

  NetComm.RegisterProcedure(
    REC_MISSILEPOS        ,EventonRecMissilePosAvailable,  sizeof(TRecMissilePos));

  NetComm.RegisterProcedure(
    REC_STAT_CANNON_SPLASH  ,EventonReceiveSplashPoint  ,  sizeof(TRecSplashCannon));

  xShip       := TXShip.Create;


  if not IsStandAlone then
    Net_Connect;
end;

procedure TAK230Manager.NetSendTo3D_OrderCannon(rec: TRec3DSetAK230);
begin
  if (TCPClient <> nil) and (TCPClient.State in [wsConnected]) then
    TCPClient.sendDataEx(C_REC_CANNON, @rec);
end;

end.
