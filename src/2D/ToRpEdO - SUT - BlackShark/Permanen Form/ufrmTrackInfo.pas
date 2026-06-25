unit ufrmTrackInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  AdvSmoothTabPager, RzPanel, RzRadGrp, Vcl.ComCtrls, Vcl.Mask, AdvDropDown,
  AdvCustomGridDropDown, AdvGridDropDown, AdvPageControl;

type
  TfrmTrackInfo = class(TForm)
    pnlMain: TPanel;
    lbl1: TLabel;
    lblTNo: TLabel;
    lbl2: TLabel;
    lblSource: TLabel;
    Label1: TLabel;
    lblCat: TLabel;
    lblPlatform: TLabel;
    Label6: TLabel;
    lblId: TLabel;
    Label8: TLabel;
    lblType: TLabel;
    lbl3: TLabel;
    lblCas: TLabel;
    lblFAS: TLabel;
    lblInt: TLabel;
    lblP: TLabel;
    lblResm1: TLabel;
    lblResm2: TLabel;
    lbllink: TLabel;
    lblRadar: TLabel;
    AdvPageTrackInfo: TAdvPageControl;
    AdvKinem: TAdvTabSheet;
    AdvGen: TAdvTabSheet;
    AdvSonar: TAdvTabSheet;
    AdvIntercept: TAdvTabSheet;
    AdvRESM: TAdvTabSheet;
    AdvEW: TAdvTabSheet;
    cbRange: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    lblBBRF: TLabel;
    lblTrackQuality: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label33: TLabel;
    Label35: TLabel;
    Label37: TLabel;
    lblActivity: TLabel;
    lblDataReportType: TLabel;
    lblDetectionRange: TLabel;
    lblEstimatedDepth: TLabel;
    lblFreetext: TLabel;
    lblSubmarineConfLevel: TLabel;
    lblWeaponRange: TLabel;
    Panel1: TPanel;
    Label20: TLabel;
    lblMSITNo: TLabel;
    Label23: TLabel;
    lblLinkYTNo: TLabel;
    Label24: TLabel;
    lblRepTNo: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image1: TImage;
    Label89: TLabel;
    Image2: TImage;
    Label92: TLabel;
    Image3: TImage;
    Label93: TLabel;
    Panel4: TPanel;
    lvTracklistNumber: TListView;
    Label32: TLabel;
    Label34: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label43: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    lblClassification: TLabel;
    lblConfidence: TLabel;
    lblContactId: TLabel;
    lblFrequency: TLabel;
    lblPRI: TLabel;
    lblPulselength: TLabel;
    lblPulseLevel: TLabel;
    lblSensor: TLabel;
    Label40: TLabel;
    Label42: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label48: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label69: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label74: TLabel;
    Label78: TLabel;
    Label80: TLabel;
    lblAmplitude: TLabel;
    lblAmplitudeResm2: TLabel;
    lblCW: TLabel;
    lblCWResm: TLabel;
    lblFixedScan: TLabel;
    lblFMOP: TLabel;
    lblFMOPResm2: TLabel;
    lblFreqResm2: TLabel;
    lblFrq: TLabel;
    lblPMOP: TLabel;
    lblPMOPResm2: TLabel;
    lblPRF: TLabel;
    lblPRFResm2: TLabel;
    lblPulseWidth: TLabel;
    lblPulseWidthResm2: TLabel;
    lblScanPeriod: TLabel;
    lblscanPeriodResm2: TLabel;
    lblScantypeResm2: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    Label68: TLabel;
    Label70: TLabel;
    Label73: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label79: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label94: TLabel;
    lbl76: TLabel;
    lbl77: TLabel;
    lblBroadClassif: TLabel;
    lblConfidenceEW: TLabel;
    lblFreq1EW: TLabel;
    lblFreq2EW: TLabel;
    lblFreqEW: TLabel;
    lblJitter: TLabel;
    lblModeNumber: TLabel;
    lblNumber: TLabel;
    lblPlatformEvalConf: TLabel;
    lblPolariz: TLabel;
    lblPulseWidthEW: TLabel;
    lblRateEW: TLabel;
    lblScanPeriodEW: TLabel;
    lblScanTypeEW: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrackInfo: TfrmTrackInfo;

implementation

{$R *.dfm}

end.
