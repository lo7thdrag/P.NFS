unit uMeriam57Manager;

interface
uses
  Forms, classes, Windows, uSimulationManager, uClassDatabase, Sysutils, uLibClientObject,
  uBaseSimulationObject, uTestShip, uBaseFunction, uTCPDatatype, OverbyteIcsWSocket;

type
  TMeriam57Manager=class(TSimulationManager)
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
      FTarget2D: Word;
      FTargetObj : TClientObject;
      FBearing, FElevation : Double;
      FisDesig, FTargetAssigned : Boolean;
    protected
      procedure EventOnMainTimer(const dt: double); override;

      procedure  EventOnReceiveDataPosition(apRec: PAnsiChar; aSize: integer);
      procedure  Event_OrderRecognizer(apRec: PAnsiChar; aSize: integer);
      procedure  EventonRecMissilePosAvailable(apRec: PAnsiChar; aSize: integer);
      procedure  EventonReceiveSplashPoint(apRec: PAnsiChar; aSize: integer);
      procedure  EventOnReceiveFCCSet(apRec: PAnsiChar; aSize: integer);
    public
      xShip       : TXShip;         // kapal tempat Radar berada

      procedure Get57WeaponAssigned;
      constructor Create;
      destructor Destroy; override;

      procedure InitializeSimulation;     override;

      //send to network
      procedure NetSendTo3D_OrderCannon(rec : TRec3DSetWCC);
      procedure NetSendTo3D_FCCSet(rec : TrecData_MeriamFCC);

      property IsStandAlone: boolean read FIsStandAlone write FIsStandAlone;

      property TargetObj: TClientObject read FTargetObj write FTargetObj; // targeted Obj -rojek
      property Env_Map: Integer read FEnv_Map write FEnv_Map;
      property ShipClassID: Integer read FShipClassID write FShipClassID;
      property ShipNumber: Integer read FShipNumber write FShipNumber;

      property ShipName: string read FShipName write FShipName;
      property ShipClassName: string read FShipClassName write FShipClassName;
      property ShipCallSign: string read FShipCallSign write FShipCallSign;

      property Target2D : Word read FTarget2D;
      property isDesig : Boolean read FisDesig;
      property TargetAssigned : Boolean read FTargetAssigned write FTargetAssigned;
      property Bearing : double read FBearing;
      property Elevation : double read FElevation;

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
  Meriam57Manager : TMeriam57Manager;
implementation

uses
  uDataModule;

{ TMeriam57Manager }

constructor TMeriam57Manager.Create;
begin
  inherited;
  FIsStandAlone := False;
  FisDesig := False;
  FTargetAssigned := False;
end;

destructor TMeriam57Manager.Destroy;
begin

  inherited;

  if not IsStandAlone then
    Net_DisConnect;

  if Assigned(xShip) then
    xShip.Free;

  if Assigned(FAssignedWeapon) then
    FAssignedWeapon.Free;
end;

procedure TMeriam57Manager.EventOnMainTimer(const dt: double);
begin
  inherited;

  UpdateMember;
//  DrawMember;
end;

procedure TMeriam57Manager.EventOnReceiveDataPosition(apRec: PAnsiChar;
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


procedure TMeriam57Manager.EventOnReceiveFCCSet(apRec: PAnsiChar;
  aSize: integer);
var
  aRec: ^TrecData_MeriamFCC;
  sc  : TSimulationClass;
begin
  aRec := @apRec^;
  if Meriam57Manager.FShipID = arec^.ShipID then
  begin
    case aRec^.OrderID of
      CORD_ID_3DUpdate_EO :
      begin
//        FEOBearing := aRec.EOBearing;
//        FEOElevation := aRec.EOElevation;
      end;

      CORD_ID_3DGet_Target :
      begin

      end;

      CORD_ID_2DGet_Target :
      begin

//        sc := MainObjList.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));
//        FTargetObj := sc as TClientObject;
//        if Assigned(FTargetObj) then
//        begin
//
//        end;
      end;

      CORD_ID_TargetType :
      begin
//        FTargetType := TTargetType(aRec.TargetType);
      end;

      CORD_ID_2DSet_Status :
      begin

      end;

      CORD_ID_2D_Desig :
      begin
        FTarget2D := arec.IDTarget2D;
        FBearing := arec.Bearing;
        FElevation := arec.Elevation;
        FisDesig := True;
        FTargetAssigned := True;
      end;

      CORD_ID_2D_Break :
      begin
        FTarget2D := 0;
        FBearing := 0;
        FElevation := 0;
        FisDesig := False;
      end;
    end;
  end;
end;

procedure TMeriam57Manager.EventonReceiveSplashPoint(apRec: PAnsiChar;
  aSize: integer);
begin

end;

procedure TMeriam57Manager.EventonRecMissilePosAvailable(apRec: PAnsiChar;
  aSize: integer);
begin

end;

procedure TMeriam57Manager.Event_OrderRecognizer(apRec: PAnsiChar;
  aSize: integer);
begin

end;

procedure TMeriam57Manager.Get57WeaponAssigned;
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

//  if TheWCC.Gun1.Isfunctionalized then
//    AddToMemoLog('Gun1 is Assigned')
//  else
//    AddToMemoLog('Gun1 is not Assigned');
//
//  if TheWCC.Gun2.Isfunctionalized then
//    AddToMemoLog('Gun2 is Assigned')
//  else
//    AddToMemoLog('Gun2 is not Assigned');
//
//  if TheWCC.Gun3.Isfunctionalized then
//    AddToMemoLog('Gun3 is Assigned')
//  else
//    AddToMemoLog('Gun3 is not Assigned');
end;

procedure TMeriam57Manager.InitializeSimulation;
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

  NetComm.RegisterProcedure(REC_CMD_57DIG  ,EventOnReceiveFCCSet  ,  sizeof(TrecData_MeriamFCC));

  xShip       := TXShip.Create;


  if not IsStandAlone then
    Net_Connect;
end;

procedure TMeriam57Manager.NetSendTo3D_OrderCannon(rec: TRec3DSetWCC);
begin
  if (TCPClient <> nil) and (TCPClient.State in [wsConnected]) then
    TCPClient.sendDataEx(C_REC_CANNON, @Rec);
end;

procedure TMeriam57Manager.NetSendTo3D_FCCSet(rec: TrecData_MeriamFCC);
begin
  if (TCPClient <> nil) and (TCPClient.State in [wsConnected]) then
    TCPClient.sendDataEx(REC_CMD_57DIG, @Rec);
end;

end.
