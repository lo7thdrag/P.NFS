unit ufrmTrackInfo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  AdvSmoothTabPager, RzPanel, RzRadGrp, Vcl.ComCtrls, Vcl.Mask, AdvDropDown,
  AdvCustomGridDropDown, AdvGridDropDown;

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
    TabSelectTrackInfo: TAdvSmoothTabPager;
    TabKinem: TAdvSmoothTabPage;
    TabGen: TAdvSmoothTabPage;
    TabSonar: TAdvSmoothTabPage;
    TabIntercept: TAdvSmoothTabPage;
    TabRESM: TAdvSmoothTabPage;
    lblCas: TLabel;
    lblFAS: TLabel;
    lblInt: TLabel;
    lblP: TLabel;
    lblResm1: TLabel;
    lblResm2: TLabel;
    lbllink: TLabel;
    lblRadar: TLabel;
    lblBBRF: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
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
    Label21: TLabel;
    Label22: TLabel;
    RzTrackNumbers: TRzCheckGroup;
    RzTrackIndicators: TRzCheckGroup;
    Label20: TLabel;
    lblMSITNo: TLabel;
    Label23: TLabel;
    lblLinkYTNo: TLabel;
    Label24: TLabel;
    lblRepTNo: TLabel;
    Label25: TLabel;
    lblSubmarineConfLevel: TLabel;
    Label27: TLabel;
    lblEstimatedDepth: TLabel;
    Label29: TLabel;
    lblDataReportType: TLabel;
    Label31: TLabel;
    lblFreetext: TLabel;
    Label33: TLabel;
    lblActivity: TLabel;
    Label35: TLabel;
    lblWeaponRange: TLabel;
    Label37: TLabel;
    lblDetectionRange: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label30: TLabel;
    lblTrackQuality: TLabel;
    lvTracklistNumber: TListView;
    Label32: TLabel;
    lblContactId: TLabel;
    lblSensor: TLabel;
    Label36: TLabel;
    lblFrequency: TLabel;
    Label39: TLabel;
    lblPRI: TLabel;
    Label41: TLabel;
    lblPulselength: TLabel;
    Label43: TLabel;
    lblPulseLevel: TLabel;
    Label45: TLabel;
    lblConfidence: TLabel;
    Label47: TLabel;
    lblClassification: TLabel;
    Label49: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    TabEW: TAdvSmoothTabPage;
    Label40: TLabel;
    lblPulseWidth: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label42: TLabel;
    lblPRF: TLabel;
    Label53: TLabel;
    Label48: TLabel;
    lblFixedScan: TLabel;
    Label54: TLabel;
    lblScanPeriod: TLabel;
    Label56: TLabel;
    Label55: TLabel;
    lblFrq: TLabel;
    Label58: TLabel;
    lblFMOP: TLabel;
    lblCW: TLabel;
    lblPMOP: TLabel;
    Label57: TLabel;
    lblAmplitude: TLabel;
    Label60: TLabel;
    Label59: TLabel;
    Label61: TLabel;
    lblPulseWidthResm2: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    lblPRFResm2: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    lblScantypeResm2: TLabel;
    Label69: TLabel;
    lblscanPeriodResm2: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    lblFreqResm2: TLabel;
    Label74: TLabel;
    lblFMOPResm2: TLabel;
    lblCWResm: TLabel;
    lblPMOPResm2: TLabel;
    Label78: TLabel;
    lblAmplitudeResm2: TLabel;
    Label80: TLabel;
    Label62: TLabel;
    Label65: TLabel;
    lblNumber: TLabel;
    Label68: TLabel;
    Label73: TLabel;
    lblModeNumber: TLabel;
    lblConfidenceEW: TLabel;
    Label70: TLabel;
    lbl76: TLabel;
    lblPlatformEvalConf: TLabel;
    lblBroadClassif: TLabel;
    Label75: TLabel;
    lblJitter: TLabel;
    Label77: TLabel;
    lblPulseWidthEW: TLabel;
    Label81: TLabel;
    Label76: TLabel;
    Label79: TLabel;
    lblPolariz: TLabel;
    Label83: TLabel;
    lblFreqEW: TLabel;
    Label85: TLabel;
    Label82: TLabel;
    lblScanTypeEW: TLabel;
    Label84: TLabel;
    lblScanPeriodEW: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    lblRateEW: TLabel;
    Label90: TLabel;
    Label86: TLabel;
    lblFreq1EW: TLabel;
    Label91: TLabel;
    lblFreq2EW: TLabel;
    Label94: TLabel;
    lbl77: TLabel;
    AdvGridDropDown1: TAdvGridDropDown;
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
