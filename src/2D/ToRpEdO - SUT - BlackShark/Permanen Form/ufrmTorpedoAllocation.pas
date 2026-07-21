unit ufrmTorpedoAllocation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, AdvPageControl,

  ufrmTorpedoParameterDepthSettings, uSutBlacksharkManager, uVehicleManager, ufrmTorpedoTubeCommands,
  uTorpedoLauncher;

type
  TfrmTorpedoAllocation = class(TForm)
    pnlMain: TPanel;
    AdvPageTorpedoAllocation: TAdvPageControl;
    AdvEngage: TAdvTabSheet;
    AdvRealloc: TAdvTabSheet;
    AdvTransfer: TAdvTabSheet;
    AdvTerminate: TAdvTabSheet;
    AdvfireRel: TAdvTabSheet;
    pnlEngage: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    lblToTarget: TLabel;
    pnlEngagementAnalysisStart: TPanel;
    Label2: TLabel;
    lblEngagementAnalysisStarted: TLabel;
    imgAllocation2: TImage;
    imgAllocation1: TImage;
    imgAllocation4: TImage;
    imgAllocation3: TImage;
    imgAllocation6: TImage;
    imgAllocation5: TImage;
    imgAllocation8: TImage;
    imgAllocation7: TImage;
    lbl1: TLabel;
    rbMSI01: TRadioButton;
    Label3: TLabel;
    rbSonar: TRadioButton;
    Label4: TLabel;
    rbMSI02: TRadioButton;
    Label5: TLabel;
    RadioButton4: TRadioButton;
    lblSonar05: TLabel;
    rbMSI03: TRadioButton;
    Label7: TLabel;
    lblAllocate: TLabel;
    Label8: TLabel;
    lvReallocation: TListView;
    Label9: TLabel;
    Label10: TLabel;
    lbltarget: TLabel;
    Label11: TLabel;
    lblNumberToTarget: TLabel;
    Label12: TLabel;
    cbReallocate: TComboBox;
    Label13: TLabel;
    rbReallocateMSI01: TRadioButton;
    rbReallocateSonar04: TRadioButton;
    Label14: TLabel;
    Label15: TLabel;
    rbReallocateMSI02: TRadioButton;
    rbReallocateSonar05: TRadioButton;
    Label16: TLabel;
    Label17: TLabel;
    rbReallocateMSI03: TRadioButton;
    Label18: TLabel;
    lblReallocate: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cbTorpInSalvo: TComboBox;
    Label21: TLabel;
    ComboBox1: TComboBox;
    chkReserveFunctions: TCheckBox;
    Label6: TLabel;
    lblReset: TLabel;
    lblClose: TLabel;
    lblRemoveTorpedo: TLabel;
    lblChangeTorpedo: TLabel;
    Label22: TLabel;
    lvTransfer: TListView;
    Label23: TLabel;
    Label24: TLabel;
    lblTargetTransfer: TLabel;
    Label25: TLabel;
    lblSalvoTransfer: TLabel;
    Label26: TLabel;
    rbTransferMSI01: TRadioButton;
    rbTransferSonar04: TRadioButton;
    Label27: TLabel;
    Label28: TLabel;
    rbTransferMSI02: TRadioButton;
    rbTransferSonar05: TRadioButton;
    Label29: TLabel;
    Label30: TLabel;
    rbTransferMSI03: TRadioButton;
    Label31: TLabel;
    lblTransferTorpedoSalvo: TLabel;
    Label32: TLabel;
    lvTermination: TListView;
    lblTerminateAllocation: TLabel;
    Label33: TLabel;
    lblTargetTerminate: TLabel;
    Label35: TLabel;
    cbTorpedoTerminate: TComboBox;
    lblSwitchRunToOff: TLabel;
    lblDeleteSalvoInfo: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Panel1: TPanel;
    imgFireRelease2: TImage;
    imgFireRelease1: TImage;
    imgFireRelease4: TImage;
    imgFireRelease3: TImage;
    imgFireRelease6: TImage;
    imgFireRelease5: TImage;
    imgFireRelease8: TImage;
    imgFireRelease7: TImage;
    Panel2: TPanel;
    lblReleaseAll: TLabel;
    lblAllocationStatus1: TLabel;
    lblAllocationStatus2: TLabel;
    lblAllocationStatus3: TLabel;
    lblAllocationStatus7: TLabel;
    lblAllocationStatus8: TLabel;
    lblAllocationStatus4: TLabel;
    lblAllocationStatus6: TLabel;
    lblAllocationStatus5: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    tmrImageAllocation: TTimer;
    procedure pnlEngagementAnalysisStartClick(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
    procedure tmrImageAllocationTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblAllocateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgAllocation1Click(Sender: TObject);
    procedure imgFireReleaseClick(Sender: TObject);
    procedure lblReleaseAllClick(Sender: TObject);
  private
    FFrmTorpedoParameterSettings : TfrmTorpedoParameterDepthSettings;
    FFrmTorpedoTubeCommands      : TfrmTorpedoTubeCommands;
  public
    FSelectTube : Integer;
    FSelectFireRelease : Integer;

    function IsReadyForEngagementAnalysis: Boolean;

    procedure UpdateAllocationStatus;
    procedure UpdateAllocations;
    procedure UpdateFireRelease;
  end;

var
  frmTorpedoAllocation: TfrmTorpedoAllocation;

implementation

uses
  ufrmTorpedoWP, ufrmTorpedoTubeStatusWindow, ufrmTacticalScreen;

{$R *.dfm}

function TfrmTorpedoAllocation.IsReadyForEngagementAnalysis: Boolean;
begin
  Result := False;

  if not Assigned(VehicleMgr) then
  begin
    SutBlacksharkManager.OperatorMessages := 'Input Track Control by Number';
    Exit;
  end;

  if not Assigned(VehicleMgr.TrackControlled) then
  begin
    SutBlacksharkManager.OperatorMessages := 'Select the Target First';
    Exit;
  end;

  Result := True;
end;

procedure TfrmTorpedoAllocation.FormCreate(Sender: TObject);
begin
  FSelectTube := -1;
  FSelectFireRelease := -1;
end;

procedure TfrmTorpedoAllocation.FormShow(Sender: TObject);
begin
  UpdateAllocationStatus;
end;

procedure TfrmTorpedoAllocation.imgAllocation1Click(Sender: TObject);
begin
  FSelectTube := TImage(Sender).Tag;

  if SutBlacksharkManager.FTorpedoArray[FSelectTube].Loaded then
  begin
    SutBlacksharkManager.OperatorMessages                  := '';
    frmTacticalScreen.pnlOperatorMessages.Color            := clBlack;
    frmTacticalScreen.pnlOperatorMessages.ParentBackground := False;
  end
  else
  begin
    SutBlacksharkManager.OperatorMessages                  := 'Select Loaded Torpedo in Instructor';
    frmTacticalScreen.pnlOperatorMessages.Color            := clRed;
    frmTacticalScreen.pnlOperatorMessages.ParentBackground := False;
    Exit;
  end;
end;

procedure TfrmTorpedoAllocation.imgFireReleaseClick(Sender: TObject);
begin
  FSelectFireRelease := TImage(Sender).Tag;

  if SutBlacksharkManager.FTorpedoArray[FSelectFireRelease].TextStatus = stTorpReady then
  begin
    SutBlacksharkManager.FTorpedoArray[FSelectFireRelease].FireRelease := True;

    SutBlacksharkManager.OperatorMessages                  := '';
    frmTacticalScreen.pnlOperatorMessages.Color            := clBlack;
    frmTacticalScreen.pnlOperatorMessages.ParentBackground := False;
  end
  else
  begin
    SutBlacksharkManager.OperatorMessages                  := 'Torpedo Not Ready';
    frmTacticalScreen.pnlOperatorMessages.Color            := clRed;
    frmTacticalScreen.pnlOperatorMessages.ParentBackground := False;
    Exit;
  end;
end;

procedure TfrmTorpedoAllocation.lblAllocateClick(Sender: TObject);
var
  shape  : TShape;
  aFrame : TTorpedoLauncher;
begin
  if FSelectTube <> -1 then
  begin
    SutBlacksharkManager.FTorpedoArray[FSelectTube].Allocated  := True;
    SutBlacksharkManager.FTorpedoArray[FSelectTube].TextStatus := stNone;
    SutBlacksharkManager.TorpedoTubeAllocNum := FSelectTube + 1;
    SutBlacksharkManager.FTorpedoArray[FSelectTube].SalvoNumber := SutBlacksharkManager.SalvoIndex;

    if Assigned(frmTorpedoTubeStatusWindow) then
    begin
      frmTorpedoTubeStatusWindow.UpdatePanelStatus;
      frmTorpedoTubeStatusWindow.UpdateFrameStatus;
    end;

    SutBlacksharkManager.OperatorMessages                  := '';
    frmTacticalScreen.pnlOperatorMessages.Color            := clBlack;
    frmTacticalScreen.pnlOperatorMessages.ParentBackground := False;
  end
  else
  begin
    SutBlacksharkManager.OperatorMessages                  := 'Select Torpedo First';
    frmTacticalScreen.pnlOperatorMessages.Color            := clRed;
    frmTacticalScreen.pnlOperatorMessages.ParentBackground := False;
    Exit;
  end;

  {$REGION 'Torpedo Tube Commands'}
  if not Assigned(FFrmTorpedoTubeCommands) then
  begin
    frmTorpedoWP.pnlTorpedoTubes.Caption := '';

    FFrmTorpedoTubeCommands        := TfrmTorpedoTubeCommands.Create(Self);
    FFrmTorpedoTubeCommands.Parent := frmTorpedoWP.pnlTorpedoTubes;
    FFrmTorpedoTubeCommands.Align  := alClient;
    FFrmTorpedoTubeCommands.Show;
  end;

  SutBlacksharkManager.TubeIndex := FSelectTube;

  if not SutBlacksharkManager.FTorpedoArray[FSelectTube].TorpedoOnOff then
  begin
    FFrmTorpedoTubeCommands.lblTorpOn.Caption    := 'TORPEDO ON';
    FFrmTorpedoTubeCommands.lblTorpOn.Font.Color := clWhite;

    FFrmTorpedoTubeCommands.lblSendCmd.Caption    := 'Send Cmd';
    FFrmTorpedoTubeCommands.lblSendCmd.Font.Color := clWhite;
  end
  else
  begin
    FFrmTorpedoTubeCommands.lblSendCmd.Caption    := 'Send Cmd';
    FFrmTorpedoTubeCommands.lblSendCmd.Font.Color := clWhite;
  end;
  {$ENDREGION}
end;

procedure TfrmTorpedoAllocation.lblCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTorpedoAllocation.lblReleaseAllClick(Sender: TObject);
var
  i       : Integer;
  Img     : TImage;
  ImgPath : string;
begin
  ImgPath := IncludeTrailingPathDelimiter(ExpandFileName(ExtractFilePath(Application.ExeName) + '..\')) + 'data\images\blackshark\FireStatus2.bmp';

  for i := 0 to 7 do
  begin
    SutBlacksharkManager.FTorpedoArray[i].FireRelease := True;

    case i of
      0: Img := imgFireRelease1;
      1: Img := imgFireRelease2;
      2: Img := imgFireRelease3;
      3: Img := imgFireRelease4;
      4: Img := imgFireRelease5;
      5: Img := imgFireRelease6;
      6: Img := imgFireRelease7;
      7: Img := imgFireRelease8;
    end;

    Img.Picture.LoadFromFile(ImgPath);
  end;
end;

procedure TfrmTorpedoAllocation.pnlEngagementAnalysisStartClick(Sender: TObject);
begin
  if not IsReadyForEngagementAnalysis then
    Exit;

  if not Assigned(TorpedoParam) then
  begin
    TorpedoParam := TTorpedoParameterSetting.Create;
    // ini harus dihandle biar di track dulu targetnya rojek
    TorpedoParam.TargetTrackID := VehicleMgr.TrackControlled.MSITrackNumber;
  end;

  if not Assigned(FFrmTorpedoParameterSettings) then
  begin
    frmTorpedoWP.pnlTorpedoParamSettings.Caption := '';

    FFrmTorpedoParameterSettings        := TfrmTorpedoParameterDepthSettings.Create(Self);
    FFrmTorpedoParameterSettings.Parent := frmTorpedoWP.pnlTorpedoParamSettings;
    FFrmTorpedoParameterSettings.Align  := alClient;
    FFrmTorpedoParameterSettings.Show;
  end;
end;

procedure TfrmTorpedoAllocation.tmrImageAllocationTimer(Sender: TObject);
begin
  UpdateAllocationStatus;
  UpdateAllocations;
  UpdateFireRelease;

  // Message Operator
  if Assigned(SutBlacksharkManager) then
    frmTacticalScreen.pnlOperatorMessages.Caption := SutBlacksharkManager.OperatorMessages
end;

procedure TfrmTorpedoAllocation.UpdateAllocationStatus;
var
  i       : Integer;
  Img     : TImage;
  ImgPath : string;
begin
  ImgPath := IncludeTrailingPathDelimiter(ExpandFileName(ExtractFilePath(Application.ExeName) + '..\')) + 'data\images\blackshark\AllocationStatus2.bmp';

  for i := 1 to 8 do
  begin
    case i of
      1: Img := imgAllocation1;
      2: Img := imgAllocation2;
      3: Img := imgAllocation3;
      4: Img := imgAllocation4;
      5: Img := imgAllocation5;
      6: Img := imgAllocation6;
      7: Img := imgAllocation7;
      8: Img := imgAllocation8;
    end;

    if SutBlacksharkManager.FTorpedoArray[i-1].Loaded then
    begin
      Img.Picture.LoadFromFile(ImgPath);

      case i of
        1: lblAllocationStatus1.Font.Color := clLime;
        2: lblAllocationStatus2.Font.Color := clLime;
        3: lblAllocationStatus3.Font.Color := clLime;
        4: lblAllocationStatus4.Font.Color := clLime;
        5: lblAllocationStatus5.Font.Color := clLime;
        6: lblAllocationStatus6.Font.Color := clLime;
        7: lblAllocationStatus7.Font.Color := clLime;
        8: lblAllocationStatus8.Font.Color := clLime;
      end;
    end
    else
    begin
      case i of
        1: lblAllocationStatus1.Font.Color := clWhite;
        2: lblAllocationStatus2.Font.Color := clWhite;
        3: lblAllocationStatus3.Font.Color := clWhite;
        4: lblAllocationStatus4.Font.Color := clWhite;
        5: lblAllocationStatus5.Font.Color := clWhite;
        6: lblAllocationStatus6.Font.Color := clWhite;
        7: lblAllocationStatus7.Font.Color := clWhite;
        8: lblAllocationStatus8.Font.Color := clWhite;
      end;
    end;
  end;
end;

procedure TfrmTorpedoAllocation.UpdateFireRelease;
var
  i       : Integer;
  Img     : TImage;
  ImgPath : string;
begin
  ImgPath := IncludeTrailingPathDelimiter(ExpandFileName(ExtractFilePath(Application.ExeName) + '..\')) + 'data\images\blackshark\FireStatus2.bmp';

  for i := 1 to 8 do
  begin
    case i of
      1: Img := imgFireRelease1;
      2: Img := imgFireRelease2;
      3: Img := imgFireRelease3;
      4: Img := imgFireRelease4;
      5: Img := imgFireRelease5;
      6: Img := imgFireRelease6;
      7: Img := imgFireRelease7;
      8: Img := imgFireRelease8;
    end;

    if SutBlacksharkManager.FTorpedoArray[i-1].FireRelease then
    begin
      Img.Picture.LoadFromFile(ImgPath);
    end;
  end;
end;

procedure TfrmTorpedoAllocation.UpdateAllocations;
begin
  if VehicleMgr.IsAnyTrackControlled then
  begin
    lblToTarget.Caption    := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
    lblToTarget.Font.Color := clLime;

    lblEngagementAnalysisStarted.Caption    := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
    lblEngagementAnalysisStarted.Font.Color := clLime;
  end
  else
  begin
    lblToTarget.Caption    := '000000';
    lblToTarget.Font.Color := clWhite;

    lblEngagementAnalysisStarted.Caption := '000000';
    lblToTarget.Font.Color := clWhite;
  end;

end;

end.
