unit uTCPClient;

interface

uses
  overbyteicsWSocket, overbyteicsWSocketS, Classes, SysUtils, Windows,
  {uBaseConstan,} uTcpDatatype;

const
  // BUFFER_SIZE= 1024 * 1024 * 20;
  BUFFER_SIZE = 64 * 1024;

type
  TCPT_PROCEDURE = procedure(apRec: PAnsiChar; aSize: integer) of object;
  TCPT_ARRAY_PROCEDURE = array of TCPT_PROCEDURE;

  TOnConnected = procedure(msg: string) of object;
  TOnDisconnected = procedure(msg: string) of object;

  TTCPClient = class(TObject)
  private

    FOnConnected: TOnConnected;
    FOnDisconnected: TOnDisconnected;

    procedure WSocket_OnDataAvailable(Sender: TObject; Error: Word);
    procedure WSocket_OnSessionConnected(Sender: TObject; Error: Word);
    procedure WSocket_OnSessionClosed(Sender: TObject; Error: Word);
    procedure WSocket_OnDataSent(Sender: TObject; Error: Word);
  protected
    FLog: TStringList;
    FRealLog: TStringList;

    WSocket: TWSocket;

    FReceivedBuffer: TBytes;

    FBuffer: PAnsiChar;
    FBufferSize: LongWord;
    FBufferNow: LongWord;
    FBufferSizeKnown: boolean;

    arrayProcedure: TCPT_ARRAY_PROCEDURE;
    arrSize: array of Word;
    FLargestRecordSize: integer;

    function getState: TSocketState;
    procedure HandleException(AE: exception; AClient: TWSocket);
  public

    property State: TSocketState read getState;
    property Log: TStringList read FLog;
    property Socket: TWSocket read WSocket;

    property OnConnected: TOnConnected read FOnConnected write FOnConnected;
    property OnDisconnected: TOnDisconnected read FOnDisconnected write FOnDisconnected;

    constructor Create;
    destructor Destroy; override;

    procedure Connect(aAddr, aPort: string);
    procedure Disconnect;

    procedure sendData(buffer: PAnsiChar; size: integer);
    procedure sendDataEx(aID: byte; aBuffer: PAnsiChar);

    procedure setLog(aLog: TStringList);
    // procedure DataAvailable(Sender: TObject; Error: Word);

    procedure PacketRecognizer(aP: PAnsiChar; aSize: integer);

    // procedure DataSent(Sender: TObject; Error: word);
    procedure RegisterProcedure(aType: Word; aProcedure: TCPT_PROCEDURE;
      recordSize: Word);

  end;

implementation

{ uses
  FastMove;
}
procedure CopyMemory(Destination: Pointer; Source: Pointer; Length: DWORD);
begin
  Move(Source^, Destination^, Length);
end;

{ TClientSocket }

constructor TTCPClient.Create;
begin
  inherited;
  FBuffer := nil;

  WSocket := TWSocket.Create(nil);
  WSocket.OnSessionConnected := WSocket_OnSessionConnected;
  WSocket.OnSessionClosed := WSocket_OnSessionClosed;
  WSocket.OnDataSent := WSocket_OnDataSent;

  FRealLog := TStringList.Create;
  FLog := FRealLog;
  // pLogPointer:= pointer(FLog);

  setLength(arrayProcedure, 0);
  setLength(arrSize, 0);

  FLargestRecordSize := 0;

  setLength(FReceivedBuffer, 1024 * 1024);

end;

destructor TTCPClient.Destroy;
begin
  setLength(FReceivedBuffer, 0);

  setLength(arrayProcedure, 0);
  setLength(arrSize, 0);

  FRealLog.Free;
  FLog := nil;

  WSocket.OnDataSent := nil;
  WSocket.OnSessionClosed := nil;
  WSocket.OnSessionConnected := nil;

  WSocket.Free;

  inherited;
end;

procedure TTCPClient.Connect(aAddr, aPort: string);
begin
  if (WSocket.State <> wsConnected) and (WSocket.State <> wsConnecting) then
  begin
    // GetMem(FBuffer, BUFFER_SIZE);
    FBufferSize := 0;
    FBufferNow := 0;
    FBufferSizeKnown := False;

    WSocket.OnDataAvailable := WSocket_OnDataAvailable;
    WSocket.Proto := 'tcp';
    WSocket.LineMode := False;
    WSocket.LineEdit := False;
    WSocket.LineEcho := False;
    WSocket.Port := aPort;
    WSocket.Addr := aAddr;
    FLog.Add(DateTimeToStr(Now) + ': ' + 'Connecting ...');
    WSocket.Connect;
    // while WSocket.State in [wsConnecting] do
    // WSocket.ProcessMessages;
    // if WSocket.State = wsConnected then
    // FLog.Add(DateTimeToStr(Now) + ': ' + 'Connected')
    // else
    // FLog.Add(DateTimeToStr(Now) + ': ' + 'Not connected')
  end;
end;

procedure TTCPClient.Disconnect;
begin
  // FreeMem(FBuffer);
//  FLog.Add(DateTimeToStr(Now) + ': ' + 'Disconnecting ...');
  WSocket.OnDataAvailable := nil;
  WSocket.Close;

//  FLog.Add(DateTimeToStr(Now) + ': ' + 'Disconnected');
end;

procedure TTCPClient.sendData(buffer: PAnsiChar; size: integer);
begin
  if WSocket.State = wsConnected then
  begin
    { TODO -oArmand : Ini buat apa ya? }
    if not WSocket.AllSent then
      raise exception.Create('in process...');

//    FLog.Add(TimeToStr(Now) + ': ' + 'Sending data');
    WSocket.Send(buffer, size);
  end
end;

procedure TTCPClient.sendDataEx(aID: byte; aBuffer: PAnsiChar);
var
  lBuffer: PAnsiChar;
  stamp: TPacketCheck;
  size: LongWord;
  strTemp: string;
begin
  // if aID<= length(arrayProcedure) then
  if (aID <= Length(arrayProcedure)) and (arrSize[aID] > 0) then
  begin
    strTemp := 'Send: ID ' + inttostr(aID) + '  ' + C_REC_PACKETNAME[aID];
    stamp.ID := aID;
    stamp.Pass := PACKET_PASS;
    CopyMemory(aBuffer, @stamp, sizeof(TPacketCheck));
    size := arrSize[aID];

    GetMem(lBuffer, size + 4);
    CopyMemory(lBuffer, @size, 4);
    CopyMemory(lBuffer + 4, aBuffer, size);

    if WSocket.State = wsConnected then
    begin
      { TODO -oArmand : Ini buat apa ya? }
      // if not WSocket.AllSent then
      // raise Exception.Create('cannot send packet, in process...');
      {
        while not WSocket.AllSent do
        begin
        FLog.Add('AllSent is false, pending ...');
        WSocket.ProcessMessages;
        end;
      }
      if not WSocket.AllSent then
        FLog.Add(TimeToStr(Now) + ': AllSent flag is false');

//      FLog.Add(TimeToStr(Now) + ': ' + strTemp);
      try
        WSocket.Send(lBuffer, size + 4);
      except
        on e: exception do
          HandleException(e, WSocket);
      end; // end exception
    end;

    FreeMem(lBuffer);
  end
  else
  begin
//    FLog.Add(TimeToStr(Now) + ': ' + 'Trying to send unknown packet (ID= ' +
//      inttostr(aID) + ')');
  end;
end;

procedure TTCPClient.setLog(aLog: TStringList);
begin
  if aLog = nil then
  begin
    FLog := FRealLog;
    exit;
  end;

  aLog.Assign(FLog);
  if Pointer(FLog) = Pointer(FRealLog) then
    FLog.Clear;
  FLog := aLog;
end;

// procedure TTCPClient.DataAvailable(Sender: TObject; Error: Word);
// var
// buffer: PAnsiChar;
// receivedByte: integer;
// len: integer;
// p, p2: pointer;
// {
// i: integer;
// }
// str: string;
// bLoop: boolean;
// begin
//
// receivedByte := TWSocket(Sender).RcvdCount;
/// /  Number of characters in receive buffer but not read yet.
//
// FLog.Add(TimeToStr(Now) + ': ' + inttostr(receivedByte) + ' byte from '
// + TWSocket(Sender).PeerAddr);
//
// if receivedByte < 1  then exit;
//
// GetMem(buffer, receivedByte+1);
// len := TWSocket(Sender).Receive(buffer, receivedByte);
//
// if len <= 0 then
// begin
// FLog.Add(TimeToStr(Now) + 'ERR: ' + 'packet with length ' + inttostr(len)
// + ' received!');
// exit;
// end;
/// /  FLog.Add( 'RECV: ' + inttostr(receivedByte) +' LEN: ' + inttostr(len) + '------');
//
// p := FBuffer + FBufferNow;
// CopyMemory(PAnsiChar(p), buffer, receivedByte);
// inc(FBufferNow, receivedByte);
//
// bLoop := True;
// while bLoop do
// begin
// if (not FBufferSizeKnown) and (FBufferNow >= 4) then
// begin
// CopyMemory(@(FBufferSize), FBuffer, 4);
// FBufferSizeKnown := True;           // record size is known
// end;
//
// if (FBufferSizeKnown) and (FBufferNow >= FBufferSize + 4) then
// begin                                  // jika sudah tau ukuran record
// p := FBuffer + 4;
// PacketRecognizer(p, FBufferSize);    // ambil 1 record, lempar.
//
// if FBufferNow > FBufferSize + 4 then    // jika masih ada data di buffer
// begin
// p := FBuffer + (FBufferSize + 4);
// FBufferNow := FBufferNow - (FBufferSize + 4);
//
// GetMem(p2, FBufferNow);
// CopyMemory(p2, p, FBufferNow);         // geser data ke awal FBuffer
// CopyMemory(FBuffer, p2, FBufferNow);
// FreeMem(p2);
//
// //CopyMemory(FBuffer, p, FBufferNow);
// //FBufferSize:= 0;
// FBufferSizeKnown := False;
// end
// else
// begin
// FBufferSize := 0;                    // buffer habis.
// FBufferNow := 0;
// FBufferSizeKnown := False;
// end;
// end
// else
// bLoop := False;
// end;
//
// {
// strHex:= '';
// for i:= 0 to receivedByte-1 do
// begin
// strHex:= strHex+' '+inttohex(ord(buffer[i]), 2);
// end;
// FLog.Add(strHex);
// }
// FreeMem(buffer);
// end;

procedure TTCPClient.WSocket_OnDataAvailable(Sender: TObject; Error: Word);
var
  // buffer: PAnsiChar;
  receivedByte: integer;
  len: integer;
  p, p2: Pointer;

  // i: integer;
  // str: string;
  bLoop: boolean;
begin

  // receivedByte := TWSocket(Sender).RcvdCount;
  // Number of characters in receive buffer but not read yet.

  // FLog.Add(TimeToStr(Now) + ': ' + inttostr(receivedByte) + ' byte from '
  // + TWSocket(Sender).PeerAddr);

  // if receivedByte < 1  then exit;

  // GetMem(buffer, receivedByte+1);
  len := TWSocket(Sender).Receive( { buffer } FReceivedBuffer, 1024 * 1024);

  if len <= 0 then
  begin
    // FLog.Add(TimeToStr(Now) + 'ERR: ' + 'packet with length ' + inttostr(len) +
    // ' received!');
    exit;
  end;
  receivedByte := len;
  // FLog.Add( 'RECV: ' + inttostr(receivedByte) +' LEN: ' + inttostr(len) + '------');

  p := FBuffer + FBufferNow;
  CopyMemory(PAnsiChar(p), { buffer } FReceivedBuffer, receivedByte);
  inc(FBufferNow, receivedByte);

  bLoop := True;
  while bLoop do
  begin
    if (not FBufferSizeKnown) and (FBufferNow >= 4) then
    begin
      CopyMemory(@(FBufferSize), FBuffer, 4);
      FBufferSizeKnown := True; // record size is known
    end;

    if (FBufferSizeKnown) and (FBufferNow >= FBufferSize + 4) then
    begin // jika sudah tau ukuran record
      p := FBuffer + 4;
      PacketRecognizer(p, FBufferSize); // ambil 1 record, lempar.

      if FBufferNow > FBufferSize + 4 then // jika masih ada data di buffer
      begin
        p := FBuffer + (FBufferSize + 4);
        FBufferNow := FBufferNow - (FBufferSize + 4);

        GetMem(p2, FBufferNow);
        CopyMemory(p2, p, FBufferNow); // geser data ke awal FBuffer
        CopyMemory(FBuffer, p2, FBufferNow);
        FreeMem(p2);

        // CopyMemory(FBuffer, p, FBufferNow);
        // FBufferSize:= 0;
        FBufferSizeKnown := False;
      end
      else
      begin
        FBufferSize := 0; // buffer habis.
        FBufferNow := 0;
        FBufferSizeKnown := False;
      end;
    end
    else
      bLoop := False;
  end;

  {
    strHex:= '';
    for i:= 0 to receivedByte-1 do
    begin
    strHex:= strHex+' '+inttohex(ord(buffer[i]), 2);
    end;
    FLog.Add(strHex);
  }
  // FreeMem(buffer);
end;

procedure TTCPClient.WSocket_OnSessionClosed(Sender: TObject; Error: Word);
begin
  if Assigned(FBuffer) then
  begin
    FreeMem(FBuffer);
    FBuffer := nil;
  end;
  if Assigned(FOnDisconnected) then
//    FOnDisconnected('Disconnected from '+WSocket.GetPeerAddr+':'+WSocket.GetPeerPort);
    FOnDisconnected('Disconnected.');
end;

procedure TTCPClient.WSocket_OnSessionConnected(Sender: TObject; Error: Word);
begin
  if not Assigned(FBuffer) then
    GetMem(FBuffer, BUFFER_SIZE);
  if Assigned(FOnConnected) then
//    FOnConnected('Connected to '+WSocket.GetPeerAddr+':'+WSocket.GetPeerPort);
    FOnConnected('Connected.');
end;

procedure TTCPClient.PacketRecognizer(aP: PAnsiChar; aSize: integer);
var
  lPc: TPacketCheck;
begin
  CopyMemory(@lPc, aP, sizeof(TPacketCheck));

  if lPc.Pass <> PACKET_PASS then
  begin
    FLog.Add(TimeToStr(Now) + ': ' + 'Packet password is wrong');
    exit;
  end;

  if lPc.ID <= Length(arrayProcedure) then
  begin
    if Assigned(arrayProcedure[lPc.ID]) then
    begin
//      FLog.Add(TimeToStr(Now) + ': ' + '(ID= ' + inttostr(lPc.ID) + ')' +
//        C_REC_PACKETNAME[lPc.ID]);
      arrayProcedure[lPc.ID](aP, arrSize[lPc.ID]);
    end;
//    else
//      FLog.Add(TimeToStr(Now) + ': ' + 'Unregistered (ID= ' +
//        inttostr(lPc.ID) + ')');
  end
  else
  begin
//    FLog.Add(TimeToStr(Now) + ': ' + 'Unregistered (ID= ' +
//      inttostr(lPc.ID) + ')');
  end;
end;

function TTCPClient.getState: TSocketState;
begin
  result := WSocket.State;
end;

procedure TTCPClient.WSocket_OnDataSent(Sender: TObject; Error: Word);
begin
//  FLog.Add('Sent: ' + Sender.ClassName + ' - ' + inttostr(Error));
end;

procedure TTCPClient.RegisterProcedure(aType: Word; aProcedure: TCPT_PROCEDURE;
  recordSize: Word);
var
  lastLength: integer;
  i: integer;
begin
  lastLength := Length(arrayProcedure);
  if aType >= lastLength then
  begin
    setLength(arrayProcedure, aType + 1);
    setLength(arrSize, aType + 1);
    for i := lastLength to aType do
    begin
      arrSize[i] := 0;
    end;
  end;
  if recordSize > FLargestRecordSize then
    FLargestRecordSize := recordSize;

  // FLog.Add('Register ID :'+ FormatFloat('00', aType) +
  FLog.Add('Register ID :' + Format('%0.2d', [aType]) + ' as ' +
    C_REC_PACKETNAME[aType] + ' size ' + inttostr(recordSize));
  // FLog.Add('Largest Registered Packet size is ' + IntToStr(FLargestRecordSize));

  arrayProcedure[aType] := aProcedure;
  arrSize[aType] := recordSize;
end;

procedure TTCPClient.HandleException(AE: exception; AClient: TWSocket);
begin
  if (AE is ESocketException) then
  begin
    FLog.Add(TimeToStr(Now) + ': Error accured: ' + AE.Message);
    FLog.Add(TimeToStr(Now) + ': Closing client ...');
    AClient.Close;
  end
  else
  begin
    FLog.Add(TimeToStr(Now) + ': Unhandled exception raised!');
  end;
end;

end.
