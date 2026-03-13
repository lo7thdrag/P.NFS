program SystemServer;

uses
  Vcl.Forms,
  System.Classes,
  uFrmMain in 'uFrmMain.pas' {frmMain},
  uTCPServer in '..\ShareLib\LibNetworks\uTCPServer.pas',
  uTCPDatatype in '..\ShareLib\LibNetworks\uTCPDatatype.pas',
  uBaseDataType in '..\ShareLib\LibBaseSystem\uBaseDataType.pas',
  uBridgeSet in '..\ShareLib\LibSetting\uBridgeSet.pas',
  uNetLinkServer in '..\ShareLib\LibNetsJSON\NetLinkComp\uNetLinkServer.pas',
  uCodecBase64 in '..\ShareLib\LibSetting\uCodecBase64.pas',
  uBuffer in '..\ShareLib\LibNetsJSON\NetLinkComp\uBuffer.pas',
  uDataManager in '..\ShareLib\LibNetsJSON\NetLinkComp\uDataManager.pas',
  uDataType in '..\ShareLib\LibNetsJSON\NetLinkComp\uDataType.pas',
  uHelper in '..\ShareLib\LibNetsJSON\NetLinkComp\uHelper.pas',
  UPacketProtocol in '..\ShareLib\LibNetsJSON\NetLinkComp\UPacketProtocol.pas',
  uThreadSafeQueue in '..\ShareLib\LibNetsJSON\NetLinkComp\uThreadSafeQueue.pas',
  Grijjy.BinaryCoding in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.BinaryCoding.pas',
  Grijjy.Bson.IO in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.Bson.IO.pas',
  Grijjy.Bson in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.Bson.pas',
  Grijjy.Bson.Serialization in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.Bson.Serialization.pas',
  Grijjy.Collections in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.Collections.pas',
  Grijjy.DateUtils in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.DateUtils.pas',
  Grijjy.SysUtils in '..\ShareLib\LibNetsJSON\Grijjy\Grijjy.SysUtils.pas',
  uData3DConverter in 'Data\uData3DConverter.pas',
  uServerManager in 'uServerManager.pas',
  uStateManager in 'uStateManager.pas',
  uStateObject in 'uStateObject.pas',
  Logger in '..\ShareLib\LibObject\Logger.pas',
  uClassDatabase in '..\ShareLib\AppForms\uClassDatabase.pas',
  uDataModule in 'uDataModule.pas' {dmMain: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown:= True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
