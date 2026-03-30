unit uLibSettings;

interface

uses
  uCodecBase64, Vcl.Graphics;

const
  C_DB_HOST     = '192.168.1.124';
  C_DB_PORT     = '3306';
  C_DB_PROTO    = 'mysql';
  C_DB_NAME     = 'dbNSuFs';
  C_DB_USER     = 'root';
  C_DB_PASS     = 'admin';
  C_SVR_IP      = '127.0.0.1';
  C_MAP_PATH    = '.\data\mapsea\Indonesia.gst';
  C_MAP_BGCOLOR = $687760; // clGray;
  C_MAP_ZOOM    = 128;
  C_MAP_LONG    = 112.722778;
  C_MAP_LATT    = -7.198333;

  C_IMG_PATH    = '.\data\img';

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
    MoniRoutePlan: Integer;
    MoniWCC: Integer;
    MoniKeyboard: Integer;
    MonitorWidth: Integer;
    MonitorHeight: Integer;
  end;

  TMonitorTopLeft = record
    MonTop_Left : Integer;
    MonTop_Top : Integer;
    MonMiddle_Left : Integer;
    MonMiddle_Top : Integer;
    MonMini_Left : Integer;
    MonMini_Top : Integer;
  end;

  TMapSetting = record
    MapGeosetDay: string;
    MapGeosetNight: string;
    MapZoom: integer;
    mX, mY: double;
    MapColor : TColor;
  end;

  TShipSetting = record
    ShipID: Integer;
    WeaponId: Integer;
  end;

  TImagePathDir = record
    imgPath: string;
  end;

  TIdentSetting = record
    ModeConsole: Boolean;
    ModeDebug: Boolean;
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
  procedure LoadMapSetting;
  procedure LoadMonitorSetting;
  procedure LoadMonitorTopLeft;
  procedure LoadOwnShips;
  procedure LoadImagePathDir;
  procedure LoadIdentSetting;

var
  VNfsNetwork : TNFSNetwork;
  VNfsDBConfig : TNfsDBConfig;
  VMapSetting : TMapSetting;
  VMonitorSetting : TMonitorSetting;
  VMonitorTopLeft : TMonitorTopLeft;
  VOwnShip : TShipSetting;
  VImgPath: TImagePathDir;
  VIdentSetting: TIdentSetting;

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

procedure LoadMapSetting;
var
  inif : TIniFile;
begin
  inif := TIniFile.Create(getFileSetting);
  try
    with VMapSetting do
    begin
      MapGeosetDay    := INIFReadString(inif, 'Map','geosetDay',C_MAP_PATH);
      MapGeosetNight  := INIFReadString(inif, 'Map', 'geosetNight', C_MAP_PATH);
      mX              := INIFReadFloat(inif, 'Map','long',C_MAP_LONG);
      mY              := INIFReadFloat(inif, 'Map','latt',C_MAP_LATT);
      MapColor        := C_MAP_BGCOLOR;          //RGB(160, 224, 255);
      MapZoom         := INIFReadInteger(inif, 'Map','zoom', C_MAP_ZOOM);
    end;
  finally
    inif.Free;
  end;
end;

procedure LoadMonitorSetting;
var
  iniF: TIniFile;
begin
  iniF := TIniFile.Create(getFileSetting);

  try
    with VMonitorSetting do begin
      MoniRoutePlan := INIFReadInteger(iniF, 'SetMonitor', 'MoniRoutePlan', 1);
      MoniWCC := INIFReadInteger(iniF, 'SetMonitor', 'MoniWCC', 0);
      MoniKeyboard := INIFReadInteger(iniF, 'SetMonitor', 'MoniKeyboard', 20);
      //MonitorHeight := INIFReadInteger(iniF, 'SetMonitor', 'MonHeight', 0);
      //MonitorWidth := INIFReadInteger(iniF, 'SetMonitor', 'MonWidth', 0);
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
      MonMiddle_Left := INIFReadInteger(iniF, 'TopLeft', 'MonMiddle_Left', 0);
      MonMiddle_Top := INIFReadInteger(iniF, 'TopLeft', 'MonMiddle_Top', 0);
      MonMini_Left := INIFReadInteger(iniF, 'TopLeft', 'MonMini_Left', 0);
      MonMini_Top := INIFReadInteger(iniF, 'TopLeft', 'MonMini_Top', 0);
    end;
  finally
    iniF.Free;
  end;
end;

procedure LoadOwnShips;
var
  iniF: TIniFile;
begin
  iniF := TIniFile.Create(getFileSetting);

  try
    with VOwnShip do
    begin
      ShipID := INIFReadInteger(iniF, 'SHIPS', 'SHIPID', 0);
      WeaponId := INIFReadInteger(iniF, 'SHIPS', 'WEAPONID', 0);
    end;
  finally
    iniF.Free;
  end;
end;

procedure LoadImagePathDir;
var
  iniF: TIniFile;
begin
  iniF := TIniFile.Create(getFileSetting);

  try
    with VImgPath do
    begin
      imgPath := INIFReadString(inif, 'image','imgPath', C_IMG_PATH);;
    end;
  finally
    iniF.Free;
  end;
end;

procedure LoadIdentSetting;
var
  iniF: TIniFile;
begin
  iniF := TIniFile.Create(getFileSetting);

  try
    with VIdentSetting do
    begin
      ModeConsole := INIFReadBool(iniF, 'ident', 'ModeC', True);
      ModeDebug := INIFReadBool(iniF, 'ident', 'ModeDebug', False);
    end;
  finally
    iniF.Free;
  end;
end;

end.
