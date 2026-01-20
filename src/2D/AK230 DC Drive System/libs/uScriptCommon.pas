unit uScriptCommon;

interface

  procedure BeginGameCommon;
  procedure EndGameCommon;


implementation

uses
   SysUtils, Controls, Forms, IniFiles, uIniFilesProcs, uCodecBase64,
   ulibSettings;


procedure BeginGameCommon;
var iResult: Integer;
    bResult : Boolean;
//    iniF : TIniFile;
//    readIn, readOut: string;
begin

//  {$IFDEF VER280}
  FormatSettings.DateSeparator     := '/';
  FormatSettings.TimeSeparator     := ':';
  FormatSettings.ShortDateFormat := 'd/m/yyyy';

  FormatSettings.DecimalSeparator  := '.';
  FormatSettings.ThousandSeparator := ',';

//  {$ELSE}
//  DateSeparator := '/';
//  FormatSettings.TimeSeparator     := ':';
//  ShortDateFormat := 'd/m/yyyy';
//
//  DecimalSeparator := '.';
//  ThousandSeparator := ',';
//  {$ENDIF}



  vSettingFile := getFileSetting;

//  try
//    iniF := TIniFile.Create(vSettingFile);
//    vDbServer.mDBServer := iniFReadString(iniF, iniSectDBConfig, iniValDBServer, defaultDBServer);
//    vDbServer.mDBProto := '';
//
//    readIn := Base64Encode(defaultDBName);
//    readOut := ForceReadString(ini, iniSectDBConfig, iniValDBName, readIn);
//    vDbServer.mDBName := Base64Decode(readOut);
//
//    readIn := Base64Encode(defaultDBUser);
//    readOut := ForceReadString(ini, iniSectDBConfig, iniValDBUser, readIn);
//    vDbServer.mDBUser := Base64Decode(readOut);
//
//    readIn := Base64Encode(defaultDBPassword);
//    readOut := ForceReadString(ini, iniSectDBConfig, iniValDBPass, readIn);
//    vDbServer.mDBPass := Base64Decode(readOut);
//
//    vDbServer.mDBPort := ForceReadString(ini, iniSectDBConfig, iniValDBport, defaultDBPort);
//
//
//  finally
//    iniF.Free;
//  end;
  if FileExists(vSettingFile) then
  begin
    LoadFF_PathImageSetting(vSettingFile, vPathImageSetting);

    InitDefault_DBConfig(vSettingFile, vDbServer.mDBServer, vDbServer.mDBProto, vDbServer.mDBName,
      vDbServer.mDBUser, vDbServer.mDBPass, vDbServer.mDBPort);

    InitDefault_GameServerConfig(vSettingFile, vBridgeServer.m2D_IP, vBridgeServer.m2D_Port,
      vBridgeServer.m3D_IP, vBridgeServer.m3D_Port);
  end
  else
  begin
    Save_PathImageSetting(vSettingFile, vPathImageSetting);
    LoadFF_PathImageSetting(vSettingFile, vPathImageSetting);

    SaveDefault_DBConfig(vSettingFile, vDbServer.mDBServer, vDbServer.mDBProto, vDbServer.mDBName,
      vDbServer.mDBUser, vDbServer.mDBPass, vDbServer.mDBPort);

    InitDefault_DBConfig(vSettingFile, vDbServer.mDBServer, vDbServer.mDBProto, vDbServer.mDBName,
      vDbServer.mDBUser, vDbServer.mDBPass, vDbServer.mDBPort);

    SaveDefault_GameServerConfig(vSettingFile, vBridgeServer.m2D_IP, vBridgeServer.m2D_Port,
      vBridgeServer.m3D_IP, vBridgeServer.m3D_Port);
  end;


end;

procedure EndGameCommon;
begin

end;

end.
