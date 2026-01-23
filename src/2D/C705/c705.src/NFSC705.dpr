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
  UfrmFoeFriendSituationPage in 'libDisplayUI\UfrmFoeFriendSituationPage.pas' {frmFoeFriendSituationPage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  uLibSettings.LoadMonitorSetting;
  uLibSettings.LoadNFSNetwork;
  uLibSettings.LoadMonitorTopLeft;

  //uLibSettings.LoadNFSDBConfig;

  Application.CreateForm(TfrmRoutePlan, frmRoutePlan);
  Application.CreateForm(TfrmFoeFriendSituationPage, frmFoeFriendSituationPage);
  //  frmRoutePlan.SetMonitor(VMonitorSetting.MonitorKiri,
//                              VMonitorTopLeft.MonTop_Left, VMonitorTopLeft.MonTop_Top);

  Application.CreateForm(TfrmWCC, frmWCC);
//  frmWCC.SetMonitor(VMonitorSetting.MonitorKanan,
//                              VMonitorTopLeft.MonBot_Left, VMonitorTopLeft.MonBot_Top);

  uFormMgr.InitForms;

  Application.Run;
end.
