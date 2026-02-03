unit uLibSettings;

interface

uses
  uCodecBase64;

const
  C_DB_HOST     = '192.168.1.124';
  C_DB_PORT     = '3306';
  C_DB_PROTO    = 'mysql';
  C_DB_NAME     = 'tcms';
  C_DB_USER     = 'root';
  C_DB_PASS     = 'tcms';
  C_SVR_IP      = '192.168.1.124';
  C_MAP_PATH    = '.\tcms_map\tcms_world.gst';

type
  TNFSNetwork = record
    GamePort : Integer;
    BCAddress : string;
    SessionID : Integer;
    CubicleID : integer;
    ServerIP: string;
    Serverport: Integer;
    Server3D: string;
    Server3DPort: Integer;
  end;

  TNfsDBConfig = record
    DBSERVER:string;
    DBPROTO:string;
    DBNAME:string;
    DBUSER:string;
    DBPASS:string;
    DBPORT:string;
  end;

  TMonitorSetting = record
    MonitorKiri: Integer;
    MonitorKanan: Integer;
    MonitorMini: Integer;
    MonitorWidth: Integer;
    MonitorHeight: Integer;
  end;

  TMonitorTopLeft = record
    MonTop_Left : Integer;
    MonTop_Top : Integer;
    MonBot_Left : Integer;
    MonBot_Top : Integer;
    MonMiddle_Left : Integer;
    MonMiddle_Top : Integer;
    MonMini_Left : Integer;
    MonMini_Top : Integer;
  end;

//  TTcmsNetwork = record
//    GamePort : Integer;
//    BCAddress : string;
//    SessionID : Integer;
//    CubicleID : integer;
//  end;

  function getFileSetting: string;
  procedure LoadNFSNetwork;
  procedure LoadNFSDBConfig;
  procedure LoadMonitorSetting;
  procedure LoadMonitorTopLeft;

var
  VNfsNetwork : TNFSNetwork;
  VNfsDBConfig : TNfsDBConfig;
  VMonitorSetting : TMonitorSetting;
  VMonitorTopLeft : TMonitorTopLeft;

implementation

uses
  IniFiles, SysUtils, uIniFilesProcs;

function getFileSetting: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'SettingsC705.ini';
end;

procedure LoadNFSNetwork;
var
  iniF: TIniFile;
begin
  iniF := TIniFile.Create(getFileSetting);

  try
    with VNfsNetwork do begin
      SessionID     := INIFReadInteger(iniF, 'Network', 'SessionID', 1111);
      GamePort      := INIFReadInteger(iniF, 'Network', 'GamePort', 9876);
      BCAddress     := INIFReadString(iniF, 'Network', 'BroadCastAddress', '192.168.1.255');
      CubicleID     := INIFReadInteger(inif, 'Network', 'CubicleID', 1);

      ServerIP        := INIFReadString(iniF, 'Network', 'Server', '192.168.0.231');
      Serverport    := INIFReadInteger(inif, 'Network', 'Serverport', 2120);
      Server3D      := INIFReadString(iniF, 'Network', '3DServer', '192.168.0.231');;
      Server3DPort  := INIFReadInteger(inif, 'Network', '3DServerPort', 7001);
    end;

  finally
    iniF.Free;
  end;
end;

procedure LoadNFSDBconfig;
var
  iniF: TIniFile;
  readIn, readOut : string;
begin
  iniF := TIniFile.Create(getFileSetting);

  try
    with VNfsDBConfig do begin
      DBSERVER  := INIFReadString(iniF, 'DBCONFIG', 'DBSERVER', '127.0.0.1');
      DBPROTO   := INIFReadString(iniF, 'DBCONFIG', 'DBPROTO', C_DB_PROTO);
      DBNAME    := INIFReadString(iniF, 'DBCONFIG', 'DBNAME', C_DB_NAME);

      readIn    := Base64Encode(C_DB_USER);
      readOut   := IniFReadstring(inif, 'DBCONFIG', 'dbuser', readIn);
      DBUSER    := Base64Decode(readOut);

      readIn    := Base64Encode(C_DB_PASS);
      readOut   := IniFReadstring(inif, 'DBCONFIG', 'dbpass', readIn);
      DBPASS    := Base64Decode(readOut);

      DBPORT    := INIFReadString(iniF, 'DBCONFIG', 'DBPORT', C_DB_PORT);
    end;
  finally
    iniF.Free;
  end;

end;

procedure LoadMonitorSetting;
var
  iniF: TIniFile;
begin
  iniF := TIniFile.Create(getFileSetting);

  try
    with VMonitorSetting do begin
      MonitorKiri := INIFReadInteger(iniF, 'SetMonitor', 'MonitorAtas', 0);
      MonitorKanan := INIFReadInteger(iniF, 'SetMonitor', 'MonitorBawah', 0);
      MonitorMini := INIFReadInteger(iniF, 'SetMonitor', 'MonitorMini', 0);
      MonitorHeight := INIFReadInteger(iniF, 'SetMonitor', 'MonHeight', 0);
      MonitorWidth := INIFReadInteger(iniF, 'SetMonitor', 'MonWidth', 0);
    end;
  finally
    iniF.Free;
  end;
end;

procedure LoadMonitorTopLeft;
var
  iniF: TIniFile;
begin
  iniF := TIniFile.Create(getFileSetting);

  try
    with VMonitorTopLeft do
    begin
      MonTop_Left := INIFReadInteger(iniF, 'TopLeft', 'MonTop_Left', 0);
      MonTop_Top := INIFReadInteger(iniF, 'TopLeft', 'MonTop_Top', 0);
      MonBot_Left := INIFReadInteger(iniF, 'TopLeft', 'MonBot_Left', 0);
      MonBot_Top := INIFReadInteger(iniF, 'TopLeft', 'MonBot_Top', 0);
      MonMini_Left := INIFReadInteger(iniF, 'TopLeft', 'MonMini_Left', 0);
      MonMini_Top := INIFReadInteger(iniF, 'TopLeft', 'MonMini_Top', 0);
    end;
  finally
    iniF.Free;
  end;
end;

end.
