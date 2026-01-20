program DCDS;

uses
  Vcl.Forms,
  uFrmDCDSMain in 'uFrmDCDSMain.pas' {frmDCDSMain},
  uClassDatabase in '..\ShareLib\AppForms\uClassDatabase.pas',
  uDataModule in '..\ShareLib\AppForms\uDataModule.pas' {DataModule1: TDataModule},
  ufrmNetSetting in '..\ShareLib\AppForms\ufrmNetSetting.pas' {frmNetSetting},
  uMapTools in '..\ShareLib\AppForms\uMapTools.pas' {frmMapTools},
  uMapWindow in '..\ShareLib\AppForms\uMapWindow.pas' {frmMapWindow},
  vmSDK26 in '..\ShareLib\libADLAS\vmSDK26.pas',
  MSThreadTimer in '..\ShareLib\LibBaseSystem\Timer\MSThreadTimer.pas',
  uQScheduler2 in '..\ShareLib\LibBaseSystem\Timer\uQScheduler2.pas',
  uVirtualTime in '..\ShareLib\LibBaseSystem\Timer\uVirtualTime.pas',
  uBaseConstan in '..\ShareLib\LibBaseSystem\uBaseConstan.pas',
  uBaseDataType in '..\ShareLib\LibBaseSystem\uBaseDataType.pas',
  uBaseFunction in '..\ShareLib\LibBaseSystem\uBaseFunction.pas',
  uBaseSimulationObject in '..\ShareLib\LibBaseSystem\uBaseSimulationObject.pas',
  uMapXFunction in '..\ShareLib\LibBaseSystem\uMapXFunction.pas',
  uSimulationManager in '..\ShareLib\LibBaseSystem\uSimulationManager.pas',
  uStringFunction in '..\ShareLib\LibBaseSystem\uStringFunction.pas',
  uLibClientObject in '..\ShareLib\LibClientObject\uLibClientObject.pas',
  uAScopeDisplay in '..\ShareLib\libDisplay\uAScopeDisplay.pas',
  uBScopeBaseDisplay in '..\ShareLib\libDisplay\uBScopeBaseDisplay.pas',
  uCompassDisplay in '..\ShareLib\libDisplay\uCompassDisplay.pas',
  uLabelDisplay in '..\ShareLib\libDisplay\uLabelDisplay.pas',
  uBaseGraphicObjects in '..\ShareLib\libGrafik\uBaseGraphicObjects.pas',
  uBaseGraphicProc in '..\ShareLib\libGrafik\uBaseGraphicProc.pas',
  uGraphics in '..\ShareLib\libGrafik\uGraphics.pas',
  uTCPClient in '..\ShareLib\LibNetworks\uTCPClient.pas',
  uTCPDatatype in '..\ShareLib\LibNetworks\uTCPDatatype.pas',
  uTCPServer in '..\ShareLib\LibNetworks\uTCPServer.pas',
  uDataTypes in '..\ShareLib\LibObject\uDataTypes.pas',
  uMapXSim in '..\ShareLib\LibObject\uMapXSim.pas',
  uMover in '..\ShareLib\LibObject\uMover.pas',
  uObjectView in '..\ShareLib\LibObject\uObjectView.pas',
  uRadarTracks in '..\ShareLib\LibObject\uRadarTracks.pas',
  uStringFunc in '..\ShareLib\LibObject\uStringFunc.pas',
  uTorpedoTrack in '..\ShareLib\LibObject\uTorpedoTrack.pas',
  uTorpedoView in '..\ShareLib\LibObject\uTorpedoView.pas',
  uBaseSensor in '..\ShareLib\LibSensor\uBaseSensor.pas',
  uBaseSensorView in '..\ShareLib\LibSensor\uBaseSensorView.pas',
  uDetected in '..\ShareLib\LibSensor\uDetected.pas',
  uLibRadar in '..\ShareLib\LibSensor\uLibRadar.pas',
  uLibRadarComp in '..\ShareLib\LibSensor\uLibRadarComp.pas',
  uLibRadarView in '..\ShareLib\LibSensor\uLibRadarView.pas',
  uLibTDCTracks in '..\ShareLib\LibSensor\uLibTDCTracks.pas',
  uTrackFunction in '..\ShareLib\LibSensor\uTrackFunction.pas',
  uBridgeSet in '..\ShareLib\LibSetting\uBridgeSet.pas',
  uCodecBase64 in '..\ShareLib\LibSetting\uCodecBase64.pas',
  uLibTDC_Object in '..\ShareLib\LibTDC_WCC\uLibTDC_Object.pas',
  uLibTDCClass in '..\ShareLib\LibTDC_WCC\uLibTDCClass.pas',
  uLibTDCDisplay in '..\ShareLib\LibTDC_WCC\uLibTDCDisplay.pas',
  uTDCConstan in '..\ShareLib\LibTDC_WCC\uTDCConstan.pas',
  uTestShip in '..\ShareLib\LibTest\uTestShip.pas',
  uFormUtil in '..\ShareLib\LibUtil\uFormUtil.pas',
  uSettingFormToMonitorWith_ini in '..\ShareLib\LibUtil\uSettingFormToMonitorWith_ini.pas',
  ufLog in 'AppForms\ufLog.pas' {frmLog},
  uIniFilesProcs in 'libs\uIniFilesProcs.pas',
  ulibSettings in 'libs\ulibSettings.pas',
  uScriptCommon in 'libs\uScriptCommon.pas',
  uAK230Manager in 'libs\uAK230Manager.pas',
  uScriptSimAK230 in 'libs\uScriptSimAK230.pas',
  uLibAK230 in 'libs\uLibAK230.pas',
  uLibAK230Class in 'libs\uLibAK230Class.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDCDSMain, frmDCDSMain);
  Application.CreateForm(TDataModule1, DataModule1);
  
  Application.Run;
end.
