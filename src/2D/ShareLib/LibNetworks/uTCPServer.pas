unit uTCPServer;

interface

uses
  overbyteicsWSocket, overbyteicsWSocketS, Classes, SysUtils, Windows,
  uTCPDatatype;

const
  // BUFFER_SIZE= 1024 * 1024 * 20;
  // BUFFER_SIZE= 20 shl 20;
  BUFFER_SIZE = 64 * 1024;

type
  TCPT_PROCEDURE = procedure(apRec: PAnsiChar; aSize: integer;
    Sender: TWSocketClient) of object;
  TCPT_ARRAY_PROCEDURE = array of TCPT_PROCEDURE;

  TOnClientConnect = procedure(msg: string) of object;
  TOnClientDisconnect = procedure(msg: string) of object;

  TTCPServer = class(TObject)
  private
    FWSocketServer: TWSocketServer;

    FLog: TStringList;
    FRealLog: TStringList;
    // pLogPointer: Pointer;
    FLargestRecordSize: integer;

    procedure HandleException(AE: exception; AClient: TWSocket);

    procedure PacketRecognizer(aP: PAnsiChar; aSize: integer; Sender: TObject);

    procedure BGException(Sender: TObject; E: exception; var CanClose: boolean);

    // procedure ClientCreate(Sender: TObject; Client: TWSocketClient);
    procedure ClientConnect(Sender: TObject; Client: TWSocketClient;
      Error: word);
    procedure ClientDisconnect(Sender: TObject; Client: TWSocketClient;
      Error: word);
    procedure ClientDataAvailable(Sender: TObject; Error: word);
    procedure ClientBGException(Sender: TObject; E: exception;
      var CanClose: boolean);

  public
    arrayProcedure: TCPT_ARRAY_PROCEDURE;
    arrSize: array of word;

    // LoginList: TStringList;
    // IPList: TStringList;
    isTimeServer: boolean;

    OnClientConnect: TOnClientConnect;
    OnClientDisConnect: TOnClientDisconnect;

    constructor Create;
    destructor Destroy; override;

    property Log: TStringList read FLog;
    property WSocketServer: TWSocketServer read FWSocketServer;

    procedure DoNothing;

    procedure setLog(aLog: TStringList);
    procedure Listen(aPort: string); overload;
    procedure Listen(aAddress, aPort: string); overload;
    procedure Stop;
    // procedure SendData(Index: integer; aBuffer: PAnsiChar; size: integer);
    procedure SendDataEx(aID: byte; aBuffer: PAnsiChar;
      AClient: TWSocketClient);

    procedure RegisterProcedure(aType: word; aProcedure: TCPT_PROCEDURE;
      recordSize: word);
    procedure UnregisterAllProcedure;
  end;

  // TClientThread = class(TThread)
  // private
  // FWSocket        : TWSocket;             { Reference to client socket  }
  // FThreadAttached : Boolean;              { TRUE once socket attached   }
  // public
  // procedure Execute; override;            { Main method                 }
  // published
  // property WSocket: TWSocket read FWSocket write FWSocket;
  // property ThreadAttached : Boolean read FThreadAttached write FThreadAttached;
  // end;

  TClientConnected = class(TWSocketClient)
  private
    // ClientThread: TClientThread;

    FReceivedBuffer: PAnsiChar;
    FBuffer: PAnsiChar;
    FBufferNow: LongWord;
    FBufferSize: LongWord;
    FBufferSizeKnown: boolean;
  public
    ConnectTime: TDateTime;

    Login: String;

    isReady: boolean;
  end;

implementation

{ TTCPServer }

var
  ReceivedBuffer: TBytes;

constructor TTCPServer.Create;
begin
  inherited;
  FWSocketServer := TWSocketServer.Create(nil);
  FRealLog := TStringList.Create;
  FLog := FRealLog;
  // pLogPointer:= pointer(FLog);

  // LoginList:= TStringList.Create;
  // IPList:= TStringList.Create;
  isTimeServer := False;

  setLength(arrayProcedure, 0);
  setLength(arrSize, 0);

  FLargestRecordSize := 0;
end;

destructor TTCPServer.Destroy;
begin
  setLength(arrSize, 0);
  setLength(arrayProcedure, 0);

  // IPList.Free;
  // LoginList.Free;

  // if Pointer(FRealLog)= Pointer(FLog) then
  // begin
  // FLog.Free;
  // FLog:= nil;
  // end;

  FRealLog.Free;
  FLog := nil;

  FWSocketServer.Free;

  inherited;
end;

procedure TTCPServer.setLog(aLog: TStringList);
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

procedure TTCPServer.Listen(aPort: string);
begin
  FWSocketServer.OnClientConnect := ClientConnect;
  FWSocketServer.OnClientDisConnect := ClientDisconnect;
  // FWSocketServer.OnClientCreate:= ClientCreate;
  FWSocketServer.OnBgException := BGException;
  FWSocketServer.Proto := 'tcp';
  FWSocketServer.Port := aPort;
  FWSocketServer.Addr := '0.0.0.0';

  FWSocketServer.LineMode := False;
  FWSocketServer.LineEdit := False;
  FWSocketServer.LineEcho := False;

  FWSocketServer.ClientClass := TClientConnected;
  FWSocketServer.Banner := '';
  // FWSocketServer.BufSize:= 20 shl 10;

  FWSocketServer.Listen;
  FLog.Add(DateTimeToStr(Now) + ': ' +
    'Server listening at port ' + aPort);
end;

// procedure TTCPServer.Stop;
// begin
// FWSocketServer.Close;
// FLog.Add(DateTimeToStr(Now)+': '+'Server stopped');
// end;

procedure TTCPServer.Stop;
// var
// i: Integer;
// cCLient: TWSocketClient;
// cCon: TClientConnected;
begin
  // for i := 0 to FWSocketServer.ClientCount-1 do
  // begin
  // cClient := FWSocketServer.Client[i];
  // if FWSocketServer.IsClient(cCLient) then begin
  // cCon:= TClientConnected(cCLient);
  // if cCon.State <> wsClosed then
  // cCon.Close;
  // end;
  // end;

  FWSocketServer.Close;
  // FWSocketServer.OnClientConnect := nil;
  // FWSocketServer.OnClientDisconnect := nil;
  FLog.Add(DateTimeToStr(Now) + ': ' + 'Server stopped');
end;

// procedure TTCPServer.SendData(Index: integer; aBuffer: PAnsiChar;
// size: integer);
// begin
// if Index>= FWSocketServer.ClientCount then
// begin
// raise Exception.Create('Index '+inttostr(Index)+' is out of bound');
// exit;
// end;
//
// if FWSocketServer.Client[Index].State= wsConnected then
// begin
// FWSocketServer.Client[Index].Send(aBuffer, size);
// end;
// end;

procedure TTCPServer.SendDataEx(aID: byte; aBuffer: PAnsiChar;
  AClient: TWSocketClient);
var
  lBuffer: PAnsiChar;
  stamp: TPacketCheck;
  size: LongWord;
  strTemp: string;
  i: integer;
begin
  // if aID<= length(arrayProcedure) then
  if (aID <= length(arrayProcedure)) and (arrSize[aID] > 0) then
  begin
    strTemp := 'Send: ID ' + inttostr(aID) + '  ' + C_REC_PACKETNAME[aID] +
      ' Size ' + inttostr(arrSize[aID]);

    stamp.ID := aID;
    stamp.Pass := PACKET_PASS;
    CopyMemory(aBuffer, @stamp, sizeof(TPacketCheck));
    size := arrSize[aID];

    getMem(lBuffer, size + 4);
    CopyMemory(lBuffer, @size, 4);
    CopyMemory(lBuffer + 4, aBuffer, size);

    if AClient <> nil then
    begin
      if AClient.State = wsConnected then
      begin
        { TODO -oArmand : Ini buat apa ya? }
        {
          while not aClient.AllSent do
          begin
          FLog.Add('AllSent is false, pending ...');
          aClient.ProcessMessages;
          end;
        }
        if not AClient.AllSent then
          FLog.Add(TimeToStr(Now) + ': AllSent flag is false');

//        FLog.Add(TimeToStr(Now) + ': ' + strTemp);
        try
          AClient.send(lBuffer, size + 4);
        except
          on E: exception do
            HandleException(E, AClient);
        end; // end exception
      end;
    end
    else
    begin
      for i := 0 to FWSocketServer.ClientCount - 1 do
      begin
        // if (FWSocketServer.Client[i].State= wsConnected) and (TClientConnected(FWSocketServer.Client[i]).isReady) then
        if (FWSocketServer.Client[i] <> nil) and
          (FWSocketServer.Client[i].State = wsConnected) then
        begin
          { TODO -oArmand : Ini buat apa ya? }
          {
            while not FWSocketServer.Client[i].AllSent do
            begin
            FLog.Add('AllSent is false, pending ...');
            FWSocketServer.Client[i].ProcessMessages;
            end;
          }
          if not FWSocketServer.Client[i].AllSent then
            FLog.Add(TimeToStr(Now) + ': AllSent flag is false');

//          FLog.Add(TimeToStr(Now) + ': ' + strTemp + ', to: ' +
//            FWSocketServer.Client[i].GetPeerAddr);
          try
            FWSocketServer.Client[i].send(lBuffer, size + 4);
          except
            on E: exception do
              HandleException(E, FWSocketServer.Client[i]);
          end; // end exception
        end;
      end;
    end;
    freeMem(lBuffer);
  end
  else
  begin
    FLog.Add(TimeToStr(Now) + ': ' + 'Trying to send unknown packet (ID= ' +
      inttostr(aID) + ')');
  end;
end;

// procedure TTCPServer.ClientCreate(Sender: TObject; Client: TWSocketClient);
// begin
// {  Entah kenapa kalo pake thread ada packet yang gak dikirim...
// Apa modelku yang salah ya?
// - Armand
// with Client as TClientConnected do
// begin
// Client.ThreadDetach;
// Client.MultiThreaded         := TRUE;
// ClientThread                 := TClientThread.Create(TRUE);
// ClientThread.FreeOnTerminate := TRUE;
// ClientThread.WSocket         := Client;
// ClientThread.Suspended       := FALSE;
// // Wait until thread is started and has attached client socket to
// // his own context.
// while not ClientThread.ThreadAttached do
// Sleep(0);
// end;
// }
// end;

procedure TTCPServer.ClientConnect(Sender: TObject; Client: TWSocketClient;
  Error: word);
var
  cCon: TClientConnected;
begin
  cCon := TClientConnected(Client);
  getMem(cCon.FReceivedBuffer, 1024 * 1024);
  getMem(cCon.FBuffer, BUFFER_SIZE);

  cCon.FBufferSize := 0;
  cCon.FBufferNow := 0;
  cCon.FBufferSizeKnown := False;

  cCon.isReady := False;
  cCon.Login := '';

  cCon.LineMode := False;
  cCon.LineEdit := False;
  cCon.LineEcho := False;
  cCon.OnDataAvailable := ClientDataAvailable;
  cCon.OnBgException := ClientBGException;
  cCon.ConnectTime := Now;
  // TClientConnected(Client).BufSize:= 20 shl 10;

  FLog.Add(DateTimeToStr(Now) + ': ' + 'Client connected from ' + cCon.PeerAddr
    + ':' + cCon.PeerPort);

  // Nando Added For Parsing IP Client Connect
  if Assigned(OnClientConnect) then
    OnClientConnect(cCon.PeerAddr + ':' + cCon.PeerPort);
end;

procedure TTCPServer.ClientDisconnect(Sender: TObject; Client: TWSocketClient;
  Error: word);
var
  // i: integer;
  cCon: TClientConnected;
begin
  cCon := TClientConnected(Client);
  FLog.Add(DateTimeToStr(Now) + ': ' + 'Client disconnected from ' +
    cCon.PeerAddr + ':' + cCon.PeerPort + ', duration: ' +
    FormatDateTime('hh:nn:ss', Now - cCon.ConnectTime));

  // Nando Added For Parsing IP Client Disonnect
  if Assigned(OnClientDisConnect) then
    OnClientDisConnect(cCon.PeerAddr + ':' + cCon.PeerPort);

  // i:= IPList.IndexOf(TClientConnected(Client).PeerAddr);
  // if i>= 0 then
  // begin
  // IPList.Delete(i);
  // LoginList.Delete(i);
  // end;

  if Assigned(cCon.FBuffer) then
    freeMem(cCon.FBuffer);

  if Assigned(cCon.FReceivedBuffer) then
    freeMem(cCon.FReceivedBuffer);

  cCon.OnDataAvailable := nil;
end;

procedure TTCPServer.ClientBGException(Sender: TObject; E: exception;
  var CanClose: boolean);
begin
  FLog.Add(TimeToStr(Now) + ': ' + 'Client exception occured: ' + E.ClassName +
    ': ' + E.Message);
  CanClose := True; // Bye bye client!
end;

procedure TTCPServer.BGException(Sender: TObject; E: exception;
  var CanClose: boolean);
begin
  FLog.Add(TimeToStr(Now) + ': ' + 'Server exception occured: ' + E.ClassName +
    ': ' + E.Message);
  CanClose := False; // Bye bye client!
end;

procedure TTCPServer.ClientDataAvailable(Sender: TObject; Error: word);
var
  cCon: TClientConnected;
  // buffer: PAnsiChar;
  receivedByte: integer;
  len: integer;
  p, p2: Pointer;
  {
    i: integer;
    strHex: sting;
  }
  bLoop: boolean;
begin
  cCon := TClientConnected(Sender);
  // receivedByte:= TWSocket(Sender).RcvdCount;
  // FLog.Add(TimeToStr(Now)+'Recv: '+ inttostr(receivedByte) + ' byte from ' + TClientConnected(Sender).PeerAddr + ' available');

  // if receivedByte < 1  then exit;

  // GetMem(buffer, receivedByte);
  len := cCon.Receive(cCon.FReceivedBuffer, sizeof(cCon.FReceivedBuffer));
  if len <= 0 then
  begin
    // FLog.Add(TimeToStr(Now) + ': ' + 'packet with length ' + inttostr(len) +
    // 'received!');
    exit;
  end;

  p := cCon.FBuffer + cCon.FBufferNow;
  CopyMemory(PAnsiChar(p), cCon.FReceivedBuffer, len);
  inc(cCon.FBufferNow, len);

  bLoop := True;
  while bLoop do
  begin
    if (not cCon.FBufferSizeKnown) and (cCon.FBufferNow >= 4) then
    begin
      CopyMemory(@(cCon.FBufferSize), cCon.FBuffer, 4);
      cCon.FBufferSizeKnown := True;
    end;

    if (cCon.FBufferSizeKnown) and (cCon.FBufferNow >= cCon.FBufferSize + 4)
    then
    begin
      p := cCon.FBuffer + 4;
      PacketRecognizer(p, cCon.FBufferSize, Sender);

      if cCon.FBufferNow > cCon.FBufferSize + 4 then
      begin
        p := cCon.FBuffer + (cCon.FBufferSize + 4);
        cCon.FBufferNow := cCon.FBufferNow - (cCon.FBufferSize + 4);

        getMem(p2, cCon.FBufferNow);
        CopyMemory(p2, p, cCon.FBufferNow);
        CopyMemory(cCon.FBuffer, p2, cCon.FBufferNow);
        freeMem(p2);

        // CopyMemory(TClientConnected(Sender).FBuffer, p, TClientConnected(Sender).FBufferNow);
        // TClientConnected(Sender).FBufferSize:= 0;
        cCon.FBufferSizeKnown := False;
      end
      else
      begin
        cCon.FBufferSize := 0;
        cCon.FBufferNow := 0;
        cCon.FBufferSizeKnown := False;
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

procedure TTCPServer.PacketRecognizer(aP: PAnsiChar; aSize: integer;
  Sender: TObject);
var
  lPc: TPacketCheck;
begin
  CopyMemory(@lPc, aP, sizeof(TPacketCheck));
  if lPc.Pass <> PACKET_PASS then
  begin
    FLog.Add(TimeToStr(Now) + ': ' + 'Packet password is wrong');
    exit;
  end;

  if lPc.ID <= length(arrayProcedure) then
  begin
    if Assigned(arrayProcedure[lPc.ID]) then
    begin
      FLog.Add(TimeToStr(Now) + ': ' + ' (ID= ' + inttostr(lPc.ID) + ')' +
        C_REC_PACKETNAME[lPc.ID]);
      arrayProcedure[lPc.ID](aP, arrSize[lPc.ID], TWSocketClient(Sender));
    end
    else
      FLog.Add(DateTimeToStr(Now) + ': ' + 'Unidentified data available (ID= ' +
        inttostr(lPc.ID) + ')');
  end
  else
  begin
    FLog.Add(DateTimeToStr(Now) + ': ' + 'Unidentified data available (ID= ' +
      inttostr(lPc.ID) + ')');
  end;
end;

procedure TTCPServer.DoNothing;
begin

end;

procedure TTCPServer.RegisterProcedure(aType: word; aProcedure: TCPT_PROCEDURE;
  recordSize: word);
var
  lastLength: integer;
  i: integer;
begin
  lastLength := length(arrayProcedure);
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

  FLog.Add('Register ID: ' + inttostr(aType) + ' as ' + C_REC_PACKETNAME[aType]
    + ' size ' + inttostr(recordSize));

  arrayProcedure[aType] := aProcedure;
  arrSize[aType] := recordSize;
end;

procedure TTCPServer.UnregisterAllProcedure;
var
  i: integer;
begin
  for i := length(arrayProcedure) - 1 downto 0 do
  begin
    arrayProcedure[i] := nil;
    arrSize[i] := 0;
  end;

  setLength(arrayProcedure, 0);
  setLength(arrSize, 0);
end;

procedure TTCPServer.HandleException(AE: exception; AClient: TWSocket);
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

procedure TTCPServer.Listen(aAddress, aPort: string);
begin
  FWSocketServer.OnClientConnect := ClientConnect;
  FWSocketServer.OnClientDisConnect := ClientDisconnect;
  // FWSocketServer.OnClientCreate:= ClientCreate;
  FWSocketServer.OnBgException := BGException;
  FWSocketServer.Proto := 'tcp';
  FWSocketServer.Port := aPort;
  FWSocketServer.Addr := aAddress;

  FWSocketServer.LineMode := False;
  FWSocketServer.LineEdit := False;
  FWSocketServer.LineEcho := False;

  FWSocketServer.ClientClass := TClientConnected;
  FWSocketServer.Banner := '';
  // FWSocketServer.BufSize:= 20 shl 10;

  FWSocketServer.Listen;
  FLog.Add(DateTimeToStr(Now) + ': ' + 'Server listening at ' +
    aAddress + ':' + aPort);
end;

{ TClientThread }

// procedure TClientThread.Execute;
// begin
// if not Assigned(WSocket) then
// Exit;
//
// { Attach client socket to this thread                                   }
// WSocket.ThreadAttach;
// { Signal main thread that we've attached socket to this thread          }
// ThreadAttached := TRUE;
// { Now let main thread continue starting the connection.                 }
// { This little avoid race condition.                                     }
// Sleep(0);
// { Then process messages until WM_QUIT message is posted.                }
// { TWSocket is event-driven. So even when used within a thread, we       }
// { have to have a "message pump". Any message pump will do and there     }
// { is one built in TWSocket, so use it !                                 }
// WSocket.MessageLoop;
// { Be sure to have main thread waiting for termination before terminating}
// Sleep(0);
// { Detach the hidden window from within the thread                       }
// WSocket.ThreadDetach;
// end;

end.
