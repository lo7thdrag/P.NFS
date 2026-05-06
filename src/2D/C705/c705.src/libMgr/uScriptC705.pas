unit uScriptC705;

interface

    procedure BeginC705;
    procedure EndC705;

var
    pCurrentScenID  : integer;
      pServer_Ip,
      pServer_Port,               //TriD_IP, TriD_Port,
      pDBServer,
      pDBProto,
      pDBName,
      pDBUser,
      pDBPass,
      pShipName,
      pClassName      : string;
      pShipID,
      pClassID        : Integer;

implementation

uses
  Windows, System.SysUtils,
  uC705SimManager, uLibSettings, uFormMgr, uVehicleManager,
    UfrmRoutePlan, uBridgeSet, uTCPDatatype;

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
  //LoadMonitorSetting;
  //LoadNFSNetwork;
  //LoadOwnShips;

  LoadMonitorTopLeft;
  LoadMapSetting;
  LoadImagePathDir;
  LoadIdentSetting;

  //LoadNFSDBConfig;

  InitDefault_AllConfigFromInstruktur(pServer_Ip,pServer_Port,
    pDBServer, pDBProto, pDBName, pDBUser, pDBPass, pShipID, pCurrentScenID);

  // Load Own Ship
  VOwnShip.ShipID := pShipID;
  VOwnShip.WeaponId := C_DBID_C705;

  VNfsNetwork.ServerIP   := pServer_Ip;
  VNfsNetwork.ServerPort := StrToIntDef(pServer_Port, 0);

          {
  if DataModule1.InitZDB(pDBServer, pDBProto, pDBName, pDBUser, pDBPass) then
  begin
    ShipClassID  := DataModule1.GetShipType(pShipID, ShipClassName);
    ShipName     := DataModule1.GetShipName(pShipID);


    AddToLog(TheClient.Log, ' ShipID      = ' + IntToStr(pShipID));
    AddToLog(TheClient.Log, ' ShipClassId = ' + IntToStr(ShipClassID) );
    AddToLog(TheClient.Log, ' ShipName ' + ShipName );
    AddToLog(TheClient.Log, ' ShipClassName ' + ShipClassName );
  end;
  }
  //Env_Map := DataModule1.GetMapById(pCurrentScenID);

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
