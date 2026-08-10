unit uC705SimManager;

interface

uses
  System.SysUtils, Vcl.ExtCtrls, System.Contnrs, OverbyteIcsWSocket, uTCPClient,
  uTCPDatatype, uLibSettings, uShipModel, uVehicleManager, uC705Launcher,
  Winapi.Windows, Vcl.Dialogs, System.Classes;

type
  TRoutePlanMode = (mPassive, mActive, mFiring);
  TOnMapInit = procedure(const GeosetPath: string) of object;

  { Ini adalah informasi apa yang baru saja berubah, buat Notify Event }
  TC705StatusType = (
    stAvailability,     // berasal dari INSTRUKTUR
    stEnableWeapon,     // berasal dari tombol Power For M untuk Launcher
    stOpenCover,        // berasal dari tombol Open Cover untuk Launcher
    stSafetyIgnition    // berasal dari tombol SAFE/ARMED untuk Launcher
  );

  TStatusWeaponChanged =
    procedure(Sender: TObject; AStatus: TC705StatusType) of object;

  TTargetSelectedEvent =
    procedure(Sender: TObject; aTarget: TShipContact; Range: Double) of object;

  // Multicast Notify Event
  //TStatusWeaponChangedEvent = procedure(Sender: TObject; aStatus: TC705StatusType) of object;
  TStatusWeaponChangedEvent = procedure(Sender: TObject) of object;

  TStatusWeaponEventItem = class
  public
    Event: TStatusWeaponChangedEvent;
  end;

  TEnvironmentStatus = record
    SeaState: Word;
  end;

  TEnvironmentChanged = procedure(Sender: TObject) of object;

  GameSimManager = class
  private
    { NFS Dependencies }
    FNFSObjectList: TObjectList;
    FAutoConnectToBridgeTimer: TTimer;

    FOnMapInit: TOnMapInit;
    //FOnStatusWeaponChanged,
    FOnTakeOffChanged: TNotifyEvent;
    FMissileTakeOff: Boolean;
    FMissileTakeOffLauncherID: Integer;

    FStatusWeaponEvents : TObjectList;

    FOnStatusWeaponChanged: TStatusWeaponChanged;
    FOnTargetSelectedAction: TTargetSelectedEvent;

    { Console Availability }
    FC705Available: Boolean;

    { Environment }
    FEnvironment: TEnvironmentStatus;
    FOnEnvironmentChanged : TEnvironmentChanged;

    procedure LauncherStatusChanged(Sender: TObject);
    procedure LauncherMissileLaunched(Sender: TObject);

    //procedure NotifyStatusWeaponChanged(aStatus: TC705StatusType);
    procedure NotifyStatusWeaponChanged(Sender: TObject);

    procedure tmrAutoConnectToBridgeTimer(Sender: TObject);
    procedure OnConnected(msg: string);
    procedure OnDisconnected(msg: string);

    procedure AddRegisterProcedure;
    { Receive procedure from NFS }
    procedure netNFS_OnReceiveData3DPosition(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnReceive2DOrder(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnDeleteShip(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnReceiveStatusConsole(apRec: PAnsiChar; aSize: Integer);
    procedure netNFS_OnReceiveMissilePos(apRec: PAnsiChar; aSize: Integer);
    procedure netNFS_OnReceiveEnvironment(apRec: PAnsiChar; aSize: Integer);

  public
    FRoutePlanMode: TRoutePlanMode;
    NFSNetRecv: TTCPClient;

    FC705Launcher: array[TC705LauncherID] of TC705Launcher;

    constructor Create;
    destructor Destroy; override;

    function GetLauncher(LauncherID: Integer): TC705Launcher;

    procedure InitializeMap;

    // Send Data
    procedure netNFS_OnSendDataC705(rec: TRec_Data_C705);

    // for Multicast Notify Event
    procedure RegisterStatusWeaponEvent(aEvent : TStatusWeaponChangedEvent);
    procedure UnregisterStatusWeaponEvent(aEvent : TStatusWeaponChangedEvent);

    property RoutePlanMode: TRoutePlanMode read FRoutePlanMode write FRoutePlanMode;
    property OnMapInit: TOnMapInit read FOnMapInit write FOnMapInit;
    property OnStatusWeaponChanged: TStatusWeaponChanged read FOnStatusWeaponChanged write FOnStatusWeaponChanged;
    property OnTakeOffChanged: TNotifyEvent read FOnTakeOffChanged write FOnTakeOffChanged;
    property OnTargetSelectedAction: TTargetSelectedEvent read FOnTargetSelectedAction write FOnTargetSelectedAction;
    property Environment : TEnvironmentStatus read FEnvironment;
    property OnEnvironmentChanged : TEnvironmentChanged read FOnEnvironmentChanged write FOnEnvironmentChanged;
    property MissileTakeOff: Boolean read FMissileTakeOff write FMissileTakeOff;
    property C705Available: Boolean read FC705Available;
    property MissileTakeOffLauncherID : Integer read FMissileTakeOffLauncherID write FMissileTakeOffLauncherID;
  published
    {
      Main Function of Simulation
    }
  end;

var
  SimManager: GameSimManager;

implementation

{ GameSimManager }

function GameSimManager.GetLauncher(LauncherID: Integer): TC705Launcher;
begin
  case LauncherID of
    1 : Result := FC705Launcher[lchRight];
    2 : Result := FC705Launcher[lchLeft];
  else
    Result := nil;
  end;
end;

//function GameSimManager.GetLauncher(LauncherID: TC705LauncherID): TC705Launcher;
//begin
//  Result := FC705Launcher[LauncherID];
//end;

procedure GameSimManager.AddRegisterProcedure;
begin
  NFSNetRecv.RegisterProcedure(REC_3D_POSITION, netNFS_OnReceiveData3DPosition, SizeOf(TRecData3DPosition));
  NFSNetRecv.RegisterProcedure(REC_2D_ORDER, netNFS_OnReceive2DOrder, SizeOf(TRecData2DOrder));
  NFSNetRecv.RegisterProcedure(REC_3D_ORDER, netNFS_OnDeleteShip, SizeOf(TRecData3DOrder));

  NFSNetRecv.RegisterProcedure(Rec_Data_C705, nil, SizeOf(TRec_Data_C705));

  NFSNetRecv.RegisterProcedure(REC_3D_MISSILEPOS, netNFS_OnReceiveMissilePos, SizeOf(TRec3DMissilePos));

  // C705 Status
  //NFSNetRecv.RegisterProcedure(REC_STAT_ORDER_CONSOLE, netNFS_OnReceiveStatusConsole, SizeOf(TRecStatus_Console_C705));
  NFSNetRecv.RegisterProcedure(REC_STAT_ORDER_CONSOLE, netNFS_OnReceiveStatusConsole, SizeOf(TRecStatus_Console));

  NFSNetRecv.RegisterProcedure(REC_ENVI, netNFS_OnReceiveEnvironment, SizeOf(TRecDataEnvironment));
end;

constructor GameSimManager.Create;
begin
  // Default Operation Route Planning
  FRoutePlanMode := mPassive;

  FMissileTakeOff := False;
  FC705Available := False;

  {Socket NFS}
  NFSNetRecv := TTCPClient.Create;

  NFSNetRecv.OnConnected := OnConnected;
  NFSNetRecv.OnDisconnected := OnDisconnected;

  {Register Procedure NetNFS}
  AddRegisterProcedure;
  OutputDebugString(PChar(
    Format('SizeOf(TRecDataEnvironment) = %d',
    [SizeOf(TRecDataEnvironment)])));

  {Timer untuk Connect ke Bridge}
  FAutoConnectToBridgeTimer := TTimer.Create(nil);
  FAutoConnectToBridgeTimer.Interval := 5000;
  FAutoConnectToBridgeTimer.OnTimer := tmrAutoConnectToBridgeTimer;
  FAutoConnectToBridgeTimer.Enabled := True;

  FStatusWeaponEvents := TObjectList.Create(True); // Auto Free Object

  // Load Missile
  FC705Launcher[lchRight] := TC705Launcher.Create(lchRight);
  FC705Launcher[lchLeft]  := TC705Launcher.Create(lchLeft);

  FC705Launcher[lchRight].ResetLauncher;
  FC705Launcher[lchLeft].ResetLauncher;

  FC705Launcher[lchRight].OnStatusLauncherChanged := LauncherStatusChanged;
  FC705Launcher[lchLeft].OnStatusLauncherChanged := LauncherStatusChanged;

  FC705Launcher[lchRight].OnMissileLaunch := LauncherMissileLaunched;
  FC705Launcher[lchLeft].OnMissileLaunch := LauncherMissileLaunched;

  {
  OutputDebugString(PChar(
  Format('TC705Launcher.Create SafetyIgnition R = %d',
  [Ord(GetLauncher(1).C705Status.SafetyIgnition)])));

  OutputDebugString(PChar(
  Format('TC705Launcher.Create SafetyIgnition L = %d',
  [Ord(GetLauncher(2).C705Status.SafetyIgnition)])));
  }
end;

destructor GameSimManager.Destroy;
begin
  FAutoConnectToBridgeTimer.Enabled := False;
  FAutoConnectToBridgeTimer.OnTimer := nil;
  if Assigned(FAutoConnectToBridgeTimer) then
    FreeAndNil(FAutoConnectToBridgeTimer);

  if Assigned(NFSNetRecv) then
  begin
    NFSNetRecv.OnConnected := nil;
    NFSNetRecv.OnDisconnected := nil;
    NFSNetRecv.Disconnect;
    FreeAndNil(NFSNetRecv);
  end;

  FreeAndNil(FStatusWeaponEvents);

  FreeAndNil(FC705Launcher[lchRight]);
  FreeAndNil(FC705Launcher[lchLeft]);

  inherited;
end;

// LoadMap, LoadGeoset pakai path
procedure GameSimManager.InitializeMap;
begin
  if Assigned(FOnMapInit) then
    FOnMapInit(VMapSetting.MapGeosetDay);
end;

{$REGION 'NFS Socket'}
procedure GameSimManager.OnConnected(msg: string);
var
  recSend: TRecData2DOrder;
begin
  FAutoConnectToBridgeTimer.Enabled := False;

  //req sync packet after connect
  recSend.orderID := _CM_REQ_SYNCPACKET;
  recSend.numValue := 0;
  recSend.strValue := '';
  recSend.strValue2 := '';
  recSend.strValue3 := '';
  recSend.ipConsole := '';
  SimManager.NFSNetRecv.sendDataEx(REC_2D_ORDER, @recSend);
end;

procedure GameSimManager.OnDisconnected(msg: string);
begin
  FAutoConnectToBridgeTimer.Enabled := True;
end;

procedure GameSimManager.tmrAutoConnectToBridgeTimer(Sender: TObject);
begin
  //connect to NFS bridge
  if SimManager.NFSNetRecv.State = wsClosed then
  begin
    SimManager.NFSNetRecv.Connect(VNfsNetwork.ServerIP, IntToStr(VNfsNetwork.Serverport));
  end
end;

{$ENDREGION}

{$REGION 'NetNFS Receive Order'}

procedure GameSimManager.netNFS_OnDeleteShip(apRec: PAnsiChar; aSize: integer);
var
  i: integer;
  aRec: ^TRecData3DOrder;
begin
  aRec := @apRec^;
end;

procedure GameSimManager.netNFS_OnReceive2DOrder(apRec: PAnsiChar; aSize: integer);
var
  rec: ^TRecData2DOrder;
  str: string;
begin
  rec := @apRec^;
  str := rec^.strValue;
end;

procedure GameSimManager.netNFS_OnReceiveData3DPosition(apRec: PAnsiChar; aSize: integer);
var
  rec: PRecData3DPosition;
  AShip: TShipContact;
begin
  rec := @apRec^;
  VehicleMgr.UpdateObjectList(rec);
end;

procedure GameSimManager.netNFS_OnReceiveMissilePos(apRec: PAnsiChar;
  aSize: Integer);
var
  Rec: ^TRec3DMissilePos;
  ShipObj: TShipContact;
  LauncherWpn: TC705Launcher;
begin
  Rec := @apRec^;

  ShipObj := VehicleMgr.FindObjectByID(Integer(Rec^.ShipID));
  if not Assigned(ShipObj) then
    Exit;

  LauncherWpn := GetLauncher(rec^.launcherID);
  if not Assigned(LauncherWpn) then
    Exit;

  // Cek dari ShipID yang sama
  if Rec^.ShipID = VOwnShip.ShipID then begin

    case Rec^.status of

      // MISSILE DI-LOAD (dari instructor)
      ST_MISSILE_LOADED:
      begin
        //FLauncherHasMissile[Rec^.launcherID] := True;
        LauncherWpn.SetHaveMissile(True);
      end;

      // MISSILE DITEMBAKKAN
      ST_MISSILE_RUN:
      begin
        //FLauncherHasMissile[Rec^.launcherID] := False;
        LauncherWpn.SetHaveMissile(False);
        LauncherWpn.LaunchMissileC705;

        FMissileTakeOff := True;
        FMissileTakeOffLauncherID := Rec^.launcherID;

        if Assigned(FOnTakeOffChanged) then
          FOnTakeOffChanged(Self);
      end;

      // MISSILE DIHAPUS / HABIS
      ST_MISSILE_DEL:
      begin
        //FLauncherHasMissile[Rec^.launcherID] := False;
        LauncherWpn.SetHaveMissile(False);

        FMissileTakeOff := False;
        FMissileTakeOffLauncherID := 0;

        if Assigned(FOnTakeOffChanged) then
          FOnTakeOffChanged(Self);
      end;

    end;

  end;

end;

procedure GameSimManager.netNFS_OnReceiveStatusConsole(apRec: PAnsiChar;
  aSize: Integer);
var
  //rec : ^TRecStatus_Console_C705;
  rec: ^TRecStatus_Console;
  TheChanges: TC705StatusType;
begin
  rec := @apRec^;

  case rec^.ErrorID of
    __STAT_C705_ENABLE: begin
      FC705Available := rec^.ParamError = __PARAM_C705_ON;

      {
      OutputDebugString(PChar(
      Format('netNFS_OnReceiveStatusConsole SafetyIgnition R = %d',
      [Ord(SimManager.GetLauncher(1).C705Status.SafetyIgnition)])));

      OutputDebugString(PChar(
      Format('netNFS_OnReceiveStatusConsole SafetyIgnition L = %d',
      [Ord(SimManager.GetLauncher(2).C705Status.SafetyIgnition)])));
      }
      //NotifyStatusWeaponChanged;
    end;
    {
    __STAT_C705_ENABLE: begin
      FC705Launcher[lchRight].SetEnableWeapon(rec^.ParamError=__PARAM_C705_ON);
      FC705Launcher[lchLeft].SetEnableWeapon(rec^.ParamError=__PARAM_C705_ON);

      //NotifyStatusWeaponChanged(stEnableWeapon);
    end;

    __STAT_C705_OpenCoverLauncherC705: begin
      FC705Launcher[lchRight].SetOpenCover(rec^.ParamError=__PARAM_C705_ON);
      FC705Launcher[lchLeft].SetOpenCover(rec^.ParamError=__PARAM_C705_ON);

      //NotifyStatusWeaponChanged(stOpenCover);
    end;

    __STAT_C705_SafetyIgnition: begin
      FC705Launcher[lchRight].SetSafetyIgnition(rec^.ParamError=__PARAM_C705_ON);
      FC705Launcher[lchLeft].SetSafetyIgnition(rec^.ParamError=__PARAM_C705_ON);

      //NotifyStatusWeaponChanged(stSafetyIgnition);
    end;
    }

  end;

end;

procedure GameSimManager.netNFS_OnReceiveEnvironment(apRec: PAnsiChar;
  aSize: Integer);
var
  rec: ^TRecDataEnvironment;
begin
  rec:= @apRec^;

  OutputDebugString(PChar(
    Format('SizeOf(TRecDataEnvironment) = %d | kedua',
    [SizeOf(TRecDataEnvironment)])));

  FEnvironment.SeaState := Rec^.seaState;
//  FEnvironment.WindVelocity := Rec^.WindVelocity;
//  FEnvironment.WindHeading := Rec^.WindHeading;
//  FEnvironment.SeaCurrentVelocity := Rec^.SeaCurrentVelocity;
//  FEnvironment.SeaCurrentHeading := Rec^.SeaCurrentHeading;
//  FEnvironment.Temperature := Rec^.Temperature;
//  FEnvironment.Humidity := Rec^.Humidity;
//  FEnvironment.SurfacePressure := Rec^.SurfacePressure;
//  FEnvironment.FogIntensity := Rec^.FogIntensity;

  if Assigned(FOnEnvironmentChanged) then
    FOnEnvironmentChanged(Self);
end;

procedure GameSimManager.netNFS_OnSendDataC705(rec: TRec_Data_C705);
begin
  if (NFSNetRecv <> nil) and (NFSNetRecv.State in [wsConnected]) then
      NFSNetRecv.sendDataEx(Rec_Data_C705, @Rec);
end;

{$ENDREGION}

{$REGION 'Sequence to Change Panel in PanelArea3A dan PanelArea3B'}
procedure GameSimManager.LauncherMissileLaunched(Sender: TObject);
var
  RecDataC705 : TRec_Data_C705;
  Launcher : TC705Launcher;
begin
  Launcher := TC705Launcher(Sender);

  if Launcher = nil then
    Exit;

  recDataC705.ShipID := VOwnShip.ShipID;
  recDataC705.mWeaponID := VOwnShip.WeaponId;

  //recDataC705.mLauncherID := LauncherID;
  case Launcher.LauncherID of
    lchRight: recDataC705.mLauncherID := 1;

    lchLeft:  recDataC705.mLauncherID := 2;
  end;

  recDataC705.mMissileID := 1;
  recDataC705.mMissileNumber := 1;
  //recDataC705.OrderID := 0; // harusnya diganti per command, misal fire, atau yang lain
  recDataC705.OrderID := __ORD_ID_Fire_C705;
  recDataC705.mTargetBearing := Launcher.TargetBearing;
  recDataC705.mTargetRange := Launcher.TargetRange;
  recDataC705.mTargetId := 0; //Launcher.TargetID;

  netNFS_OnSendDataC705(recDataC705);

  // RESET TARGET
  VehicleMgr.SelectedTargetID := -1;
  SimManager.RoutePlanMode := mPassive;
end;

procedure GameSimManager.LauncherStatusChanged(Sender: TObject);
begin
  //NotifyStatusWeaponChanged(stEnableWeapon);
  NotifyStatusWeaponChanged(Sender);
end;

//procedure GameSimManager.NotifyStatusWeaponChanged(aStatus: TC705StatusType);
//var
//  i : Integer;
//begin
//  for i := 0 to FStatusWeaponEvents.Count-1 do
//    TStatusWeaponEventItem(FStatusWeaponEvents[i]).Event(Self, aStatus);
//end;
procedure GameSimManager.NotifyStatusWeaponChanged(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to FStatusWeaponEvents.Count-1 do
    TStatusWeaponEventItem(FStatusWeaponEvents[i]).Event(Sender);
end;

procedure GameSimManager.RegisterStatusWeaponEvent(aEvent: TStatusWeaponChangedEvent);
var
  Item : TStatusWeaponEventItem;
begin
  Item := TStatusWeaponEventItem.Create;
  Item.Event := aEvent;

  FStatusWeaponEvents.Add(Item);
end;

procedure GameSimManager.UnregisterStatusWeaponEvent(aEvent: TStatusWeaponChangedEvent);
var
  i : Integer;
  M1,M2 : TMethod;
begin
  M1 := TMethod(aEvent);

  for i := FStatusWeaponEvents.Count-1 downto 0 do
  begin
    M2 := TMethod(TStatusWeaponEventItem(FStatusWeaponEvents[i]).Event);

    if (M1.Code = M2.Code) and
       (M1.Data = M2.Data) then
    begin
      FStatusWeaponEvents.Delete(i);
      Break;
    end;
  end;
end;

{$ENDREGION}

end.

