unit uScriptC705;

interface

  procedure BeginC705;
  procedure EndC705;

implementation

uses
  Windows, uC705SimManager, uLibSettings, uFormMgr, uVehicleManager,
    UfrmRoutePlan;

/// some sub function to keep the main procedure simple;

{ ****
    Visual flow LoadMap, Load Geoset
BeginScript
     ->
SimManager.OnMapInit := frmRoutePlan.InitMapMainForm
     ->
SimManager.InitializeMap
     ->
event dipanggil
     ->
frmRoutePlan.InitMapMainForm
     ->
LoadGeoset di frmRoutePlan
**** }


//main procedure of c705------------------------------------------------------->>

procedure BeginC705;
begin
  LoadMonitorSetting;
  LoadNFSNetwork;
  LoadMonitorTopLeft;
  LoadMapSetting;
  LoadOwnShips;
  LoadImagePathDir;

  LoadIdentSetting;

  //LoadNFSDBConfig;

  { Create SimManager }
  SimManager := GameSimManager.Create;    //create platform & create thread

  VehicleMgr := TVehicleManager.Create;

  if Assigned(frmRoutePlan) then
    SimManager.OnMapInit := frmRoutePlan.InitMapMainForm;
  SimManager.InitializeMap;

  frmRoutePlan.strPath := VImgPath.imgPath + '\icon\Route Plan - Tool Bar\';
  frmRoutePlan.SetImgBtn;

  InitForms;
end;

procedure EndC705;
begin
  SimManager.Free;
  VehicleMgr.Free;
end;

end.
