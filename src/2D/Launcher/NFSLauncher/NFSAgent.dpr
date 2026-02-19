program NFSAgent;

uses
  Forms,
  uClient3D in 'client\uClient3D.pas' {frmMain},
  uQuery in 'client\uQuery.pas',
  uXMLScen in 'client\uXMLScen.pas',
  uDataModule in '..\..\ShareLib\AppForms\uDataModule.pas' {DataModule1: TDataModule},
  uTCPClient in '..\..\ShareLib\LibNetworks\uTCPClient.pas',
  uTCPDatatype in '..\..\ShareLib\LibNetworks\uTCPDatatype.pas',
  DosCommand in 'component\DosCommand.pas',
  uBridgeSet in '..\..\ShareLib\LibSetting\uBridgeSet.pas',
  uCodecBase64 in '..\..\ShareLib\LibSetting\uCodecBase64.pas',
  uBaseDataType in '..\..\ShareLib\LibBaseSystem\uBaseDataType.pas',
  uClassDatabase in '..\..\ShareLib\AppForms\uClassDatabase.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.Title := 'NFS Agent';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
