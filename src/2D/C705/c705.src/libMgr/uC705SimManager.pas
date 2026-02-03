unit uC705SimManager;

interface

uses
  SysUtils, Classes, Controls, Graphics, Types, OverbyteIcsWSocket,
  uTCPClient, uTCPDatatype;

type
  GameSimManager = class
  private
    { NFS Dependencies }


    { Receive procedure from NFS }
    procedure netNFS_OnReceiveData3DPosition(apRec: PAnsiChar; aSize: integer);
    procedure netNFS_OnReceive2DOrder(apRec: PAnsiChar; aSize: integer);

  public
    NFSNetRecv: TTCPClient;

    constructor Create;
    destructor Destroy; override;

  published
    {
      Main Function of Simulation
    }
  end;

var
  SimManager: GameSimManager;

implementation

uses
  Windows, UfrmRoutePlan;

{ GameSimManager }

constructor GameSimManager.Create;
begin
  {Socket NFS}
  NFSNetRecv := TTCPClient.Create;

  NFSNetRecv.Socket.OnChangeState := frmRoutePlan.onTCPChangeState;

  NFSNetRecv.RegisterProcedure(REC_3D_POSITION, netNFS_OnReceiveData3DPosition, SizeOf(TRecData3DPosition));
  NFSNetRecv.RegisterProcedure(REC_2D_ORDER, netNFS_OnReceive2DOrder, SizeOf(TRecData2DOrder));
end;

destructor GameSimManager.Destroy;
begin

  inherited;
end;

procedure GameSimManager.netNFS_OnReceive2DOrder(apRec: PAnsiChar;
  aSize: integer);
var
  rec: ^TRecData2DOrder;
  str: string;
begin
  rec := @aprec^;
  str := rec^.strValue;
end;

procedure GameSimManager.netNFS_OnReceiveData3DPosition(apRec: PAnsiChar;
  aSize: integer);
var
  rec: ^TRecData3DPosition;
  str: string;
begin
  rec := @aprec^;
  str := rec^.ShipID.ToString;
end;

end.
