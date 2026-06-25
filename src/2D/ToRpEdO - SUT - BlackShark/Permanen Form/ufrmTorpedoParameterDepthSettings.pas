unit ufrmTorpedoParameterDepthSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  AdvPageControl, Vcl.ComCtrls;

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
    Label60: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoParameterDepthSettings: TfrmTorpedoParameterDepthSettings;

implementation

{$R *.dfm}

end.
