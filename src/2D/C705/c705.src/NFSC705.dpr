program NFSC705;

uses
  Vcl.Forms,
  UfrmRoutePlan in 'libDisplayUI\UfrmRoutePlan.pas' {frmRoutePlan},
  UfrmWCC in 'libDisplayUI\UfrmWCC.pas' {frmWCC},
  uLibSettings in 'uLibSettings.pas',
  uCodecBase64 in '..\didFramework\LibBaseUtils\StringUtils\uCodecBase64.pas',
  uStringFunc in '..\didFramework\LibBaseUtils\StringUtils\uStringFunc.pas',
  uIniFilesProcs in '..\didFramework\LibBaseUtils\uIniFilesProcs.pas',
  uWmiHwId in '..\didFramework\LibBaseUtils\uWmiHwId.pas',
  uScriptProgram in 'uScriptProgram.pas',
  uLibConst in 'LibUtils\uLibConst.pas',
  uMapXUnitConverter in 'LibMapX\uMapXUnitConverter.pas',
  uBaseConst in 'LibBaseSystem\uBaseConst.pas',
  uBaseFunction in 'LibBaseSystem\uBaseFunction.pas',
  uCoordConverter in 'LibBaseSystem\uCoordConverter.pas',
  uFormMgr in 'libMgr\uFormMgr.pas',
  UfrmFoeFriendSituationPage in 'libDisplayUI\UfrmFoeFriendSituationPage.pas' {frmFoeFriendSituationPage},
  uFrmMissileInformation in 'libDisplayUI\FrmTab\uFrmMissileInformation.pas' {frmMissileInformation},
  uFrmKeyboardCalcLaunch in 'libDisplayUI\uFrmKeyboardCalcLaunch.pas' {frmKeyboardCalcLaunch},
  uFrmFireDistribution in 'libDisplayUI\FrmTab\uFrmFireDistribution.pas' {frmFireDistribution},
  uFrmMissileMonitor in 'libDisplayUI\FrmTab\uFrmMissileMonitor.pas' {frmMissileMonitor},
  uFrmLaunchData in 'libDisplayUI\FrmTab\uFrmLaunchData.pas' {frmLaunchData},
  uFrmChannelSelect in 'libDisplayUI\FrmTab\uFrmChannelSelect.pas' {frmChannelSelect},
  uScriptC705 in 'libMgr\uScriptC705.pas',
  uTCPClient in '..\..\ShareLib\LibNetworks\uTCPClient.pas',
  uTCPDatatype in '..\..\ShareLib\LibNetworks\uTCPDatatype.pas',
  uC705SimManager in 'libMgr\uC705SimManager.pas',
  uBaseDataType in '..\..\ShareLib\LibBaseSystem\uBaseDataType.pas',
  uFrmINSTest in 'libDisplayUI\FrmTab\uFrmINSTest.pas' {frmINSTest},
  uShipModel in 'LibMapX\uShipModel.pas',
  uRadarSensor in 'LibMapX\uRadarSensor.pas',
  UfrmRadar in 'libDisplayUI\FrmTab\UfrmRadar.pas' {frmRadar},
  uFrmParamSetting in 'libDisplayUI\FrmTab\uFrmParamSetting.pas' {frmParamSetting},
  uBridgeSet in '..\..\ShareLib\LibSetting\uBridgeSet.pas',
  uBaseSimObjects in '..\didFramework\LibSims\uBaseSimObjects.pas',
  uSimObjects in '..\didFramework\LibSims\uSimObjects.pas',
  uCoordDataTypes in 'LibBaseSystem\uCoordDataTypes.pas',
  uVehicleManager in 'libMgr\uVehicleManager.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TfrmRoutePlan, frmRoutePlan);
  Application.CreateForm(TfrmFoeFriendSituationPage, frmFoeFriendSituationPage);
  Application.CreateForm(TfrmKeyboardCalcLaunch, frmKeyboardCalcLaunch);
  Application.CreateForm(TfrmWCC, frmWCC);
  //Application.CreateForm(TfrmPnlArea3AFoeFriend, frmPnlArea3AFoeFriend);
  //Application.CreateForm(TfrmParamSetting, frmParamSetting);
  //Application.CreateForm(TfrmRadar, frmRadar);
  //Application.CreateForm(TfrmParamSetting, frmParamSetting);
  //Application.CreateForm(TfrmINSTest, frmINSTest);
  //Application.CreateForm(TfrmMissileMonitor, frmMissileMonitor);
  //Application.CreateForm(TfrmLaunchData, frmLaunchData);
  //Application.CreateForm(TfrmChannelSelect, frmChannelSelect);
  //Application.CreateForm(TfrmFireDistribution, frmFireDistribution);
  //Application.CreateForm(TfrmMissileInformation, frmMissileInformation);

  uScriptC705.BeginC705;
  Application.Run;
end.
