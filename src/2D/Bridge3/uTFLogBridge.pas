unit uTFLogBridge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,

  uBridgeManager, AdvSmoothPanel;

const
  C_MAX_LOG_LINECOUNT = 50;

type
  TTFLogBridge = class(TForm)
    pnlMain: TPanel;
    pnlClient: TPanel;
    pnlServer: TPanel;
    mLogClient: TMemo;
    mLogServer: TMemo;
    pnlClientUp: TPanel;
    pnlServerUp: TPanel;
    pnlClientBottom: TPanel;
    pnlSetting: TPanel;
    pnlSettingUp: TPanel;
    mLogSetting: TMemo;
    pnlPacket: TPanel;
    pnlUppacket: TPanel;
    mmoPacket: TMemo;
    tmrShutdownServer: TTimer;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    pnl1Home: TAdvSmoothPanel;
    lbljudul: TLabel;
    btn1: TButton;
    Panel1: TPanel;
    btnBack: TButton;
    btnClearLog_Packet: TButton;
    chkVerboseLog_Cli3D: TCheckBox;
    chkVerboseLog_Svr2D: TCheckBox;
    chkVerboseLog_Packet: TCheckBox;
    btnClearLog_Cli3D: TButton;
    btnClearLog_Svr2D: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrShutdownServerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnClearLog_PacketClick(Sender: TObject);
    procedure btnClearLog_Svr2DClick(Sender: TObject);
    procedure btnClearLog_Cli3DClick(Sender: TObject);
    procedure chkVerboseLog_Cli3DClick(Sender: TObject);
    procedure chkVerboseLog_Svr2DClick(Sender: TObject);
  private
    { Private declarations }
    isClose: Boolean;

  public
    { Public declarations }
    procedure OnLogPnlClient3D(str: string);
    procedure OnLogServer2D(str: string);
    procedure OnLogClient3D(str: string);
    procedure OnLogPacket(str: string);
    procedure OnLogSettingSocket(m2D_IP, m2D_Port, m3D_IP, m3D_Port: string);
    procedure OnLogSettingDB(mDBServer, mDBProto, mDBName, mDBUser, mDBPass,
      mDBPort: string);

    procedure PrepareStopSimulation;
  end;

var
  TFLogBridge: TTFLogBridge;

implementation

{$R *.dfm}
{ TTFLogBridge }

procedure TTFLogBridge.btn1Click(Sender: TObject);
begin
  Height  := 379;
  Width   := 1057;
  pnlMain.BringToFront;

  BorderStyle := bsSizeable;
end;

procedure TTFLogBridge.btnBackClick(Sender: TObject);
var
  mProject : string;

begin
  Height := 293;
  Width := 150;

  pnl1Home.BringToFront;
  BorderStyle := bsNone;

  mProject := BridgeManager.PubBridgeSet.mSystemServer.Project;

  if mProject = 'NAFS' then
  begin
    Top   := 10;
    Left  := 1145;
  end
  else if mProject = 'NSFS' then
  begin
    Top   := 313;
    Left  := 1145;
  end
  else
  begin
    Top   := 616;
    Left  := 1145;
  end;
end;

procedure TTFLogBridge.btnClearLog_Cli3DClick(Sender: TObject);
begin
  mLogClient.Clear;
end;

procedure TTFLogBridge.btnClearLog_PacketClick(Sender: TObject);
begin
  mmoPacket.Clear;
end;

procedure TTFLogBridge.btnClearLog_Svr2DClick(Sender: TObject);
begin
  mLogServer.Clear;
end;

procedure TTFLogBridge.chkVerboseLog_Cli3DClick(Sender: TObject);
begin
  if chkVerboseLog_Cli3D.Checked then
  begin
    BridgeManager.SetLog3DClient(TStringList(mLogClient.Lines));
  end
  else
  begin
    BridgeManager.SetLog3DClient(nil);
  end;
end;

procedure TTFLogBridge.chkVerboseLog_Svr2DClick(Sender: TObject);
begin
  if chkVerboseLog_Svr2D.Checked then
  begin
    BridgeManager.SetLog2DServer(TStringList(mLogServer.Lines));
  end
  else
  begin
    BridgeManager.SetLog2DServer(nil);
  end;
end;

procedure TTFLogBridge.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  PrepareStopSimulation;
  BridgeManager.OnLogPnlClient := nil;
  BridgeManager.OnLogSettingDB := nil;
  BridgeManager.OnLogSettingSocket := nil;
  BridgeManager.OnLogServer2D := nil;
  BridgeManager.OnLogClient3D := nil;
  BridgeManager.OnLogPacket := nil;

end;

procedure TTFLogBridge.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not isClose then
    tmrShutdownServer.Enabled := True;
  CanClose := isClose;
end;

procedure TTFLogBridge.FormCreate(Sender: TObject);
begin
  isClose := False;
  tmrShutdownServer.Enabled := False;

  BridgeManager := TBridgeManager.Create;

  BridgeManager.OnLogPnlClient := OnLogPnlClient3D;
  BridgeManager.OnLogSettingDB := OnLogSettingDB;
  BridgeManager.OnLogSettingSocket := OnLogSettingSocket;
//  BridgeManager.OnLogServer2D := OnLogServer2D;
//  BridgeManager.OnLogClient3D := OnLogClient3D;
  chkVerboseLog_Cli3D.Checked := False;
  chkVerboseLog_Svr2D.Checked := False;
  BridgeManager.SetLog2DServer(nil);
  BridgeManager.SetLog3DClient(nil);
  BridgeManager.OnLogPacket := OnLogPacket;

  BridgeManager.InitSimulation;
  BridgeManager.RunSimulation;

  Self.Width := 150;
  pnl1Home.BringToFront;

end;

procedure TTFLogBridge.FormDestroy(Sender: TObject);
begin
  BridgeManager.Free;
end;

procedure TTFLogBridge.FormShow(Sender: TObject);
var
  mProject : string;
begin
  mProject := BridgeManager.PubBridgeSet.mSystemServer.Project;

  if mProject = 'NAFS' then
  begin
    lbljudul.Caption := 'BRIGDE NAFS';
    lbljudul.Font.Color         := $00D0875A;
    pnl1Home.Fill.Color         := $00D0875A;
    pnl1Home.Fill.ColorMirror   := $00D4D4D4;
    pnl1Home.Fill.ColorMirrorTo := $00D0875A;
    pnl1Home.Fill.ColorTo       := $00D4D4D4;

    pnlClientUp.Color := $00D0875A;
    pnlServerUp.Color := $00D0875A;
    pnlSettingUp.Color := $00D0875A;
    pnlUppacket.Color := $00D0875A;

    Top   := 10;
    Left  := 1145;
  end
  else if mProject = 'NSFS' then
  begin
    lbljudul.Caption := 'BRIGDE NSFS';
    lbljudul.Font.Color         := $0040220F;
    pnl1Home.Fill.Color         := $0040220F;
    pnl1Home.Fill.ColorMirror   := $00CF7234;
    pnl1Home.Fill.ColorMirrorTo := $0040220F;
    pnl1Home.Fill.ColorTo       := $00CF7234;

    pnlClientUp.Color := $0040220F;
    pnlServerUp.Color := $0040220F;
    pnlSettingUp.Color := $0040220F;
    pnlUppacket.Color := $0040220F;

    Top   := 313;
    Left  := 1145;
  end
  else
  begin
    lbljudul.Caption := 'BRIGDE NSSFS';
    lbljudul.Font.Color         := $0058524F;
    pnl1Home.Fill.Color         := $0058524F;
    pnl1Home.Fill.ColorMirror   := $00E4E4E4;
    pnl1Home.Fill.ColorMirrorTo := $0058524F;
    pnl1Home.Fill.ColorTo       := $00E4E4E4;

    pnlClientUp.Color := $0058524F;
    pnlServerUp.Color := $0058524F;
    pnlSettingUp.Color := $0058524F;
    pnlUppacket.Color := $0058524F;

    Top   := 616;
    Left  := 1145;
  end;

end;

procedure TTFLogBridge.OnLogClient3D(str: string);
begin
  if not chkVerboseLog_Cli3D.Checked then
    Exit;

  // if mLogClient.Lines.Count > 100 then mLogClient.Lines.Clear;
  mLogClient.Lines.BeginUpdate;
  try
    if mLogClient.Lines.Count > C_MAX_LOG_LINECOUNT then
      mLogClient.Lines.Delete(0);
    mLogClient.Lines.Add(str);
  finally
    mLogClient.Lines.EndUpdate;
  end;
end;

procedure TTFLogBridge.OnLogPacket(str: string);
begin
  if not chkVerboseLog_Packet.Checked then
    Exit;
  // if mmoPacket.Lines.Count > 100 then mmoPacket.Lines.Clear;
  mmoPacket.Lines.BeginUpdate;
  try
    if mmoPacket.Lines.Count > C_MAX_LOG_LINECOUNT then // ori 200
      mmoPacket.Lines.Delete(0);
    mmoPacket.Lines.Add(str);
  finally
    mmoPacket.Lines.EndUpdate;
  end;
end;

procedure TTFLogBridge.OnLogPnlClient3D(str: string);
begin
  pnlClientBottom.Caption := str;
end;

procedure TTFLogBridge.OnLogServer2D(str: string);
begin
  if not chkVerboseLog_Svr2D.Checked then
    Exit;

  // if mLogServer.Lines.Count > 100 then mLogServer.Lines.Clear;
  mLogServer.Lines.BeginUpdate;
  try
    if mLogServer.Lines.Count > C_MAX_LOG_LINECOUNT then
      mLogServer.Lines.Delete(0);
    mLogServer.Lines.Add(str);
  finally
    mLogServer.Lines.EndUpdate;
  end;
end;

procedure TTFLogBridge.OnLogSettingDB(mDBServer, mDBProto, mDBName, mDBUser,
  mDBPass, mDBPort: string);
begin
  mLogSetting.Lines.Add('DB Server : ' + mDBServer);
  mLogSetting.Lines.Add('DB Proto  : ' + mDBProto);
  mLogSetting.Lines.Add('DB Name   : ' + mDBName);
  mLogSetting.Lines.Add('DB User   : ' + mDBUser);
  mLogSetting.Lines.Add('DB Pass   : ' + mDBPass);
  mLogSetting.Lines.Add('DB Port   : ' + mDBPort);
end;

procedure TTFLogBridge.OnLogSettingSocket(m2D_IP, m2D_Port, m3D_IP,
  m3D_Port: string);
begin
  mLogSetting.Lines.Add('3D Server : ' + m3D_IP);
  mLogSetting.Lines.Add('3D Port   : ' + m3D_Port);
  mLogSetting.Lines.Add('2D Server : ' + m2D_IP);
  mLogSetting.Lines.Add('2D Port   : ' + m2D_Port);
end;

procedure TTFLogBridge.PrepareStopSimulation;
begin
  BridgeManager.TcpClient.setLog(nil);
  BridgeManager.TcpServer.setLog(nil);
  BridgeManager.PrepareStopSimulation;
end;

procedure TTFLogBridge.tmrShutdownServerTimer(Sender: TObject);
begin
  if BridgeManager.GetServer2DClientCount > 0 then
  begin
    BridgeManager.CloseOneServer2DClient
  end
  else
  begin

    PrepareStopSimulation;
    BridgeManager.OnLogPnlClient := nil;
    BridgeManager.OnLogSettingDB := nil;
    BridgeManager.OnLogSettingSocket := nil;
    BridgeManager.OnLogServer2D := nil;
    BridgeManager.OnLogClient3D := nil;
    BridgeManager.OnLogPacket := nil;

    isClose := True;
    Close;
  end;
end;

end.
