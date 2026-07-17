unit uC705SimManager;

interface

uses
  System.SysUtils, Vcl.ExtCtrls, System.Contnrs, OverbyteIcsWSocket, uTCPClient,
  uTCPDatatype, uLibSettings, uShipModel, uVehicleManager,
  Winapi.Windows, Vcl.Dialogs, System.Classes;

type
  TRoutePlanMode = (mPassive, mActive, mFiring);
  TOnMapInit = procedure(const GeosetPath: string) of object;

  TC705StatusType = (
    stEnableWeapon,
    stOpenCover,
    stSafetyIgnition
  );

  TStatusWeaponChanged =
    procedure(Sender: TObject; AStatus: TC705StatusType) of object;

  TTargetSelectedEvent =
    procedure(Sender: TObject; aTarget: TShipContact; Range: Double) of object;

  TC705Status = record
    {
      Console Status
      ----------------
      Berasal langsung dari Console WCC
    }
    EnableWeapon,
    OpenCoverLauncher,
    SafetyIgnition : Boolean;

    {
      Internal Simulation Status
      ---------------------------
      Status berikut bukan berasal dari network,
      melainkan dihitung oleh Simulation Manager.
    }
    // TRUE apabila proses Warm-up selesai.
    WarmUpDone: Boolean;

    // TRUE apabila Seeker telah siap digunakan
    SeekerReady: Boolean;
  end;

  // Multicast Notify Event
  TStatusWeaponChangedEvent = procedure(Sender: TObject;
    aStatus: TC705StatusType) of object;

  TStatusWeaponEventItem = class
  public
    Event: TStatusWeaponChangedEvent;
  end;

  GameSimManager = class
  private
    { NFS Dependencies }
    FNFSObjectList: TObjectList;
    FAutoConnectToBridgeTimer: TTimer;

    FOnMapInit: TOnMapInit;
    //FOnStatusWeaponChanged,
    FOnTakeOffChanged: TNotifyEvent;
    FMissileTakeOff: Boolean;

    FStatusWeaponEvents : TObjectList;

    FOnStatusWeaponChanged: TStatusWeaponChanged;
    FOnTargetSelectedAction: TTargetSelectedEvent;

    FC705Status: TC705Status;

    // WarmUp Missile
    // Timer simulasi Warmup missile.
    // Digunakan untuk mensimulasikan proses pemanasan seeker setelah Weapon Power On
    FWarmUpTimer: TTimer;

    procedure NotifyStatusWeaponChanged(aStatus: TC705StatusType);

    procedure tmrAutoConnectToBridgeTimer(Sender: TObject);
    procedure OnConnected(msg: string);
    procedure OnDisconnected(msg: string);

    { Receive procedure from NFS }
    procedure netNFS_OnReceiveData3DPosition(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnReceive2DOrder(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnDeleteShip(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnReceiveStatusConsole(apRec: PAnsiChar; aSize: Integer);
    procedure netNFS_OnReceiveMissilePos(apRec: PAnsiChar; aSize: Integer);

    procedure tmrWarmUpTimer(Sender: TObject);
  public
    FRoutePlanMode: TRoutePlanMode;
    NFSNetRecv: TTCPClient;

    // TRUE  = EMPTY SLOT     // FALSE = MISSILE READY
    FLauncherHasMissile: array[1..2] of Boolean;
    //** “Saat ini launcher MASIH ADA missile” **

    constructor Create;
    destructor Destroy; override;

    procedure InitializeMap;

    function isReadyToLaunchC705: Boolean;

    function GetLauncherStateStr(aLauncherID: Integer): string;

    procedure ResetLauncher(aLauncherID: Integer);

    procedure SetImgPowerConsole(aStatus: Boolean);

    // for Multicast Notify Event
    procedure RegisterStatusWeaponEvent(aEvent : TStatusWeaponChangedEvent);
    procedure UnregisterStatusWeaponEvent(aEvent : TStatusWeaponChangedEvent);

    property RoutePlanMode: TRoutePlanMode read FRoutePlanMode write FRoutePlanMode;
    property OnMapInit: TOnMapInit read FOnMapInit write FOnMapInit;

    property C705Status: TC705Status read FC705Status write FC705Status;
    //property OnStatusWeaponChanged: TNotifyEvent read FOnStatusWeaponChanged write FOnStatusWeaponChanged;
    property OnStatusWeaponChanged: TStatusWeaponChanged read FOnStatusWeaponChanged write FOnStatusWeaponChanged;
    property OnTakeOffChanged: TNotifyEvent read FOnTakeOffChanged write FOnTakeOffChanged;
    property OnTargetSelectedAction: TTargetSelectedEvent read FOnTargetSelectedAction write FOnTargetSelectedAction;

    property MissileTakeOff: Boolean read FMissileTakeOff write FMissileTakeOff;

    // Send Data
    procedure netNFS_OnSendDataC705(rec: TRec_Data_C705);
  published
    {
      Main Function of Simulation
    }
  end;

var
  SimManager: GameSimManager;

implementation

{ GameSimManager }

constructor GameSimManager.Create;
var
  i, j : Integer;
begin
  // Default Operation Route Planning
  FRoutePlanMode := mPassive;

  FC705Status.EnableWeapon := False;
  FC705Status.OpenCoverLauncher := False;
  FC705Status.SafetyIgnition := False;

  FMissileTakeOff := False;

  {Socket NFS}
  NFSNetRecv := TTCPClient.Create;

  NFSNetRecv.OnConnected := OnConnected;
  NFSNetRecv.OnDisconnected := OnDisconnected;

  {Register Procedure NetNFS}
  NFSNetRecv.RegisterProcedure(REC_3D_POSITION, netNFS_OnReceiveData3DPosition, SizeOf(TRecData3DPosition));
  NFSNetRecv.RegisterProcedure(REC_2D_ORDER, netNFS_OnReceive2DOrder, SizeOf(TRecData2DOrder));
  NFSNetRecv.RegisterProcedure(REC_3D_ORDER, netNFS_OnDeleteShip, SizeOf(TRecData3DOrder));

  NFSNetRecv.RegisterProcedure(Rec_Data_C705, nil, SizeOf(TRec_Data_C705));

  NFSNetRecv.RegisterProcedure(REC_3D_MISSILEPOS, netNFS_OnReceiveMissilePos, SizeOf(TRec3DMissilePos));

  // C705 Status
  //NFSNetRecv.RegisterProcedure(REC_STAT_ORDER_CONSOLE, netNFS_OnReceiveStatusConsole, SizeOf(TRecStatus_Console_C705));
  NFSNetRecv.RegisterProcedure(REC_STAT_ORDER_CONSOLE, netNFS_OnReceiveStatusConsole, SizeOf(TRecStatus_Console));

  {Timer untuk Connect ke Bridge}
  FAutoConnectToBridgeTimer := TTimer.Create(nil);
  FAutoConnectToBridgeTimer.Interval := 5000;
  FAutoConnectToBridgeTimer.OnTimer := tmrAutoConnectToBridgeTimer;
  FAutoConnectToBridgeTimer.Enabled := True;

  // Load Missile
  for i := 1 to 2 do
  begin
    FLauncherHasMissile[i] := False;
  end;

  FStatusWeaponEvents := TObjectList.Create(True); // Auto Free Object

  // Timer Set Panel Area3A & Area3B
  FWarmUpTimer := TTimer.Create(nil);
  FWarmUpTimer.Enabled := False;
  FWarmUpTimer.Interval := 3000;  // 3 detik
  FWarmUpTimer.OnTimer := tmrWarmUpTimer;;
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

  if Assigned(FWarmUpTimer) then
  begin
    FWarmUpTimer.Enabled := False;
    FWarmUpTimer.OnTimer := nil;
    FreeAndNil(FWarmUpTimer);
  end;

  inherited;
end;

function GameSimManager.GetLauncherStateStr(aLauncherID: Integer): string;
var
  s1, s2: string;
begin
  // TRUE = EMPTY
  if FLauncherHasMissile[aLauncherID] then
    Result := 'READY'
  else
    Result := 'EMPTY';
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
begin
  Rec := @apRec^;

  ShipObj := VehicleMgr.FindObjectByID(Integer(Rec^.ShipID));

  if not Assigned(ShipObj) then
    Exit;

  // Cek dari ShipID yang sama
  if Rec^.ShipID = VOwnShip.ShipID then begin

    case Rec^.status of

      // MISSILE DI-LOAD (dari instructor)
      ST_MISSILE_LOADED:
      begin
        FLauncherHasMissile[Rec^.launcherID] := True;
      end;

      // MISSILE DITEMBAKKAN
      ST_MISSILE_RUN:
      begin
        FLauncherHasMissile[Rec^.launcherID] := False;

        FMissileTakeOff := True;

        if Assigned(FOnTakeOffChanged) then
          FOnTakeOffChanged(Self);
      end;

      // MISSILE DIHAPUS / HABIS
      ST_MISSILE_DEL:
      begin
        FLauncherHasMissile[Rec^.launcherID] := False;
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
      //FC705Status.EnableWeapon := rec^.ParamError = __PARAM_C705_ON;

      if FC705Status.EnableWeapon <> (rec^.ParamError = __PARAM_C705_ON) then begin
        FC705Status.EnableWeapon := rec^.ParamError = __PARAM_C705_ON;
        NotifyStatusWeaponChanged(stEnableWeapon);

        if FC705Status.EnableWeapon then begin
          // Mulai Simulasi WarmUp dengan Timer
          FC705Status.WarmUpDone := False;
          FC705Status.SeekerReady := False;

          FWarmUpTimer.Enabled := False;
          FWarmUpTimer.Enabled := True;
        end
        else begin
          // Reset seluruh status internal (WarmUp, SeekerReady)
          FWarmUpTimer.Enabled := False;

          FC705Status.WarmUpDone := False;
          FC705Status.SeekerReady := False;
        end;
      end;

    end;

    __STAT_C705_OpenCoverLauncherC705: begin
      //FC705Status.OpenCoverLauncher := rec^.ParamError = __PARAM_C705_ON;

      if FC705Status.OpenCoverLauncher <> (rec^.ParamError = __PARAM_C705_ON) then begin
        FC705Status.OpenCoverLauncher := rec^.ParamError = __PARAM_C705_ON;
        NotifyStatusWeaponChanged(stOpenCover);
      end;
    end;

    __STAT_C705_SafetyIgnition: begin
      //FC705Status.SafetyIgnition := rec^.ParamError = __PARAM_C705_ON;

      if FC705Status.SafetyIgnition <> (rec^.ParamError = __PARAM_C705_ON) then begin
        FC705Status.SafetyIgnition := rec^.ParamError = __PARAM_C705_ON;
        NotifyStatusWeaponChanged(stSafetyIgnition);
      end;
    end;

  end;

end;

procedure GameSimManager.netNFS_OnSendDataC705(rec: TRec_Data_C705);
begin
  if (NFSNetRecv <> nil) and (NFSNetRecv.State in [wsConnected]) then
      NFSNetRecv.sendDataEx(Rec_Data_C705, @Rec);
end;

{$ENDREGION}

function GameSimManager.IsReadyToLaunchC705: Boolean;
begin
  Result :=
    FC705Status.EnableWeapon and FC705Status.OpenCoverLauncher
      and FC705Status.SafetyIgnition;
end;

procedure GameSimManager.NotifyStatusWeaponChanged(aStatus: TC705StatusType);
var
  i : Integer;
begin
  for i := 0 to FStatusWeaponEvents.Count-1 do
    TStatusWeaponEventItem(FStatusWeaponEvents[i]).Event(Self, aStatus);
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

procedure GameSimManager.RegisterStatusWeaponEvent(aEvent: TStatusWeaponChangedEvent);
var
  Item : TStatusWeaponEventItem;
begin
  Item := TStatusWeaponEventItem.Create;
  Item.Event := aEvent;

  FStatusWeaponEvents.Add(Item);
end;

procedure GameSimManager.ResetLauncher(aLauncherID: Integer);
begin
  FLauncherHasMissile[aLauncherID] := False;

  // Reset -> Kosong semua
end;

procedure GameSimManager.SetImgPowerConsole(aStatus: Boolean);
begin
  if aStatus then

end;

{
 Warm-up Timer.
 Dipanggil otomatis setelah Weapon Power On (dari WCC/ Instruktur) selama 3 detik
}
procedure GameSimManager.tmrWarmUpTimer(Sender: TObject);
begin
  FWarmUpTimer.Enabled := False;

  FC705Status.WarmUpDone := True;
  FC705Status.SeekerReady := True;

  NotifyStatusWeaponChanged(stEnableWeapon);
end;

end.

