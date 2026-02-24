unit uPtkServer;

interface

uses Windows, Messages, SysUtils, Classes, OverbyteIcsWSocket,
  OverbyteIcsWSocketS, Dialogs;

type

  TOnNetReceive = procedure(word : string) of object;

  TConnection = class(TWSocketClient)
  public
    RcvdLine: string;
    Param: array [0 .. 10] of string;
    ParamCount: Integer;
    ConnectTime: TDateTime;
  end;

  TDisplayProc = procedure(AMsg: string) of object;

  TListener = class(TObject)
  private
    FSocket: TWSocketServer;
    FPort: string;
    FAddr: string;
    FOnDisplay: TDisplayProc;
    FLog: TStringList;
    FRealLog: TStringList;
    FOnNetReceive : TOnNetReceive;

//    procedure Display(AMsg: string);
    procedure BgExceptionHandler(Sender: TObject; E: Exception;
      var CanClose: Boolean);
    procedure ClientConnectHandler(Sender: TObject; Client: TWSocketClient;
      Error: Word);
    procedure ClientDisconnectHandler(Sender: TObject; Client: TWSocketClient;
      Error: Word);
    procedure ClientDataAvailableHandler(Sender: TObject; Error: Word);

    procedure ClientBgExceptionHandler(Sender: TObject; E: Exception;
      var CanClose: Boolean);

    // procedure ProcessData(AConnection: TConnection);

    function GetBanner: string;
    procedure SetBanner(const AValue: string);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Startup;
    procedure Shutdown;
    procedure Send(msg: string);

    procedure setLog(aLog: TStringList);

    property OnDisplay: TDisplayProc read FOnDisplay write FOnDisplay;
    property Banner: string read GetBanner write SetBanner;
    property Port: string read FPort write FPort;
    property Address: string read FAddr write FAddr;
    property OnNetReceive : TOnNetReceive read FOnNetReceive write FOnNetReceive;
  end;

//  var
//    Server: TListener;

implementation

uses OverbyteIcsUtils;

constructor TListener.Create;
begin
  inherited Create;
  FSocket := TWSocketServer.Create(nil);
  FSocket.Banner := 'TCP Service Ready.';
  FPort := '2345';
  FAddr := '0.0.0.0';

  FLog := TStringList.Create;
  FRealLog := FLog;
end;

destructor TListener.Destroy;
begin
  if Assigned(FSocket) then
  begin
    FSocket.Destroy;
    FSocket := nil;
  end;
  inherited Destroy;

  if Pointer(FRealLog) = Pointer(FLog) then
  begin
    FLog.Free;
    FLog := nil;
  end;
end;

procedure TListener.Send(msg: string);
var
  i: Integer;
begin

  for i := 0 to FSocket.ClientCount - 1 do
  begin
//    Display('Mengirim ke : ' + FSocket.Client[i].GetPeerAddr + ' pesan : ' +
//        msg);

    FLog.Add(DateTimeToStr(Now) + ': ' + 'Mengirim ke : ' + FSocket.Client[i].GetPeerAddr + ' pesan : ' +
        msg);

    FSocket.Client[i].SendStr(msg + #13#10);
    FSocket.Client[i].Flush;

  end;

end;

//procedure TListener.Display(AMsg: string);
//begin
//  if Assigned(FOnDisplay) then
//    FOnDisplay(AMsg);
//end;

procedure TListener.BgExceptionHandler(Sender: TObject; E: Exception;
  var CanClose: Boolean);
begin
  ShowMessage('Server exception occured: ' + E.ClassName + ': ' + E.Message);
//  Display('Server exception occured: ' + E.ClassName + ': ' + E.Message);
  CanClose := False;
end;

procedure TListener.ClientConnectHandler(Sender: TObject;
  Client: TWSocketClient; Error: Word);
var
  AConnection: TConnection;
begin
  AConnection := Client as TConnection;

//  Display('Client connecting: ' + AConnection.PeerAddr);
  FLog.Add(DateTimeToStr(Now) + ': ' + ('Client connecting: ' + AConnection.PeerAddr));
  AConnection.LineMode := True;
//  AConnection.LineEdit := True;
  AConnection.LineEnd := #13#10;
  AConnection.OnDataAvailable := ClientDataAvailableHandler;
  AConnection.OnBgException := ClientBgExceptionHandler;
  AConnection.ConnectTime := Now;


//  FSocket.Banner := IntToStr(Integer(VTCMS_GameCenter.ActiveRole));
end;

procedure TListener.ClientDisconnectHandler(Sender: TObject;
  Client: TWSocketClient; Error: Word);
var
  AConnection: TConnection;
begin
  AConnection := Client as TConnection;
//  ShowMessage('Client disconnecting: ' + AConnection.PeerAddr + '   ' +
//      'Duration: ' + FormatDateTime('hh:nn:ss',
//      Now - AConnection.ConnectTime));
//  Display('Client disconnecting: ' + AConnection.PeerAddr + '   ' +
//      'Duration: ' + FormatDateTime('hh:nn:ss',
//      Now - AConnection.ConnectTime));
  AConnection.OnDataAvailable:= nil;
end;

//procedure TListener.ClientDataAvailableHandler(Sender: TObject; Error: Word);
//var
//  AConnection: TConnection;
//  msg : string;
//begin
//  AConnection := Sender as TConnection;
//  { We use line mode. We will receive complete lines }
//  AConnection.RcvdLine := AConnection.ReceiveStr;
//  { Remove trailing CR/LF }
//  while (Length(AConnection.RcvdLine) > 0) and IsCharInSysCharSet
//    (AConnection.RcvdLine[Length(AConnection.RcvdLine)], [#13, #10])
//  do
//    AConnection.RcvdLine := Copy(AConnection.RcvdLine, 1,
//      Length(AConnection.RcvdLine) - 1);
//      msg := AConnection.RcvdLine;
//
////  ShowMessage(msg);
//  if Assigned(FOnNetReceive) then
//    FOnNetReceive(msg);
//
////  Display('Received from ' + AConnection.GetPeerAddr + ': ' +
////      AConnection.RcvdLine + #13#10);
//  FLog.Add(DateTimeToStr(Now) + ': ' + 'Received from ' + AConnection.GetPeerAddr + ': ' +
//      AConnection.RcvdLine + #13#10);
//
//  // AConnection.SendStr('Hai' + #13#10);
//  // ProcessData(Sender as TConnection);
//end;

procedure TListener.ClientDataAvailableHandler(Sender: TObject; Error: Word);
var
  AConnection: TConnection;
  msg : string;
begin
  AConnection := Sender as TConnection;
  { We use line mode. We will receive complete lines }
  AConnection.RcvdLine := AConnection.ReceiveStr;

  { Remove trailing CR/LF }
//  while (Length(AConnection.RcvdLine) > 0) and IsCharInSysCharSet
//    (AConnection.RcvdLine[Length(AConnection.RcvdLine)], [#13, #10])
//  do
//    AConnection.RcvdLine := Copy(AConnection.RcvdLine, 1,
//      Length(AConnection.RcvdLine) - 1);
//      msg := AConnection.RcvdLine;
  msg:= StringReplace(AConnection.RcvdLine, #13#10, '', [rfIgnoreCase]);

//  ShowMessage(msg);
  if Assigned(FOnNetReceive) then
    FOnNetReceive(msg);

//  Display('Received from ' + AConnection.GetPeerAddr + ': ' +
//      AConnection.RcvdLine + #13#10);
  FLog.Add(DateTimeToStr(Now) + ': ' + 'Received from ' + AConnection.GetPeerAddr + ': ' +
      AConnection.RcvdLine + #13#10);

  // AConnection.SendStr('Hai' + #13#10);
  // ProcessData(Sender as TConnection);
end;

procedure TListener.ClientBgExceptionHandler(Sender: TObject; E: Exception;
  var CanClose: Boolean);
begin
  ShowMessage('Client exception occured: ' + E.ClassName + ': ' + E.Message);
//  Display('Client exception occured: ' + E.ClassName + ': ' + E.Message);
  CanClose := True;
end;

procedure TListener.Startup;
begin
  FSocket.OnBgException := BgExceptionHandler;
  FSocket.OnClientConnect := ClientConnectHandler;
  FSocket.OnClientDisconnect := ClientDisconnectHandler;
  FSocket.Proto := 'tcp';
  FSocket.Port := FPort;
  FSocket.Addr := FAddr;
  FSocket.ClientClass := TConnection;
  FSocket.Listen;
//  Display('Waiting for clients...');
end;

procedure TListener.Shutdown;
begin
  //Send('shutdown');
  FSocket.Close;
end;

function TListener.GetBanner: string;
begin
  Result := FSocket.Banner;
end;

procedure TListener.SetBanner(const AValue: string);
begin
  FSocket.Banner := AValue;
end;

procedure TListener.setLog(aLog: TStringList);
begin
  if aLog = nil then
  begin
    FRealLog.Assign(FLog);
    FLog := FRealLog;
    exit;
  end;

  aLog.Assign(FLog);
  //if pLogPointer= Pointer(FLog) then
  if Pointer(FRealLog) = Pointer(FLog) then
    FLog.Clear;
  FLog := aLog;
end;

end.
