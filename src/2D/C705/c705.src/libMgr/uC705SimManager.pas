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
    SeekerRdy,
    SeaTargetRdy,
    InsideSectorRdy,
    ParaSettingRdy,
    PLCChkRdy,
    INITChkRdy,
    INITStateRdy,
    INSGNSSRdy,
    MNormalRdy,
    CalFinishRdy,
    ParaLockRdy,
    FullOpenRdy: Boolean;
  end;

  // Multicast Notify Event
  TStatusWeaponChangedEvent = procedure(Sender: TObject;
    aStatus: TC705StatusType) of object;

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

    FStatusWeaponEvents : TObjectList;

    FOnStatusWeaponChanged: TStatusWeaponChanged;
    FOnTargetSelectedAction: TTargetSelectedEvent;

    FC705Status: TC705Status;

    // WarmUp Missile
    // Timer simulasi Warmup missile.
    // Digunakan untuk mensimulasikan proses pemanasan seeker setelah Weapon Power On
    FWarmUpTimer: TTimer;
    // Timer buat Sequence setelah klik Target
    FTargetSequenceTimer: TTimer;

    FIdxTargetStep: Integer;

    { Environment }
    FEnvironment: TEnvironmentStatus;
    FOnEnvironmentChanged : TEnvironmentChanged;

    procedure NotifyStatusWeaponChanged(aStatus: TC705StatusType);

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

    procedure tmrWarmUpTimer(Sender: TObject);
    procedure tmrTargetSequenceTimer(Sender: TObject);
  public
    FRoutePlanMode: TRoutePlanMode;
    NFSNetRecv: TTCPClient;

    // TRUE  = EMPTY SLOT     // FALSE = MISSILE READY
    FLauncherHasMissile: array[1..2] of Boolean;
    //** “Saat ini launcher MASIH ADA missile” **

    constructor Create;
    destructor Destroy; override;

    function isReadyToLaunchC705: Boolean;
    function GetLauncherStateStr(aLauncherID: Integer): string;

    procedure InitializeMap;
    // Send Data
    procedure netNFS_OnSendDataC705(rec: TRec_Data_C705);

    // for Multicast Notify Event
    procedure RegisterStatusWeaponEvent(aEvent : TStatusWeaponChangedEvent);
    procedure UnregisterStatusWeaponEvent(aEvent : TStatusWeaponChangedEvent);

    // Memulai proces Target Acquisition
    // Ganti panel SeaTgt, InsideSector, ParamSetting.
    procedure StartTargetSequence;

    property RoutePlanMode: TRoutePlanMode read FRoutePlanMode write FRoutePlanMode;
    property OnMapInit: TOnMapInit read FOnMapInit write FOnMapInit;

    property C705Status: TC705Status read FC705Status write FC705Status;
    //property OnStatusWeaponChanged: TNotifyEvent read FOnStatusWeaponChanged write FOnStatusWeaponChanged;
    property OnStatusWeaponChanged: TStatusWeaponChanged read FOnStatusWeaponChanged write FOnStatusWeaponChanged;
    property OnTakeOffChanged: TNotifyEvent read FOnTakeOffChanged write FOnTakeOffChanged;
    property OnTargetSelectedAction: TTargetSelectedEvent read FOnTargetSelectedAction write FOnTargetSelectedAction;
    property Environment : TEnvironmentStatus read FEnvironment;
    property OnEnvironmentChanged : TEnvironmentChanged read FOnEnvironmentChanged write FOnEnvironmentChanged;

    property MissileTakeOff: Boolean read FMissileTakeOff write FMissileTakeOff;
  published
    {
      Main Function of Simulation
    }
  end;

var
  SimManager: GameSimManager;

implementation

{ GameSimManager }

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
  AddRegisterProcedure;
  OutputDebugString(PChar(
    Format('SizeOf(TRecDataEnvironment) = %d',
    [SizeOf(TRecDataEnvironment)])));

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
  FWarmUpTimer.OnTimer := tmrWarmUpTimer;

  // Timer Sequence setelah klik Target
  FTargetSequenceTimer := TTimer.Create(nil);
  FTargetSequenceTimer.Enabled := False;
  FTargetSequenceTimer.Interval := 2000;
  FTargetSequenceTimer.OnTimer := tmrTargetSequenceTimer;
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

  if Assigned(FTargetSequenceTimer) then
  begin
    FTargetSequenceTimer.Enabled := False;
    FTargetSequenceTimer.OnTimer := nil;
    FreeAndNil(FTargetSequenceTimer);
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

function GameSimManager.IsReadyToLaunchC705: Boolean;
begin
  Result :=
    FC705Status.EnableWeapon and FC705Status.OpenCoverLauncher
      and FC705Status.SafetyIgnition;
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

        if FC705Status.EnableWeapon then begin
          // Mulai Simulasi WarmUp dengan Timer
          FC705Status.WarmUpDone := False;
          FC705Status.SeekerRdy := False;

          FWarmUpTimer.Enabled := False;
          FWarmUpTimer.Enabled := True;
        end
        else begin
          // Reset seluruh status internal (WarmUp, SeekerReady)
          FWarmUpTimer.Enabled := False;

          FC705Status.WarmUpDone := False;
          FC705Status.SeekerRdy := False;
        end;

        NotifyStatusWeaponChanged(stEnableWeapon);
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
procedure GameSimManager.NotifyStatusWeaponChanged(aStatus: TC705StatusType);
var
  i : Integer;
begin
  for i := 0 to FStatusWeaponEvents.Count-1 do
    TStatusWeaponEventItem(FStatusWeaponEvents[i]).Event(Self, aStatus);
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

procedure GameSimManager.StartTargetSequence;
begin
  FC705Status.SeaTargetRdy := False;
  FC705Status.InsideSectorRdy := False;
  FC705Status.ParaSettingRdy := False;

  NotifyStatusWeaponChanged(stEnableWeapon);

  FIdxTargetStep := 0;

  FTargetSequenceTimer.Enabled := True;
end;

{
 Warm-up Timer.
 Dipanggil otomatis setelah Weapon Power On (dari WCC/ Instruktur) selama 3 detik
}
procedure GameSimManager.tmrWarmUpTimer(Sender: TObject);
begin
  FWarmUpTimer.Enabled := False;

  FC705Status.WarmUpDone := True;
  FC705Status.SeekerRdy := True;

  NotifyStatusWeaponChanged(stEnableWeapon);
end;

procedure GameSimManager.tmrTargetSequenceTimer(Sender: TObject);
begin
  case FIdxTargetStep of

    //--------------------------------------------------------
    // STEP-1
    // Sea Target
    //--------------------------------------------------------
    0:  begin
      FC705Status.SeaTargetRdy := True;

      NotifyStatusWeaponChanged(stEnableWeapon);

      Inc(FIdxTargetStep);
    end;

    //--------------------------------------------------------
    // STEP-2
    // Inside Sector
    //--------------------------------------------------------
    1:  begin
      FC705Status.InsideSectorRdy := True;

      NotifyStatusWeaponChanged(stEnableWeapon);

      Inc(FIdxTargetStep);
    end;

    //--------------------------------------------------------
    // STEP-3
    // Parameter Setting
    //--------------------------------------------------------
    2:  begin
      FC705Status.ParaSettingRdy := True;

      NotifyStatusWeaponChanged(stEnableWeapon);

      FTargetSequenceTimer.Enabled := False;
      //tunggu 5 detik
      FTargetSequenceTimer.Interval := 5000;
    end;

    3:  begin
      FC705Status.PlcChkRdy := True;

      // balik lagi ke 2 detik
      FTargetSequenceTimer.Interval := 2000;
    end;

    4:
      FC705Status.InitChkRdy := True;

    5:
      FC705Status.InitStateRdy := True;

    6:
      FC705Status.InsGnssRdy := True;

    7:
      FC705Status.MNormalRdy := True;

    8:
      FC705Status.CalFinishRdy := True;

    9:
      FC705Status.ParaLockRdy := True;

    10: begin
      FC705Status.FullOpenRdy := True;

      FTargetSequenceTimer.Enabled := False;
    end;

  end;
end;

{$ENDREGION}

end.

