unit ufrmTorpedoParameterDepthSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  AdvPageControl, Vcl.ComCtrls, uDataParameterSetting, uSutBlacksharkManager, uVehicleManager, uBaseFunction, ufrmSystemInfo;

type
  TfrmTorpedoParameterDepthSettings = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    lblNumberTarget: TLabel;
    Label2: TLabel;
    lblNumberSalvo: TLabel;
    Label3: TLabel;
    lblNoTorpedoes: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblOfficialGuidance: TLabel;
    lblOfficialSearchSpeed: TLabel;
    Label12: TLabel;
    cbTrialGuidance: TComboBox;
    edtOfficialLOSDeviation: TEdit;
    edtTrialLOSDeviation: TEdit;
    cbTrialSearchSpeed: TComboBox;
    AdvPageTorpedoParameterDepth: TAdvPageControl;
    AdvDepth: TAdvTabSheet;
    AdvApproach: TAdvTabSheet;
    AdvSA: TAdvTabSheet;
    AdvIntGuidance: TAdvTabSheet;
    AdvToSo: TAdvTabSheet;
    AdvSafety: TAdvTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    lblOfficalCeiling: TLabel;
    lblOfficialAttackDepth: TLabel;
    lblOfficialSearchDepth: TLabel;
    lblOfficialAppoarchDepth: TLabel;
    lblOfficialFloor: TLabel;
    edtTrialCeiling: TEdit;
    edtTrialAttackDepth: TEdit;
    edtTrialSearchDepth: TEdit;
    edtTrialAppoarchDepth: TEdit;
    edtTrialFloor: TEdit;
    chkTrialCeiling: TCheckBox;
    chkTrialFloor: TCheckBox;
    lblApply: TLabel;
    lblApplySetOfficial: TLabel;
    lblReset: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    lblOfficialEnableDis: TLabel;
    edtTrialEnablingDist: TEdit;
    lblOfficialApproachSpeed: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    lblOfficialApproachCourse: TLabel;
    cbTrialApproachSpeed: TComboBox;
    chkTrialApproachCourse: TCheckBox;
    Label28: TLabel;
    Label29: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    lblOfficialCenterOS: TLabel;
    lblOfficialSALength: TLabel;
    lblSAWidth: TLabel;
    lblOfficialCenterSSP: TLabel;
    lblOfficialSearchConfidence: TLabel;
    Label48: TLabel;
    chkTrialCenterOS: TCheckBox;
    edtTrialCenterSSP: TEdit;
    Label49: TLabel;
    lblOfficialSAUpdating: TLabel;
    cbTrialSAUpdating: TComboBox;
    lblTrialSearchConfidence: TLabel;
    Label40: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    lblOfficialSearchPattern: TLabel;
    cbTrialSearchPattern: TComboBox;
    lblOfficialDPCAngle: TLabel;
    edtTrialDPCAngle: TEdit;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    lblOfficialToSoMode: TLabel;
    lblOfficialToSoRangePAS: TLabel;
    Label57: TLabel;
    cbTrialToSoMOde: TComboBox;
    edtTrialToSoRangePAS: TEdit;
    Label58: TLabel;
    Label59: TLabel;
    lblOfficialToSoRangeACT: TLabel;
    edtTrialToSoRangeACT: TEdit;
    Label55: TLabel;
    Label56: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    lblOfficialASH: TLabel;
    lblOfficialProtectionRadius: TLabel;
    cbTrialASH: TComboBox;
    edtTrialProtectionRadius: TEdit;
    chkProtectionRadius: TCheckBox;
    edtTrialSAWidth: TEdit;
    edtTrialCenterOS: TEdit;
    edtTrialSALength: TEdit;
    edtTrialApproachCourse: TEdit;
    procedure lblResetClick(Sender: TObject);
    procedure lblApplySetOfficialClick(Sender: TObject);
    procedure lblApplyClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
//   RecDataParameter : TRecParameterSettings;

   procedure ResetControl(AControl: TControl);
  end;

var
  frmTorpedoParameterDepthSettings: TfrmTorpedoParameterDepthSettings;

implementation

{$R *.dfm}

procedure TfrmTorpedoParameterDepthSettings.ResetControl(AControl: TControl);
var
  i,j : Integer;
  Tab : TAdvTabSheet;
begin // reset perubahan dan ganti trial ke official
  {$REGION 'AdvDepth'}
  if AControl is TEdit then
  begin
    edtTrialCeiling.Text       := IntToStr(TorpedoParam.Ceiling);
    edtTrialAttackDepth.Text   := IntToStr(TorpedoParam.AttackDepth);
    edtTrialSearchDepth.Text   := IntToStr(TorpedoParam.SearchDepth);
    edtTrialAppoarchDepth.Text := IntToStr(TorpedoParam.ApproachDepth);
    edtTrialFloor.Text         := IntToStr(TorpedoParam.Floor);
  end
  else if AControl is TCheckBox then
  begin
    chkTrialCeiling.Checked := True;
    chkTrialFloor.Checked   := True;
  end;
  {$ENDREGION}

  {$REGION 'AdvApproach'}
  if AControl is TEdit then
  begin
    edtTrialEnablingDist.Text := FormatFloat('0.0',TorpedoParam.EnablingDist);
    edtTrialApproachCourse.Text := IntToStr(Round(TorpedoParam.ApproachCourse));
  end
  else if AControl is TComboBox then
    cbTrialApproachSpeed.ItemIndex := TorpedoParam.ApproachSpeed - 9
  else if AControl is TCheckBox then
    chkTrialApproachCourse.Checked := false;
  {$ENDREGION}

  {$REGION 'AdvSA'}
  if AControl is TLabel then
  begin
    lblTrialSearchConfidence.Caption    := '0';
  end
  else if AControl is TEdit then
  begin
    edtTrialCenterSSP.Text           := FormatFloat('0.0',TorpedoParam.CenterSSP);
    edtTrialCenterOS.Text            := FormatFloat('0.0',TorpedoParam.CenterOS);
    edtTrialSALength.text            := FormatFloat('0.0',TorpedoParam.SALength);
    edtTrialSAWidth.Text             := FormatFloat('0.0',TorpedoParam.SAWidth);
  end
  else if AControl is TComboBox then
    cbTrialSAUpdating.ItemIndex := TorpedoParam.SAUpdating
  else if AControl is TCheckBox then
    chkTrialCenterOS.Checked := False;
  {$ENDREGION}

  {$REGION 'AdvIntGuidance'}
  if AControl is TEdit then
    edtTrialDPCAngle.Text := FormatFloat('0.0',TorpedoParam.DPCAngle)
  else if AControl is TComboBox then
    cbTrialSearchPattern.ItemIndex := Integer(TorpedoParam.SearchPattern);
  {$ENDREGION}

  {$REGION 'AdvToSo'}
  if AControl is TEdit then
  begin
    edtTrialToSoRangePAS.Text := IntToStr(TorpedoParam.TosoRangePAS);
    edtTrialToSoRangeACT.Text := IntToStr(TorpedoParam.TosoRangeACT);
  end
  else if AControl is TComboBox then
    cbTrialToSoMOde.ItemIndex := TorpedoParam.TosoMode;
  {$ENDREGION}

  {$REGION 'AdvSafety'}
  if AControl is TEdit then
    edtTrialProtectionRadius.Text := IntToStr(TorpedoParam.ProtectionRadius)
  else if AControl is TComboBox then
    cbTrialASH.ItemIndex := TorpedoParam.ASH
  else if AControl is TCheckBox then
    chkProtectionRadius.Checked := False;
  {$ENDREGION}

  if AControl is TWinControl then
    for i := 0 to TWinControl(AControl).ControlCount -1 do
      ResetControl(TWinControl(AControl).Controls[i]);
end;

procedure TfrmTorpedoParameterDepthSettings.FormShow(Sender: TObject);
var
  bearing, azimuth : Double;
begin
  // ambil semua variable dari torpedoparam
  {$REGION 'Upper'}
  lblNumberTarget.Caption        := '';
  lblNumberTarget.Caption        := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
  cbTrialGuidance.ItemIndex      := TorpedoParam.Guidance;
  lblOfficialGuidance.Caption    := cbTrialGuidance.Text;
  edtTrialLOSDeviation.Text      := IntToStr(TorpedoParam.LOSDeviation);
  edtOfficialLOSDeviation.Text   := edtTrialLOSDeviation.Text;
  cbTrialSearchSpeed.ItemIndex   := TorpedoParam.SearchSpeed - 9;
  lblOfficialSearchSpeed.Caption := cbTrialSearchSpeed.Text;
  {$ENDREGION}

  {$REGION 'AdvDepth'}
  edtTrialCeiling.Text              := IntToStr(TorpedoParam.Ceiling);
  lblOfficalCeiling.Caption         := edtTrialCeiling.Text;
  edtTrialAttackDepth.Text          := IntToStr(TorpedoParam.AttackDepth);
  lblOfficialAttackDepth.Caption    := edtTrialAttackDepth.Text;
  edtTrialSearchDepth.Text          := IntToStr(TorpedoParam.SearchDepth);
  lblOfficialSearchDepth.Caption    := edtTrialSearchDepth.Text;
  edtTrialAppoarchDepth.Text        := IntToStr(TorpedoParam.ApproachDepth);
  lblOfficialAppoarchDepth.Caption  := edtTrialAppoarchDepth.Text;
  edtTrialFloor.Text                := IntToStr(TorpedoParam.Floor);
  lblOfficialFloor.Caption          := edtTrialFloor.Text;
  {$ENDREGION}

  {$REGION 'AdvApproach'}
  edtTrialEnablingDist.Text         := Formatfloat('0.0',TorpedoParam.EnablingDist);
  lblOfficialEnableDis.Caption      := edtTrialEnablingDist.Text;
  cbTrialApproachSpeed.ItemIndex    := TorpedoParam.ApproachSpeed - 9;
  lblOfficialApproachSpeed.Caption  := cbTrialApproachSpeed.Text;
  // approach course automatically set
  azimuth := CalcBearing(SutBlacksharkManager.xShip.PositionX, SutBlacksharkManager.xShip.PositionY,
    VehicleMgr.TrackControlled.PosX, VehicleMgr.TrackControlled.PosY);
  bearing := azimuth - SutBlacksharkManager.xShip.Heading;
  if bearing < 0 then
  bearing := bearing + 360;
  TorpedoParam.ApproachCourse       := bearing;
  edtTrialApproachCourse.Text       := IntToStr(Round(TorpedoParam.ApproachCourse));
  lblOfficialApproachCourse.Caption := edtTrialApproachCourse.Text;
  {$ENDREGION}

  {$REGION 'AdvSA'}
  cbTrialSAUpdating.ItemIndex         := TorpedoParam.SAUpdating;
  lblOfficialSAUpdating.Caption       := cbTrialSAUpdating.Text;
  edtTrialCenterOS.text               := Formatfloat('0.0',TorpedoParam.CenterOS);
  lblOfficialCenterOS.Caption         := edtTrialCenterOS.Text;
  edtTrialSALength.Text               := Formatfloat('0.0',TorpedoParam.SALength);
  lblOfficialSALength.Caption         := edtTrialSALength.Text;
  edtTrialSAWidth.Text                := Formatfloat('0.0', TorpedoParam.SAWidth);
  lblSAWidth.Caption                  := edtTrialSAWidth.Text;
  edtTrialCenterSSP.Text              := Formatfloat('0.0', TorpedoParam.CenterSSP);
  lblOfficialCenterSSP.Caption        := edtTrialCenterSSP.Text;
  {$ENDREGION}

  {$REGION 'AdvIntGuidance'}
  cbTrialSearchPattern.ItemIndex    := Integer(TorpedoParam.SearchPattern);
  lblOfficialSearchPattern.Caption  := cbTrialSearchPattern.Text;
  edtTrialDPCAngle.Text             := Formatfloat('0.0', TorpedoParam.DPCAngle);
  lblOfficialDPCAngle.Caption       := edtTrialDPCAngle.Text;
  {$ENDREGION}

  {$REGION 'AdvToSo'}
  cbTrialToSoMode.ItemIndex       := TorpedoParam.TosoMode;
  lblOfficialToSoMode.Caption     := cbTrialToSoMode.Text;
  edtTrialToSoRangePAS.Text       := IntToStr(TorpedoParam.TosoRangePAS);
  lblOfficialToSoRangePAS.Caption := edtTrialToSoRangePAS.Text;
  edtTrialToSoRangeACT.Text       := IntToStr(TorpedoParam.TosoRangeACT);
  lblOfficialToSoRangeACT.Caption := edtTrialToSoRangeACT.Text;
  {$ENDREGION}

  {$REGION 'AdvSafety'}
  edtTrialProtectionRadius.Text       := IntToStr(TorpedoParam.ProtectionRadius);
  lblOfficialProtectionRadius.Caption := edtTrialProtectionRadius.Text;
  cbTrialASH.ItemIndex                := TorpedoParam.ASH;
  lblOfficialASH.Caption              := cbTrialASH.Text;
  {$ENDREGION}

  if Assigned(VehicleMgr.TrackControlled) then
  begin
    lblNumberTarget.Caption := IntToStr(VehicleMgr.TrackControlled.MSITrackNumber);
    lblNumberTarget.Font.Color := clLime;
  end;
end;

procedure TfrmTorpedoParameterDepthSettings.lblApplyClick(Sender: TObject);
begin
  {$REGION 'AdvDepth'}
//  RecDataParameter.Ceiling       := StrToIntDef(edtTrialCeiling.Text, 0);
//  RecDataParameter.AttackDepth   := StrToIntDef(edtTrialAttackDepth.Text, 0);
//  RecDataParameter.SearchDepth   := StrToIntDef(edtTrialSearchDepth.Text, 0);
//  RecDataParameter.ApproachDepth := StrToIntDef(edtTrialAppoarchDepth.Text, 0);
//  RecDataParameter.Floor         := StrToIntDef(edtTrialFloor.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvApproach'}
//  RecDataParameter.EnableDistance := StrToIntDef(edtTrialEnablingDist.Text, 0);
//  RecDataParameter.ApproachSpeed  := cbTrialApproachSpeed.ItemIndex;
//  RecDataParameter.ApproachCourse := StrToIntDef(lblTrialApproachCourse.Caption, 0);
  {$ENDREGION}

  {$REGION 'AdvSA'}
//  RecDataParameter.SAUpdating        := cbTrialSAUpdating.ItemIndex;
//  RecDataParameter.CenterOS          := StrToIntDef(lblTrialCenterOS.Caption, 0);
//  RecDataParameter.SALength          := StrToIntDef(lblTrialSALength.Caption, 0);
//  RecDataParameter.SAWidth           := StrToIntDef(lblTrialSAWidth.Caption, 0);
//  RecDataParameter.CenterSSP         := StrToIntDef(edtTrialCenterSSP.Text, 0);
//  RecDataParameter.SearchConfidence  := StrToIntDef(lblTrialSearchConfidence.Caption, 0);
  {$ENDREGION}

  {$REGION 'AdvIntGuidance'}
//  RecDataParameter.SearchPattern := cbTrialSearchPattern.ItemIndex;
//  RecDataParameter.DPCAngle      := StrToIntDef(edtTrialDPCAngle.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvToSo'}
//  RecDataParameter.ToSoMode     := cbTrialToSoMode.ItemIndex;
//  RecDataParameter.ToSoRangePAS := StrToIntDef(edtTrialToSoRangePAS.Text, 0);
//  RecDataParameter.ToSoRangeACT := StrToIntDef(edtTrialToSoRangeACT.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvSafety'}
//  RecDataParameter.ProtectionRadius := StrToIntDef(edtTrialProtectionRadius.Text, 0);
//  RecDataParameter.ASH              := cbTrialASH.ItemIndex;
  {$ENDREGION}
end;

procedure TfrmTorpedoParameterDepthSettings.lblApplySetOfficialClick(Sender: TObject);
var
  bearing, azimuth : Double;
begin
  {$REGION 'Upper'}
  TorpedoParam.Guidance          := cbTrialGuidance.ItemIndex;
  lblOfficialGuidance.Caption    := cbTrialGuidance.Text;
  TorpedoParam.LOSDeviation      := StrToInt(edtTrialLOSDeviation.Text);
  edtOfficialLOSDeviation.Text   := edtTrialLOSDeviation.Text;
  TorpedoParam.SearchSpeed       := cbTrialSearchSpeed.ItemIndex + 9;
  lblOfficialSearchSpeed.Caption := cbTrialSearchSpeed.Text;
  {$ENDREGION}

  {$REGION 'AdvDepth'}
  TorpedoParam.Ceiling              := StrToInt(edtTrialCeiling.Text);
  lblOfficalCeiling.Caption         := edtTrialCeiling.Text;
  TorpedoParam.AttackDepth          := StrToInt(edtTrialAttackDepth.Text);
  lblOfficialAttackDepth.Caption    := edtTrialAttackDepth.Text;
  TorpedoParam.SearchDepth          := StrToInt(edtTrialSearchDepth.Text);
  lblOfficialSearchDepth.Caption    := edtTrialSearchDepth.Text;
  TorpedoParam.ApproachDepth        := StrToInt(edtTrialAppoarchDepth.Text);
  lblOfficialAppoarchDepth.Caption  := edtTrialAppoarchDepth.Text;
  TorpedoParam.Floor                := StrToInt(edtTrialFloor.Text);
  lblOfficialFloor.Caption          := edtTrialFloor.Text;
  {$ENDREGION}

  {$REGION 'AdvApproach'}
  TorpedoParam.EnablingDist         := StrToFloat(edtTrialEnablingDist.Text);
  lblOfficialEnableDis.Caption      := edtTrialEnablingDist.Text;
  TorpedoParam.ApproachSpeed        := cbTrialApproachSpeed.ItemIndex + 9;
  lblOfficialApproachSpeed.Caption  := cbTrialApproachSpeed.Text;
  // approach course automatically set
  azimuth := CalcBearing(SutBlacksharkManager.xShip.PositionX, SutBlacksharkManager.xShip.PositionY,
    VehicleMgr.TrackControlled.PosX, VehicleMgr.TrackControlled.PosY);
  bearing := azimuth - SutBlacksharkManager.xShip.Heading;
  if bearing < 0 then
  bearing := bearing + 360;
  TorpedoParam.ApproachCourse       := bearing;
  lblOfficialApproachCourse.Caption := IntToStr(Round(TorpedoParam.ApproachCourse));
  {$ENDREGION}

  {$REGION 'AdvSA'}
  TorpedoParam.SAUpdating             := cbTrialSAUpdating.ItemIndex;
  lblOfficialSAUpdating.Caption       := cbTrialSAUpdating.Text;
  TorpedoParam.CenterOS               := StrToFloat(edtTrialCenterOS.text);
  lblOfficialCenterOS.Caption         := edtTrialCenterOS.Text;
  TorpedoParam.SALength               := StrToFloat(edtTrialSALength.Text);
  lblOfficialSALength.Caption         := edtTrialSALength.Text;
  TorpedoParam.SAWidth                := StrToFloat(edtTrialSAWidth.Text);
  lblSAWidth.Caption                  := edtTrialSAWidth.Text;
  TorpedoParam.CenterSSP              := StrToFloat(edtTrialCenterSSP.Text);
  lblOfficialCenterSSP.Caption        := edtTrialCenterSSP.Text;
  {$ENDREGION}

  {$REGION 'AdvIntGuidance'}
  TorpedoParam.SearchPattern        := TSearchPattern(cbTrialSearchPattern.ItemIndex);
  lblOfficialSearchPattern.Caption  := cbTrialSearchPattern.Text;
  TorpedoParam.DPCAngle             := StrToFloat(edtTrialDPCAngle.Text);
  lblOfficialDPCAngle.Caption       := edtTrialDPCAngle.Text;
  {$ENDREGION}

  {$REGION 'AdvToSo'}
  TorpedoParam.TosoMode           := cbTrialToSoMode.ItemIndex;
  lblOfficialToSoMode.Caption     := cbTrialToSoMode.Text;
  TorpedoParam.TosoRangePAS       := StrToInt(edtTrialToSoRangePAS.Text);
  lblOfficialToSoRangePAS.Caption := edtTrialToSoRangePAS.Text;
  TorpedoParam.TosoRangeACT       := StrToInt(edtTrialToSoRangeACT.Text);
  lblOfficialToSoRangeACT.Caption := edtTrialToSoRangeACT.Text;
  {$ENDREGION}

  {$REGION 'AdvSafety'}
  TorpedoParam.ProtectionRadius       := StrToInt(edtTrialProtectionRadius.Text);
  lblOfficialProtectionRadius.Caption := edtTrialProtectionRadius.Text;
  TorpedoParam.ASH                    := cbTrialASH.ItemIndex;
  lblOfficialASH.Caption              := cbTrialASH.Text;
  {$ENDREGION}

  if TorpedoParam.SalvoNum = 0 then
  begin
//    SutBlacksharkManager.SalvoIndex := SutBlacksharkManager.SalvoIndex + 1;
    TorpedoParam.SalvoNum           := SutBlacksharkManager.SalvoIndex;
    lblNumberSalvo.Caption          := IntToStr(TorpedoParam.SalvoNum);
    lblNumberSalvo.Font.Color       := clLime;
  end;

  if TorpedoParam.TorpedoNum = 0 then
  begin
//    SutBlacksharkManager.TorpedoIndex := SutBlacksharkManager.TorpedoIndex + 1;
//    TorpedoParam.TorpedoNum           := SutBlacksharkManager.TorpedoIndex;
    lblNoTorpedoes.Caption            := IntToStr(TorpedoParam.TorpedoNum);
    lblNoTorpedoes.Font.Color         := clLime;
  end;

  if Assigned(frmSystemInfo) and frmSystemInfo.Visible then
    frmSystemInfo.UpdateEngagementList;

  lblNoTorpedoes.Caption    := '1';
  lblNoTorpedoes.Font.Color := clLime;
end;

procedure TfrmTorpedoParameterDepthSettings.lblResetClick(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to AdvPageTorpedoParameterDepth.PageCount - 1 do
    ResetControl(AdvPageTorpedoParameterDepth.Pages[i]);
end;

end.
