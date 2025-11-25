program RBUDigital;

uses
  Vcl.Forms,
  ufrmMainDisplay in 'ufrmMainDisplay.pas' {frmMainDisplay},
  ufrmPasswordEntryCode in 'forms\ufrmPasswordEntryCode.pas' {frmPasswordEntryCode},
  uBaseConst in 'Libs\LibBaseSystem\uBaseConst.pas',
  uLibConst in 'Libs\LibUtils\uLibConst.pas',
  uClassDatabase in '..\ShareLib\AppForms\uClassDatabase.pas',
  uDataModule in '..\ShareLib\AppForms\uDataModule.pas' {DataModule1: TDataModule},
  ufrmNetSetting in '..\ShareLib\AppForms\ufrmNetSetting.pas' {frmNetSetting},
  uBaseConstan in '..\ShareLib\LibBaseSystem\uBaseConstan.pas',
  uBaseDataType in '..\ShareLib\LibBaseSystem\uBaseDataType.pas',
  uBaseFunction in '..\ShareLib\LibBaseSystem\uBaseFunction.pas',
  uTCPClient in '..\ShareLib\LibNetworks\uTCPClient.pas',
  uTCPDatatype in '..\ShareLib\LibNetworks\uTCPDatatype.pas',
  uBridgeSet in '..\ShareLib\LibSetting\uBridgeSet.pas',
  uCodecBase64 in '..\ShareLib\LibSetting\uCodecBase64.pas',
  uFormUtil in '..\ShareLib\LibUtil\uFormUtil.pas',
  uSettingFormToMonitorWith_ini in '..\ShareLib\LibUtil\uSettingFormToMonitorWith_ini.pas',
  uLibRBU in 'Libs\uLibRBU.pas',
  uRBU_Manager in 'Libs\uRBU_Manager.pas',
  uIniFilesProcs in 'Libs\uIniFilesProcs.pas',
  ulibSettings in 'Libs\ulibSettings.pas',
  uScriptCommon in 'Libs\uScriptCommon.pas',
  uScriptRBUDigital in 'Libs\uScriptRBUDigital.pas',
  uSimulationManager in '..\ShareLib\LibBaseSystem\uSimulationManager.pas',
  MSThreadTimer in '..\ShareLib\LibBaseSystem\Timer\MSThreadTimer.pas',
  uVirtualTime in '..\ShareLib\LibBaseSystem\Timer\uVirtualTime.pas',
  uBaseSimulationObject in '..\ShareLib\LibBaseSystem\uBaseSimulationObject.pas',
  uMapXUnitConverter in 'Libs\LibMapX\uMapXUnitConverter.pas',
  uBaseFunctionRBUD in 'Libs\LibBaseSystem\uBaseFunctionRBUD.pas',
  uCoordConverter in 'Libs\LibBaseSystem\uCoordConverter.pas',
  uCoordDataTypes in 'Libs\LibBaseSystem\uCoordDataTypes.pas',
  uVehicleManager in 'Libs\uVehicleManager.pas',
  uTrackView in 'Libs\LibRBUObject\uTrackView.pas',
  uVehicle in 'Libs\LibRBUObject\uVehicle.pas',
  GdiPlus in 'Libs\libGDI\GdiPlus.pas',
  GdiPlusHelpers in 'Libs\libGDI\GdiPlusHelpers.pas',
  uObjectVisual in 'Libs\LibVisual\uObjectVisual.pas',
  uRadarDynamicSector in 'Libs\LibVisual\uRadarDynamicSector.pas',
  uRadarTargets in 'Libs\LibVisual\uRadarTargets.pas',
  uRadarVisual in 'Libs\LibVisual\uRadarVisual.pas',
  uSimVisuals in 'Libs\LibVisual\uSimVisuals.pas',
  uTestShip in '..\ShareLib\LibTest\uTestShip.pas',
  uMapXSim in '..\ShareLib\LibObject\uMapXSim.pas',
  uMover in '..\ShareLib\LibObject\uMover.pas',
  uObjectView in '..\ShareLib\LibObject\uObjectView.pas',
  uBaseGraphicProc in '..\ShareLib\libGrafik\uBaseGraphicProc.pas',
  uLibClientObject in '..\ShareLib\LibClientObject\uLibClientObject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainDisplay, frmMainDisplay);
  Application.CreateForm(TfrmPasswordEntryCode, frmPasswordEntryCode);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmNetSetting, frmNetSetting);
  frmPasswordEntryCode.Show;
  Application.Run;
end.
