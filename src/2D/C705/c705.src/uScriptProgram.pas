unit uScriptProgram;

interface

  procedure BeginScriptProg;
  procedure EndScriptProg;

implementation

uses
  Windows, uWmiHwId, System.Win.Registry, System.SysUtils,
  Vcl.Dialogs, Vcl.Forms, uLibSettings;

const
  cKey = 'SOFTWARE\Microsoft\Mno';

procedure BeginScriptProg;
var
  HWID : THardwareId;
  iReg : TRegistry;
  strVal : string;
begin
  try
    HWID := THardwareId.Create(False);
    try
      HWID.GenerateHardwareId;
      iReg := TRegistry.Create(KEY_READ OR KEY_WOW64_64KEY);
      iReg.RootKey := HKEY_LOCAL_MACHINE;
      iReg.OpenKey(cKey, True);
      //if iReg.ValueExists('Mno') then
      if True then
      begin
        strVal := iReg.ReadString('Mno');
        //if strVal = HWID.HardwareIdBase64 then
        if True then
        begin
          LoadNFSNetwork;
        //  SetMonitor;

        end
        else
        begin
          ShowMessage('This Machine is not registered!');
          Application.Terminate;
        end;
      end
      else
      begin
        ShowMessage('This Machine is not registered!');
        Application.Terminate;
      end;
    finally
      HWID.Free;
    end;
  except
     on E:Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;

end;

procedure EndScriptProg;
begin
  //
end;

end.
