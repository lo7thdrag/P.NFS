unit uScriptC705;

interface

  procedure BeginC705;
  procedure EndC705;

implementation

uses
  Windows, uC705SimManager, uLibSettings, uFormMgr, uVehicleManager;

/// some sub function to keep the main procedure simple;


//main procedure of c705------------------------------------------------------->>

procedure BeginC705;
begin
  LoadMonitorSetting;
  LoadNFSNetwork;
  LoadMonitorTopLeft;

  //LoadNFSDBConfig;

  InitForms;

  { Create SimManager }
  SimManager := GameSimManager.Create;    //create platform & create thread
  VehicleMgr := TVehicleManager.Create
end;

procedure EndC705;
begin
  SimManager.Free;
  VehicleMgr.Free;
end;

end.
