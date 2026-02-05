unit uC705SimManager;

interface

uses
  System.SysUtils, Vcl.ExtCtrls, System.Contnrs, OverbyteIcsWSocket, uTCPClient,
  uTCPDatatype, uLibSettings, uShipModel;

type
  PRecData3DPosition = ^TRecData3DPosition;

  GameSimManager = class
  private
    { NFS Dependencies }
    FNFSObjectList: TObjectList;
    FAutoConnectToBridgeTimer: TTimer;

    procedure tmrAutoConnectToBridgeTimer(Sender: TObject);

    function FindObjectByID(AID: Integer): TShipContact;
    procedure UpdateObjectList(AShipInfo: PRecData3DPosition);
    procedure DeleteObjectByID(AID: Integer);

    procedure OnConnected(msg: string);
    procedure OnDisconnected(msg: string);

    { Receive procedure from NFS }
    procedure netNFS_OnReceiveData3DPosition(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnReceive2DOrder(apRec: PAnsiChar; aSize: integer);

  public
    NFSNetRecv: TTCPClient;

    constructor Create;
    destructor Destroy; override;

    property NFSObjectList: TObjectList read FNFSObjectList;

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
  FNFSObjectList := TObjectList.Create;

  {Socket NFS}
  NFSNetRecv := TTCPClient.Create;

  NFSNetRecv.OnConnected := OnConnected;
  NFSNetRecv.OnDisconnected := OnDisconnected;

  NFSNetRecv.RegisterProcedure(REC_3D_POSITION, netNFS_OnReceiveData3DPosition, SizeOf(TRecData3DPosition));
  NFSNetRecv.RegisterProcedure(REC_2D_ORDER, netNFS_OnReceive2DOrder, SizeOf(TRecData2DOrder));

  FAutoConnectToBridgeTimer := TTimer.Create(nil);
  FAutoConnectToBridgeTimer.Interval := 5000;
  FAutoConnectToBridgeTimer.OnTimer := tmrAutoConnectToBridgeTimer;
  FAutoConnectToBridgeTimer.Enabled := True;
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

  if Assigned(FNFSObjectList) then
    FreeAndNil(FNFSObjectList);

  inherited;
end;

function GameSimManager.FindObjectByID(AID: Integer): TShipContact;
var
  i: Integer;
  Ship: TShipContact;
begin
  Result := nil;
  if Assigned(FNFSObjectList) then
  begin
    for i := 0 to FNFSObjectList.Count - 1 do
    begin
      Ship := TShipContact(FNFSObjectList[i]);
      if Ship.ID = AID then
      begin
        Result := Ship;
        Break;
      end;
    end;
  end;
end;

procedure GameSimManager.UpdateObjectList(AShipInfo: PRecData3DPosition);
var
  Ship: TShipContact;
begin
  if Assigned(FNFSObjectList) and Assigned(AShipInfo) then
  begin
    Ship := FindObjectByID(AShipInfo^.ShipID);
    if not Assigned(Ship) then
    begin
      Ship := TShipContact.Create(AShipInfo^.ShipID, '', AShipInfo^.Y, AShipInfo^.X, AShipInfo^.Heading, AShipInfo^.Speed);
      FNFSObjectList.Add(Ship);
    end
    else
    begin
      Ship.Lat := AShipInfo^.Y;
      Ship.Lon := AShipInfo^.X;
      Ship.Heading := AShipInfo^.Heading;
      Ship.Speed := AShipInfo^.Speed;
    end;
  end;
end;

procedure GameSimManager.DeleteObjectByID(AID: Integer);
var
  i: Integer;
  Ship: TShipContact;
begin
  if Assigned(FNFSObjectList) then
  begin
    for i := 0 to FNFSObjectList.Count - 1 do
    begin
      Ship := TShipContact(FNFSObjectList[i]);
      if Ship.ID = AID then
      begin
        FNFSObjectList.Delete(i);
        Break;
      end;
    end;
  end;
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
  UpdateObjectList(rec);
end;

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

end.

