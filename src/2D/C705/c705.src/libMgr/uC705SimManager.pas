unit uC705SimManager;

interface

uses
  System.SysUtils, Vcl.ExtCtrls, System.Contnrs, OverbyteIcsWSocket, uTCPClient,
  uTCPDatatype, uLibSettings, uShipModel, uVehicleManager;

type
  TRoutePlanMode = (mPassive, mActive);
  TOnMapInit = procedure(const GeosetPath: string) of object;

  GameSimManager = class
  private
    { NFS Dependencies }
    FNFSObjectList: TObjectList;
    FAutoConnectToBridgeTimer: TTimer;

    FOnMapInit: TOnMapInit;

    procedure tmrAutoConnectToBridgeTimer(Sender: TObject);
    procedure OnConnected(msg: string);
    procedure OnDisconnected(msg: string);

    { Receive procedure from NFS }
    procedure netNFS_OnReceiveData3DPosition(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnReceive2DOrder(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnDeleteShip(apRec: PAnsiChar; aSize: integer);



  public
    FRoutePlanMode: TRoutePlanMode;

    NFSNetRecv: TTCPClient;

    constructor Create;
    destructor Destroy; override;

    procedure InitializeMap;

    property RoutePlanMode: TRoutePlanMode read FRoutePlanMode write FRoutePlanMode;
    property OnMapInit: TOnMapInit read FOnMapInit write FOnMapInit;
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
begin
  {Socket NFS}
  NFSNetRecv := TTCPClient.Create;

  NFSNetRecv.OnConnected := OnConnected;
  NFSNetRecv.OnDisconnected := OnDisconnected;

  {Register Procedure NetNFS}
  NFSNetRecv.RegisterProcedure(REC_3D_POSITION, netNFS_OnReceiveData3DPosition, SizeOf(TRecData3DPosition));
  NFSNetRecv.RegisterProcedure(REC_2D_ORDER, netNFS_OnReceive2DOrder, SizeOf(TRecData2DOrder));
  NFSNetRecv.RegisterProcedure(REC_3D_ORDER, netNFS_OnDeleteShip, SizeOf(TRecData3DOrder));

  NFSNetRecv.RegisterProcedure(Rec_Data_C705, nil, SizeOf(TRec_Data_C705));

  {Timer untuk Connect ke Bridge}
  FAutoConnectToBridgeTimer := TTimer.Create(nil);
  FAutoConnectToBridgeTimer.Interval := 5000;
  FAutoConnectToBridgeTimer.OnTimer := tmrAutoConnectToBridgeTimer;
  FAutoConnectToBridgeTimer.Enabled := True;

  // Default Operation Route Planning
  FRoutePlanMode := mPassive;
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

procedure GameSimManager.netNFS_OnSendDataC705(rec: TRec_Data_C705);
begin
  if (NFSNetRecv <> nil) and (NFSNetRecv.State in [wsConnected]) then
      NFSNetRecv.sendDataEx(Rec_Data_C705, @Rec);
end;

{$ENDREGION}

end.

