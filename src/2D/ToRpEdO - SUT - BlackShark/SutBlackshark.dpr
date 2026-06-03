program SutBlackshark;

uses
  Vcl.Forms,
  uLibConst in 'LibUtils\uLibConst.pas',
  uBaseConst in 'LibBaseSystem\uBaseConst.pas',
  GdiPlus in 'libGDI\GdiPlus.pas',
  GdiPlusHelpers in 'libGDI\GdiPlusHelpers.pas',
  uObjectVisual in 'LibVisual\uObjectVisual.pas',
  uSimVisuals in 'LibVisual\uSimVisuals.pas',
  uCoordConverter in 'LibBaseSystem\uCoordConverter.pas',
  uCoordDataTypes in 'LibBaseSystem\uCoordDataTypes.pas',
  uMapXUnitConverter in 'LibMapX\uMapXUnitConverter.pas',
  uSutBlacksharkManager in 'uSutBlacksharkManager.pas',
  uBridgeSet in '..\ShareLib\LibSetting\uBridgeSet.pas',
  uCodecBase64 in '..\ShareLib\LibSetting\uCodecBase64.pas',
  uSimulationManager in '..\ShareLib\LibBaseSystem\uSimulationManager.pas',
  MSThreadTimer in '..\ShareLib\LibBaseSystem\Timer\MSThreadTimer.pas',
  uVirtualTime in '..\ShareLib\LibBaseSystem\Timer\uVirtualTime.pas',
  uTCPClient in '..\ShareLib\LibNetworks\uTCPClient.pas',
  uTCPDatatype in '..\ShareLib\LibNetworks\uTCPDatatype.pas',
  uBaseDataType in '..\ShareLib\LibBaseSystem\uBaseDataType.pas',
  uBaseSimulationObject in '..\ShareLib\LibBaseSystem\uBaseSimulationObject.pas',
  uBaseConstan in '..\ShareLib\LibBaseSystem\uBaseConstan.pas',
  uTestShip in '..\ShareLib\LibTest\uTestShip.pas',
  uMapXSim in '..\ShareLib\LibObject\uMapXSim.pas',
  uMover in '..\ShareLib\LibObject\uMover.pas',
  uObjectView in '..\ShareLib\LibObject\uObjectView.pas',
  uBaseFunction in '..\ShareLib\LibBaseSystem\uBaseFunction.pas',
  uBaseGraphicProc in '..\ShareLib\libGrafik\uBaseGraphicProc.pas',
  uLibClientObject in '..\ShareLib\LibClientObject\uLibClientObject.pas',
  uRadarVisual in 'LibVisual\uRadarVisual.pas',
  uRadarDynamicSector in 'LibVisual\uRadarDynamicSector.pas',
  uRadarNorthIndicator in 'uRadarNorthIndicator.pas',
  uRadarTargets in 'LibVisual\uRadarTargets.pas',
  uScriptSutBlackshark in 'uScriptSutBlackshark.pas',
  uDataModule in '..\ShareLib\AppForms\uDataModule.pas' {DataModule1: TDataModule},
  uClassDatabase in '..\ShareLib\AppForms\uClassDatabase.pas',
  uVehicleManager in 'uVehicleManager.pas',
  Grijjy.BinaryCoding in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.BinaryCoding.pas',
  Grijjy.Bson.IO in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.Bson.IO.pas',
  Grijjy.Bson in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.Bson.pas',
  Grijjy.Bson.Serialization in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.Bson.Serialization.pas',
  Grijjy.Collections in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.Collections.pas',
  Grijjy.DateUtils in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.DateUtils.pas',
  Grijjy.SysUtils in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.SysUtils.pas',
  uIniFilesProcs in 'LibSutBlackshark\uIniFilesProcs.pas',
  ulibSettings in 'LibSutBlackshark\ulibSettings.pas',
  uScriptCommon in 'LibSutBlackshark\uScriptCommon.pas',
  uTrackView in 'LibSutBlacksharkObject\uTrackView.pas',
  uVehicle in 'LibSutBlacksharkObject\uVehicle.pas',
  uBaseFunctionSutBlackshark in 'LibBaseSystem\uBaseFunctionSutBlackshark.pas',
  ufrmTacticalScreen in 'ufrmTacticalScreen.pas' {FrmTacticalScreen},
  ufrmSupportScreen in 'ufrmSupportScreen.pas' {FrmSupportScreen},
  uSettingFormToMonitorWith_ini in '..\ShareLib\LibUtil\uSettingFormToMonitorWith_ini.pas',
  uFormUtil in '..\ShareLib\LibUtil\uFormUtil.pas',
  uBaseObject in 'LibSutBlacksharkObject\uBaseObject.pas',
  uPointTrack in 'LibSutBlacksharkObject\uPointTrack.pas',
  uNonVehicle in 'LibSutBlacksharkObject\uNonVehicle.pas',
  uTorpedoLauncher in 'LibSutBlacksharkObject\uTorpedoLauncher.pas',
  uTorpedo in 'LibSutBlacksharkObject\uTorpedo.pas';
  ufrmControlByNumber in 'ufrmControlByNumber.pas' {frmControlByNumber},
  ufrmTackHistory in 'ufrmTackHistory.pas' {frmTrackHistory},
  ufrmCreateModifyTrack in 'ufrmCreateModifyTrack.pas' {frmCreateModifyTrack},
  ufrmTrackFilter in 'ufrmTrackFilter.pas' {frmTrackFilter};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmControlByNumber, frmControlByNumber);
  Application.CreateForm(TfrmTrackHistory, frmTrackHistory);
  Application.CreateForm(TfrmCreateModifyTrack, frmCreateModifyTrack);
  Application.CreateForm(TfrmTrackFilter, frmTrackFilter);
  //    Application.CreateForm(TfrmMainSutBlackshark, frmMainSutBlackshark);
  Application.CreateForm(TFrmTacticalScreen, FrmTacticalScreen);
  Application.CreateForm(TFrmSupportScreen, FrmSupportScreen);
//  Application.CreateForm(TFrmTacticalScreen, FrmTacticalScreen);

  Application.Run;
end.
