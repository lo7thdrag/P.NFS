unit uLibPTKSetting;

interface

uses
  Graphics, Windows, SysUtils, IniFiles,uIniFilesProcs;

type
  TPTKSetting = record
    isFullScreen : Boolean;
    MonitorPos : Integer;
  end;
  TNetworkSetting = record
    ipConnect : string;
    portConnect : string;
  end;
  function getFileSetting: string;
  procedure SaveNetworkSetting;
  procedure LoadNetworkSetting;

  procedure SavePTKSetting;
  procedure LoadPTKSetting;
var
  PtkSetting : TPTKSetting;
  NetworkSetting : TNetworkSetting;
implementation

function getFileSetting: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'ptk.ini';
end;

procedure SaveNetworkSetting;
var  iniF: TIniFile;
begin
  IniF := TIniFile.Create(getFileSetting);

  with iniF, NetworkSetting do begin
    WriteString('NetworkSetting', 'ipConnect', '127.0.0.1');
    WriteString('NetworkSetting', 'portConnect',  '2001' );
  end;
  inif.Free;

end;

procedure LoadNetworkSetting;
var
  iniF: TIniFile;
  f : string ;
begin
  f := getFileSetting;
  iniF := TIniFile.Create(f);

  try
    with NetworkSetting do begin
      ipConnect := INIFReadString(iniF, 'NetworkSetting', 'ipConnect', '127.0.0.1');
      portConnect := INIFReadString(iniF, 'NetworkSetting', 'portConnect', '2001');
    end;
  finally
    iniF.Free;
  end;

end;

procedure SavePTKSetting;
var  iniF: TIniFile;
begin
  IniF := TIniFile.Create(getFileSetting);

  with iniF, PtkSetting do begin
    WriteBool('PtkSetting', 'isFullScreen', True);
    WriteInteger('PtkSetting', 'MonitorPos',  0 );
  end;
  inif.Free;

end;

procedure LoadPTKSetting;
var
  iniF: TIniFile;
  f : string ;
begin
  f := getFileSetting;
  iniF := TIniFile.Create(f);

  try
    with PtkSetting do begin
      isFullScreen := INIFReadBool(iniF, 'PtkSetting', 'isFullScreen', True);
      MonitorPos := INIFReadInteger(iniF, 'PtkSetting', 'MonitorPos', 0);
    end;
  finally
    iniF.Free;
  end;

end;

end.
