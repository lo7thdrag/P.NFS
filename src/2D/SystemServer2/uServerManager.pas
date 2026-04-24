unit uServerManager;

interface

uses
  Classes, ExtCtrls, Windows, SysUtils, Vcl.Forms, Vcl.Dialogs,
  overbyteicsWSocketS,
  uTCPServer, uTCPDatatype, uDataType,
  uNetLinkServer, uData3DConverter,
  uBridgeSet,
  Logger,
  uDataModule,
  uStateManager, uClassDatabase,
  uStateObject;

type
  TConnectStatus = procedure(const sl: TStringList) of Object;

  TServerManager = class(TObject)
  private
    // setting
    FLogFile: TLogFile;
    bridgeSet: TRecBridgeSet;
    bridgeSetPath: string;

    DBServer, DBProto, DBName, DBUser, DBPass, DBPort: string;

    FServer2D: TTCPServer;
    TcpServer3D: TNetLinkServer;

    FStateManager: TStateManager;
    FTimerBroadcast: TTimer;

    FNetLinkServer_OnClientStatus: TConnectStatus;
    FOnClientStatus3D: TGetStrProc;
    FOnClientStatus2D: TGetStrProc;
    FOnLogReceived3d: TGetStrProc;
    FOnLogReceived2d: TGetStrProc;
    FOnLogListenPort2D: TGetStrProc;
    FOnLogListenPort3D: TGetStrProc;
    TimerGetPacket: TTimer;

    FLastScenarioActive: Integer;

    procedure OnTimerGetPacketRun(sender: TObject);

    procedure LoadScenario(const useDB: Boolean);
    procedure StopScenario;

    procedure OnTmrBroadcast(sender: TObject);

    // Event Connect & Disconnect From Client Bridge 2D
    procedure OnClient2DTCPConnect(msg: string);
    procedure OnClient2DTCPDisconnect(msg: string);

    procedure FNetLinkServer_OnClientConnect(const s: string);
    procedure FNetLinkServer_OnClientDisconnect(const s: string);
    procedure FNetLinkServer_OnLogReceived(const s: string);

    procedure ListenServer2D(Address, Port: string);
    procedure ListenServer3D(Address, Port: string);

    procedure Prepare_As_Server2D;
    procedure Prepare_As_Server3D;

    function FindObjectByShipID(const ShipID: Word): TObject;

    // event for network
    // procedure Server2Drecv_Missilepos(apRec: PAnsiChar; aSize: Integer;
    // sender: TWSocketClient);
    procedure ClientRecv_3D_Order(apRec: PAnsiChar; aSize: Integer;
      sender: TWSocketClient);

    procedure Server2DReceive_Server3DSend(apRec: PAnsiChar; aSize: Integer;
      sender: TWSocketClient);
    procedure Server2DRecv_StatusGame(apRec: PAnsiChar; aSize: Integer;
      sender: TWSocketClient);

    procedure ServerReceive_ClientManagement(apRec: PAnsiChar; aSize: Integer;
      sender: TWSocketClient);

    // event for network 3D
    procedure RecvReqSce(AHeader: TPacketHeader; AContent: string);
    // procedure NetHandler_Recv_3DStatus(AHeader: TPacketHeader;
    // AContent: string);
    procedure RecvReqEnv(AHeader: TPacketHeader; AContent: string);
    procedure ClientRecv_3D_MissilePos(AHeader: TPacketHeader;
      AContent: string);
    procedure ClientRecv_3D_ShipPos(AHeader: TPacketHeader; AContent: string);
    procedure ServerRecv_3D_Server2DSend(AHeader: TPacketHeader;
      AContent: string);

  public

    constructor Create;
    destructor Destroy; override;

    function InitSimulation: Boolean;
    procedure RunSimulation;
    procedure StopSimulation;

    procedure SetEventLogForServer3D;

    procedure SetLog2DServer(aLog: TStringList);

    function GetServer2DClientCount: Integer;
    procedure CloseOneServer2DClient;

    property Server2D: TTCPServer read FServer2D;

    // event Log for network 2D
    property OnLogListenPort2D: TGetStrProc read FOnLogListenPort2D
      write FOnLogListenPort2D;
    property OnLogReceived2D: TGetStrProc read FOnLogReceived2d
      write FOnLogReceived2d;
    property OnClientStatus2D: TGetStrProc read FOnClientStatus2D
      write FOnClientStatus2D;

    // event Log for network 3D
    property OnClientStatus3D: TGetStrProc read FOnClientStatus3D
      write FOnClientStatus3D;
    property OnLogReceived3D: TGetStrProc read FOnLogReceived3d
      write FOnLogReceived3d;
    property OnLogListenPort3D: TGetStrProc read FOnLogListenPort3D
      write FOnLogListenPort3D;
    property PubBridgeSet: TRecBridgeSet read bridgeSet
      write bridgeSet;
  end;

implementation

uses
  Grijjy.Bson,
  Grijjy.Bson.IO,
  Grijjy.Bson.Serialization;

{ TStateManager }

constructor TServerManager.Create;
begin
  inherited;
  FLogFile := TLogFile.Create;
  FLogFile.FileName := ChangeFileExt(Application.ExeName, '.log');
  FLogFile.IsLog := True;
  FLogFile.Init;

  FServer2D := TTCPServer.Create;
  FServer2D.OnClientConnect := OnClient2DTCPConnect;
  FServer2D.OnClientDisConnect := OnClient2DTCPDisconnect;

  TcpServer3D := TNetLinkServer.Create;
  TcpServer3D.OnClient_Connect := FNetLinkServer_OnClientConnect;
  TcpServer3D.OnClient_DisConnect := FNetLinkServer_OnClientDisconnect;

  FStateManager := TStateManager.Create;

  TimerGetPacket := TTimer.Create(nil);
  TimerGetPacket.Enabled := False;
  TimerGetPacket.Interval := 16;
  TimerGetPacket.OnTimer := OnTimerGetPacketRun;

  FTimerBroadcast := TTimer.Create(nil);
  FTimerBroadcast.Enabled := True;
  FTimerBroadcast.Interval := 30;
  FTimerBroadcast.OnTimer := OnTmrBroadcast;
end;

destructor TServerManager.Destroy;
begin
  FTimerBroadcast.Free;

  FStateManager.Free;

  TimerGetPacket.Free;

  TcpServer3D.Free;

  FServer2D.Free;
  FLogFile.Free;
  inherited;
end;

function TServerManager.InitSimulation: Boolean;
begin
  Result := False;
  bridgeSetPath := GetSettingDirectory;

  InitDefault_DBConfig(bridgeSetPath, DBServer, DBProto, DBName, DBUser,
    DBPass, DBPort);
  FLogFile.Log('DEBUG', 'bridgeSetPath = ' + bridgeSetPath);
  FLogFile.Log('DEBUG', 'DBServer = ' + DBServer);
  FLogFile.Log('DEBUG', 'DBProto = ' + DBProto);
  FLogFile.Log('DEBUG', 'DBName = ' + DBName);
  FLogFile.Log('DEBUG', 'DBUser = ' + DBUser);
  FLogFile.Log('DEBUG', 'DBPass = ' + DBPass);
  FLogFile.Log('DEBUG', 'DBPort = ' + DBPort);
  if not dmMain.InitZDB(DBServer, DBProto, DBName, DBUser, DBPass, DBPort) then
  begin
    FLogFile.Log('ERROR', 'Connection to database failed!!');
    ShowMessage('Connection to database failed!!');
    Exit;
  end;

  with bridgeSet.mSystemServer do
  begin
    InitDefault_SystemServerConfig(bridgeSetPath, Server2DAddress, Server2DPort,
      Server3DAddress, Server3DPort, Project);
  end;

  Prepare_As_Server2D;
  Prepare_As_Server3D;
  Result := True;
end;

procedure TServerManager.RunSimulation;
begin
  ListenServer2D(bridgeSet.mSystemServer.Server2DAddress,
    bridgeSet.mSystemServer.Server2DPort);
  ListenServer3D(bridgeSet.mSystemServer.Server3DAddress,
    bridgeSet.mSystemServer.Server3DPort);
end;

procedure TServerManager.StopSimulation;
begin
  TimerGetPacket.Enabled := False;
  FServer2D.UnregisterAllProcedure;
  FServer2D.Stop;

  TcpServer3D.UnregisterAllProcedure;
  TcpServer3D.Stop;
end;

procedure TServerManager.SetEventLogForServer3D;
begin
  TcpServer3D.OnGetStatusLog := FOnLogReceived3d;
  TcpServer3D.OnGetSendLog := FOnLogReceived3d;
  TcpServer3D.OnGetRecvLog := FOnLogReceived3d;
end;

procedure TServerManager.SetLog2DServer(aLog: TStringList);
begin
  FServer2D.setLog(aLog);
end;

function TServerManager.GetServer2DClientCount: Integer;
begin
  Result := FServer2D.WSocketServer.ClientCount;
end;

procedure TServerManager.CloseOneServer2DClient;
begin
  FServer2D.WSocketServer.Client[FServer2D.WSocketServer.ClientCount - 1].Close
end;

procedure TServerManager.ClientRecv_3D_MissilePos(AHeader: TPacketHeader;
  AContent: string);
var
  incoming_data: TRecMissilePos3D;
  apRec: TRec3DMissilePos;
begin
  if Length(AContent) > 0 then
  begin
    TgoBsonSerializer.Deserialize<TRecMissilePos3D>(AContent, incoming_data);

//    if Assigned(FOnLogReceived3d) then
//    begin
//      FOnLogReceived3d('JSON : ' + AContent);
//      FOnLogReceived3d('REC_3D_MISSILEPOS' + #13#10 +
//        'ShipID : ' + IntToStr(incoming_data.ShipID) + #13#10 +
//        'X : ' + FormatFloat('0.00', incoming_data.X) + #13#10 +
//        'Y : ' + FormatFloat('0.00', incoming_data.Y) + #13#10 +
//        'Z : ' + FormatFloat('0.00', incoming_data.Y));
//    end;

    apRec.ShipID := incoming_data.ShipID;
    apRec.WeaponID := incoming_data.WeaponID;
    apRec.launcherID := incoming_data.launcherID;
    apRec.missileID := incoming_data.missileID;
    apRec.MissileNumber := incoming_data.MissileNumber;
    apRec.status := incoming_data.status;
    apRec.X := incoming_data.X;
    apRec.y := incoming_data.y;
    apRec.z := incoming_data.z;
    apRec.heading := incoming_data.heading;
    apRec.speed := incoming_data.speed;

    FServer2D.SendDataEx(REC_3D_MISSILEPOS, @apRec, nil);
  end;
end;

procedure TServerManager.ClientRecv_3D_Order(apRec: PAnsiChar; aSize: Integer;
  sender: TWSocketClient);
begin

end;

procedure TServerManager.ClientRecv_3D_ShipPos(AHeader: TPacketHeader;
  AContent: string);
var
  incoming_data: TRecDataPosition3D;
   apRec: TRecData3DPosition;
  o: TObject;
  so: TShipObject;
  Obj: TShipObject;
begin
  if Length(AContent) > 0 then
  begin
    TgoBsonSerializer.Deserialize<TRecDataPosition3D>(AContent, incoming_data);

//    if Assigned(FOnLogReceived3d) then
//    begin
//      FOnLogReceived3d('JSON : ' + AContent);
//      FOnLogReceived3d('REC3D_POSITION' + #13#10 +
//        'ShipID : ' + IntToStr(incoming_data.ShipID) + #13#10 +
//        'X : ' + FormatFloat('0.00', incoming_data.X) + #13#10 +
//        'Y : ' + FormatFloat('0.00', incoming_data.Y) + #13#10 +
//        'Z : ' + FormatFloat('0.00', incoming_data.Z));
//    end;

//     apRec.ShipID := incoming_data.ShipID;
//     apRec.X := incoming_data.X;
//     apRec.y := incoming_data.y;
//     apRec.z := incoming_data.z;
//     apRec.heading := incoming_data.heading;
//     apRec.speed := incoming_data.speed;
//     apRec.pitch := incoming_data.pitch;
//     apRec.roll := incoming_data.roll;
//     apRec.rudder := incoming_data.rudder;

    o := FindObjectByShipID(incoming_data.ShipID);
    if Assigned(o) then
    begin
      if o is TShipObject then
      begin
        so := o as TShipObject;
        so.X := incoming_data.X;
        so.y := incoming_data.y;
        so.z := incoming_data.z;
        so.heading := incoming_data.heading;
        so.speed := incoming_data.speed;
        so.pitch := incoming_data.pitch;
        so.roll := incoming_data.roll;
        so.rudder := incoming_data.rudder;

        if Assigned(FOnLogReceived3d) then
        begin
//          FOnLogReceived3d('JSON : ' + AContent);
          FOnLogReceived3d('REC3D_POSITION' + ', ' +
            'ShipID : ' + IntToStr(incoming_data.ShipID) + ', ' +
            'X : ' + FormatFloat('0.00', incoming_data.X) + ', ' +
            'Y : ' + FormatFloat('0.00', incoming_data.Y) + ', ' +
            'Z : ' + FormatFloat('0.00', incoming_data.Z) + ', ' +
            ' Update Pos Kapal');
        end;
      end;
    end
    else   // jika nambah kapal
    begin
      Obj := TShipObject.Create;
      Obj.IDShip := incoming_data.ShipID;
      Obj.X := incoming_data.X;
      Obj.y := incoming_data.Y;
      Obj.z := incoming_data.Z;
      Obj.heading := incoming_data.Heading;
      Obj.pitch := 0.0;
      Obj.roll := 0.0;
      Obj.speed := 0;
      Obj.rudder := 0.0;

      FStateManager.Add(Obj);

      if Assigned(FOnLogReceived3d) then
        begin
//          FOnLogReceived3d('JSON : ' + AContent);
          FOnLogReceived3d('REC3D_POSITION' + ', ' +
            'ShipID : ' + IntToStr(incoming_data.ShipID) + ', ' +
            'X : ' + FormatFloat('0.00', incoming_data.X) + ', ' +
            'Y : ' + FormatFloat('0.00', incoming_data.Y) + ', ' +
            'Z : ' + FormatFloat('0.00', incoming_data.Z) + ', ' +
            ' Add New Kapal ');
        end;
    end;

//    FServer2D.SendDataEx(REC_3D_POSITION, @apRec, nil);
  end;
end;

function TServerManager.FindObjectByShipID(const ShipID: Word): TObject;
var
  i: Integer;
  o: TObject;
  so: TShipObject;
begin
  Result := nil;
  for i := 0 to FStateManager.Count - 1 do
  begin
    o := FStateManager.Items[i];
    if Assigned(o) then
    begin
      if o is TShipObject then
      begin
        so := o as TShipObject;
        if so.IDShip = ShipID then
        begin
          Result := o;
          Exit
        end;
      end;
    end;
  end;

end;

procedure TServerManager.FNetLinkServer_OnClientConnect(const s: string);
var
  sl: TStringList;
begin
  // if Assigned(OnLogReceived3D) then
  // OnLogReceived3D(s);

  sl := TStringList.Create;
  try
    TcpServer3D.GetConnectedList(sl);

    if Assigned(FNetLinkServer_OnClientStatus) then
      FNetLinkServer_OnClientStatus(sl);

    if Assigned(FOnClientStatus3D) then
      FOnClientStatus3D(s)
  finally
    sl.DisposeOf;
  end;
end;

//
procedure TServerManager.FNetLinkServer_OnClientDisconnect(const s: string);
var
  sl: TStringList;
begin
  if Assigned(OnLogReceived3D) then
    OnLogReceived3D(s);

  sl := TStringList.Create;
  try
    TcpServer3D.GetConnectedList(sl);

    if Assigned(FNetLinkServer_OnClientStatus) then
      FNetLinkServer_OnClientStatus(sl);
  finally
    sl.DisposeOf;
  end;
end;

procedure TServerManager.ListenServer2D(Address, Port: string);
begin
  FServer2D.Listen(Address, Port);

  if Assigned(OnLogListenPort2D) then
    OnLogListenPort2D(Port);

end;

procedure TServerManager.LoadScenario(const useDB: Boolean);
var
  i: Integer;
  o: TObject;
  Obj: TShipObject;
  cnt: Integer;
  recScenarioStat: TRecScenarioStat;
  recObj: TRecDataPosition3D;
begin

  recScenarioStat.StatusSce := 1;
  TcpServer3D.SendData(REC_SCESTAT, recScenarioStat);

  if useDB then
  begin

    dmMain.Ds.Close;

    dmMain.Ds.SQL.Clear;
    dmMain.Ds.SQL.Add('SELECT *');
    dmMain.Ds.SQL.Add('FROM sce_ship');
    dmMain.Ds.SQL.Add('WHERE IDM=' + IntToStr(FLastScenarioActive));
    dmMain.Ds.SQL.Add('ORDER BY IDM, ID, IDSHIP');
    dmMain.Ds.Open;
    dmMain.Ds.First;

    cnt := dmMain.Ds.RecordCount;

    if not dmMain.Ds.IsEmpty then
    begin
      // if not Assigned(aRec) then
      // aRec := TList.Create
      // else
      // aRec.Clear;

      while not dmMain.Ds.Eof do
      begin
        Obj := TShipObject.Create;
        Obj.IDShip := dmMain.Ds.FieldByName('IDSHIP').AsInteger;
        Obj.X := dmMain.Ds.FieldByName('TRANS_X').AsFloat;
        Obj.y := dmMain.Ds.FieldByName('TRANS_Y').AsFloat;
        Obj.z := dmMain.Ds.FieldByName('TRANS_Z').AsFloat;
        Obj.heading := dmMain.Ds.FieldByName('HEADING').AsInteger;
        Obj.pitch := 0.0;
        Obj.roll := 0.0;
        Obj.speed := dmMain.Ds.FieldByName('SPEED').AsInteger;
        Obj.rudder := 0.0;

        FStateManager.Add(Obj);

        recObj.ShipID := Obj.IDShip;
        recObj.X := Obj.X;
        recObj.y := Obj.y;
        recObj.z := Obj.z;
        recObj.heading := Obj.heading;
        recObj.pitch := Obj.pitch;
        recObj.roll := Obj.roll;
        recObj.speed := Obj.speed;
        recObj.rudder := Obj.rudder;
        recObj.fuel := 0.0;
        recObj.status := 0.0;
        TcpServer3D.SendData(REC3D_POSITION, recObj);

        dmMain.Ds.Next;
      end;
    end

  end
  else
  begin

    for i := 0 to FStateManager.Count - 1 do
    begin
      o := FStateManager.Items[i];
      if Assigned(o) then
      begin
        if o is TShipObject then
        begin
          Obj := o as TShipObject;

          recObj.ShipID := Obj.IDShip;
          recObj.X := Obj.X;
          recObj.y := Obj.y;
          recObj.z := Obj.z;
          recObj.heading := Obj.heading;
          recObj.pitch := Obj.pitch;
          recObj.roll := Obj.roll;
          recObj.speed := Obj.speed;
          recObj.rudder := Obj.rudder;
          recObj.fuel := 0.0;
          recObj.status := 0.0;

          TcpServer3D.SendData(REC3D_POSITION, recObj);
        end;
      end;
    end;

  end;

  recScenarioStat.StatusSce := 2;
  TcpServer3D.SendData(REC_SCESTAT, recScenarioStat);

end;

procedure TServerManager.StopScenario;
var
  recScenarioStat: TRecScenarioStat;
begin
  FStateManager.ClearAll;
  recScenarioStat.StatusSce := 3;
  TcpServer3D.SendData(REC_SCESTAT, recScenarioStat);
end;

procedure TServerManager.ListenServer3D(Address, Port: string);
begin
  TcpServer3D.Listen(Address, Port);

  if Assigned(OnLogListenPort3D) then
    OnLogListenPort3D(Port);

  TimerGetPacket.Enabled := True;
end;

// procedure TServerManager.NetHandler_Recv_3DStatus(AHeader: TPacketHeader;
// AContent: string);
// var
// incoming_data: TRecStatusGame3D;
// begin
// if Length(AContent) > 0 then
// begin
// TgoBsonSerializer.Deserialize<TRecStatusGame3D>(AContent, incoming_data);
//
// if Assigned(FOnLogReceived3d) then
// begin
// FOnLogReceived3d('JSON : ' + AContent);
// FOnLogReceived3d('REC_STATUS_GAME' + #13#10 + 'ScenarioID : ' +
// IntToStr(incoming_data.ScenarioID) + #13#10 + 'StatusConnect : ' +
// IntToStr(incoming_data.StatusConnect));
// end;
// end;
//
// end;

procedure TServerManager.OnClient2DTCPConnect(msg: string);
begin
  if Assigned(FOnClientStatus2D) then
    FOnClientStatus2D('Client ' + msg + ' Connected');
end;

procedure TServerManager.OnClient2DTCPDisconnect(msg: string);
begin
  if Assigned(FOnClientStatus2D) then
    FOnClientStatus2D('Client ' + msg + ' Disconnected');
end;

procedure TServerManager.OnTmrBroadcast(sender: TObject);
var
  o: TObject;
  so: TShipObject;
  apRec: TRecData3DPosition;
begin
  o := FStateManager.GetNextObject;
  if Assigned(o) then
  begin
    if o is TShipObject then
    begin
      so := o as TShipObject;

      apRec.ShipID := so.IDShip;
      apRec.X := so.X;
      apRec.y := so.y;
      apRec.z := so.z;
      apRec.heading := so.heading;
      apRec.speed := so.speed;
      apRec.pitch := so.pitch;
      apRec.roll := so.roll;
      apRec.rudder := 0;
      FServer2D.SendDataEx(REC_3D_POSITION, @apRec, nil);
    end;
  end;
end;

procedure TServerManager.OnTimerGetPacketRun(sender: TObject);
begin
  TimerGetPacket.Enabled := False;
  try
    TcpServer3D.GetPacket;
  finally
    TimerGetPacket.Enabled := True;
  end;
end;

procedure TServerManager.FNetLinkServer_OnLogReceived(const s: string);
begin
  if Assigned(FOnLogReceived3d) then
    FOnLogReceived3d(s);
end;

procedure TServerManager.Prepare_As_Server2D;
begin
  // Receive Scenario id
  FServer2D.RegisterProcedure(REC_STATUS_GAME, Server2DRecv_StatusGame,
    SizeOf(TRecStatusGame));
  // FServer2D.RegisterProcedure(REC_2D_ORDER, ServerReceive_ClientManagement,
  // SizeOf(TRecData2DOrder));
  // For Weapon
  FServer2D.RegisterProcedure(REC_3D_EXOCET, Server2DReceive_Server3DSend,
    SizeOf(TRecSetExocet));
  FServer2D.RegisterProcedure(REC_3D_ASROCK, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetAsrock));
  FServer2D.RegisterProcedure(REC_3D_RBU, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetRBU));
  FServer2D.RegisterProcedure(REC_3D_TORPEDO_SUT, Server2DReceive_Server3DSend,
    SizeOf(TRecSetTorpedoSUT));
  FServer2D.RegisterProcedure(REC_SPSS_ORDER, Server2DReceive_Server3DSend,
    SizeOf(TRecDataTorperdo));
  FServer2D.RegisterProcedure(C_REC_CANNON, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetWCC));
  FServer2D.RegisterProcedure(REC_CMD_TETRAL, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetTetral));
  FServer2D.RegisterProcedure(REC_CMD_MISTRAL, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetMistral));
  FServer2D.RegisterProcedure(REC_CMD_STRELLA, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetStrella));
  FServer2D.RegisterProcedure(REC_DATA_Yakhont, Server2DReceive_Server3DSend,
    SizeOf(TRecData_YAkhont));
  FServer2D.RegisterProcedure(REC_DATA_C802, Server2DReceive_Server3DSend,
    SizeOf(TRecData_C802));
  FServer2D.RegisterProcedure(REC_CMD_EXOCET_40, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetExocet_40));
  FServer2D.RegisterProcedure(REC_SET_CHAFF, Server2DReceive_Server3DSend,
    SizeOf(TRecSetChaff));
  FServer2D.RegisterProcedure(REC_SET_ASROCK, Server2DReceive_Server3DSend,
    SizeOf(TRecSetAsrock));
  FServer2D.RegisterProcedure(REC_3D_TORPEDO_MK44, Server2DReceive_Server3DSend,
    SizeOf(TRecTorpedoMK44Order));
  FServer2D.RegisterProcedure(REC_3D_WCC, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetWCC));
  FServer2D.RegisterProcedure(REC_CMD_DESIG_A244, Server2DReceive_Server3DSend,
    SizeOf(TRecDesigA244));
  FServer2D.RegisterProcedure(REC_CMD_VLMICA, Server2DReceive_Server3DSend,
    SizeOf(TRec3DSetVLMica));
  FServer2D.RegisterProcedure(REC_3D_STAT_ORDER_CONSOLE, Server2DReceive_Server3DSend,
    SizeOf(TRecStatus_Console3D));
  FServer2D.RegisterProcedure(REC_STAT_ORDER_CONSOLE, Server2DReceive_Server3DSend,
    SizeOf(TRecStatus_Console));

  // For Position
  FServer2D.RegisterProcedure(REC_3D_MISSILEPOS, Server2DReceive_Server3DSend,
    SizeOf(TRec3DMissilePos));
  FServer2D.RegisterProcedure(REC_3D_POSITION, Server2DReceive_Server3DSend,
    SizeOf(TRecData3DPosition));
  FServer2D.RegisterProcedure(REC_STAT_CANNON_SPLASH,
    Server2DReceive_Server3DSend, SizeOf(TRecSplashCANNON));

  // For Utility
  FServer2D.RegisterProcedure(REC_3D_ORDER, Server2DReceive_Server3DSend,
    SizeOf(TRecData3DOrder));
  FServer2D.RegisterProcedure(REC_RECV_TORP_STATE, Server2DReceive_Server3DSend,
    SizeOf(TRec_TorpStatus));
  FServer2D.RegisterProcedure(REC_3D_SETCONTROL, Server2DReceive_Server3DSend,
    SizeOf(spActorsController));
  FServer2D.RegisterProcedure(REC_3D_UTIL_TOOLS, Server2DReceive_Server3DSend,
    SizeOf(spUtilityTools));
  FServer2D.RegisterProcedure(REC_STATUS_MESSAGE, Server2DReceive_Server3DSend,
    SizeOf(TRecMessageHandling));

  FServer2D.RegisterProcedure(REC_CMD_SET_CAMERA_TARGET, Server2DReceive_Server3DSend,
      sizeof(TRecCmdSetCameraTarget));

  FServer2D.RegisterProcedure(Rec_CMD_CAMERA_CONTROLLER, Server2DReceive_Server3DSend,
      sizeof(TRec_CameraController));

  FServer2D.RegisterProcedure(REC_ENVI_3D, Server2DReceive_Server3DSend,
      sizeof(TRecDataEnvironment));

  // GUIDANCE VEHICLE
  FServer2D.RegisterProcedure(REC_GUIDANCE, Server2DReceive_Server3DSend,
    SizeOf(TRecGuidance));

  // C705; angga
  FServer2D.RegisterProcedure(Rec_Data_C705, Server2DReceive_Server3DSend,
      sizeof(TRec_Data_C705));
end;

procedure TServerManager.Prepare_As_Server3D;
begin
  TcpServer3D.RegisterProcedure(REC_SCEID, RecvReqSce);
  TcpServer3D.RegisterProcedure(REC_REQENVI, RecvReqEnv);
  TcpServer3D.RegisterProcedure(REC_SCESTAT, nil);

  // TcpServer3D.RegisterProcedure(REC3D_STATUS_GAME, NetHandler_Recv_3DStatus);

  // for weapon
  TcpServer3D.RegisterProcedure(REC_3D_EXOCET, nil);
  TcpServer3D.RegisterProcedure(REC_3D_ASROCK, nil);
  TcpServer3D.RegisterProcedure(REC_3D_RBU, nil);
  TcpServer3D.RegisterProcedure(REC_3D_TORPEDO_SUT, nil);
  TcpServer3D.RegisterProcedure(REC_SPSS_ORDER, nil);
  TcpServer3D.RegisterProcedure(C_REC_CANNON, nil);
  TcpServer3D.RegisterProcedure(REC_CMD_TETRAL, nil);
  TcpServer3D.RegisterProcedure(REC_CMD_MISTRAL, nil);
  TcpServer3D.RegisterProcedure(REC_CMD_STRELLA, nil);
  TcpServer3D.RegisterProcedure(REC_CMD_MISTRAL, nil);
  TcpServer3D.RegisterProcedure(REC_DATA_Yakhont, nil);
  TcpServer3D.RegisterProcedure(REC_DATA_C802, nil);
  TcpServer3D.RegisterProcedure(REC_CMD_EXOCET_40, nil);
  TcpServer3D.RegisterProcedure(REC_CMD_DESIG_A244_3D, nil);
  TcpServer3D.RegisterProcedure(REC_CMD_VLMICA, nil);
  TcpServer3D.RegisterProcedure(REC_DATA_C7053D, nil);
  TcpServer3D.RegisterProcedure(REC_3D_STAT_ORDER_CONSOLE, nil);
  TcpServer3D.RegisterProcedure(REC_STAT_ORDER_CONSOLE, nil);

  // For Position
  TcpServer3D.RegisterProcedure(REC3D_POSITION, ClientRecv_3D_ShipPos);
  TcpServer3D.RegisterProcedure(REC_3D_MISSILEPOS, ClientRecv_3D_MissilePos);
  TcpServer3D.RegisterProcedure(REC_STAT_CANNON_SPLASH,
    ServerRecv_3D_Server2DSend);
  TcpServer3D.RegisterProcedure(C_REC_CANNON,
    ServerRecv_3D_Server2DSend);

  // For Utility
  TcpServer3D.RegisterProcedure(REC_3D_ORDER, ServerRecv_3D_Server2DSend);
  TcpServer3D.RegisterProcedure(REC_RECV_TORP_STATE,
    ServerRecv_3D_Server2DSend);
  TcpServer3D.RegisterProcedure(REC_3D_SETCONTROL, nil);
  TcpServer3D.RegisterProcedure(REC_3D_UTIL_TOOLS, ServerRecv_3D_Server2DSend);
  TcpServer3D.RegisterProcedure(REC_STATUS_MESSAGE, ServerRecv_3D_Server2DSend);
  TcpServer3D.RegisterProcedure(REC_CMD_SET_CAMERA_TARGET_3D, nil);
  TcpServer3D.RegisterProcedure(REC_ENVI_3D, nil);

end;

procedure TServerManager.Server2DReceive_Server3DSend(apRec: PAnsiChar;
  aSize: Integer; sender: TWSocketClient);
var
  pc: TPacketCheck;
  RecRecv: ^TRecSplashCANNON;
  RecRecvTorpState: ^TRec_TorpStatus;
  RecRecvStatusMessage: ^TRecMessageHandling;
  RecvData3DOrder: ^TRecData3DOrder;
  RecSendData3DOrder: TRecData3DOrder3D;
  strWeapon: string;

  Recv2dMissilePos: ^TRec3DMissilePos;
  RecSend3DMissilePos: TRec3DMissilePos;

  RecSendMissilePos: TRecMissilePos3D;

  Recv2DPos: ^TRecData3DPosition;
  RecSend2DPositionTo3D: TRecDataPosition3D;

  RecvRecMeriam: ^TRec3DSetWCC;
  RecSendMeriamTo3D: TRec3DSetWCC3D;

  recTorpedoSut: ^TRecSetTorpedoSUT;
  recSenTorpedoSut: TRecSetTorpedoSUT3D;

  recRBU: ^TRec3DSetRBU;
  recSendRBU: TRec3DSetRBU3D;

  recExocet: ^TRec3DSetExocet;
  recSendExocet: TRecSetExocet3D;

  recASROC: ^TRec3DSetAsrock;
  recSendASROC: TRec3DSetAsrock3D;

  recA244: ^TRecDataTorperdo;
  recSendA244: TRecDataTorperdo3D;

  recYAHKONT: ^TRecData_YAkhont;
  recSendYahkont: TRecData_Yakhont3D;

  recC802: ^TRecData_C802;
  recSendC802: TRecData_C8023D;

  recExocetMM40: ^TRec3DSetExocet_40;
  recSendExocetMM40: TRecSetExocet3D_40;

  recTetral: ^TRec3DSetTetral;
  recSendTetral: TRec3DSetTetral3D;

  recActorController3d: ^spActorsController;
  recSendActorController3d: spActorsController3D;

  recUtilityTools: ^spUtilityTools;
  recSendUtiityTools: spUtilityTools3D;

  recGuidance: ^TRecGuidance;
  recSendGuidance: TRecGuidance3D;

  recSetChaff: ^TRecSetChaff;
  recSendChaff: TRec3DSetChaff3D;

  recTorpedoMK44order: ^TRecTorpedoMK44Order;
  recSendTorpedoMk44Order: TRecTorpedoMK44Order3D;

  RecMistral: ^TRec3DSetMistral;
  RecSendMistral: TRec3DSetMistral3D;

  RecStrella: ^TRec3DSetStrella;
  recSendStrella: TRec3DSetStrella3D;

  RecDesigA244: ^TRecDesigA244;
  RecSendDesigA2443D: TRecDesigA2443D;

  RecVLMica: ^TRec3DSetVLMica;
  RecSendVLMica3D: TRecSetVLMica3D;

  RecCmdSetCameraTarget: ^TRecCmdSetCameraTarget;
  RecCmdSetCameraTarget3D: TRecCmdSetCameraTarget3D;

  RecCmdSetCameraControl: ^TRec_CameraController;
  RecCmdSetCameraControl3D: TRec_CameraController3D;

  RecCmdSetEnvi: ^TRecDataEnvironment;
  RecCmdSetEnvi3D: TRecDataEnvironment3D;

  RecDataFireC705: ^TRec_Data_C705;
  RecDataFireC7053D: TRecData_C7053D;

  RecDataStatusConsole: ^TRecStatus_Console;
  RecDataStatusConsole3D: TRecStatus_Console3D;

  o: TObject;

  tempInt: Integer;

//  ShipClassID: Integer;
begin
  // client socket received. server socket rebroadcast.
  // receive from 3D, send to 3D panel
  // theServer.WSocketServer.

  CopyMemory(@pc, apRec, SizeOf(TPacketCheck));
  // tcpServer.SendDataEx(pc.ID, apRec, nil);

  case pc.ID of
    REC_3D_TORPEDO_SUT:
      begin
        recTorpedoSut := @apRec^;
        recSenTorpedoSut.ShipID := recTorpedoSut^.ShipID;
        recSenTorpedoSut.mWeaponID := recTorpedoSut^.mWeaponID;
        // Diisi sesuai Database
        recSenTorpedoSut.mLauncherID := recTorpedoSut^.mLauncherID;
        recSenTorpedoSut.mMissileID := recTorpedoSut^.mMissileID;
        recSenTorpedoSut.mMissileNumber := recTorpedoSut^.mMissileNumber;
        // Diisi 0 aj...nanti instruktur yang ngisi ulang
        recSenTorpedoSut.mT_ID := recTorpedoSut^.mT_ID;
        recSenTorpedoSut.OrderID := recTorpedoSut^.OrderID;

        recSenTorpedoSut.mTorpedoCourse := recTorpedoSut^.mTorpedoCourse;
        recSenTorpedoSut.mTorpedoSpeed := recTorpedoSut^.mTorpedoSpeed;
        recSenTorpedoSut.mTorpedoDepth := recTorpedoSut^.mTorpedoDepth;
        recSenTorpedoSut.mTorpedoSafeDistance :=
          recTorpedoSut^.mTorpedoSafeDistance;
        recSenTorpedoSut.mTorpedoEnDis := recTorpedoSut^.mTorpedoEnDis;
        recSenTorpedoSut.mpredm := recTorpedoSut^.mpredm;
        recSenTorpedoSut.mTargetType := recTorpedoSut^.mTargetType;

        TcpServer3D.SendData(REC_3D_TORPEDO_SUT, recSenTorpedoSut);
      end;
    REC_3D_RBU:
      begin
        recRBU := @apRec^;

        recSendRBU.ShipID := recRBU^.ShipID;
        recSendRBU.mWeaponID := recRBU^.mWeaponID; // Diisi sesuai Database
        recSendRBU.mLauncherID := recRBU^.mLauncherID;
        recSendRBU.mMissileID := recRBU^.mMissileID;
        recSendRBU.mMissileNumber := recRBU^.mMissileNumber;
        // Diisi 0 aj...nanti instruktur yang ngisi ulang
        recSendRBU.mCount := recRBU^.mCount;
        recSendRBU.mMissileType := recRBU^.mMissileType;
        recSendRBU.mTargetID := recRBU^.mTargetID; // Added by bagoes
        recSendRBU.OrderID := recRBU^.OrderID;

        recSendRBU.mLncrBearing := recRBU^.mLncrBearing;
        recSendRBU.mLncRange := recRBU^.mLncRange;
        recSendRBU.mTargetDepth := recRBU^.mTargetDepth;
        recSendRBU.mCorrBearing := recRBU^.mCorrBearing;
        recSendRBU.mCorrElev := recRBU^.mCorrElev;

        if (recRBU^.OrderID = __ORD_RBU_LOADING) then
        begin
          RecSend3DMissilePos.ShipID := recRBU^.ShipID;
          RecSend3DMissilePos.WeaponID := recRBU^.mWeaponID;
          RecSend3DMissilePos.launcherID := recRBU^.mLauncherID;
          RecSend3DMissilePos.missileID := recRBU^.mMissileID;
          RecSend3DMissilePos.MissileNumber := recRBU^.mMissileNumber;
          RecSend3DMissilePos.status := 0;
          case recRBU^.OrderID of
            __ORD_RBU_LOADING:
              RecSend3DMissilePos.status := ST_MISSILE_LOADED;
          end;
          RecSend3DMissilePos.X := 0;
          RecSend3DMissilePos.y := 0;
          RecSend3DMissilePos.z := 0;
          RecSend3DMissilePos.heading := 0.0;
          RecSend3DMissilePos.speed := 0.0;

          FServer2D.SendDataEx(REC_3D_MISSILEPOS, @RecSend3DMissilePos, nil);
        end;

        TcpServer3D.SendData(REC_3D_RBU, recSendRBU);
      end;
    REC_SPSS_ORDER:
      begin
        recA244 := @apRec^;

        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('REC_SPSS_ORDER' + #13#10 +
            'shipID : ' + IntToStr(recA244^.ShipID) + #13#10 +
            'mWeaponID : ' + IntToStr(recA244^.mWeaponID) + #13#10 +
            'mLauncherID : ' + IntToStr(recA244^.mLauncherID) + #13#10 +
            'mMissileID : ' + IntToStr(recA244^.mMissileID) + #13#10 +
            'mMissileNumber : ' + IntToStr(recA244^.mMissileNumber) + #13#10 +
            'OrderID : ' + IntToStr(recA244^.OrderID) + #13#10 +
            'ISC : ' + FloatToStr(recA244^.ISC) + #13#10 +
            'ISR : ' + IntToStr(recA244^.ISR) + #13#10 +
            'WTR : ' + IntToStr(recA244^.WTR) + #13#10 +
            'CEI : ' + IntToStr(recA244^.CEI) + #13#10 +
            'PRG : ' + IntToStr(recA244^.PRG) + #13#10 +
            'DOP : ' + IntToStr(recA244^.DOP) + #13#10 +
            'ACE : ' + IntToStr(recA244^.ACE) + #13#10 +
            'FLO : ' + IntToStr(recA244^.FLO) + #13#10 +
            'ISD : ' + IntToStr(recA244^.ISD) + #13#10 +
            'ACM : ' + IntToStr(recA244^.ACM));

        recSendA244.ShipID := recA244^.ShipID;
        recSendA244.mWeaponID := recA244^.mWeaponID; // Diisi sesuai Database
        recSendA244.mLauncherID := recA244^.mLauncherID;
        recSendA244.mMissileID := recA244^.mMissileID;
        recSendA244.mMissileNumber := recA244^.mMissileNumber;
        // Diisi 0 aj...nanti instruktur yang ngisi ulang

        recSendA244.OrderID := recA244^.OrderID;

        recSendA244.ISC := recA244^.ISC;
        recSendA244.ISR := recA244^.ISR;
        recSendA244.WTR := recA244^.WTR; // (0: SH, 1 :DP);
        recSendA244.CEI := recA244^.CEI;
        recSendA244.PRG := recA244^.PRG; // (0: HE, 1 :SP)
        recSendA244.DOP := recA244^.DOP; // (0: CW, 1 :FM)
        recSendA244.ACE := recA244^.ACE;
        recSendA244.FLO := recA244^.FLO;
        recSendA244.ISD := recA244^.ISD;
        recSendA244.ACM := recA244^.ACM;

        TcpServer3D.SendData(REC_SPSS_ORDER, recSendA244);

        if (recA244.OrderID = _ORD_SPS_LOADING)
          or (recA244.OrderID = _ORD_SPS_FIRE)
        then
        begin

//          dmMain.Ds.Close;
//          dmMain.Ds.SQL.Clear;
//          dmMain.Ds.SQL.Add('SELECT SHIP_CLASS_ID');
//          dmMain.Ds.SQL.Add('FROM m_ship');
//          dmMain.Ds.SQL.Add('WHERE Ship_ID=' + IntToStr(recA244^.ShipID));
//          dmMain.Ds.Open;
//          dmMain.Ds.First;
//          ShipClassID:= 0;
//          if dmMain.Ds.RecordCount>0 then
//            ShipClassID:= dmMain.DS.FieldByName('SHIP_CLASS_ID').AsInteger;

          RecSend3DMissilePos.ShipID := recA244^.ShipID;
          RecSend3DMissilePos.WeaponID := recA244^.mWeaponID;
          RecSend3DMissilePos.launcherID := recA244^.mLauncherID;
          RecSend3DMissilePos.missileID := recA244^.mMissileID;
          RecSend3DMissilePos.MissileNumber := recA244^.mMissileNumber;
          RecSend3DMissilePos.status := 0;
          case recSendA244.OrderID of
            _ORD_SPS_FIRE:
              begin
//                if ShipClassID=10 then
                  RecSend3DMissilePos.status:= ST_MISSILE_RUN;
              end;
            _ORD_SPS_LOADING: RecSend3DMissilePos.status := ST_MISSILE_LOADED;
            // __ORD_SPS_ON:;
            // __ORD_SPS_OFF:;
          end;
          RecSend3DMissilePos.X := 0;
          RecSend3DMissilePos.y := 0;
          RecSend3DMissilePos.z := 0;
          RecSend3DMissilePos.heading := 0.0;
          RecSend3DMissilePos.speed := 0.0;
          FServer2D.SendDataEx(REC_3D_MISSILEPOS, @RecSend3DMissilePos, nil);
        end;
      end;
    REC_3D_EXOCET:
      begin
        recExocet := @apRec^;
        recSendExocet.ShipID := recExocet^.ShipID;
        recSendExocet.mWeaponID := recExocet^.mWeaponID;
        // Diisi sesuai Database
        recSendExocet.mLauncherID := recExocet^.mLauncherID;
        recSendExocet.mMissileID := recExocet^.mMissileID;
        recSendExocet.mMissileNumber := recExocet^.mMissileNumber;
        // Diisi 0 aj...nanti instruktur yang ngisi ulang

        recSendExocet.sOrder := recExocet^.sOrder;

        recSendExocet.mProxFuze := recExocet^.mProxFuze;
        recSendExocet.mAltitude := recExocet^.mAltitude;
        recSendExocet.mSearchArea := recExocet^.mSearchArea;
        recSendExocet.mRTG := recExocet^.mRTG;
        recSendExocet.mManualWidth := recExocet^.mManualWidth;
        recSendExocet.mSelecDepth := recExocet^.mSelecDepth;
        recSendExocet.mTBearing := recExocet^.mTBearing;
        recSendExocet.mTRange := recExocet^.mTRange;

        TcpServer3D.SendData(REC_3D_EXOCET, recSendExocet);
      end;
    {
      REC_3D_ASROCK:
      begin
      recASROC := @apRec^;
      recSendASROC.ShipID := recASROC^.ShipID;
      recSendASROC.mWeaponID := recASROC^.mWeaponID; // Diisi sesuai Database
      recSendASROC.mLauncherID := recASROC^.mLauncherID;
      recSendASROC.mMissileID := recASROC^.mMissileID;
      recSendASROC.mMissileNumber := recASROC^.mMissileNumber;
      // Diisi 0 aj...nanti instruktur yang ngisi ulang
      recSendASROC.mMissile_Type := recASROC^.mMissile_Type; // add by eka
      recSendASROC.mTargetID := recASROC^.mTargetID; // Added by bagoes
      recSendASROC.OrderID := recASROC^.OrderID;
      recSendASROC.mTargetBearing := recASROC^.mTargetBearing;
      recSendASROC.mTargetRange := recASROC^.mTargetRange;
      recSendASROC.mTargetDepth := recASROC^.mTargetDepth;
      recSendASROC.mFuzeType := recASROC^.mFuzeType; // 0: time   1 : prox

      recSendASROC.mCorrRange := recASROC^.mCorrRange;

      TcpServer3D.SendData(REC_3D_ASROCK, recSendASROC);
      end;
    }
    C_REC_CANNON:
      begin
        RecvRecMeriam := @apRec^;
        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('C_REC_CANNON' + #13#10 + 'shipID : ' +
            IntToStr(RecvRecMeriam^.ShipID) + #13#10 + 'mWeaponID : ' +
            IntToStr(RecvRecMeriam^.mWeaponID) + #13#10 + 'mLauncherID : ' +
            IntToStr(RecvRecMeriam^.mLauncherID) + #13#10 + 'mMissileID : ' +
            IntToStr(RecvRecMeriam^.mMissileID) + #13#10 + 'mMissileNumber : ' +
            IntToStr(RecvRecMeriam^.mMissileNumber) + #13#10 + 'mOrderID : ' +
            IntToStr(RecvRecMeriam^.mOrderID) + #13#10 + 'mTargetID : ' +
            IntToStr(RecvRecMeriam^.mTargetID) + #13#10 + 'mModeID : ' +
            IntToStr(RecvRecMeriam^.mModeID) + #13#10 + 'mUpDown : ' +
            FloatToStr(RecvRecMeriam^.mUpDown) + #13#10 + 'mAutoCorrectElev : '
            + FloatToStr(RecvRecMeriam^.mAutoCorrectElev) + #13#10 +
            'mAutoCorrectBearing : ' +
            FloatToStr(RecvRecMeriam^.mAutoCorrectBearing) + #13#10 +
            'mBalistikID : ' + IntToStr(RecvRecMeriam^.mBalistikID) + #13#10 +
            'mSalvoRate : ' + IntToStr(RecvRecMeriam^.mSalvoRate));

        RecSendMeriamTo3D.ShipID := RecvRecMeriam^.ShipID;
        RecSendMeriamTo3D.mWeaponID := RecvRecMeriam^.mWeaponID;
        RecSendMeriamTo3D.mLauncherID := RecvRecMeriam^.mLauncherID;
        RecSendMeriamTo3D.mMissileID := RecvRecMeriam^.mMissileID;
        RecSendMeriamTo3D.mMissileNumber := RecvRecMeriam^.mMissileNumber;
        RecSendMeriamTo3D.mOrderID := RecvRecMeriam^.mOrderID;
        RecSendMeriamTo3D.mTargetID := RecvRecMeriam^.mTargetID;

        RecSendMeriamTo3D.mModeID := RecvRecMeriam^.mModeID;
        RecSendMeriamTo3D.mUpDown := RecvRecMeriam^.mUpDown;
        RecSendMeriamTo3D.mAutoCorrectElev := RecvRecMeriam^.mAutoCorrectElev;
        RecSendMeriamTo3D.mAutoCorrectBearing :=
          RecvRecMeriam^.mAutoCorrectBearing;
        RecSendMeriamTo3D.mBalistikID := RecvRecMeriam^.mBalistikID;
        RecSendMeriamTo3D.mSalvoRate := RecvRecMeriam^.mSalvoRate;
        TcpServer3D.SendData(C_REC_CANNON, RecSendMeriamTo3D);
      end;
    {
      REC_3D_WCC:
      begin
      RecvRecMeriam := @apRec^;
      if Assigned(OnLogReceived2D) then
      OnLogReceived2D('REC_3D_WCC C_REC_CANNON' + #13#10 + 'shipID : ' +
      IntToStr(RecvRecMeriam^.ShipID) + #13#10 + 'mWeaponID : ' +
      IntToStr(RecvRecMeriam^.mWeaponID) + #13#10 + 'mLauncherID : ' +
      FloatToStr(RecvRecMeriam^.mLauncherID) + #13#10 + 'mMissileID : ' +
      FloatToStr(RecvRecMeriam^.mMissileID) + #13#10 + 'mMissileNumber : '
      + FloatToStr(RecvRecMeriam^.mMissileNumber) + #13#10 + 'mOrderID : '
      + FloatToStr(RecvRecMeriam^.mOrderID) + #13#10 + 'mTargetID : ' +
      FloatToStr(RecvRecMeriam^.mTargetID) + #13#10 + 'mModeID : ' +
      FloatToStr(RecvRecMeriam^.mModeID) + #13#10 + 'mUpDown : ' +
      FloatToStr(RecvRecMeriam^.mUpDown) + #13#10 + 'mAutoCorrectElev : '
      + FloatToStr(RecvRecMeriam^.mAutoCorrectElev) + #13#10 +
      'mAutoCorrectBearing : ' +
      FloatToStr(RecvRecMeriam^.mAutoCorrectBearing) + #13#10 +
      'mBalistikID : ' + FloatToStr(RecvRecMeriam^.mBalistikID) + #13#10 +
      'mSalvoRate : ' + FloatToStr(RecvRecMeriam^.mSalvoRate));

      RecSendMeriamTo3D.ShipID := RecvRecMeriam^.ShipID;
      RecSendMeriamTo3D.mWeaponID := RecvRecMeriam^.mWeaponID;
      RecSendMeriamTo3D.mLauncherID := RecvRecMeriam^.mLauncherID;
      RecSendMeriamTo3D.mMissileID := RecvRecMeriam^.mMissileID;
      RecSendMeriamTo3D.mMissileNumber := RecvRecMeriam^.mMissileNumber;
      RecSendMeriamTo3D.mOrderID := RecvRecMeriam^.mOrderID;
      RecSendMeriamTo3D.mTargetID := RecvRecMeriam^.mTargetID;

      RecSendMeriamTo3D.mModeID := RecvRecMeriam^.mModeID;
      RecSendMeriamTo3D.mUpDown := RecvRecMeriam^.mUpDown;
      RecSendMeriamTo3D.mAutoCorrectElev := RecvRecMeriam^.mAutoCorrectElev;
      RecSendMeriamTo3D.mAutoCorrectBearing :=
      RecvRecMeriam^.mAutoCorrectBearing;
      RecSendMeriamTo3D.mBalistikID := RecvRecMeriam^.mBalistikID;
      RecSendMeriamTo3D.mSalvoRate := RecvRecMeriam^.mSalvoRate;
      TcpServer3D.SendData(REC_3D_WCC, RecSendMeriamTo3D);
      end;
    }
    REC_DATA_Yakhont:
      begin
        recYAHKONT := @apRec^;
        
        if Assigned(OnLogReceived2D) then begin
          OnLogReceived2D('ShipID         = ' + IntToStr(recYAHKONT^.ShipID));
          OnLogReceived2D('mTargetID      = ' + IntToStr(recYAHKONT^.mTargetID));
          OnLogReceived2D('mWeaponID      = ' + IntToStr(recYAHKONT^.mWeaponID));
          OnLogReceived2D('mLauncherID    = ' + IntToStr(recYAHKONT^.mLauncherID));
          OnLogReceived2D('mMissileID     = ' + IntToStr(recYAHKONT^.mMissileID));
          OnLogReceived2D('mMissileNumber = ' + IntToStr(recYAHKONT^.mMissileNumber));
          OnLogReceived2D('mOrder         = ' + IntToStr(recYAHKONT^.OrderID));
          OnLogReceived2D('mTargetRange   = ' + FloatToStr(recYAHKONT^.mTargetRange));
          OnLogReceived2D('mTargetBearing = ' + FloatToStr(recYAHKONT^.mTargetBearing));
        end;
        
        recSendYahkont.ShipID := recYAHKONT^.ShipID;
        recSendYahkont.mWeaponID := recYAHKONT^.mWeaponID;
        recSendYahkont.mTargetID  := recYAHKONT^.mTargetID;          //Tambahan TargetID
        // Diisi sesuai Database
        recSendYahkont.mLauncherID := recYAHKONT^.mLauncherID;
        recSendYahkont.mMissileID := recYAHKONT^.mMissileID;
        recSendYahkont.mMissileNumber := recYAHKONT^.mMissileNumber;
        // Diisi 0 aj...nanti instruktur yang ngisi ulan

        recSendYahkont.mMissile1 := recYAHKONT^.mMissile1;
        recSendYahkont.mMissile2 := recYAHKONT^.mMissile2;
        recSendYahkont.mMissile3 := recYAHKONT^.mMissile3;
        recSendYahkont.mMissile4 := recYAHKONT^.mMissile4;

        recSendYahkont.OrderID := recYAHKONT^.OrderID;

        recSendYahkont.mTargetBearing := recYAHKONT^.mTargetBearing;
        recSendYahkont.mTargetRange := recYAHKONT^.mTargetRange;

        TcpServer3D.SendData(REC_DATA_Yakhont, recSendYahkont);

        if (recYAHKONT^.OrderID = __ORD_Yahkont_LOADING) then
        begin
          RecSend3DMissilePos.ShipID := recYAHKONT^.ShipID;
          RecSend3DMissilePos.WeaponID := recYAHKONT^.mWeaponID;
          RecSend3DMissilePos.launcherID := recYAHKONT^.mLauncherID;
          RecSend3DMissilePos.missileID := recYAHKONT^.mMissileID;
          RecSend3DMissilePos.MissileNumber := recYAHKONT^.mMissileNumber;
                    
          RecSend3DMissilePos.status := 0;
          case recYAHKONT^.OrderID of
            __ORD_Yahkont_LOADING:
              RecSend3DMissilePos.status := ST_MISSILE_LOADED;
          end;
          RecSend3DMissilePos.X := 0;
          RecSend3DMissilePos.y := 0;
          RecSend3DMissilePos.z := 0;
          RecSend3DMissilePos.heading := 0.0;
          RecSend3DMissilePos.speed := 0.0;

          FServer2D.SendDataEx(REC_3D_MISSILEPOS, @RecSend3DMissilePos, nil);
        end;

      end;
    REC_DATA_C802:
      begin
        recC802 := @apRec^;

        if Assigned(OnLogReceived2D) then
        begin

          OnLogReceived2D('ShipID :' + IntToStr(recC802^.ShipID));
          OnLogReceived2D('mTargetId :' + IntToStr(recC802^.mTargetID));
          OnLogReceived2D('mWeaponID :' + IntToStr(recC802^.mWeaponID));
          OnLogReceived2D('mLauncherID :' + IntToStr(recC802^.mLauncherID));
          OnLogReceived2D('mMissileID :' + IntToStr(recC802^.mMissileID));
          OnLogReceived2D('mMissileNumber :' +
            IntToStr(recC802^.mMissileNumber));
          OnLogReceived2D('OrderID :' + IntToStr(recC802^.OrderID) +
            'kalo 1 itu OrdID_C802_launch(1)');
          OnLogReceived2D('mTargetBearing :' +
            FloatToStr(recC802^.mTargetBearing));
          OnLogReceived2D('mTargetRange :' + FloatToStr(recC802^.mTargetRange));

        end;

        recSendC802.ShipID := recC802^.ShipID;
        recSendC802.mTargetID := recC802^.mTargetID;
        recSendC802.mWeaponID := recC802^.mWeaponID; // Diisi sesuai Database
        recSendC802.mLauncherID := recC802^.mLauncherID;
        recSendC802.mMissileID := recC802^.mMissileID;
        recSendC802.mMissileNumber := recC802^.mMissileNumber;
        // Diisi 0 aj...nanti instruktur yang ngisi ulan

        recSendC802.OrderID := recC802^.OrderID;

        recSendC802.mTargetBearing := recC802^.mTargetBearing;
        recSendC802.mTargetRange := recC802^.mTargetRange;
        TcpServer3D.SendData(REC_DATA_C802, recSendC802);

        if (recC802^.OrderID = __ORD_C802_LOADING) then
        begin
          RecSend3DMissilePos.ShipID := recC802^.ShipID;
          RecSend3DMissilePos.WeaponID := recC802^.mWeaponID;
          RecSend3DMissilePos.launcherID := recC802^.mLauncherID;
          RecSend3DMissilePos.missileID := recC802^.mMissileID;
          RecSend3DMissilePos.MissileNumber := recC802^.mMissileNumber;
          RecSend3DMissilePos.status := 0;
          case recC802^.OrderID of
            __ORD_C802_LOADING:
              RecSend3DMissilePos.status := ST_MISSILE_LOADED;
          end;
          RecSend3DMissilePos.X := 0;
          RecSend3DMissilePos.y := 0;
          RecSend3DMissilePos.z := 0;
          RecSend3DMissilePos.heading := 0.0;
          RecSend3DMissilePos.speed := 0.0;

          FServer2D.SendDataEx(REC_3D_MISSILEPOS, @RecSend3DMissilePos, nil);
        end;
      end;
    REC_CMD_EXOCET_40:
      begin
        recExocetMM40 := @apRec^;

        if Assigned(OnLogReceived2D) then
        begin
          OnLogReceived2D('ShipID = ' + IntToStr(recExocetMM40^.ShipID));
          OnLogReceived2D('mWeaponID = ' + IntToStr(recExocetMM40^.mWeaponID));
          OnLogReceived2D('mLauncherID = ' +
            IntToStr(recExocetMM40^.mLauncherID));
          OnLogReceived2D('mMissileID = ' +
            IntToStr(recExocetMM40^.mMissileID));
          OnLogReceived2D('mMissileNumber = ' +
            IntToStr(recExocetMM40^.mMissileNumber));
          OnLogReceived2D('sOrder = ' + IntToStr(recExocetMM40^.sOrder));
          OnLogReceived2D('mTRange = ' + FloatToStr(recExocetMM40^.mTRange));
          OnLogReceived2D('mTBearing = ' +
            FloatToStr(recExocetMM40^.mTBearing));
          OnLogReceived2D('TargetID = ' + IntToStr(recExocetMM40^.TargetID));
        end;

        recSendExocetMM40.ShipID := recExocetMM40^.ShipID;
        recSendExocetMM40.mWeaponID := recExocetMM40^.mWeaponID;
        recSendExocetMM40.mLauncherID := recExocetMM40^.mLauncherID;
        recSendExocetMM40.mMissileID := recExocetMM40^.mMissileID;
        recSendExocetMM40.mMissileNumber := recExocetMM40^.mMissileNumber;

        recSendExocetMM40.sOrder := recExocetMM40^.sOrder;

        recSendExocetMM40.mTRange := recExocetMM40^.mTRange;
        recSendExocetMM40.mTBearing := recExocetMM40^.mTBearing;

        recSendExocetMM40.mAngular_Mode := recExocetMM40^.mAngular_Mode;
        recSendExocetMM40.mAgility_Mode := recExocetMM40^.mAgility_Mode;
        recSendExocetMM40.mInitialStep_Mode := recExocetMM40^.mInitialStep_Mode;

        recSendExocetMM40.mObstacle_Alt := recExocetMM40^.mObstacle_Alt;
        recSendExocetMM40.mObstacle_Range := recExocetMM40^.mObstacle_Range;

        recSendExocetMM40.mApproach_Range := recExocetMM40^.mApproach_Range;
        recSendExocetMM40.mTerminal_Range := recExocetMM40^.mTerminal_Range;

        recSendExocetMM40.mLeft_Angle := recExocetMM40^.mLeft_Angle;
        recSendExocetMM40.mRight_Angle := recExocetMM40^.mRight_Angle;
        recSendExocetMM40.mFar_Range := recExocetMM40^.mFar_Range;
        recSendExocetMM40.mNear_Range := recExocetMM40^.mNear_Range;

        recSendExocetMM40.mMasking1 := recExocetMM40^.mMasking1;
        recSendExocetMM40.mMasking2 := recExocetMM40^.mMasking2;
        recSendExocetMM40.mMasking3 := recExocetMM40^.mMasking3;
        recSendExocetMM40.mMasking4 := recExocetMM40^.mMasking4;
        recSendExocetMM40.mMasking5 := recExocetMM40^.mMasking5;
        recSendExocetMM40.mMasking6 := recExocetMM40^.mMasking6;
        recSendExocetMM40.mMasking7 := recExocetMM40^.mMasking7;
        recSendExocetMM40.mMasking8 := recExocetMM40^.mMasking8;
        recSendExocetMM40.mMasking9 := recExocetMM40^.mMasking9;
        recSendExocetMM40.mMasking10 := recExocetMM40^.mMasking10;
        recSendExocetMM40.mMasking11 := recExocetMM40^.mMasking11;
        recSendExocetMM40.mMasking12 := recExocetMM40^.mMasking12;
        recSendExocetMM40.mMasking13 := recExocetMM40^.mMasking13;
        recSendExocetMM40.mMasking14 := recExocetMM40^.mMasking14;
        recSendExocetMM40.mMasking15 := recExocetMM40^.mMasking15;
        recSendExocetMM40.mMasking16 := recExocetMM40^.mMasking16;
        recSendExocetMM40.mSeekerOpenPosX := recExocetMM40^.mSeekerOpenPosX;
        recSendExocetMM40.mSeekerOpenPosY := recExocetMM40^.mSeekerOpenPosY;
        recSendExocetMM40.mSeekerOpenHeading :=
          recExocetMM40^.mSeekerOpenHeading;

        recSendExocetMM40.TargetID := recExocetMM40^.TargetID;

        TcpServer3D.SendData(REC_CMD_EXOCET_40, recSendExocetMM40);

        // warning
        // REC_CMD_EXOCET_40
        // REC_CMD_EXOCET_40       = 27;
        // __ORD_EXOCET_40_FIRE     = 1;
        // __ORD_EXOCET_40_LOADING  = 2;
        // __ORD_EXOCET_40_ON      = 3;
        // __ORD_EXOCET_40_OFF     = 4;

        // REC_3D_MISSILEPOS
        // status:
        // ST_MISSILE_RUN			= 1;
        // ST_MISSILE_HIT			= 2;
        // ST_MISSILE_DEL			= 3;
        // ST_MISSILE_LOADED   = 5;
        // ST_MISSILE_UNLOCK   = 6;
        // ST_MISSILE_LOCK     = 7;

        if (recExocetMM40.sOrder = __ORD_EXOCET_40_LOADING)
          or (recExocetMM40.sOrder=__ORD_EXOCET_40_FIRE)
        then
        begin

//          dmMain.Ds.Close;
//          dmMain.Ds.SQL.Clear;
//          dmMain.Ds.SQL.Add('SELECT SHIP_CLASS_ID');
//          dmMain.Ds.SQL.Add('FROM m_ship');
//          dmMain.Ds.SQL.Add('WHERE Ship_ID=' + IntToStr(recA244^.ShipID));
//          dmMain.Ds.Open;
//          dmMain.Ds.First;
//          ShipClassID:= 0;
//          if dmMain.Ds.RecordCount>0 then
//            ShipClassID:= dmMain.DS.FieldByName('SHIP_CLASS_ID').AsInteger;

          RecSend3DMissilePos.ShipID := recExocetMM40.ShipID;
          RecSend3DMissilePos.WeaponID := recExocetMM40.mWeaponID;
          RecSend3DMissilePos.launcherID := recExocetMM40.mLauncherID;
          RecSend3DMissilePos.missileID := recExocetMM40.mMissileID;
          RecSend3DMissilePos.MissileNumber := 0;
          RecSend3DMissilePos.status := 0;
          case recExocetMM40.sOrder of
            __ORD_EXOCET_40_FIRE:
              begin
//                if ShipClassID=10 then
                  RecSend3DMissilePos.status:= ST_MISSILE_RUN;
              end;
            __ORD_EXOCET_40_LOADING:
              RecSend3DMissilePos.status := ST_MISSILE_LOADED;
            // __ORD_EXOCET_40_ON:;
            // __ORD_EXOCET_40_OFF:;
          end;
          RecSend3DMissilePos.X := 0;
          RecSend3DMissilePos.y := 0;
          RecSend3DMissilePos.z := 0;
          RecSend3DMissilePos.heading := 0.0;
          RecSend3DMissilePos.speed := 0.0;

          FServer2D.SendDataEx(REC_3D_MISSILEPOS, @RecSend3DMissilePos, nil);
        end;

      end;
    REC_CMD_TETRAL:
      begin
        recTetral := @apRec^;

        if Assigned(OnLogReceived2D) then
        begin
          OnLogReceived2D('ShipID = ' + IntToStr(recTetral^.ShipID));
          OnLogReceived2D('mWeaponID = ' + IntToStr(recTetral^.mWeaponID));
          OnLogReceived2D('mLauncherID = ' + IntToStr(recTetral^.mLauncherID));
          OnLogReceived2D('mMissileID = ' + IntToStr(recTetral^.mMissileID));
          OnLogReceived2D('mMissileNumber = ' +
            IntToStr(recTetral^.mMissileNumber));
          OnLogReceived2D('sOrder = ' + IntToStr(recTetral^.OrderID));
          OnLogReceived2D('mTRange = ' + FloatToStr(recTetral^.mTargetRange));
          OnLogReceived2D('mTBearing = ' +
            FloatToStr(recTetral^.mTargetBearing));
          OnLogReceived2D('mTElevation = ' +
            FloatToStr(recTetral^.mTargetElev));
          OnLogReceived2D('TargetID = ' + IntToStr(recTetral^.TargetID));
        end;

        recSendTetral.ShipID := recTetral^.ShipID;
        recSendTetral.mWeaponID := recTetral^.mWeaponID;
        recSendTetral.mLauncherID := recTetral^.mLauncherID;
        recSendTetral.mMissileID := recTetral^.mMissileID;
        recSendTetral.mMissileNumber := recTetral^.mMissileNumber;
        // Diisi 0 aj...nanti instruktur yang ngisi ulang

        recSendTetral.OrderID := recTetral^.OrderID;

        recSendTetral.mTargetBearing := recTetral^.mTargetBearing;
        recSendTetral.mTargetRange := recTetral^.mTargetRange;
        recSendTetral.mTargetElev := recTetral^.mTargetElev;

        recSendTetral.TargetID := recTetral^.TargetID;

        TcpServer3D.SendData(REC_CMD_TETRAL, recSendTetral);

        if (recTetral.OrderID = __ORD_TETRAL_LOADING)
//          or (recTetral.OrderID = __ORD_TETRAL_FIRE)
        then
        begin

          RecSend3DMissilePos.ShipID := recTetral.ShipID;
          RecSend3DMissilePos.WeaponID := recTetral.mWeaponID;
          RecSend3DMissilePos.launcherID := recTetral.mLauncherID;
          RecSend3DMissilePos.missileID := recTetral.mMissileID;
          RecSend3DMissilePos.MissileNumber := 0;
          RecSend3DMissilePos.status := 0;
          case recTetral.OrderID of
            // __ORD_TETRAL_FIRE: RecSend3DMissilePos.status:= ST_MISSILE_RUN;
            __ORD_TETRAL_LOADING:
              RecSend3DMissilePos.status := ST_MISSILE_LOADED;
            // __ORD_EXOCET_40_ON:;
            // __ORD_EXOCET_40_OFF:;
          end;
          RecSend3DMissilePos.X := 0;
          RecSend3DMissilePos.y := 0;
          RecSend3DMissilePos.z := 0;
          RecSend3DMissilePos.heading := 0.0;
          RecSend3DMissilePos.speed := 0.0;

          FServer2D.SendDataEx(REC_3D_MISSILEPOS, @RecSend3DMissilePos, nil);
        end;
      end;
    REC_3D_UTIL_TOOLS:
      begin
        recUtilityTools := @apRec^;
        recSendUtiityTools.OrderID := recUtilityTools^.OrderID;
        recSendUtiityTools.c0 := recUtilityTools^.c0;
        recSendUtiityTools.c1 := recUtilityTools^.c1;
        recSendUtiityTools.c2 := recUtilityTools^.c2;
        recSendUtiityTools.c3 := recUtilityTools^.c3;
        recSendUtiityTools.c4 := recUtilityTools^.c4;
        // For Camera -> //co  = shipID, c1 =
        recSendUtiityTools.c5 := recUtilityTools^.c5;
        recSendUtiityTools.c6 := recUtilityTools^.c6;
        TcpServer3D.SendData(REC_3D_UTIL_TOOLS, recSendUtiityTools);
      end;
    REC_3D_SETCONTROL:
      begin
        recActorController3d := @apRec^;

        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('REC_3D_SETCONTROL' + #13#10 + 'ShipID : ' +
            IntToStr(recActorController3d^.ShipID) + #13#10 + 'X : ' +
            FloatToStr(recActorController3d^.X) + #13#10 + 'Y : ' +
            FloatToStr(recActorController3d^.y) + #13#10 + 'Z : ' +
            FloatToStr(recActorController3d^.z) + #13#10);

        recSendActorController3d.ShipID := recActorController3d^.ShipID;
        recSendActorController3d.TypeID := recActorController3d^.TypeID;

        recSendActorController3d.ActorRuntimeID1 :=
          recActorController3d^.ActorRuntimeID1; // Weapon ID
        recSendActorController3d.ActorRuntimeID2 :=
          recActorController3d^.ActorRuntimeID2; // Launcher ID
        recSendActorController3d.ActorRuntimeID3 :=
          recActorController3d^.ActorRuntimeID3; // Missile ID
        recSendActorController3d.ActorRuntimeID4 :=
          recActorController3d^.ActorRuntimeID4; // Missile Number

        recSendActorController3d.OrderID := recActorController3d^.OrderID;
        recSendActorController3d.X := recActorController3d^.X;
        recSendActorController3d.y := recActorController3d^.y;
        recSendActorController3d.z := recActorController3d^.z;
        recSendActorController3d.h := recActorController3d^.h;
        recSendActorController3d.p := recActorController3d^.p;
        recSendActorController3d.r := recActorController3d^.r;

        TcpServer3D.SendData(REC_3D_SETCONTROL, recSendActorController3d);
      end;
    REC_3D_MISSILEPOS:
      begin
        Recv2dMissilePos := @apRec^;
        RecSendMissilePos.ShipID := Recv2dMissilePos^.ShipID;
        RecSendMissilePos.WeaponID := Recv2dMissilePos^.WeaponID;
        RecSendMissilePos.launcherID := Recv2dMissilePos^.launcherID;
        RecSendMissilePos.missileID := Recv2dMissilePos^.missileID;
        RecSendMissilePos.MissileNumber := Recv2dMissilePos^.MissileNumber;

        RecSendMissilePos.status := Recv2dMissilePos^.status;
        RecSendMissilePos.X := Recv2dMissilePos^.X;
        RecSendMissilePos.y := Recv2dMissilePos^.y;
        RecSendMissilePos.z := Recv2dMissilePos^.z;
        RecSendMissilePos.heading := Recv2dMissilePos^.heading;
        RecSendMissilePos.speed := Recv2dMissilePos^.speed;

        TcpServer3D.SendData(REC_3D_MISSILEPOS, RecSendMissilePos);
      end;
    REC_3D_ORDER:
      begin
        RecvData3DOrder := @apRec^;
        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('REC_3D_ORDER' + #13#10 + 'shipID : ' +
            IntToStr(RecvData3DOrder^.ShipID) + #13#10 + 'sOrder : ' +
            IntToStr(RecvData3DOrder^.sOrder) + #13#10 + 'mValue : ' +
            FloatToStr(RecvData3DOrder^.mValue) + #13#10 + 'ModeMove : ' +
            IntToStr(RecvData3DOrder^.ModeMove) + #13#10 + 'coordinatX : ' +
            FloatToStr(RecvData3DOrder^.coordinatX) + #13#10 + 'coordinatY : ' +
            FloatToStr(RecvData3DOrder^.coordinatY) + #13#10 + 'coordinatZ : ' +
            FloatToStr(RecvData3DOrder^.coordinatZ));
        RecSendData3DOrder.ShipID := RecvData3DOrder^.ShipID;
        RecSendData3DOrder.sOrder := RecvData3DOrder^.sOrder;
        RecSendData3DOrder.mValue := RecvData3DOrder^.mValue;
        RecSendData3DOrder.ModeMove := RecvData3DOrder^.ModeMove;
        RecSendData3DOrder.coordinatX := RecvData3DOrder^.coordinatX;
        RecSendData3DOrder.coordinatY := RecvData3DOrder^.coordinatY;
        RecSendData3DOrder.coordinatZ := RecvData3DOrder^.coordinatZ;

        TcpServer3D.SendData(REC_3D_ORDER, RecSendData3DOrder);
      end;
    REC_3D_POSITION:
      begin
        Recv2DPos := @apRec^;

        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('REC_3D_POSITION' + #13#10 + 'ShipID : ' +
            IntToStr(Recv2DPos^.ShipID) + #13#10 + 'X : ' +
            FloatToStr(Recv2DPos^.X) + #13#10 + 'Y : ' +
            FloatToStr(Recv2DPos^.y) + #13#10 + 'Z : ' +
            FloatToStr(Recv2DPos^.z) + #13#10 + 'Heading : ' +
            FloatToStr(Recv2DPos^.heading) + #13#10 + 'Speed : ' +
            FloatToStr(Recv2DPos^.speed) + #13#10 + 'pitch : ' +
            FloatToStr(Recv2DPos^.pitch) + #13#10 + 'roll : ' +
            FloatToStr(Recv2DPos^.roll) + #13#10 + 'rudder : ' +
            FloatToStr(Recv2DPos^.rudder));

        RecSend2DPositionTo3D.ShipID := Recv2DPos^.ShipID;
        RecSend2DPositionTo3D.X := Recv2DPos^.X;
        RecSend2DPositionTo3D.y := Recv2DPos^.y;
        RecSend2DPositionTo3D.z := Recv2DPos^.z;
        RecSend2DPositionTo3D.heading := Recv2DPos^.heading;
        RecSend2DPositionTo3D.speed := Recv2DPos^.speed;
        RecSend2DPositionTo3D.pitch := Recv2DPos^.pitch;
        RecSend2DPositionTo3D.roll := Recv2DPos^.roll;
        RecSend2DPositionTo3D.rudder := Recv2DPos^.rudder;
        RecSend2DPositionTo3D.fuel := 0.0;
        RecSend2DPositionTo3D.status := 0.0;

        // Sementara buat simulasi karena belum ada 3d
        // o:= FindObjectByShipID(Recv2DPos^.ShipID);
        // if Assigned(o) then begin
        // if o is TShipObject then begin
        // (o as TShipObject).x:= Recv2DPos^.X;
        // (o as TShipObject).y:= Recv2DPos^.Y;
        // end;
        // end;

        TcpServer3D.SendData(REC3D_POSITION, RecSend2DPositionTo3D);
      end;
    REC_GUIDANCE:
      begin
        recGuidance := @apRec^;
        recSendGuidance.ShipID := recGuidance^.ShipID;
        recSendGuidance.GuidanceID := recGuidance^.GuidanceID;
        // SL     | Helm  | Circle    | Zigzag   | Sinuation | Formation | Evasion | Waypoint| Outrun | Engagement | Shadow  |
        // ====================================================================================================================
        recSendGuidance.param0 := recGuidance^.param0;
        // Course | Angle | TgtID     | Course   | Course    |           | TgtID   |         | TgtID  | TgtID      | TgtID   |
        recSendGuidance.param1 := recGuidance^.param1;
        // Speed  | Speed | Speed     | Speed    | Speed     |           |         |         |        | Speed      | Speed   |
        recSendGuidance.param2 := recGuidance^.param2;
        // |       | Radius    | legLgth  | Amplitude |           |         |         |        | EgmntRange | TgtRange|
        recSendGuidance.param3 := recGuidance^.param3;
        // |       | Direction |          | Period    |           |         |                  | Altitude   |
        recSendGuidance.param4 := recGuidance^.param4;
        // |       | RangeOffst|          |
        recSendGuidance.param5 := recGuidance^.param5;
        // |       | AngleOffst|          |
        recSendGuidance.param6 := recGuidance^.param6;
        // |       | AbsAglOfst|          |
        TcpServer3D.SendData(REC_GUIDANCE, recSendGuidance);
      end;
    REC_SET_CHAFF:
      begin
        recSetChaff := @apRec^;
        recSendChaff.ShipID := recSetChaff^.ShipID;
        recSendChaff.mLauncherID := recSetChaff^.mLauncherID;
        recSendChaff.OrderID := recSetChaff^.OrderID;
        // mCountID      : integer;
        recSendChaff.mDegreeRate := recSetChaff^.mDegreeRate;
        recSendChaff.mPart := recSetChaff^.mPart;
        recSendChaff.mPartNo := recSetChaff^.mPartNo;

        TcpServer3D.SendData(REC_SET_CHAFF, recSendChaff);
      end;
    REC_3D_TORPEDO_MK44:
      begin
        recTorpedoMK44order := @apRec^;
        recSendTorpedoMk44Order.ShipID := recTorpedoMK44order^.ShipID;
        recSendTorpedoMk44Order.OrderID := recTorpedoMK44order^.OrderID;
        recSendTorpedoMk44Order.mID := recTorpedoMK44order^.mID;
        recSendTorpedoMk44Order.mISD := recTorpedoMK44order^.mISD;
        recSendTorpedoMk44Order.mFloor := recTorpedoMK44order^.mFloor;
        recSendTorpedoMk44Order.mGyroRunOut := recTorpedoMK44order^.mGyroRunOut;

        TcpServer3D.SendData(REC_3D_TORPEDO_MK44, recSendTorpedoMk44Order);
      end;
    REC_CMD_DESIG_A244:
      begin
        RecDesigA244 := @apRec^;

        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('REC_CMD_DESIG_A244' + #13#10 +
            'ShipID : ' + IntToStr(RecDesigA244^.ShipID) + #13#10 +
            'mWeaponID : ' + IntToStr(RecDesigA244^.mWeaponID) + #13#10 +
            'mTargetID : ' + IntToStr(RecDesigA244^.mTargetID) + #13#10 +
            'OrderID : ' + IntToStr(RecDesigA244^.OrderID));

        RecSendDesigA2443D.ShipID := RecDesigA244^.ShipID;
        RecSendDesigA2443D.mWeaponID := RecDesigA244^.mWeaponID;
        RecSendDesigA2443D.mTargetID := RecDesigA244^.mTargetID;
        RecSendDesigA2443D.OrderID := RecDesigA244^.OrderID;

        TcpServer3D.SendData(REC_CMD_DESIG_A244_3D, RecSendDesigA2443D);
      end;
    REC_CMD_VLMICA:
      begin
        RecVLMica := @apRec^;

        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('REC_CMD_VLMICA' + #13#10 +
            'ShipID : ' + IntToStr(RecVLMica^.ShipID) + #13#10 +
            'mWeaponID : ' + IntToStr(RecVLMica^.mWeaponID) + #13#10 +
            'mLauncherID : ' + IntToStr(RecVLMica^.mLauncherID) + #13#10 +
            'mMissileID : ' + IntToStr(RecVLMica^.mMissileID) + #13#10 +
            'mMissileNumber : ' + IntToStr(RecVLMica^.mMissileNumber) + #13#10 +
            'OrderID : ' + IntToStr(RecVLMica^.OrderID) + #13#10 +
            'mTargetBearing : ' + FLoatToStr(RecVLMica^.mTargetBearing) + #13#10 +
            'mTargetRange : ' + FloatToStr(RecVLMica^.mTargetRange) + #13#10 +
            'mTargetElev : ' + FloatToStr(RecVLMica^.mTargetElev) + #13#10 +
            'OrderID : ' + IntToStr(RecVLMica^.TargetID));

        RecSendVLMica3D.ShipID := RecVLMica^.ShipID;
        RecSendVLMica3D.mWeaponID := RecVLMica^.mWeaponID;
        RecSendVLMica3D.mLauncherID := RecVLMica^.mLauncherID;
        RecSendVLMica3D.mMissileID := RecVLMica^.mMissileID;
        RecSendVLMica3D.mMissileNumber := RecVLMica^.mMissileNumber;
        RecSendVLMica3D.OrderID := RecVLMica^.OrderID;
        RecSendVLMica3D.mTargetBearing := RecVLMica^.mTargetBearing;
        RecSendVLMica3D.mTargetRange := RecVLMica^.mTargetRange;
        RecSendVLMica3D.mTargetElev := RecVLMica^.mTargetElev;
        RecSendVLMica3D.TargetID := RecVLMica^.TargetID;

        TcpServer3D.SendData(REC_CMD_VLMICA, RecSendVLMica3D);

        if (RecVLMica.OrderID = __ORD_VLMICA_LOADING)
          or (RecVLMica.OrderID = __ORD_VLMICA_FIRE)
        then
        begin

          RecSend3DMissilePos.ShipID := RecVLMica.ShipID;
          RecSend3DMissilePos.WeaponID := RecVLMica.mWeaponID;
          RecSend3DMissilePos.launcherID := RecVLMica.mLauncherID;
          RecSend3DMissilePos.missileID := RecVLMica.mMissileID;
          RecSend3DMissilePos.MissileNumber := 0;
          RecSend3DMissilePos.status := 0;
          case RecVLMica.OrderID of
            __ORD_VLMICA_FIRE:
            begin
              RecSend3DMissilePos.missileID := RecSend3DMissilePos.missileID + 1;
              RecSend3DMissilePos.status:= ST_MISSILE_RUN;
            end;
            __ORD_VLMICA_LOADING:
              RecSend3DMissilePos.status := ST_MISSILE_LOADED;
            // __ORD_EXOCET_40_ON:;
            // __ORD_EXOCET_40_OFF:;
          end;
          RecSend3DMissilePos.X := 0;
          RecSend3DMissilePos.y := 0;
          RecSend3DMissilePos.z := 0;
          RecSend3DMissilePos.heading := 0.0;
          RecSend3DMissilePos.speed := 0.0;

          FServer2D.SendDataEx(REC_3D_MISSILEPOS, @RecSend3DMissilePos, nil);
        end;
      end;
//    REC_CMD_SET_CAMERA_TARGET:
//      begin
//        RecCmdSetCameraTarget := @apRec^;
//
//        if Assigned(OnLogReceived2D) then
//          OnLogReceived2D('REC_CMD_SET_CAMERA_TARGET' + #13#10 +
//            'ShipID : ' + IntToStr(RecCmdSetCameraTarget^.ShipID));
//
//        RecCmdSetCameraTarget3D.ShipID := RecCmdSetCameraTarget^.ShipID;
//
//        TcpServer3D.SendData(REC_CMD_SET_CAMERA_TARGET_3D, RecCmdSetCameraTarget3D);
//      end;
    Rec_CMD_CAMERA_CONTROLLER:
      begin
        RecCmdSetCameraControl := @apRec^;

        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('Rec_CMD_CAMERA_CONTROLLER' + #13#10 +
            'cmd : ' + IntToStr(RecCmdSetCameraControl^.cmd)+ #13#10 +
            'ValInt : ' + IntToStr(RecCmdSetCameraControl^.valueInt)+ #13#10);
//            'ValDbl : ' + (RecCmdSetCameraControl^.valueDbl)+ #13#10);

        RecCmdSetCameraControl3D.cmd := RecCmdSetCameraControl^.cmd;
        RecCmdSetCameraControl3D.valueInt := RecCmdSetCameraControl^.valueInt;
        RecCmdSetCameraControl3D.valueDbl := RecCmdSetCameraControl^.valueDbl;
        RecCmdSetCameraControl3D.valueStr := RecCmdSetCameraControl^.valueStr;

        TcpServer3D.SendData(REC_CMD_SET_CAMERA_TARGET_3D, RecCmdSetCameraControl3D);
      end;

    REC_ENVI_3D:
      begin
        RecCmdSetEnvi := @apRec^;

        if Assigned(OnLogReceived2D) then
          OnLogReceived2D('Rec_CMD_ENVI_3D' + #13#10 +
            'seaState : ' + IntToStr(recCmdSetEnvi^.seaState)+ #13#10 +
            'windVelocity : ' + FloatToStr(recCmdSetEnvi^.windVelocity)+ #13#10 +
            'windHeading : ' + FloatToStr(recCmdSetEnvi^.windHeading)+ #13#10 +
            'seaCurrentVelocity : ' + FloatToStr(recCmdSetEnvi^.seaCurrentVelocity)+ #13#10 +
            'seaCurrentHeading : ' + FloatToStr(recCmdSetEnvi^.seaCurrentHeading)+ #13#10 +
            'temperature : ' + FloatToStr(recCmdSetEnvi^.temperature)+ #13#10 +
            'humidity : ' + FloatToStr(recCmdSetEnvi^.humidity)+ #13#10 +
            'surfacePressure : ' + FloatToStr(recCmdSetEnvi^.surfacePressure)+ #13#10 +
            'fogIntensity : ' + IntToStr(recCmdSetEnvi^.fogIntensity)+ #13#10);

        RecCmdSetEnvi3D.seaState := RecCmdSetEnvi^.seaState;
        RecCmdSetEnvi3D.windVelocity := RecCmdSetEnvi^.windVelocity;
        RecCmdSetEnvi3D.windHeading := RecCmdSetEnvi^.windHeading;
        RecCmdSetEnvi3D.seaCurrentVelocity := RecCmdSetEnvi^.seaCurrentVelocity;
        RecCmdSetEnvi3D.seaCurrentHeading := RecCmdSetEnvi^.seaCurrentHeading;
        RecCmdSetEnvi3D.temperature := RecCmdSetEnvi^.temperature;
        RecCmdSetEnvi3D.humidity := RecCmdSetEnvi^.humidity;
        RecCmdSetEnvi3D.surfacePressure := RecCmdSetEnvi^.surfacePressure;
        RecCmdSetEnvi3D.fogIntensity := RecCmdSetEnvi^.fogIntensity;

        TcpServer3D.SendData(REC_ENVI_3D, RecCmdSetEnvi3D);
      end;

    REC_Data_C705: begin
      RecDataFireC705 := @apRec^;

      if Assigned(OnLogReceived2D) then
      begin

        OnLogReceived2D('ShipID :' + IntToStr(RecDataFireC705^.ShipID));
        OnLogReceived2D('mTargetId :' + IntToStr(RecDataFireC705^.mTargetID));
        OnLogReceived2D('mWeaponID :' + IntToStr(RecDataFireC705^.mWeaponID));
        OnLogReceived2D('mLauncherID :' + IntToStr(RecDataFireC705^.mLauncherID));
        OnLogReceived2D('mMissileID :' + IntToStr(RecDataFireC705^.mMissileID));
        OnLogReceived2D('mMissileNumber :' +
          IntToStr(RecDataFireC705^.mMissileNumber));
        OnLogReceived2D('OrderID :' + IntToStr(RecDataFireC705^.OrderID) +
          'kalo 1 itu OrdID_C802_launch(1)');
        OnLogReceived2D('mTargetBearing :' +
          FloatToStr(RecDataFireC705^.mTargetBearing));
        OnLogReceived2D('mTargetRange :' + FloatToStr(RecDataFireC705^.mTargetRange));

      end;

      RecDataFireC7053D.ShipID := RecDataFireC705^.ShipID;
      RecDataFireC7053D.mTargetID := RecDataFireC705^.mTargetID;
      RecDataFireC7053D.mWeaponID := RecDataFireC705^.mWeaponID; // Diisi sesuai Database
      RecDataFireC7053D.mLauncherID := RecDataFireC705^.mLauncherID;
      RecDataFireC7053D.mMissileID := RecDataFireC705^.mMissileID;
      RecDataFireC7053D.mMissileNumber := RecDataFireC705^.mMissileNumber;
      // Diisi 0 aj...nanti instruktur yang ngisi ulan

      RecDataFireC7053D.OrderID := RecDataFireC705^.OrderID;

      RecDataFireC7053D.mTargetBearing := RecDataFireC705^.mTargetBearing;
      RecDataFireC7053D.mTargetRange := RecDataFireC705^.mTargetRange;
      TcpServer3D.SendData(REC_DATA_C7053D, RecDataFireC7053D);

      { // add if needed
      if (RecDataFireC705^.OrderID = __ORD_C802_LOADING) then
      begin
        RecSend3DMissilePos.ShipID := RecDataFireC705^.ShipID;
        RecSend3DMissilePos.WeaponID := RecDataFireC705^.mWeaponID;
        RecSend3DMissilePos.launcherID := RecDataFireC705^.mLauncherID;
        RecSend3DMissilePos.missileID := RecDataFireC705^.mMissileID;
        RecSend3DMissilePos.MissileNumber := RecDataFireC705^.mMissileNumber;
        RecSend3DMissilePos.status := 0;
        case RecDataFireC705^.OrderID of
          __ORD_C802_LOADING:
            RecSend3DMissilePos.status := ST_MISSILE_LOADED;
        end;
        RecSend3DMissilePos.X := 0;
        RecSend3DMissilePos.y := 0;
        RecSend3DMissilePos.z := 0;
        RecSend3DMissilePos.heading := 0.0;
        RecSend3DMissilePos.speed := 0.0;

        FServer2D.SendDataEx(REC_3D_MISSILEPOS, @RecSend3DMissilePos, nil);
      end;}
    end;

    REC_STAT_ORDER_CONSOLE: begin
      RecDataStatusConsole := @apRec^;

      if Assigned(OnLogReceived2D) then
      begin

        OnLogReceived2D('ShipID :' + RecDataStatusConsole^.OWN_SHIP_UID);
        OnLogReceived2D('Weapon ID :' + IntToStr(RecDataStatusConsole^.WeaponID));
        OnLogReceived2D('Error iD :' + IntToStr(RecDataStatusConsole^.ErrorID));
        OnLogReceived2D('Param Error :' + IntToStr(RecDataStatusConsole^.ParamError));

      end;

      if TryStrToInt(RecDataStatusConsole^.OWN_SHIP_UID, tempInt) then
        RecDataStatusConsole3D.ShipID := Word(tempInt)
      else
        RecDataStatusConsole3D.ShipID := 0; // fallback kalau gagal
      //RecDataStatusConsole3D.ShipID := RecDataStatusConsole^.OWN_SHIP_UID;
      RecDataStatusConsole3D.WeaponID := RecDataStatusConsole^.WeaponID;
      RecDataStatusConsole3D.ErrorID := RecDataStatusConsole^.ErrorID;
      RecDataStatusConsole3D.ParamError := RecDataStatusConsole^.ParamError;
      TcpServer3D.SendData(REC_3D_STAT_ORDER_CONSOLE, RecDataStatusConsole3D);

    end;

    { REC_CMD_MISTRAL:
      begin
      RecMistral := @apRec^;
      RecSendMistral.ShipID := RecMistral^.ShipID;
      RecSendMistral.mWeaponID := RecMistral^.mWeaponID;
      // Diisi sesuai Database
      RecSendMistral.mLauncherID := RecMistral^.mLauncherID;
      RecSendMistral.mMissileID := RecMistral^.mMissileID;
      RecSendMistral.mMissileNumber := RecMistral^.mMissileNumber;
      // Diisi 0 aj...nanti instruktur yang ngisi ulang

      RecSendMistral.OrderID := RecMistral^.OrderID;

      RecSendMistral.mTargetBearing := RecMistral^.mTargetBearing;
      RecSendMistral.mTargetRange := RecMistral^.mTargetRange;
      RecSendMistral.mTargetElev := RecMistral^.mTargetElev;

      TcpServer3D.SendData(REC_CMD_MISTRAL, RecSendMistral);
      end;
    }
    { REC_CMD_STRELLA:
      begin
      RecStrella := @apRec^;
      recSendStrella.ShipID := RecStrella^.ShipID;
      recSendStrella.mWeaponID := RecStrella^.mWeaponID;
      // Diisi sesuai Database
      recSendStrella.mLauncherID := RecStrella^.mLauncherID;
      recSendStrella.mMissileID := RecStrella^.mMissileID;
      recSendStrella.mMissileNumber := RecStrella^.mMissileNumber;
      // Diisi 0 aj...nanti instruktur yang ngisi ulang

      recSendStrella.OrderID := RecStrella^.OrderID;

      recSendStrella.mTargetBearing := RecStrella^.mTargetBearing;
      recSendStrella.mTargetRange := RecStrella^.mTargetRange;
      recSendStrella.mTargetElev := RecStrella^.mTargetElev;

      TcpServer3D.SendData(REC_CMD_STRELLA, recSendStrella);
      end;
    }
  end;

  if pc.ID = REC_STAT_CANNON_SPLASH then
  begin
    RecRecv := @apRec^;

    strWeapon := 'Unknown Cannon';
    case RecRecv^.WeaponID of
      C_DBID_CANNON40:
        strWeapon := 'Cannon 40';
      C_DBID_CANNON57:
        strWeapon := 'Cannon 57';
      C_DBID_CANNON76:
        strWeapon := 'Cannon 76';
      C_DBID_CANNON120:
        strWeapon := 'Cannon 120';
    end;

    if Assigned(OnLogReceived2D) then

      OnLogReceived2D('TBridgeManager.ClientReceive_ServerSend : Receive ' +
        strWeapon + ' Launcher ' + IntToStr(RecRecv^.launcherID) +
        ' From Vehicle ' + IntToStr(RecRecv^.ShipID) + ' Splash @' + ' X : ' +
        FloatToStr(RecRecv^.PosX) + ' Y : ' + FloatToStr(RecRecv^.PosY) +
        ' Z : ' + FloatToStr(RecRecv^.PosZ));
  end
  else if pc.ID = REC_RECV_TORP_STATE then
  begin
    RecRecvTorpState := @apRec^;
    if Assigned(OnLogReceived2D) then
      OnLogReceived2D
        ('TBridgeManager.ClientReceive_ServerSend : Sut detect target ' +
        'ShipID ' + IntToStr(RecRecvTorpState^.ShipID) + ' ' + ' mWeaponID  ' +
        IntToStr(RecRecvTorpState^.mWeaponID) + ' ' + 'mLauncherID ' +
        IntToStr(RecRecvTorpState^.mLauncherID) + ' ' + 'mMissileID  ' +
        IntToStr(RecRecvTorpState^.mMissileID) + ' ' + 'isFind      ' +
        IntToStr(RecRecvTorpState^.isFind));

  end
  else if pc.ID = REC_STATUS_MESSAGE then
  begin
    RecRecvStatusMessage := @apRec^;
    if Assigned(OnLogReceived2D) then
      OnLogReceived2D
        ('TBridgeManager.ClientReceive_ServerSend : REC_STATUS_MESSAGE' + ' ' +
        FloatToStr(RecRecvStatusMessage^.MessageID) + '-' +
        FloatToStr(RecRecvStatusMessage^.Cmd1) + '-' +
        FloatToStr(RecRecvStatusMessage^.Cmd2) + '-' +
        FloatToStr(RecRecvStatusMessage^.Cmd3) + '-' +
        FloatToStr(RecRecvStatusMessage^.Cmd4));
  end
end;

// procedure TServerManager.Server2Drecv_Missilepos(apRec: PAnsiChar;
// aSize: Integer; Sender: TWSocketClient);
// begin
// //
// end;

procedure TServerManager.RecvReqEnv(AHeader: TPacketHeader; AContent: string);
var
  incoming_data: TRecReqEnvi3D;
  RecSend: TRecDataEnvironment3D;   // kirim dari database
  scenTemp: TScenario;
  RecCmdSetEnvi3D: TRecDataEnvironment3D;
begin
  scenTemp := TScenario.Create;
  dmMain.GetScenarioDefByID(FLastScenarioActive, scenTemp);

  RecCmdSetEnvi3D.seaState := Round(scenTemp.Scenario_SeaState);
  RecCmdSetEnvi3D.windVelocity := Round(scenTemp.Scenario_WindSpeed);
  RecCmdSetEnvi3D.windHeading := Round(scenTemp.Scenario_WindDir_Deg);
  RecCmdSetEnvi3D.seaCurrentVelocity := Round(scenTemp.Scenario_CurrSpeed);
  RecCmdSetEnvi3D.seaCurrentHeading := Round(scenTemp.Scenario_CurrDir_Deg);
  RecCmdSetEnvi3D.temperature := Round(scenTemp.Scenario_Temperature);
  RecCmdSetEnvi3D.humidity := Round(scenTemp.Scenario_Humidity);
  RecCmdSetEnvi3D.surfacePressure := Round(scenTemp.Scenario_BaroPressure);
  RecCmdSetEnvi3D.fogIntensity := Round(scenTemp.Scenario_FogHeight);

  TcpServer3D.SendData(REC_ENVI_3D, RecCmdSetEnvi3D);
end;

procedure TServerManager.RecvReqSce(AHeader: TPacketHeader; AContent: string);
var
  incoming_data: TRecRequestScenario;
  recScenarioStat: TRecScenarioStat;
  // apRec: TRecRequestScenario;
begin
  if Length(AContent) > 0 then
  begin
    TgoBsonSerializer.Deserialize<TRecRequestScenario>(AContent, incoming_data);

    if Assigned(FOnLogReceived3d) then
    begin
      FOnLogReceived3d('JSON : ' + AContent);
      FOnLogReceived3d('REC_SCEID' + #13#10 +
        'ScenarioID : ' + IntToStr(incoming_data.ScenarioID) + #13#10 +
        'StatusSce : ' + FormatFloat('0.00', incoming_data.StatusSce));
    end;

    if FLastScenarioActive > 0 then
    begin
      if (incoming_data.ScenarioID = 0) and (incoming_data.StatusSce = 0) then
        LoadScenario(False);
    end
    else
    begin
      recScenarioStat.StatusSce := 0;
      TcpServer3D.SendData(REC_SCESTAT, recScenarioStat);
    end;

    // apRec.ScenarioID := FLastScenarioActive;
    // apRec.StatusSce := 1;
    // TcpServer3D.SendData(REC_SCESTAT, apRec);
  end;
end;

procedure TServerManager.Server2DRecv_StatusGame(apRec: PAnsiChar;
  aSize: Integer; sender: TWSocketClient);
var
  rec: ^TRecStatusGame;
  // recStatus: TRecStatusGame3D;
begin
  rec := @apRec^;
  if Assigned(OnLogReceived2D) then
    OnLogReceived2D('REC_STATUS_GAME' + #13#10 + 'ScenarioID : ' +
      IntToStr(rec^.ScenarioID) + #13#10 + 'StatusConnect : ' +
      IntToStr(rec^.StatusConnect));

  if rec^.StatusConnect = 1 then
  begin
    FLastScenarioActive := rec^.ScenarioID;
    LoadScenario(True);
  end
  else if rec^.StatusConnect = 2 then
  begin
    FLastScenarioActive := 0;
    StopScenario;
  end;

  // recStatus.ScenarioID := rec^.ScenarioID;
  // recStatus.StatusConnect := rec^.StatusConnect;

  // TcpServer3D.SendData(REC_STATUS_GAME, recStatus);
end;

procedure TServerManager.ServerReceive_ClientManagement(apRec: PAnsiChar;
  aSize: Integer; sender: TWSocketClient);
var
  // i,j : integer;

  aRec: ^TRecData2DOrder;
  RecSend: TRecData2DOrder;

  IpToSend: string;
  PortToSend: string;
  // Client    : TWSocketClient;
  // pBuff     : PAnsiChar;
  // pid       : ^TPacketCheck;
  // pSize     : Word;
begin
  aRec := @apRec^;

  case aRec.OrderID of
    _CM_CLIENT_MANAGE:
      begin
        case aRec.numValue of
          __CM_CLIENT_RESTARTALLCOMM, __CM_CLIENT_SHUTDOWNALLCOM,
            __CM_CLIENT_RESTARTSERVERCOMM, __CM_CLIENT_SHUTDOWNSERVERCOMM,
            __CM_CLIENT_CLOSEALLCOM:
            begin
              // RecSend.OrderID := aRec.OrderID;
              // RecSend.numValue := aRec.numValue;
              // RecSend.strValue := '';
              // RecSend.strValue2 := '';
              // RecSend.strValue3 := '';
              // RecSend.ipConsole := '';
              // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, nil);
            end;

          __CM_CLIENT_CONNECT:
            begin
              // IpToSend := sender.GetPeerAddr;

              // for i := 0 to TcpServer.WSocketServer.ClientCount - 1 do
              // begin
              // Client := TcpServer.WSocketServer.Client[i];
              // if Client.GetPeerAddr = IpToSend then
              // begin
              // //Send Set DB Address
              // RecSend.orderID   := _CM_CLIENT_MANAGE;
              // RecSend.numValue  := __CM_CLIENT_SETDB_ADDR;
              // RecSend.strValue  := DBServer;
              // RecSend.strValue2 := '';
              // RecSend.strValue3 := '';
              // RecSend.ipConsole := IpToSend;
              // //Send to Launcher
              // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, Client);
              //
              // //Send Set DB Address
              // RecSend.orderID   := _CM_CLIENT_MANAGE;
              // RecSend.numValue  := __CM_CLIENT_WELCOME;
              // RecSend.strValue  := IpToSend;
              // RecSend.strValue2 := '';
              // RecSend.strValue3 := '';
              // RecSend.ipConsole := IpToSend;
              // //Send to Launcher
              // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, Client);
              // end;
              // end;
            end;

          __CM_CLIENT_RESTART:
            begin
              // IpToSend := aRec.ipConsole;
              // for i := 0 to TcpServer.WSocketServer.ClientCount - 1 do
              // begin
              // Client := TcpServer.WSocketServer.Client[i];
              // if Client.GetPeerAddr = IpToSend then
              // begin
              // //Send Restart
              // RecSend.orderID   := _CM_CLIENT_MANAGE;
              // RecSend.numValue  := __CM_CLIENT_RESTART;
              // RecSend.strValue  := IpToSend;
              // RecSend.strValue2 := '';
              // RecSend.strValue3 := '';
              // RecSend.ipConsole := IpToSend;
              //
              // //Send to Launcher
              // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, Client);
              // end;
              // end;
            end;

          __CM_CLIENT_SHUTDOWN:
            begin
              // IpToSend := aRec.ipConsole;
              // for i := 0 to TcpServer.WSocketServer.ClientCount - 1 do
              // begin
              // Client := TcpServer.WSocketServer.Client[i];
              // if Client.GetPeerAddr = IpToSend then
              // begin
              // //Send Restart
              // RecSend.orderID   := _CM_CLIENT_MANAGE;
              // RecSend.numValue  := __CM_CLIENT_SHUTDOWN;
              // RecSend.strValue  := IpToSend;
              // RecSend.strValue2 := '';
              // RecSend.strValue3 := '';
              // RecSend.ipConsole := IpToSend;
              //
              // //Send to Launcher
              // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, Client);
              // end;
              // end;
            end;

          __CM_CLIENT_RESTART_ALL:
            begin
              // Send Restart
              // RecSend.OrderID := _CM_CLIENT_MANAGE;
              // RecSend.numValue := __CM_CLIENT_RESTART;
              // RecSend.strValue := '';
              // RecSend.strValue2 := '';
              // RecSend.strValue3 := '';
              // RecSend.ipConsole := '';

              // Send to Launcher
              // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, nil);
            end;

          __CM_CLIENT_SHUTDOWN_ALL:
            begin
              // Send Restart
              // RecSend.OrderID := _CM_CLIENT_MANAGE;
              // RecSend.numValue := __CM_CLIENT_SHUTDOWN;
              // RecSend.strValue := '';
              // RecSend.strValue2 := '';
              // RecSend.strValue3 := '';
              // RecSend.ipConsole := '';

              // Send to Launcher
              // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, nil);
            end;
        end;
      end;

    _CM_CLIENT_APP:
      begin
        case aRec.numValue of
          __CM_CLIENT_LAUNCH, __CM_CLIENT_STOP, __CM_CLIENT_RELAUNCH:
            begin
              // IpToSend := aRec.ipConsole;
              // for i := 0 to TcpServer.WSocketServer.ClientCount - 1 do
              // begin
              // Client := TcpServer.WSocketServer.Client[i];
              // if Client.GetPeerAddr = IpToSend then
              // begin
              // TcpServer.SendDataEx(REC_2D_ORDER, apRec, Client);
              // end
              // end;
            end;

          __CM_CLIENT_LAUNCHALL:
            begin
              // Send To All Launcher
              // tcpServer.SendDataEx(REC_2D_ORDER, apRec, nil);

              // Save ScenarioID
              // LastScenarioID := StrToInt(aRec^.strValue);

              // if Assigned(OnLogReceived2D) then
              // begin
              // OnLogReceived2D('');
              // OnLogReceived2D('Run Scenario ID -> ' + aRec^.strValue);
              // end;
            end;
        end;
      end;

    _CM_CLIENT_CHECK:
      begin
        // Send To All Launcher
        // tcpServer.SendDataEx(REC_2D_ORDER, apRec, nil);

        // if Assigned(OnLogReceived2D) then
        // begin
        // OnLogReceived2D('');
        // OnLogReceived2D('== Client Check ==');
        // end;

        // for i := 0 to TcpServer.WSocketServer.ClientCount - 1 do
        // begin
        // Client := TcpServer.WSocketServer.Client[i];
        //
        // if Assigned(OnLogPacket) then
        // begin
        // OnLogPacket('Client ' + IntToStr(i) + ' Ip Adress ' + Client.GetPeerAddr);
        // end;
        // end;
      end;

    _CM_CLIENT_CHECKSCENARIOID:
      begin
        // IpToSend := sender.GetPeerAddr;

        // for i := 0 to TcpServer.WSocketServer.ClientCount - 1 do
        // begin
        // Client := TcpServer.WSocketServer.Client[i];
        // if Client.GetPeerAddr = IpToSend then
        // begin
        // RecSend.orderID   := _CM_CLIENT_CHECKSCENARIOID;
        // RecSend.numValue  := GameStatus;
        // RecSend.strValue  := IntToStr(LastScenarioID);
        // RecSend.strValue2 := '';
        // RecSend.strValue3 := '';
        // RecSend.ipConsole := '';
        //
        // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, Client);
        // end;
        // end;
      end;

    _CM_REQ_SYNCPACKET:
      begin
        // IpToSend := sender.GetPeerAddr;
        // PortToSend := sender.GetPeerPort;

        // for i := 0 to TcpServer.WSocketServer.ClientCount - 1 do
        // begin
        // Client := TcpServer.WSocketServer.Client[i];
        // if (Client.GetPeerAddr = IpToSend) and (Client.GetPeerPort = PortToSend) then
        // begin
        // for j := 0 to FPacketBuff.BuffCount - 1 do
        // begin
        // if FPacketBuff.PeekPacket(j, pBuff, pSize) then
        // begin
        // pid := @pBuff^;
        // TcpServer.SendDataEx(pid^.ID, pBuff, Client);
        // end;
        // end;
        //
        // if Assigned(OnLogPacket) then
        // OnLogPacket('Send Sync Packet To ' + IpToSend);
        // end;
        // end;
      end;

    _CM_CLIENT_CONNECT:
      begin
        // IpToSend := sender.GetPeerAddr;
        // for i := 0 to TcpServer.WSocketServer.ClientCount - 1 do
        // begin
        // Client := TcpServer.WSocketServer.Client[i];
        // if Client.GetPeerAddr = IpToSend then
        // begin
        // RecSend.orderID   := aRec^.orderID;
        // RecSend.numValue  := aRec^.numValue;
        // RecSend.strValue  := '';
        // RecSend.strValue2 := '';
        // RecSend.strValue3 := '';
        // RecSend.ipConsole := '';
        //
        // TcpServer.SendDataEx(REC_2D_ORDER, @RecSend, Client);
        // end;
        // end;
      end;
  end;
end;

procedure TServerManager.ServerRecv_3D_Server2DSend(AHeader: TPacketHeader;
  AContent: string);
var
  incoming_data: TRecSplashCannon3D;
  apRec: TRecSplashCannon;

  incoming_data_cannon: TRec3DSetWCC3D;
  apRec_cannon: TRec3DSetWCC;
begin
  if Length(AContent) > 0 then
  begin
    if AHeader.PacketID=REC_STAT_CANNON_SPLASH then
    begin

      TgoBsonSerializer.Deserialize<TRecSplashCannon3D>(AContent, incoming_data);

//      if Assigned(FOnLogReceived3d) then
//      begin
//        FOnLogReceived3d('JSON : ' + AContent);
//        FOnLogReceived3d('REC_STAT_CANNON_SPLASH' + #13#10 +
//          'ShipID : ' + IntToStr(incoming_data.ShipID) + #13#10 +
//          'WeaponID : ' + IntToStr(incoming_data.WeaponID) + #13#10 +
//          'LauncherID : ' + IntToStr(incoming_data.LauncherID) + #13#10 +
//          'X : ' + FormatFloat('0.00', incoming_data.PosX) + #13#10 +
//          'Y : ' + FormatFloat('0.00', incoming_data.PosY) + #13#10 +
//          'Z : ' + FormatFloat('0.00', incoming_data.PosZ));
//      end;

      apRec.ShipID := incoming_data.ShipID;
      apRec.WeaponID := incoming_data.WeaponID;
      apRec.launcherID := incoming_data.launcherID;

      apRec.PosX := incoming_data.PosX;
      apRec.PosY := incoming_data.PosY;
      apRec.PosZ := incoming_data.PosZ;

      FServer2D.SendDataEx(REC_STAT_CANNON_SPLASH, @apRec, nil);
    end;

    if AHeader.PacketID=C_REC_CANNON then
    begin

      TgoBsonSerializer.Deserialize<TRec3DSetWCC3D>(AContent, incoming_data_cannon);

//      if Assigned(FOnLogReceived3d) then
//      begin
//        FOnLogReceived3d('JSON : ' + AContent);
//        FOnLogReceived3d('REC_STAT_CANNON_SPLASH' + #13#10 +
//          'ShipID : ' + IntToStr(incoming_data.ShipID) + #13#10 +
//          'WeaponID : ' + IntToStr(incoming_data.WeaponID) + #13#10 +
//          'LauncherID : ' + IntToStr(incoming_data.LauncherID) + #13#10 +
//          'X : ' + FormatFloat('0.00', incoming_data.PosX) + #13#10 +
//          'Y : ' + FormatFloat('0.00', incoming_data.PosY) + #13#10 +
//          'Z : ' + FormatFloat('0.00', incoming_data.PosZ));
//      end;

      apRec_cannon.ShipID := incoming_data_cannon.ShipID;
      apRec_cannon.mWeaponID := incoming_data_cannon.mWeaponID;
      apRec_cannon.mLauncherID := incoming_data_cannon.mLauncherID;
      apRec_cannon.mMissileID := incoming_data_cannon.mMissileID;
      apRec_cannon.mMissileNumber := incoming_data_cannon.mMissileNumber;
      apRec_cannon.mOrderID := incoming_data_cannon.mOrderID;
      apRec_cannon.mTargetID := incoming_data_cannon.mTargetID;
      apRec_cannon.mModeID := incoming_data_cannon.mModeID;
      apRec_cannon.mUpDown := incoming_data_cannon.mUpDown;

      apRec_cannon.mAutoCorrectElev := incoming_data_cannon.mAutoCorrectElev;
      apRec_cannon.mAutoCorrectBearing := incoming_data_cannon.mAutoCorrectBearing;
      apRec_cannon.mBalistikID := incoming_data_cannon.mBalistikID;
      apRec_cannon.mSalvoRate := incoming_data_cannon.mSalvoRate;

      FServer2D.SendDataEx(C_REC_CANNON, @apRec_cannon, nil);

      TcpServer3D.SendData(REC_SET_CANNON, incoming_data_cannon);
    end;
  end;
end;

end.
