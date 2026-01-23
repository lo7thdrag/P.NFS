unit uLibInstrukturSetting;

interface

type

  TRecInstMapSet  = record
    geoset, geosetMini1 , geosetMini2  : string;
    xCenter, yCenter, zoom: double;
    xOffset, yOffset: double;
    useOffset: boolean;
  end;

  TRecInstMonitorSet  = record
    MapDisplay, ContollerDisplay : Integer;
  end;

  TRecInstProjectSet  = record
    World : string;
  end;

  procedure InitConfig_InstrMap(var aMapSet : TRecInstMapSet);
  procedure SaveConfig_InstrMap(const aMapSet : TRecInstMapSet);

  procedure InitConfig_InstrMonitor(var aMonitorSet : TRecInstMonitorSet);
  procedure SaveConfig_InstrMonitor(const aMonitorSet : TRecInstMonitorSet);

  procedure InitConfig_InstrProject(var aProjectSet : TRecInstProjectSet);
  procedure SaveConfig_InstrProject(const aProjectSet : TRecInstProjectSet);


implementation

uses
  SysUtils, IniFiles, uLibSettings;

const
  CInstr_SettingFile = 'Instruktur.ini';

  // default data
  MAPPATH = '..\Data\mapsea\';
  C_GEOSET   = MAPPATH +'INDONESIA.GST';

  // ini const
  iniSect_Map       = 'map';
  iniVal_geo        = 'geoset';
  iniVal_geoMini1   = 'geosetminimap1';
  iniVal_geoMini2   = 'geosetminimap2';
  iniVal_MapX   = 'centerx';
  iniVal_MapY   = 'centery';
  iniVal_MapZ   = 'zoom';

  iniVal_MapOffX   = 'offsetx';
  iniVal_MapOffY   = 'offsety';
  iniVal_MapOff    = 'useoffset';
  iniVal_Mode      = 'mode';

  iniSect_Monitor       = 'monitor';
  iniVal_MapDisplay       = 'MapDisplay';
  iniVal_ContollerDisplay = 'ContollerDisplay';

  iniSect_Project       = 'project';
  iniVal_world       = 'World';

//------------------------------------------------------------------------------
function instrPrepareInif: string;
var fPath : string;
begin
  fpath := GetEmulatorSettingDirectory;

  if not DirectoryExists(fPath) then
    ForceDirectories(fpath);

  result := fPath + CInstr_SettingFile;
end;

procedure InitConfig_InstrMap(var aMapSet : TRecInstMapSet);
var ini: TIniFile;
    iniF: string;
begin
  iniF := instrPrepareInif;

  ini := TIniFile.Create(iniF);
  with aMapSet do begin
    geoset  := ForceReadString(ini, iniSect_Map, iniVal_geo,  C_GEOSET   );
    geosetMini1  := ForceReadString(ini, iniSect_Map, iniVal_geoMini1,  C_GEOSET   );
    geosetMini2  := ForceReadString(ini, iniSect_Map, iniVal_geoMini2,  C_GEOSET   );

    xCenter := ForceReadFloat(ini, iniSect_Map, iniVal_MapX, 112.739524);
    yCenter := ForceReadFloat(ini, iniSect_Map, iniVal_MapY, -7.19549);
    zoom    := ForceReadFloat(ini, iniSect_Map, iniVal_MapZ, 20.0);

    xOffset  :=  ForceReadFloat(ini, iniSect_Map, iniVal_MapOffX, 112.739524);
    yOffset  :=  ForceReadFloat(ini, iniSect_Map, iniVal_MapOffY, -7.19549);

    useOffset:=  ForceReadBool(ini, iniSect_Map, iniVal_MapOff, false);
  end;
  ini.Free;
end;

procedure SaveConfig_InstrMap(const aMapSet : TRecInstMapSet);
var ini: TIniFile;
    iniF: string;
begin
  iniF := instrPrepareInif;
  ini := TIniFile.Create(iniF);
  with aMapSet, Ini do begin
    WriteString(iniSect_Map,  iniVal_geo,  geoset );

    WriteFloat(iniSect_Map, iniVal_MapX  , xCenter );
    WriteFloat(iniSect_Map, iniVal_MapY  , yCenter  );
    WriteFloat(iniSect_Map, iniVal_MapZ  , zoom  );

    WriteFloat(iniSect_Map, iniVal_MapOffX  , xOffset );
    WriteFloat(iniSect_Map, iniVal_MapOffY  , yOffset );
    WriteBool(iniSect_Map, iniVal_MapOff  , useOffset );
  end;

  ini.Free;
end;

procedure InitConfig_InstrMonitor(var aMonitorSet : TRecInstMonitorSet);
var
  ini: TIniFile;
  iniF: string;
begin
  iniF := instrPrepareInif;
  ini := TIniFile.Create(iniF);

  with aMonitorSet do
  begin
    MapDisplay  := ForceReadInt(ini, iniSect_Monitor, iniVal_MapDisplay, 0);
    ContollerDisplay  := ForceReadInt(ini, iniSect_Monitor, iniVal_ContollerDisplay, 0);
  end;
  ini.Free;
end;

procedure SaveConfig_InstrMonitor(const aMonitorSet : TRecInstMonitorSet);
var ini: TIniFile;
    iniF: string;
begin
  iniF := instrPrepareInif;
  ini := TIniFile.Create(iniF);

  with aMonitorSet, Ini do
  begin
    WriteInteger(iniSect_Monitor,  iniVal_MapDisplay,  MapDisplay );
    WriteInteger(iniSect_Monitor,  iniVal_ContollerDisplay,  ContollerDisplay );
  end;

  ini.Free;
end;

procedure InitConfig_InstrProject(var aProjectSet : TRecInstProjectSet);
var ini: TIniFile;
    iniF: string;
begin
  iniF := instrPrepareInif;
  ini := TIniFile.Create(iniF);

  with aProjectSet do
  begin
    World  := ForceReadString(ini, iniSect_Project, iniVal_world, 'NASF');
  end;
  ini.Free;
end;

procedure SaveConfig_InstrProject(const aProjectSet : TRecInstProjectSet);
var ini: TIniFile;
    iniF: string;
begin
  iniF := instrPrepareInif;
  ini := TIniFile.Create(iniF);

  with aProjectSet, Ini do
  begin
    WriteString(iniSect_Project,  iniVal_world,  World );
  end;

  ini.Free;
end;


end.
