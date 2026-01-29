unit uTFLogBridge;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,

  uBridgeManager, AdvSmoothPanel;

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
    btnBack: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrShutdownServerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
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
end;

procedure TTFLogBridge.btnBackClick(Sender: TObject);
begin
  Height  := 300;
  Width   := 300;
  pnl1Home.BringToFront;
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
  BridgeManager.OnLogServer2D := OnLogServer2D;
  BridgeManager.OnLogClient3D := OnLogClient3D;
  BridgeManager.OnLogPacket := OnLogPacket;

  BridgeManager.SetLog2DServer(TStringList(mLogServer.Lines));

  BridgeManager.InitSimulation;
  BridgeManager.RunSimulation;
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
    Top   := 0;
    Left  := 975;
  end
  else if mProject = 'NSFS' then
  begin
    lbljudul.Caption := 'BRIGDE NSFS';
    lbljudul.Font.Color         := $0040220F;
    pnl1Home.Fill.Color         := $0040220F;
    pnl1Home.Fill.ColorMirror   := $00CF7234;
    pnl1Home.Fill.ColorMirrorTo := $0040220F;
    pnl1Home.Fill.ColorTo       := $00CF7234;
    Top   := 340;
    Left  := 975;
  end
  else
  begin
    lbljudul.Caption := 'BRIGDE NSSFS';
    lbljudul.Font.Color         := $0058524F;
    pnl1Home.Fill.Color         := $0058524F;
    pnl1Home.Fill.ColorMirror   := $00E4E4E4;
    pnl1Home.Fill.ColorMirrorTo := $0058524F;
    pnl1Home.Fill.ColorTo       := $00E4E4E4;
    Top   := 680;
    Left  := 975;
  end;

end;

procedure TTFLogBridge.OnLogClient3D(str: string);
begin
  // if mLogClient.Lines.Count > 100 then mLogClient.Lines.Clear;
  mLogClient.Lines.BeginUpdate;
  try
    if mLogClient.Lines.Count > 200 then
      mLogClient.Lines.Delete(0);
    mLogClient.Lines.Add(str);
  finally
    mLogClient.Lines.EndUpdate;
  end;
end;

procedure TTFLogBridge.OnLogPacket(str: string);
begin
  // if mmoPacket.Lines.Count > 100 then mmoPacket.Lines.Clear;
  mmoPacket.Lines.BeginUpdate;
  try
    if mmoPacket.Lines.Count > 200 then
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
  // if mLogServer.Lines.Count > 100 then mLogServer.Lines.Clear;
  mLogServer.Lines.BeginUpdate;
  try
    if mLogServer.Lines.Count > 200 then
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
