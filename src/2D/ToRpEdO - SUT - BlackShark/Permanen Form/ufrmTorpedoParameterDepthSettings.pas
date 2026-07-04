unit ufrmTorpedoParameterDepthSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  AdvPageControl, Vcl.ComCtrls, uDataParameterSetting;

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
    lblTrialApproachCourse: TLabel;
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
    lblTrialCenterOS: TLabel;
    lblTrialSALength: TLabel;
    lblTrialSAWidth: TLabel;
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
    procedure lblResetClick(Sender: TObject);
    procedure lblApplySetOfficialClick(Sender: TObject);
    procedure lblApplyClick(Sender: TObject);
  private
    { Private declarations }
  public
   RecDataParameter : TRecParameterSettings;

   procedure ResetControl(AControl: TControl);
  end;

var
  frmTorpedoParameterDepthSettings: TfrmTorpedoParameterDepthSettings;

implementation

{$R *.dfm}

procedure TfrmTorpedoParameterDepthSettings.ResetControl(AControl: TControl);
var
  I: Integer;
begin
  if AControl is TEdit then
    TEdit(AControl).Text := '0'

  else if AControl is TComboBox then
    TComboBox(AControl).ItemIndex := -1

  else if AControl is TCheckBox then
    TCheckBox(AControl).Checked := False

  else if AControl is TLabel then
    TLabel(AControl).Caption := '0';

  if AControl is TWinControl then
    for I := 0 to TWinControl(AControl).ControlCount - 1 do
      ResetControl(TWinControl(AControl).Controls[I]);
end;

procedure TfrmTorpedoParameterDepthSettings.lblApplyClick(Sender: TObject);
begin
  {$REGION 'AdvDepth'}
  RecDataParameter.Ceiling       := StrToIntDef(edtTrialCeiling.Text, 0);
  RecDataParameter.AttackDepth   := StrToIntDef(edtTrialAttackDepth.Text, 0);
  RecDataParameter.SearchDepth   := StrToIntDef(edtTrialSearchDepth.Text, 0);
  RecDataParameter.ApproachDepth := StrToIntDef(edtTrialAppoarchDepth.Text, 0);
  RecDataParameter.Floor         := StrToIntDef(edtTrialFloor.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvApproach'}
  RecDataParameter.EnableDistance := StrToIntDef(edtTrialEnablingDist.Text, 0);
  RecDataParameter.ApproachSpeed  := cbTrialApproachSpeed.ItemIndex;
  RecDataParameter.ApproachCourse := StrToIntDef(lblTrialApproachCourse.Caption, 0);
  {$ENDREGION}

  {$REGION 'AdvSA'}
  RecDataParameter.SAUpdating        := cbTrialSAUpdating.ItemIndex;
  RecDataParameter.CenterOS          := StrToIntDef(lblTrialCenterOS.Caption, 0);
  RecDataParameter.SALength          := StrToIntDef(lblTrialSALength.Caption, 0);
  RecDataParameter.SAWidth           := StrToIntDef(lblTrialSAWidth.Caption, 0);
  RecDataParameter.CenterSSP         := StrToIntDef(edtTrialCenterSSP.Text, 0);
  RecDataParameter.SearchConfidence  := StrToIntDef(lblTrialSearchConfidence.Caption, 0);
  {$ENDREGION}

  {$REGION 'AdvIntGuidance'}
  RecDataParameter.SearchPattern := cbTrialSearchPattern.ItemIndex;
  RecDataParameter.DPCAngle      := StrToIntDef(edtTrialDPCAngle.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvToSo'}
  RecDataParameter.ToSoMode     := cbTrialToSoMode.ItemIndex;
  RecDataParameter.ToSoRangePAS := StrToIntDef(edtTrialToSoRangePAS.Text, 0);
  RecDataParameter.ToSoRangeACT := StrToIntDef(edtTrialToSoRangeACT.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvSafety'}
  RecDataParameter.ProtectionRadius := StrToIntDef(edtTrialProtectionRadius.Text, 0);
  RecDataParameter.ASH              := cbTrialASH.ItemIndex;
  {$ENDREGION}
end;

procedure TfrmTorpedoParameterDepthSettings.lblApplySetOfficialClick(Sender: TObject);
begin
  {$REGION 'AdvDepth'}
  lblOfficalCeiling.Caption        := edtTrialCeiling.Text;
  lblOfficialAttackDepth.Caption   := edtTrialAttackDepth.Text;
  lblOfficialSearchDepth.Caption   := edtTrialSearchDepth.Text;
  lblOfficialAppoarchDepth.Caption := edtTrialAppoarchDepth.Text;
  lblOfficialFloor.Caption         := edtTrialFloor.Text;

  RecDataParameter.Ceiling       := StrToIntDef(edtTrialCeiling.Text, 0);
  RecDataParameter.AttackDepth   := StrToIntDef(edtTrialAttackDepth.Text, 0);
  RecDataParameter.SearchDepth   := StrToIntDef(edtTrialSearchDepth.Text, 0);
  RecDataParameter.ApproachDepth := StrToIntDef(edtTrialAppoarchDepth.Text, 0);
  RecDataParameter.Floor         := StrToIntDef(edtTrialFloor.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvApproach'}
  lblOfficialEnableDis.Caption      := edtTrialEnablingDist.Text;
  lblOfficialApproachSpeed.Caption  := cbTrialApproachSpeed.Text;
  lblOfficialApproachCourse.Caption := lblTrialApproachCourse.Caption;

  RecDataParameter.EnableDistance := StrToIntDef(edtTrialEnablingDist.Text, 0);
  RecDataParameter.ApproachSpeed  := cbTrialApproachSpeed.ItemIndex;
  RecDataParameter.ApproachCourse := StrToIntDef(lblTrialApproachCourse.Caption, 0);
  {$ENDREGION}

  {$REGION 'AdvSA'}
  lblOfficialSAUpdating.Caption       := cbTrialSAUpdating.Text;
  lblOfficialCenterOS.Caption         := lblTrialCenterOS.Caption;
  lblOfficialSALength.Caption         := lblTrialSALength.Caption;
  lblSAWidth.Caption                  := lblTrialSAWidth.Caption;
  lblOfficialCenterSSP.Caption        := edtTrialCenterSSP.Text;
  lblOfficialSearchConfidence.Caption := lblTrialSearchConfidence.Caption;

  RecDataParameter.SAUpdating        := cbTrialSAUpdating.ItemIndex;
  RecDataParameter.CenterOS          := StrToIntDef(lblTrialCenterOS.Caption, 0);
  RecDataParameter.SALength          := StrToIntDef(lblTrialSALength.Caption, 0);
  RecDataParameter.SAWidth           := StrToIntDef(lblTrialSAWidth.Caption, 0);
  RecDataParameter.CenterSSP         := StrToIntDef(edtTrialCenterSSP.Text, 0);
  RecDataParameter.SearchConfidence  := StrToIntDef(lblTrialSearchConfidence.Caption, 0);
  {$ENDREGION}

  {$REGION 'AdvIntGuidance'}
  lblOfficialSearchPattern.Caption := cbTrialSearchPattern.Text;
  lblOfficialDPCAngle.Caption      := edtTrialDPCAngle.Text;

  RecDataParameter.SearchPattern := cbTrialSearchPattern.ItemIndex;
  RecDataParameter.DPCAngle      := StrToIntDef(edtTrialDPCAngle.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvToSo'}
  lblOfficialToSoMode.Caption     := cbTrialToSoMode.Text;
  lblOfficialToSoRangePAS.Caption := edtTrialToSoRangePAS.Text;
  lblOfficialToSoRangeACT.Caption := edtTrialToSoRangeACT.Text;

  RecDataParameter.ToSoMode     := cbTrialToSoMode.ItemIndex;
  RecDataParameter.ToSoRangePAS := StrToIntDef(edtTrialToSoRangePAS.Text, 0);
  RecDataParameter.ToSoRangeACT := StrToIntDef(edtTrialToSoRangeACT.Text, 0);
  {$ENDREGION}

  {$REGION 'AdvSafety'}
  lblOfficialProtectionRadius.Caption := edtTrialProtectionRadius.Text;
  lblOfficialASH.Caption              := cbTrialASH.Text;

  RecDataParameter.ProtectionRadius := StrToIntDef(edtTrialProtectionRadius.Text, 0);
  RecDataParameter.ASH              := cbTrialASH.ItemIndex;
  {$ENDREGION}
end;

procedure TfrmTorpedoParameterDepthSettings.lblResetClick(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to AdvPageTorpedoParameterDepth.PageCount - 1 do
    ResetControl(AdvPageTorpedoParameterDepth.Pages[I]);
end;

end.
