unit uFrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,

  uServerManager, AdvSmoothPanel;

type
  TfrmMain = class(TForm)
    pnlContent2D: TPanel;
    pnlContent3D: TPanel;
    pnlServer2D: TPanel;
    pnlLogServer2D: TPanel;
    pnlServer3D: TPanel;
    pnlLogServer3D: TPanel;
    Label1: TLabel;
    lbl2DServerPort: TLabel;
    mmoLog3D: TMemo;
    lbClients3D: TListBox;
    Label2: TLabel;
    lbl3DServerPort: TLabel;
    mmoLogClient2D: TMemo;
    mmoLogClientData2D: TMemo;
    tmrShutdownServer: TTimer;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    pnl2Log: TPanel;
    btnBack: TButton;
    pnl1Home: TAdvSmoothPanel;
    btn1: TButton;
    lbljudul: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrShutdownServerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    isClose: Boolean;
    ServerManager: TServerManager;

  public
    { Public declarations }

    procedure OnClientStatus2D(const str: string);
    procedure OnLogReceived2D(const s: string);
    procedure OnLogListenPort2D(const s: string);

    procedure OnClientStatus3D(const s: string);
    procedure OnLogReceived3D(const s: string);
    procedure OnLogListenPort3D(const s: string);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}
{ TfrmMain }

procedure TfrmMain.btn1Click(Sender: TObject);
begin
  Height := 660;
  Width := 597;
  pnl2Log.BringToFront;
  BorderStyle := bsSizeable;
end;

procedure TfrmMain.btnBackClick(Sender: TObject);
var
  mProject : string;

begin
  Height := 293;
  Width := 150;
  pnl1Home.BringToFront;
  BorderStyle := bsNone;

  mProject := ServerManager.PubBridgeSet.mSystemServer.Project;

  if mProject = 'NAFS' then
  begin
    Top   := 10;
    Left  := 991;
  end
  else if mProject = 'NSFS' then
  begin
    Top   := 313;
    Left  := 991;
  end
  else
  begin
    Top   := 616;
    Left  := 991;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // StateManager.StopSimulation;

  // StateManager.ONetLinkServer_OnClientStatus2D := nil;
  // StateManager.OnLogReceived2D := nil;
  // StateManager.OnLogListenPort2D := nil;
  //
  // StateManager.SetLog2DServer(nil);
  //
  // StateManager.ONetLinkServer_OnClientStatus := nil;
  // StateManager.OnLogReceived := nil;
  // StateManager.OnLogListenPort3D := nil;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not isClose then
    tmrShutdownServer.Enabled := True;
  CanClose := isClose;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  isClose := False;
  tmrShutdownServer.Enabled := False;

  // //create bridge manager
  ServerManager := TServerManager.Create;

  ServerManager.OnClientStatus2D := OnClientStatus2D;
  ServerManager.OnLogReceived2D := OnLogReceived2D;
  ServerManager.OnLogListenPort2D := OnLogListenPort2D;

  ServerManager.SetLog2DServer(TStringList(mmoLogClientData2D.Lines));

  ServerManager.OnClientStatus3D := OnClientStatus3D;
  ServerManager.OnLogReceived3D := OnLogReceived3D;
  ServerManager.OnLogListenPort3D := OnLogListenPort3D;

  ServerManager.SetEventLogForServer3D;

  if ServerManager.InitSimulation then
    ServerManager.RunSimulation
  else
    Close
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  ServerManager.Free;
end;

procedure TfrmMain.FormShow(Sender: TObject);
var
  mProject : string;
begin
  mProject := ServerManager.PubBridgeSet.mSystemServer.Project;

  if mProject = 'NAFS' then
  begin
    lbljudul.Caption := 'SERVER NAFS';
    lbljudul.Font.Color         := $00D0875A;
    pnl1Home.Fill.Color         := $00D0875A;
    pnl1Home.Fill.ColorMirror   := $00D4D4D4;
    pnl1Home.Fill.ColorMirrorTo := $00D0875A;
    pnl1Home.Fill.ColorTo       := $00D4D4D4;
    pnlServer2D.Color := $00D0875A;
    pnlServer3D.Color := $00D0875A;
    Top   := 10;
    Left  := 991;
  end
  else if mProject = 'NSFS' then
  begin
    lbljudul.Caption := 'SERVER NSFS';
    lbljudul.Font.Color         := $0040220F;
    pnl1Home.Fill.Color         := $0040220F;
    pnl1Home.Fill.ColorMirror   := $00CF7234;
    pnl1Home.Fill.ColorMirrorTo := $0040220F;
    pnl1Home.Fill.ColorTo       := $00CF7234;
    pnlServer2D.Color := $0040220F;
    pnlServer3D.Color := $0040220F;
    Top   := 313;
    Left  := 991;
  end
  else
  begin
    lbljudul.Caption := 'SERVER NSSFS';
    lbljudul.Font.Color         := $0058524F;
    pnl1Home.Fill.Color         := $0058524F;
    pnl1Home.Fill.ColorMirror   := $00E4E4E4;
    pnl1Home.Fill.ColorMirrorTo := $0058524F;
    pnl1Home.Fill.ColorTo       := $00E4E4E4;
    pnlServer2D.Color := $0058524F;
    pnlServer3D.Color := $0058524F;
    Top   := 616;
    Left  := 991;
  end;

end;

procedure TfrmMain.OnClientStatus3D(const s: string);
begin
  lbClients3D.Items.BeginUpdate;
  try
    lbClients3D.Items.Add(s);
  finally
    lbClients3D.Items.EndUpdate;
  end;
end;

procedure TfrmMain.OnLogListenPort2D(const s: string);
begin
  lbl2DServerPort.Caption := s;
end;

procedure TfrmMain.OnLogListenPort3D(const s: string);
begin
  lbl3DServerPort.Caption := s;
end;

procedure TfrmMain.OnLogReceived3D(const s: string);
begin
  mmoLog3D.Lines.BeginUpdate;
  try
    if mmoLog3D.Lines.Count > 200 then
      mmoLog3D.Lines.Delete(0);
    mmoLog3D.Lines.Add(s);
  finally
    mmoLog3D.Lines.EndUpdate;
  end;
end;

procedure TfrmMain.OnClientStatus2D(const str: string);
begin
  mmoLogClient2D.Lines.BeginUpdate;
  try
    if mmoLogClient2D.Lines.Count > 200 then
      mmoLogClient2D.Lines.Delete(0);
    mmoLogClient2D.Lines.Add(str);
  finally
    mmoLogClient2D.Lines.EndUpdate;
  end;
end;

procedure TfrmMain.OnLogReceived2D(const s: string);
begin
  mmoLogClientData2D.Lines.BeginUpdate;
  try
    if mmoLogClientData2D.Lines.Count > 200 then
      mmoLogClientData2D.Lines.Delete(0);
    mmoLogClientData2D.Lines.Add(s);
  finally
    mmoLogClientData2D.Lines.EndUpdate;
  end;
end;

procedure TfrmMain.tmrShutdownServerTimer(Sender: TObject);
begin
  if ServerManager.GetServer2DClientCount > 0 then
  begin
    ServerManager.CloseOneServer2DClient
  end
  else
  begin

    ServerManager.StopSimulation;

    tmrShutdownServer.Enabled := True;

    ServerManager.OnClientStatus2D := nil;
    ServerManager.OnLogReceived2D := nil;
    ServerManager.OnLogListenPort2D := nil;

    ServerManager.SetLog2DServer(nil);

    ServerManager.OnClientStatus3D := nil;
    ServerManager.OnLogReceived3D := nil;
    ServerManager.OnLogListenPort3D := nil;

    isClose := True;
    Close;
  end;

end;

end.
