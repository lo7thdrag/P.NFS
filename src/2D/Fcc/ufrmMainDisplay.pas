unit ufrmMainDisplay;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList,Vcl.OleCtrls, MapXLib_TLB, uBaseFunctionFCC, uObjectVisual,
  uCoordConverter, uMapXUnitConverter, system.math, TFlatCheckBoxUnit, uFccManager, uBridgeSet,
  uSimulationManager, uRadarVisual, uRadarDynamicSector, uRadarNorthIndicator,
  uRadarTargets, VrControls, VrDesign, AdvOfficeButtons, SHDocVw, MSHTML, ActiveX,
  uClassDatabase, System.IOUtils, Grijjy.Bson.Serialization, ShellAPI;

type
  TSetting = record
  public
    [BsonElement('Host')]
    Host: string;
    [BsonElement('Port')]
    Port: string;
    [BsonElement('Video')]
    Video: string;
    [BsonElement('PosX')]
    PosX: Integer;
    [BsonElement('PosY')]
    PosY: Integer;
    [BsonElement('Width')]
    Width: Integer;
    [BsonElement('Height')]
    Height: Integer;
  end;
  TfrmMainFCC = class(TForm)
    pnlSituationZone: TPanel;
    pnlUpper: TPanel;
    PnlLower: TPanel;
    pnlRightUpper: TPanel;
    pnlVideoZone: TPanel;
    imgListLight: TImageList;
    imgBackgrounSituationZone: TImage;
    FMap: TMap;
    btnMapIncrement: TButton;
    btnMapDecrement: TButton;
    pnlMap48km: TPanel;
    pnlMap24km: TPanel;
    pnlMap12km: TPanel;
    pnlMap6km: TPanel;
    pnlMap3km: TPanel;
    pnlMap1point5km: TPanel;
    lblMap48Km: TLabel;
    lblMap24Km: TLabel;
    lblMap12Km: TLabel;
    lblMap6Km: TLabel;
    lblMap3Km: TLabel;
    lblMap1point5Km: TLabel;
    imgCompas: TImage;
    tmrUpdateForm: TTimer;
    imgFcc1Image: TImage;
    tmrUpdateHeading: TTimer;
    acbxDisRing: TAdvOfficeCheckBox;
    acbxShootArea: TAdvOfficeCheckBox;
    acbxTrackerArea: TAdvOfficeCheckBox;
    acbxTargetPara: TAdvOfficeCheckBox;
    lblMapLat: TLabel;
    lblMapLon: TLabel;
    pnlLowRight: TPanel;
    pnlLowLeft: TPanel;
    pnlBite: TPanel;
    pnlBiteHeader: TPanel;
    pnlBiteBottom: TPanel;
    pnlBiteControl: TPanel;
    pnlBiteBottomTime: TPanel;
    lblBiteOperating: TLabel;
    lblBiteSystem: TLabel;
    lblBiteTimeOperating: TLabel;
    lblBiteTimeSystem: TLabel;
    lblBiteTimeOperatingValue: TLabel;
    lblBiteTimeSystemValue: TLabel;
    pnlTracker: TPanel;
    pnlTrackerHeader: TPanel;
    pnlTrackerBottom: TPanel;
    pnlFCC1: TPanel;
    pnlFCCHeader: TPanel;
    pnlFCCBottom: TPanel;
    pnlButtonCtrl: TPanel;
    pnlLocalState: TPanel;
    pnlLocalStateHeader: TPanel;
    pnlSysCtrl: TPanel;
    pnlCombatLs: TPanel;
    pnlWaitLs: TPanel;
    pnlTrLs: TPanel;
    pnlCtrlCmd: TPanel;
    pnlCtrlCmdHeader: TPanel;
    pnlCombatCtrl: TPanel;
    pnlWaitCtrl: TPanel;
    pnlCtrl: TPanel;
    pnlFireForbid: TPanel;
    pnlCalData: TPanel;
    pnlCalDataHeader: TPanel;
    pnlLast: TPanel;
    lblLastDeltaBE: TLabel;
    lblLastDeltaEL: TLabel;
    lblLastDeltaD: TLabel;
    lblLastSatuanDeltaBE: TLabel;
    lblLastSatuanDeltaEL: TLabel;
    lblLastSatuanDeltaD: TLabel;
    pnlLastHeader: TPanel;
    edtLastDeltaBE: TEdit;
    edtLastDeltaEL: TEdit;
    edtLastDeltaD: TEdit;
    pnlSum: TPanel;
    lblSumDeltaBE: TLabel;
    lblSumSatuanDeltaBe: TLabel;
    lblSumDeltaEL: TLabel;
    lblSumSatualDeltaEL: TLabel;
    LblSumDeltaD: TLabel;
    lblSumSatuanDeltaD: TLabel;
    pnlSumHeader: TPanel;
    edtSumDeltaBe: TEdit;
    edtSumDeltaEL: TEdit;
    edtSumDeltaD: TEdit;
    pnlCtrlData: TPanel;
    lblCtrlDataBE: TLabel;
    lblCtrlDataEL: TLabel;
    lblCtrlDataSatuanBE: TLabel;
    lblCtrlDataSatuanEL: TLabel;
    lblCtrlDataBeInc: TLabel;
    lblCtrlDataSatuanBeInc: TLabel;
    LblCtrlDataELInc: TLabel;
    lblCtrlDataSatuanELInc: TLabel;
    lblCtrlDataBeS: TLabel;
    lblCtrlDataSatuanBeS: TLabel;
    lblCtrlDataElS: TLabel;
    lblCtrlDataSatuanElS: TLabel;
    pnlCtrlDataHeader: TPanel;
    edtCtrlDataBE: TEdit;
    edtCtrlDataEL: TEdit;
    edtCtrlDataBeInc: TEdit;
    edtCtrlDataElInc: TEdit;
    edtCtrlDataBeS: TEdit;
    edtCtrlDataElS: TEdit;
    pnlCtrlState: TPanel;
    imgCtrlStateTracked: TImage;
    imgCtrlStateDataReady: TImage;
    imgCtrlStateFCC: TImage;
    imgCtrlStateFireAllow: TImage;
    imgCtrlStateFiring: TImage;
    imgCtrlStateLimitZone: TImage;
    imgCtrlStateAimed: TImage;
    lblCtrlStateTracked: TLabel;
    lblCtrlStateDataReady: TLabel;
    lblCtrlStateFCC: TLabel;
    lblCtrlStateFireAllow: TLabel;
    lblCtrlStateFiring: TLabel;
    lblCtrlStateLimitZone: TLabel;
    lblCtrlStateAimed: TLabel;
    pnlCtrlStateHeader: TPanel;
    pnlGunData: TPanel;
    pnlGunPointAngel: TPanel;
    lblGpaBE: TLabel;
    lblGpaEL: TLabel;
    lblGpaSatuanBE: TLabel;
    lblGpaSatuanEL: TLabel;
    pnlGunPointAngelHeader: TPanel;
    edtGpABE: TEdit;
    edtGpaEL: TEdit;
    pnlGunState: TPanel;
    lblGunStateCtrlBy: TLabel;
    imgGunStateCtrlBy: TImage;
    lblGunStateServo: TLabel;
    imgGunStateServo: TImage;
    lblGunStateFC: TLabel;
    imgGunStateFC: TImage;
    lblGunStateReturnZero: TLabel;
    imgGunStateReturnZero: TImage;
    pnlGunStateHeader: TPanel;
    pnlGunParameter: TPanel;
    pnlGunParameterHeader: TPanel;
    pnlFCC2: TPanel;
    pnlFCC2Header: TPanel;
    pnlFCC2Bottom: TPanel;
    pnlFCC12: TPanel;
    pnlFCC13: TPanel;
    pnlLocalStateHeader1: TPanel;
    pnlSysCtrl1: TPanel;
    pnlCombatLs1: TPanel;
    pnlWaitLs1: TPanel;
    pnlTrLs1: TPanel;
    pnlCtrlCmd1: TPanel;
    pnlCtrlCmdHeader1: TPanel;
    pnlCombatCtrl1: TPanel;
    pnlWaitCtrl1: TPanel;
    pnlCtrl1: TPanel;
    pnlFireForbid1: TPanel;
    pnlCalData1: TPanel;
    pnlCalDataHeader1: TPanel;
    pnlLast1: TPanel;
    lblLastDeltaBE1: TLabel;
    lblLastDeltaEL1: TLabel;
    lblLastDeltaD1: TLabel;
    lblLastSatuanDeltaBE1: TLabel;
    lblLastSatuanDeltaEL1: TLabel;
    lblLastSatuanDeltaD1: TLabel;
    pnlLastHeader1: TPanel;
    edtLastDeltaBE1: TEdit;
    edtLastDeltaEL1: TEdit;
    edtLastDeltaD1: TEdit;
    pnlSum1: TPanel;
    lblSumDeltaBE1: TLabel;
    lblSumSatuanDeltaBe1: TLabel;
    lblSumDeltaEL1: TLabel;
    lblSumSatualDeltaEL1: TLabel;
    lbl1: TLabel;
    lblSumSatuanDeltaD1: TLabel;
    pnlSumHeader1: TPanel;
    edtSumDeltaBe1: TEdit;
    edtSumDeltaEL1: TEdit;
    edtSumDeltaD1: TEdit;
    pnlCtrlData1: TPanel;
    lblCtrlDataBE1: TLabel;
    lblCtrlDataEL1: TLabel;
    lblCtrlDataSatuanBE1: TLabel;
    lblCtrlDataSatuanEL1: TLabel;
    lblCtrlDataBeInc1: TLabel;
    lblCtrlDataSatuanBeInc1: TLabel;
    lbl2: TLabel;
    lblCtrlDataSatuanELInc1: TLabel;
    lblCtrlDataBeS1: TLabel;
    lblCtrlDataSatuanBeS1: TLabel;
    lblCtrlDataElS1: TLabel;
    lblCtrlDataSatuanElS1: TLabel;
    pnlCtrlDataHeader1: TPanel;
    edtCtrlDataBE1: TEdit;
    edtCtrlDataEL1: TEdit;
    edtCtrlDataBeInc1: TEdit;
    edtCtrlDataElInc1: TEdit;
    edtCtrlDataBeS1: TEdit;
    edtCtrlDataElS1: TEdit;
    pnlCtrlState1: TPanel;
    imgCtrlStateTrackedFCC2: TImage;
    imgCtrlStateDataReadyFCC2: TImage;
    imgCtrlStateFCC2: TImage;
    imgCtrlStateFireAllowFCC2: TImage;
    imgCtrlStateFiringFCC2: TImage;
    imgCtrlStateLimitZoneFCC2: TImage;
    imgCtrlStateAimedFCC2: TImage;
    lblCtrlStateTracked1: TLabel;
    lblCtrlStateDataReady1: TLabel;
    lblCtrlStateFCC1: TLabel;
    lblCtrlStateFireAllow1: TLabel;
    lblCtrlStateFiring1: TLabel;
    lblCtrlStateLimitZone1: TLabel;
    lblCtrlStateAimed1: TLabel;
    pnlCtrlStateHeader1: TPanel;
    pnlGunData1: TPanel;
    pnlFCC14: TPanel;
    lblGpaBE1: TLabel;
    lblGpaEL1: TLabel;
    lblGpaSatuanBE1: TLabel;
    lblGpaSatuanEL1: TLabel;
    pnlGunPointAngelHeader1: TPanel;
    edtGpABE1: TEdit;
    edtGpaEL1: TEdit;
    pnlGunState1: TPanel;
    lblGunStateCtrlBy1: TLabel;
    imgGunStateCtrlByFCC2: TImage;
    lblGunStateServo1: TLabel;
    imgGunStateServoFCC2: TImage;
    lblGunStateFC1: TLabel;
    imgGunStateFCFCC2: TImage;
    lblGunStateReturnZero1: TLabel;
    imgGunStateReturnZeroFCC2: TImage;
    pnlGunStateHeader1: TPanel;
    pnlGunParameter1: TPanel;
    pnlGunParameterHeader1: TPanel;
    lblGpDrum: TLabel;
    pnlGpDrum: TPanel;
    pnlGpType: TPanel;
    lblGpType: TLabel;
    lblGpRate: TLabel;
    pnlGpRate: TPanel;
    lblGpPr: TLabel;
    pnlGpPr: TPanel;
    lblGpRr: TLabel;
    pnlGpRr: TPanel;
    lblGpMv: TLabel;
    pnlGpMv: TPanel;
    lblGpTime: TLabel;
    pnlGpTime: TPanel;
    lblSatuanMv: TLabel;
    lblSatuanTime: TLabel;
    pnlBaseLow: TPanel;
    pnlBaseHigh: TPanel;
    pnlLowtHeader: TPanel;
    pnlHigHeader: TPanel;
    lblPRLow: TLabel;
    lblLowPR: TLabel;
    lblLowRR: TLabel;
    edtLowPR: TEdit;
    edtLowRR: TEdit;
    edtHighPR: TEdit;
    lblHighPR: TLabel;
    lblHighRR: TLabel;
    edtHighRR: TEdit;
    pnlBiteControlFCC1: TPanel;
    pnlBiteControlFCC2: TPanel;
    pnlBiteChooseDvc: TPanel;
    lblBiteChooseDvc: TPanel;
    btnBiteChooseDvcFCC: TButton;
    btnBiteChooseDvc730B: TButton;
    pnlFire: TPanel;
    pnlBiteDvcState: TPanel;
    imgBiteDvcStateFCC: TImage;
    imgBiteDvcState730B: TImage;
    imgBiteDvcStateEO: TImage;
    imgBiteDvcStateTR: TImage;
    imgBiteDvcStateTCC: TImage;
    imgBiteDvcStateSIE: TImage;
    imgBiteDvcStateSR: TImage;
    lblBiteDvcStateFcc: TLabel;
    lblBiteDvcState730B: TLabel;
    lblBiteDvcStateEO: TLabel;
    lblBiteDvcStateTr: TLabel;
    lblBiteDvcStateTCC: TLabel;
    lblBiteDvcStateSIE: TLabel;
    lblBiteDvcStateSR: TLabel;
    lblBiteDvcStateHeader: TPanel;
    pnlFcc2BiteDvcState: TPanel;
    imgBiteDvcStateFCC2: TImage;
    imgBiteDvcState57: TImage;
    imgBiteDvcStateEOFcc2: TImage;
    imgBiteDvcStateTRFcc2: TImage;
    imgBiteDvcStateTCCFcc2: TImage;
    imgBiteDvcStateSIEFcc2: TImage;
    imgBiteDvcStateSRFcc2: TImage;
    lblBiteDvcStateFcc2: TLabel;
    lblBiteDvcState57: TLabel;
    lblBiteDvcStateEOFcc2: TLabel;
    lblBiteDvcStateTrFcc2: TLabel;
    lblBiteDvcStateTCCFcc2: TLabel;
    lblBiteDvcStateSIEFcc2: TLabel;
    lblBiteDvcStateSRFcc2: TLabel;
    pnl1Fcc2: TPanel;
    pnlBiteChooseDvcFcc2: TPanel;
    pnl2Fcc2: TPanel;
    btnBiteChooseDvcFCC2: TButton;
    btnBiteChooseDvc57: TButton;
    pnlFireFcc2: TPanel;
    pnlTrackerFCC1: TPanel;
    pnlTrackerFCC2: TPanel;
    pnlTrackerState: TPanel;
    pnlTrackerStateHeader: TPanel;
    edtTrsLocalCtrl: TEdit;
    edtTrsCombat: TEdit;
    edtTrsWait: TEdit;
    edtTrsLost: TEdit;
    edtTrsAuto: TEdit;
    edtTrsTvChannel: TEdit;
    edtTrsTurnOn: TEdit;
    pnlTrackerData: TPanel;
    lblTrdBE: TLabel;
    lblTrdEL: TLabel;
    lblTrdSatuanBE: TLabel;
    lblTrdSatuanEL: TLabel;
    lblTrdD: TLabel;
    lblTrdSatuanD: TLabel;
    lblTrdDeltaBE: TLabel;
    lblTrdSatuanDeltaBE: TLabel;
    lblTrdDeltaEL: TLabel;
    lblTrdSatuanDeltaEL: TLabel;
    pnlTrackerDataHeader: TPanel;
    edtTrdBE: TEdit;
    edtTrdEL: TEdit;
    edtTrdD: TEdit;
    edtTrdDeltaBE: TEdit;
    edtTrdDeltaEL: TEdit;
    pnlTrackerStateFCC2: TPanel;
    pnlTrackerStateHeaderFCC2: TPanel;
    edtTrsLocalCtrlFCC2: TEdit;
    edtTrsCombatFCC2: TEdit;
    edtTrsWaitFCC2: TEdit;
    edtTrsLostFCC2: TEdit;
    edtTrsAutoFCC2: TEdit;
    edtTrsTvChannelFCC2: TEdit;
    edtTrsTurnOnFCC2: TEdit;
    pnlFCC2TrackerStateHeader: TPanel;
    lblTrdBEFCC2: TLabel;
    lblTrdELFCC2: TLabel;
    lblTrdSatuanBEFCC2: TLabel;
    lblTrdSatuanELFCC2: TLabel;
    lblTrdDFCC2: TLabel;
    lblTrdSatuanDFCC2: TLabel;
    lblTrdDeltaBEFCC2: TLabel;
    lblTrdSatuanDeltaBEFCC2: TLabel;
    lblTrdDeltaELFCC2: TLabel;
    lblTrdSatuanDeltaELFCC2: TLabel;
    pnlTrackerDataHeaderFCC2: TPanel;
    edtTrdBEFCC2: TEdit;
    edtTrdELFCC2: TEdit;
    edtTrdDFCC2: TEdit;
    edtTrdDeltaBEFCC2: TEdit;
    edtTrdDeltaELFCC2: TEdit;
    pnlStatusOwnShip: TPanel;
    pnlIndWth: TPanel;
    pnlCalSetting: TPanel;
    pnlWeatherSetting: TPanel;
    pnlNavSetting: TPanel;
    pnlINDData: TPanel;
    lblIndDataBatchNo: TLabel;
    lblIndDataType: TLabel;
    lblIndDataD: TLabel;
    lblIndDataSatuanD: TLabel;
    lblIndDataAZ: TLabel;
    lblIndDataSatuanAZ: TLabel;
    lblIndDataEL: TLabel;
    lblIndDataSatuanEL: TLabel;
    lblIndDataCourse: TLabel;
    lblIndDataSatuanCourse: TLabel;
    lblIndDataSpeed: TLabel;
    lblIndDataSatuanSpeed: TLabel;
    pnlIndDataHeader: TPanel;
    edtIndDataBatchNo: TEdit;
    edtIndDataType: TEdit;
    edtIndDataD: TEdit;
    edtIndDataAZ: TEdit;
    edtIndDataEL: TEdit;
    edtIndDataCourse: TEdit;
    edtIndDataSpeed: TEdit;
    pnlNavData: TPanel;
    lblNavDataRoll: TLabel;
    lblNavDataHeading: TLabel;
    lblNavDataLon: TLabel;
    lblNavDataPitch: TLabel;
    lblNavDataSpeed: TLabel;
    lblNavDataSatuanRoll: TLabel;
    lblNavDataSatuanLon: TLabel;
    lblNavDataSatuanPitch: TLabel;
    lblNavDataSatuanSpeed: TLabel;
    lblNavDataLat: TLabel;
    lblNavDataVoyage: TLabel;
    lblNavDataSatuanHeading: TLabel;
    lblNavDataSatuanVoyage: TLabel;
    lblNavDataSatuanLat: TLabel;
    pnlNavDataHeader: TPanel;
    edtNavDataRoll: TEdit;
    edtNavDataHeading: TEdit;
    edtNavDataLON: TEdit;
    edtNavDataPitch: TEdit;
    edtNavDataSpeed: TEdit;
    edtNavDataLAT: TEdit;
    edtNavDataVoyage: TEdit;
    pnlWeatherData: TPanel;
    lblWeatherDataWs: TLabel;
    lblWeatherDataSatuanWs: TLabel;
    lblWeatherDataWd: TLabel;
    lblWeatherDataSatuanWd: TLabel;
    lblWeatherDataTemp: TLabel;
    lblWeatherDataSatuanTemp: TLabel;
    lblWeatherDataHumi: TLabel;
    lblWeatherDataSatuanHumi: TLabel;
    lblWeatherDataAirP: TLabel;
    lblWeatherDataSatuanAirP: TLabel;
    pnlWeatherDataHeader: TPanel;
    edtWeatherDataWs: TEdit;
    edtWeatherDataWd: TEdit;
    edtWeatherDataTemp: TEdit;
    edtWeatherDataHumi: TEdit;
    edtWeatherDataAirP: TEdit;
    pnlCalSettingHeader: TPanel;
    lblLastDeltaBESetting: TLabel;
    edtDeltaBESetting: TEdit;
    lblLastSatuanDeltaELSetting: TLabel;
    lblLastSatuanDeltaELSetting2: TLabel;
    edtDeltaELSetting: TEdit;
    lblLastDeltaELSetting: TLabel;
    lblLastDeltaDSetting: TLabel;
    edtDeltaDSetting: TEdit;
    lblLastSatuanDeltaDSetting: TLabel;
    pnlBaseVideoZone: TPanel;
    pnlWeatherSettingHeader: TPanel;
    rbWeatherAuto: TRadioButton;
    rbWeatherManual: TRadioButton;
    edtWeatherSettingWs: TEdit;
    lblWeatherSettingWs: TLabel;
    lblWeatherSettingSatuanWs: TLabel;
    lblWeatherSettingWd: TLabel;
    edtWeatherSettingWd: TEdit;
    lblWeatherSettingSatuanWd: TLabel;
    lblWeatherSettingTemp: TLabel;
    edtWeatherSettingTemp: TEdit;
    lblWeatherSettingSatuanTemp: TLabel;
    lblWeatherSettingHumi: TLabel;
    edtWeatherSettingHumi: TEdit;
    lblWeatherSettingSatuanHumi: TLabel;
    lblWeatherSettingAirP: TLabel;
    edtWeatherSettingAirP: TEdit;
    lblWeatherSettingSatuanAirP: TLabel;
    pnlNavSettingHeader: TPanel;
    lblNavSettingHeading: TLabel;
    edtNavSettingHeading: TEdit;
    lblNavSettingSatuanHeading: TLabel;
    lblNavSettingVoyage: TLabel;
    edtNavSettingALT: TEdit;
    lblNavSettingSatuanVoyage: TLabel;
    lblNavSettingPitch: TLabel;
    edtNavSettingPitch: TEdit;
    lblNavSettingSatuanPitch: TLabel;
    lblNavSettingRoll: TLabel;
    edtNavSettingRoll: TEdit;
    lblNavSettingSatuanRoll: TLabel;
    lblNavSettingSpeed: TLabel;
    edtNavSettingSpeed: TEdit;
    lblNavSettingSatuanSpeed: TLabel;
    lblNavSettingLon: TLabel;
    edtNavSettingLON: TEdit;
    lblNavSettingSatuanLon: TLabel;
    lblNavSettingLat: TLabel;
    edtNavSettingLAT: TEdit;
    lblNavSettingSatuanLat: TLabel;
    rbNavAuto: TRadioButton;
    rbNavrManual: TRadioButton;
    pnlRRSetting: TPanel;
    lblRRSettingLeftDrum: TLabel;
    lblRRSettingRightDrum: TLabel;
    pnlRRSettingHeader: TPanel;
    edtRRSettingLeftDrum: TEdit;
    edtRRSettingRightDrum: TEdit;
    pnlTimeSetting: TPanel;
    lblTimeSettingTime: TLabel;
    lblTimeSettingSatuanTime: TLabel;
    pnlTimeSettingHeader: TPanel;
    edtTimeSettingTime: TEdit;
    pnlIndSetting: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Panel2: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    rbIndAir: TRadioButton;
    RadioButton2: TRadioButton;
    pnlDAttackSetting: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    pnlDAttackSetting2: TPanel;
    edtAltDirectAttack: TEdit;
    edtLonDirectAttack: TEdit;
    edtLatDirectAttack: TEdit;
    pnlVFireSetting: TPanel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Panel6: TPanel;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure tmrUpdateFormTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure btnMapIncrementClick(Sender: TObject);
    procedure btnMapDecrementClick(Sender: TObject);
    procedure pnlMapRangeClick(Sender: TObject);
    procedure imgCompasClick(Sender: TObject);
    procedure tmrUpdateHeadingTimer(Sender: TObject);
    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure acbxTargetParaClick(Sender: TObject);
    procedure FMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure FMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlFireFcc2Click(Sender: TObject);
    procedure onRbNavSetting(Sender: TObject);
    procedure onRbWeatherSetting(Sender: TObject);
  protected
    procedure DrawAngle(aCnv: TCanvas);
    procedure DrawCompas(aCnv: TCanvas);

    function MeterWidth: Integer;
    function MeterHeight: Integer;
    function Rotate(Width, Height, Radius: Integer; Degrees: Double): Winapi.Windows.TPoint;
    procedure DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;Color: TColor; Width: Integer);
  private
    { Private declarations }
    FBitmapBackground : TBitmap;
    BitMapLampGrey, BitMapLampGreen, BitMapLampRed  : TBitmap;
    config: TSetting;
    ExecInfo, ExecPTK: TShellExecuteInfo;
    LeftDrum, RightDrum, TargetRoundInDrum: Integer;
    DrumPosState, IsServoOn : Boolean; // False untuk left drum, True untuk right drum
    HighFR, MiddleFR, LowFR : Boolean; // fire rate
    FireTime : Single;
    FireTimeMS, ActualFireTimeMS : Cardinal;
//    FProcessInfo: TProcessInformation;
    InsideZone, FireAllow, IsFiring, IsReturnZero : BOOL;
    FCurrBearing, FCurrElev, FTargetBearing, FTargetElev : Double;
    FLyrDraw: CMapXLayer;
    FNorthAngle : Double;
    FMapCanvas     : TCanvas;
    FMapConverter : TMapXUnitConverter;
    FFlag       : Byte;
    FIndexRange : Integer;
    FCurrentRange, FBearingVal, FElevVal : Double;  // meter
    FShipHeading : Integer;

    { Property On TDA }
    FRings       : TRadarRangeRings;
    AreaBlindZone   : TRadarDynamicSector;
    AreaBlindZone1   : TRadarDynamicSector;
    AreaGunPoint   : TRadarDynamicSector;
    AreaPenembakan  : TRadarDynamicSector;
    AreaTracker  : TRadarDynamicSector;
    FBearing0    : TRadarBearing;

    FNorthInd : TRadarNorthIndicator;

//    TargetMgr : TRadarTargetManager;

    FCircleRect  : TRect;
    FCircleCX    : Integer;
    FCircleCY    : Integer;
    FCircleR     : Integer; // radius pixel lingkaran peta

    FIsWeatherAuto : Boolean;
    FIsNavAuto, FSelectedVehicleState : Boolean;

    //setting parameter
    pCurrentScenID  : integer;
    pServer_Ip,
    pServer_Port,               //TriD_IP, TriD_Port,
    pDBServer,
    pDBProto,
    pDBName,
    pDBUser,
    pDBPass,
    pShipName,
    pClassName      : string;
    pShipID,
    pClassID        : Integer;

    activePanel : Integer; // 1: cal setting

    procedure LoadGeoset(const aGst: string); virtual;
    procedure InitializeForm();
    procedure setRegionCircle;

    procedure ResetColorRange();

    procedure DrawAll(aCnv: TCanvas; aCvt: TCoordConverter; aFlag: Byte);

     procedure ShowInfoCursor(const x, y: integer);

     procedure ptkCommand(const str : string);
     procedure HandleKeyByBtnName(const BtnName: string);

    procedure fireClick();

    procedure DAttackFire();
  public
    { Public declarations }
    rCX, rCY: integer;
    DAttackState : Boolean;
  end;

var
  frmMainFCC: TfrmMainFCC;

implementation

{$R *.dfm}

uses uLibConst, uBaseConst, uScriptFcc, uDataModule, ulibSettings, uVehicleManager, uVehicle, uBaseFunction, uTCPDatatype;
const
  CMin_Z = 0;
  CMax_Z = 14;

function RunAppInPanel(Panel: TWinControl; const Exe, Params: string): HWND;
var
  SI: STARTUPINFO;
  PI: PROCESS_INFORMATION;
begin
  ZeroMemory(@SI, SizeOf(SI));
  ZeroMemory(@PI, SizeOf(PI));
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW;
  SI.wShowWindow := SW_SHOW;

  if CreateProcess(nil, PChar(Exe + ' ' + Params), nil, nil, False,
                   CREATE_NEW_CONSOLE, nil, nil, SI, PI) then
  begin
    Result := PI.hProcess;
  end
  else
    Result := 0;
end;


function ZoomIndexToScale(const i: Integer): double;
begin
  if i < -3 then
    result := 0.125
  else if i > 14 then
    result := 2500.0
  else
    result := Power(2.0, (i - 3));
end;

function FindClosestZoomIndex(const z: double): Integer;
var
  i: Integer;
begin
  if z >= 2500 then
    result := CMax_Z
  else if z <= 0.125 then
    result := CMin_Z
  else
  begin
    i := Round(Log2(z));
    result := i + 3;
  end;
end;

function FixMapZoom(z: double): double;
begin
  if z >= 1.0 then
    result := Round(z)
  else
    result := 0.001 * Round(z * 1000);
end;

procedure EnableComposited(WinControl:TWinControl);
var
  i:Integer;
  NewExStyle:DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for I := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

procedure TfrmMainFCC.acbxTargetParaClick(Sender: TObject);
begin
  case TAdvOfficeCheckBox(Sender).Tag of
    0: //target para
    begin

    end;
    1: // dis range
    begin
      FRings.Visible := TAdvOfficeCheckBox(Sender).Checked;
    end;
    2: // shot area
    begin
      AreaPenembakan.Visible := TAdvOfficeCheckBox(Sender).Checked;
    end;
    3: // tracker area
    begin
      AreaTracker.Visible := TAdvOfficeCheckBox(Sender).Checked;
    end;
  end;
end;

procedure TfrmMainFCC.btnMapDecrementClick(Sender: TObject);
begin
  if self.FIndexRange > 0 then
  begin
    dec(self.FIndexRange);
    self.FCurrentRange := CRangeOperation[self.FIndexRange];
  end
  else
    self.FCurrentRange := CRangeOperation[0];

  ResetColorRange;

  case FIndexRange of
    0 :
    begin
      pnlMap1point5km.Color := clYellow;
    end;
    1 :
    begin
      pnlMap3km.Color := clYellow;
    end;
    2 :
    begin
      pnlMap6km.Color := clYellow;
    end;
    3 :
    begin
      pnlMap12km.Color := clYellow;
    end;
    4 :
    begin
      pnlMap24km.Color := clYellow;
    end;
    5 :
    begin
      pnlMap48km.Color := clYellow;
    end;
  end;

//  fmap.Zoom := self.FCurrentRange;
  FMap.ZoomTo((Self.FCurrentRange  * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);
end;

procedure TfrmMainFCC.btnMapIncrementClick(Sender: TObject);
begin
  if self.FIndexRange < CCountRange - 1 then
  begin
    inc(self.FIndexRange);
    self.FCurrentRange := CRangeOperation[self.FIndexRange];
  end
  else
    self.FCurrentRange := CRangeOperation[CCountRange -1];

  ResetColorRange;

  case FIndexRange of
    0 :
    begin
      pnlMap1point5km.Color := clYellow;
    end;
    1 :
    begin
      pnlMap3km.Color := clYellow;
    end;
    2 :
    begin
      pnlMap6km.Color := clYellow;
    end;
    3 :
    begin
      pnlMap12km.Color := clYellow;
    end;
    4 :
    begin
      pnlMap24km.Color := clYellow;
    end;
    5 :
    begin
      pnlMap48km.Color := clYellow;
    end;
  end;


//  fmap.Zoom := self.FCurrentRange;
  FMap.ZoomTo((Self.FCurrentRange  * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);
end;

procedure TfrmMainFCC.DrawAll(aCnv: TCanvas; aCvt: TCoordConverter;
  aFlag: Byte);
var
  pnt: Winapi.Windows.TPoint;
var
  z: double;
  i: Integer;
  TurretHeading : Double;
begin
  aCvt.ConvertToScreen(FMap.CenterX, FMap.CenterY, pnt.X, pnt.Y);

  z := FixMapZoom(FMap.Zoom);
  i := FindClosestZoomIndex(z);
  z := ZoomIndexToScale(i);

    // BLIND ZONE
    AreaBlindZone1.CenterMode := cmMapPosition;
    AreaBlindZone1.MapPosX := FMap.CenterX;
    AreaBlindZone1.MapPosY := FMap.CenterY;
    AreaBlindZone1.CoordConverter := aCvt;
    AreaBlindZone1.ConvertCoord(aCvt);

    AreaBlindZone1.OuterRadiusPx := FCircleR;
    AreaBlindZone1.CurrentRange_m := Self.FCurrentRange;

    if Assigned(FCCManager) then
    begin
      if Assigned(FCCManager.xShip) then
        AreaBlindZone1.HeadingDeg    := FCCManager.xShip.Heading;
    end;

    AreaBlindZone1.Draw(aCnv);

    AreaBlindZone.CenterMode := cmMapPosition;
    AreaBlindZone.MapPosX := FMap.CenterX;
    AreaBlindZone.MapPosY := FMap.CenterY;
    AreaBlindZone.CoordConverter := aCvt;
    AreaBlindZone.ConvertCoord(aCvt);

    AreaBlindZone.OuterRadiusPx := FCircleR;
    AreaBlindZone.CurrentRange_m := Self.FCurrentRange;

    if Assigned(FCCManager) then
    begin
      if Assigned(FCCManager.xShip) then
        AreaBlindZone.HeadingDeg    := FCCManager.xShip.Heading;
    end;

    AreaBlindZone.Draw(aCnv);

    AreaPenembakan.CenterMode     := cmMapPosition;
    AreaPenembakan.MapPosX        := FMap.CenterX;
    AreaPenembakan.MapPosY        := FMap.CenterY;
    AreaPenembakan.CoordConverter := aCvt;

    AreaPenembakan.OuterRadiusPx  := FCircleR;
    AreaPenembakan.CurrentRange_m := Self.FCurrentRange;

    if Assigned(FCCManager) then
    begin
      if Assigned(FCCManager.xShip) then
        AreaPenembakan.HeadingDeg    := FCCManager.xShip.Heading;
    end;

    AreaPenembakan.Draw(aCnv);

    AreaTracker.CenterMode     := cmMapPosition;
    AreaTracker.MapPosX        := FMap.CenterX;
    AreaTracker.MapPosY        := FMap.CenterY;
    AreaTracker.CoordConverter := aCvt;

    AreaTracker.OuterRadiusPx  := FCircleR;
    AreaTracker.CurrentRange_m := Self.FCurrentRange;

    if Assigned(FCCManager) then
    begin
      if Assigned(FCCManager.xShip) then
        AreaTracker.HeadingDeg    := FCCManager.xShip.Heading;
    end;

    AreaTracker.Draw(aCnv);

//    AreaGunPoint.CenterMode     := cmMapPosition;
//    AreaGunPoint.MapPosX        := FMap.CenterX;
//    AreaGunPoint.MapPosY        := FMap.CenterY;
//    AreaGunPoint.CoordConverter := aCvt;
//
//    AreaGunPoint.OuterRadiusPx  := FCircleR;
//    AreaGunPoint.CurrentRange_m := Self.FCurrentRange;
//
//    if Assigned(FCCManager) then
//    begin
//      if Assigned(FCCManager.xShip) then
//        AreaGunPoint.HeadingDeg    := FCCManager.xShip.Heading;
//    end;
//
//    AreaGunPoint.Draw(aCnv);

    // --- North Indicator ---
    FNorthInd.CenterX       := FCircleCX;
    FNorthInd.CenterY       := FCircleCY;
    FNorthInd.RadiusPx      := FCircleR;
    if Assigned(FCCManager) then
    begin
      if Assigned(FCCManager.xShip) then
      begin
        FNorthInd.HeadingDeg    := FCCManager.xShip.Heading;
        FNorthInd.UseTrueMotion := FCCManager.IsTrueMotion; // TRUE or FALSE
      end;
    end;
    FNorthInd.Draw(aCnv);



    // RANGE RINGS
    FRings.CircleRect    := FCircleRect;
    FRings.CurrentRange_m := FCurrentRange;
    FRings.ConvertCoord(aCvt);
    FRings.Draw(aCnv);

    // BEARING 0°
    FBearing0.CircleRect := FCircleRect;
    FBearing0.ConvertCoord(aCvt);
    if Assigned(FCCManager) then
    begin
      if Assigned(FCCManager.xShip) then
      begin
        TurretHeading := (FCCManager.xShip.Heading + FCurrBearing);
        if TurretHeading >= 360 then TurretHeading := TurretHeading - 360;
        
        FBearing0.BearingDeg    := TurretHeading;
      end;
    end;
    FBearing0.Draw(aCnv);

//    TargetMgr.Draw(aCnv);

    VehicleMgr.DrawAll(aCnv);
end;

procedure TfrmMainFCC.DrawAngle(aCnv: TCanvas);
var
  I,Size,Enlarge,StartAngle,AngleRadius: Integer;
  ticksMax,ticks,ticksEnlarge,ticksMin :integer;
  labels,decimals,labelsoffset: integer;
  Angle,AngleOffset,BaseAngle : integer;
  Increment,Degrees,CurValue,IncValue: Double;
  R: TRect;
  P1, P2: Winapi.Windows.TPoint;
  Mask,StrValue: string;
  ticksColor : TColor;
  labelsfont : TFont;

  left,top,right,bottom : Integer;
  diffBeetwinWH : Integer;  //differnt beetwin width and height width - height, kemudian dibagi dua sebagai batas left dan right,supaya lingkarannya tetap center.
begin
  with aCnv do
  begin
    Brush.Style := bsSolid;
    Brush.Color := clBlack; // or clBlack, clWhite, etc.
    FillRect(ClipRect); // clears the drawing area
  end;

  Angle := 0;
  if Assigned(FCCManager) then
  begin
    if Assigned(FCCManager.xShip) then
      Angle    := Round(FCCManager.xShip.Heading); // rojek add buat mutar angle sesuai arah kapal
  end;

  baseAngle := round(CBaseAngle);
  AngleOffset := round(CBaseAngle);
  labelsfont := TFont.Create();
  labelsfont.Color := clYellow;
  labelsfont.Size := 10;
  StartAngle := BaseAngle + Angle;

  diffBeetwinWH := (pnlSituationZone.Width - pnlSituationZone.Height) div 2;

  top := 50;
  bottom := pnlSituationZone.Height - top;
  left := diffBeetwinWH + top;
  right := pnlSituationZone.Width - left;
  with aCnv do
  begin
		Pen.Color := CForegroundColor;

    Brush.Style := bsClear;
//    R := Rect(0,0, Map.Width, Map.Height);
    R := Rect(left,top, right, bottom);
//    AngleRadius := (R.right - R.left) div 2;
    AngleRadius := 280;
    ticksmax := 16;
    ticks := round(24);
    ticksEnlarge := 5;
    ticksMin := 8;
    ticksColor := clGreen;
    labels := 24;
    decimals := 0;
    labelsoffset := 30;

    {jarum derajat}

    if Ticks >= 1 then
    begin
      Enlarge := TicksEnlarge;
      Degrees := StartAngle;
      Increment := AngleOffset/Ticks;
      aCnv.Pen.Color := clRed;
      aCnv.Pen.Width := 3;
      aCnv.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
      for I := 1 to Ticks + 1 do
      begin
//        if (Enlarge mod TicksEnlarge = 0) then
//          Size := TicksMax else Size := TicksMin;
        Size := TicksMax;
        Inc(Enlarge);
        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius, Degrees);
        P2 := Rotate(MeterWidth, MeterHeight, AngleRadius + Size, Degrees);
        DrawLine(aCnv, P1.X, P1.Y, P2.X, P2.Y, TicksColor, 2);
        Degrees := Degrees + Increment;
      end;
    end;


    {angka}

    if Labels >= 1 then
    begin
      Font := LabelsFont;
      CurValue := 0;
      IncValue := (360 - 0)/labels;
      Degrees := StartAngle;
      Increment := AngleOffset/labels;
      Mask := '%.' + IntToStr(Decimals) + 'f';
      for I := 1 to Labels  do
      begin
//        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius + LabelsOffset, Degrees);
        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius + LabelsOffset, Degrees);

//        if strlen(pchar(floattostr(CurValue))) <= 2 then
//          begin
//          if curValue = 0 then
//             StrValue := '00'+Format(Mask, [CurValue])
//          else
//             StrValue := '0'+Format(Mask, [CurValue]);
//          end
//        else
        if round(CurValue) mod 30 = 0 then
        begin
          if CurValue > 180 then
             StrValue := Format(Mask, [CurValue - 360]) + '°'
          else
            StrValue := Format(Mask, [CurValue]) + '°';

          P1.X := P1.X - TextWidth(StrValue) div 2;
          P1.Y := P1.Y - TextHeight(StrValue) div 2;
          TextOut(P1.X, P1.Y, StrValue);
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue*I);
        end
        else
        begin
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue*I);
        end;
      end;
    end;
  end;

end;

procedure TfrmMainFCC.DrawCompas(aCnv: TCanvas);
var
  R: TRect;
  CenterComp: Winapi.Windows.TPoint;
  Points, Points2: array of Winapi.Windows.TPoint;
begin
  SetLength(Points, 3);
  SetLength(Points2, 3);
  CenterComp.X := imgCompas.Height div 2;
  CenterComp.Y := imgCompas.Width div 2;
  R := Rect(0,0, imgCompas.Height, imgCompas.Width);
//  aCnv.Brush.Style := bsClear;
  aCnv.Pen.Color := clYellow;
  acnv.Brush.Color := clBlack;

  //draw lingkaran luar
  aCnv.Ellipse(r.Left, r.Top, r.Right, r.Bottom);

  //draw segitiga north
  Points[0] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 46, FNorthAngle + 270);
  Points[1] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2 - 15), FNorthAngle);
  Points[2] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 46, FNorthAngle + 90);

  //draw segitiga south
  Points2[0] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 46, FNorthAngle + 270);
  Points2[1] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 15, FNorthAngle + 180);
  Points2[2] := Rotate(imgCompas.Width, imgCompas.Height, (imgCompas.Height div 2) - 46, FNorthAngle + 90);

//  aCnv.Brush.Style := bsSolid;
  acnv.Pen.Width := 2;
  acnv.Pen.Color := clRed;
  acnv.Brush.Color := clRed;
  acnv.Polygon(Points);

  acnv.Pen.Color := clWhite;
  acnv.Brush.Color := clWhite;
  acnv.Polygon(Points2);
end;

procedure TfrmMainFCC.DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;
  Color: TColor; Width: Integer);
begin
  Canvas.Pen.Color := Color;
  Canvas.Pen.Width := Width;
  Canvas.MoveTo(X1, Y1);
  Canvas.LineTo(X2, Y2);
end;

procedure TfrmMainFCC.fireClick;
var
  RecSend : TRec3DSetWCC;
  aLow, aHigh: Double;
  range,rangem, bearing : Double;
begin
  if Assigned(FCCManager.SelectedVehicle) then
  begin
    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    bearing := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    // range = 3000 m, target lebih rendah 25 m
    ComputeBallisticAngleVacuum(rangem, FCCManager.SelectedVehicle.PosZ, 800, aLow, aHigh);

    RecSend.ShipID          := FCCManager.ShipID;
    RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID     := 0;
    RecSend.mMissileID      := 0;
    RecSend.mMissileNumber  := 0;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID);

    case vFccSetting.FccMode of
    1 : //FCC1 Mode
      begin
        RecSend.mModeID             := 3;
      end;
      2 : //FCC2 Mode
      begin
        RecSend.mModeID             := 1;
      end;
    end;

    RecSend.mAutoCorrectElev    := aLow;
    RecSend.mAutoCorrectBearing := bearing;

    RecSend.mBalistikID         := 0;
    RecSend.mSalvoRate          := 30;


    RecSend.mOrderID := __ORD_CANNON_START_F;
    FCCManager.NetSendTo3D_OrderCannon(RecSend);

    Sleep(1000);

    RecSend.ShipID          := FCCManager.ShipID;
    RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID     := 0;
    RecSend.mMissileID      := 0;
    RecSend.mMissileNumber  := 0;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID);
//    RecSend.mModeID             := 0;
    RecSend.mAutoCorrectElev    := aLow;
    RecSend.mAutoCorrectBearing := bearing;

    RecSend.mBalistikID         := 0;
    RecSend.mSalvoRate          := 30;


    RecSend.mOrderID := __ORD_CANNON_STOP_F;
    FCCManager.NetSendTo3D_OrderCannon(RecSend);
  end;
end;

procedure TfrmMainFCC.FMapDrawUserLayer(ASender: TObject;
  const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull,
  RectInvalid: IDispatch);
begin
  FMapCanvas.Handle := hOutputDC;
  DrawAll(FMapCanvas, FMapConverter, FFlag);
end;

procedure TfrmMainFCC.FMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
//  Sel: TRadarTargetSymbol;
  v : TVehicle;
  rangeX, dH, v0: Double;
  aLow, aHigh, aEnv: Double;
  ok: Boolean;
begin
  if Button <> mbLeft then Exit;

//  Sel := TargetMgr.SelectAt(X, Y);

  v := VehicleMgr.SelectAt(X, Y);


  FMap.Refresh; // langsung repaint untuk tunjukkan kotak putih

  if Assigned(v) then
  begin
    // misalnya tampilkan info target
    // ShowMessage('Target terpilih: ' + Sel.TrackLabel);

    FCCManager.SelectedVehicle := v;
    rangeX := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, v.PosX, v.PosY) * C_NauticalMile_To_Metre;   // 3 km
    dH     := v.PosZ;    // target 20 m lebih rendah
    v0     := 1035;    // m/s
    FSelectedVehicleState := true;

    if Assigned(FCCManager) then
    begin
      // 1) Tanpa environment (vakum)
      ok := FCCManager.ComputeGunElevationVacuum(rangeX, dH, v0, aLow, aHigh);
//      edtLowPR.Text := FormatFloat('0.00', aLow);
//      edtHighPR.Text := FormatFloat('0.00', aHigh);
    end;
  end
  else
  begin
    FSelectedVehicleState := false;
  end;
end;

procedure TfrmMainFCC.FMapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  ShowInfoCursor(X,y);
end;

procedure TfrmMainFCC.DAttackFire;
var
  isValid : Boolean;
  RecSend : TRec3DSetWCC;

  CorrectBearing,
  CorrectElev : Double;
  aLow, aHigh: Double;
  range,rangem, bearing  : Double;
begin
    if not IsServoOn then
      Exit;

    if (edtLonDirectAttack.Text = '0.00000000') or (edtLatDirectAttack.Text = '0.00000000') or (StrToFloat(edtAltDirectAttack.Text) < 0) or (StrToFloat(edtAltDirectAttack.Text) > 90)then
      Exit;

    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, StrToFloat(edtLonDirectAttack.text), StrToFloat(edtLatDirectAttack.text));
    rangem := range * C_NauticalMile_To_Metre;
    bearing := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, StrToFloat(edtLonDirectAttack.text), StrToFloat(edtLatDirectAttack.text));
    bearing := bearing - FCCManager.xShip.Heading;
    if bearing < 0 then
    bearing := bearing + 360;
    FBearingVal := bearing;
    // range = 3000 m, target lebih rendah 25 m
    ComputeBallisticAngleVacuum(rangem, StrToFloat(edtAltDirectAttack.Text), 350, aLow, aHigh);

    if (aLow <= 80 ) and (aLow >= 0 )then
    begin
//      FTargetAngleElevasi:= StrToFloatDef(edtElevasi.Text, 0);
      aLow := FMod(aLow, 360);
      if aLow < 0 then
        aLow := aLow + 360;

      FElevVal := aLow;

      RecSend.ShipID          := FCCManager.ShipID;
      RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
      RecSend.mLauncherID     := 0;
      RecSend.mMissileID      := 0;
      RecSend.mMissileNumber  := 0;
      RecSend.mOrderID        := 0;

      RecSend.mUpDown             := 0;
      RecSend.mTargetID           := 0;

      case vFccSetting.FccMode of
        1 : //FCC1 Mode
        begin
          if rangem > 3000 then
          begin
            imgCtrlStateLimitZone.Picture.Bitmap := BitMapLampred;
            InsideZone := False;
            Exit;
          end;

          RecSend.mModeID             := 3;
          if (bearing < 135) or (bearing > 225) then
          begin
            imgCtrlStateLimitZone.Picture.Bitmap := BitMapLampGreen;
            imgGunStateReturnZero.Picture.Bitmap := BitMapLampGrey;
            InsideZone := True;
          end
          else
          begin
            imgCtrlStateLimitZone.Picture.Bitmap := BitMapLampred;
            InsideZone := False;
            Exit;
          end;
        end;
        2 : //FCC2 Mode
        begin
          if rangem > 6500 then
          begin
            imgCtrlStateLimitZoneFCC2.Picture.Bitmap := BitMapLampRed;
            InsideZone := False;
            Exit;
          end;

          RecSend.mModeID             := 1;

          if (bearing > 315) or (bearing < 45) then
          begin
            imgCtrlStateLimitZoneFCC2.Picture.Bitmap := BitMapLampRed;
            InsideZone := False;
            Exit;
          end
          else
          begin
            imgCtrlStateLimitZoneFCC2.Picture.Bitmap := BitMapLampGreen;
            imgGunStateReturnZeroFCC2.Picture.Bitmap := BitMapLampGrey;
            InsideZone := True;
          end;
        end;
      end;
      RecSend.mAutoCorrectElev    := aLow;
      RecSend.mAutoCorrectBearing := bearing;

      RecSend.mBalistikID         := 0;
      RecSend.mSalvoRate          := 30;


      RecSend.mOrderID := __ORD_CANNON_ASSIGNED;

      if not InsideZone then
        Exit;

      FCCManager.NetSendTo3D_OrderCannon(RecSend);
    end
    else if (aLow >= 350 )then
    begin
      alow := FMod(alow, 360);
      if alow < 0 then
        alow := alow + 360;

      FElevVal := aLow;

      RecSend.ShipID          := FCCManager.ShipID;
      RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
      RecSend.mLauncherID     := 0;
      RecSend.mMissileID      := 0;
      RecSend.mMissileNumber  := 0;
      RecSend.mOrderID        := 0;

      RecSend.mUpDown             := 0;
      RecSend.mTargetID           := 0;

      case vFccSetting.FccMode of
        1 : //FCC1 Mode
        begin
          RecSend.mModeID             := 0;
        end;
        2 : //FCC2 Mode
        begin
          RecSend.mModeID             := 0;

          if (bearing > 315) and (bearing < 45) then
            Exit;
        end;
      end;

      RecSend.mAutoCorrectElev    := alow;
      RecSend.mAutoCorrectBearing := bearing;

      RecSend.mBalistikID         := 0;
      RecSend.mSalvoRate          := 30;


      RecSend.mOrderID := __ORD_CANNON_ASSIGNED;

      if not InsideZone then
        Exit;

      IsReturnZero := False;

      FTargetBearing := bearing;
      FTargetElev := aLow;
      edtCtrlDataBeInc.Text := (ftargetbearing - fcurrbearing).ToString();
      edtCtrlDataElInc.Text := (FTargetElev - fcurrelev).ToString();
      edtCtrlDataBeInc1.Text := (ftargetbearing - fcurrbearing).ToString();
      edtCtrlDataElInc1.Text := (FTargetElev - fcurrelev).ToString();
      FCCManager.NetSendTo3D_OrderCannon(RecSend);
    end;
end;

procedure TfrmMainFCC.FMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  isValid : Boolean;
  RecSend : TRec3DSetWCC;

  CorrectBearing,
  CorrectElev : Double;
  aLow, aHigh: Double;
  range,rangem, bearing, azimuth : Double;
begin
  if Assigned(fccmanager.SelectedVehicle) and FSelectedVehicleState then  // rojek coba jika tidak selected vehicle
  begin
    if not IsServoOn then
    Exit;

    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    azimuth := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    bearing := azimuth - FCCManager.xShip.Heading;
    if bearing < 0 then
    bearing := bearing + 360;
    FBearingVal := bearing;
    // range = 3000 m, target lebih rendah 25 m
    ComputeBallisticAngleVacuum(rangem, FCCManager.SelectedVehicle.PosZ, 350, aLow, aHigh);

    if (aLow <= 80 ) and (aLow >= 0 )then
    begin
//      FTargetAngleElevasi:= StrToFloatDef(edtElevasi.Text, 0);
      aLow := FMod(aLow, 360);
      if aLow < 0 then
        aLow := aLow + 360;

      FElevVal := aLow;

      RecSend.ShipID          := FCCManager.ShipID;
      RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
      RecSend.mLauncherID     := 0;
      RecSend.mMissileID      := 0;
      RecSend.mMissileNumber  := 0;
      RecSend.mOrderID        := 0;

      RecSend.mUpDown             := 0;
      RecSend.mTargetID           := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID);

      case vFccSetting.FccMode of
        1 : //FCC1 Mode
        begin
          if rangem > 3000 then
          begin
            imgCtrlStateLimitZone.Picture.Bitmap := BitMapLampred;
            InsideZone := False;
            Exit;
          end;

          RecSend.mModeID             := 3;
          if (bearing < 135) or (bearing > 225) then
          begin
            imgCtrlStateLimitZone.Picture.Bitmap := BitMapLampGreen;
            imgGunStateReturnZero.Picture.Bitmap := BitMapLampGrey;
            InsideZone := True;
          end
          else
          begin
            imgCtrlStateLimitZone.Picture.Bitmap := BitMapLampred;
            InsideZone := False;
            Exit;
          end;
        end;
        2 : //FCC2 Mode
        begin
          if rangem > 6500 then
          begin
            imgCtrlStateLimitZoneFCC2.Picture.Bitmap := BitMapLampRed;
            InsideZone := False;
            Exit;
          end;

          RecSend.mModeID             := 1;

          if (bearing > 315) or (bearing < 45) then
          begin
            imgCtrlStateLimitZoneFCC2.Picture.Bitmap := BitMapLampRed;
            InsideZone := False;
            Exit;
          end
          else
          begin
            imgCtrlStateLimitZoneFCC2.Picture.Bitmap := BitMapLampGreen;
            imgGunStateReturnZeroFCC2.Picture.Bitmap := BitMapLampGrey;
            InsideZone := True;
          end;
        end;
      end;
      RecSend.mAutoCorrectElev    := aLow;
      RecSend.mAutoCorrectBearing := bearing;

      RecSend.mBalistikID         := 0;
      RecSend.mSalvoRate          := 30;


      RecSend.mOrderID := __ORD_CANNON_ASSIGNED;

      FCCManager.NetSendTo3D_OrderCannon(RecSend);
    end
    else if (aLow >= 350 )then
    begin
      alow := FMod(alow, 360);
      if alow < 0 then
        alow := alow + 360;

      FElevVal := aLow;

      RecSend.ShipID          := FCCManager.ShipID;
      RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
      RecSend.mLauncherID     := 0;
      RecSend.mMissileID      := 0;
      RecSend.mMissileNumber  := 0;
      RecSend.mOrderID        := 0;

      RecSend.mUpDown             := 0;
      RecSend.mTargetID           := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID);

      case vFccSetting.FccMode of
        1 : //FCC1 Mode
        begin
          RecSend.mModeID             := 3;
        end;
        2 : //FCC2 Mode
        begin
          RecSend.mModeID             := 1;

          if (bearing > 315) and (bearing < 45) then
            Exit;
        end;
      end;

      RecSend.mAutoCorrectElev    := alow;
      RecSend.mAutoCorrectBearing := bearing;

      RecSend.mBalistikID         := 0;
      RecSend.mSalvoRate          := 30;


      RecSend.mOrderID := __ORD_CANNON_ASSIGNED;
      FCCManager.NetSendTo3D_OrderCannon(RecSend);


    end;

    //IND Data
    edtIndDataBatchNo.Text := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID).ToString();
    case FCCManager.SelectedVehicle.Domain of
      1://surface
      begin
        edtIndDataType.Text := 'Surface';
      end;
      2://air
      begin
        edtIndDataType.Text := 'Air';
      end;
    end;
    edtIndDataD.Text := rangem.ToString();
    edtIndDataAZ.Text := azimuth.ToString();
    edtIndDataEL.Text := alow.ToString();
    edtIndDataCourse.Text := FCCManager.SelectedVehicle.HeadingDeg.ToString();
    edtIndDataSpeed.Text := FCCManager.SelectedVehicle.Speed_mps.ToString();

    if not FSelectedVehicleState then
    begin
      edtIndDataBatchNo.Text := '0';
      edtIndDataType.Text := '--';
      edtIndDataD.Text := '0';
      edtIndDataAZ.Text := '0';
      edtIndDataEL.Text := '0';
      edtIndDataCourse.Text := '0';
      edtIndDataSpeed.Text := '0';
    end;
    // END IND Data

    IsReturnZero := False;

    FTargetBearing := bearing;
    FTargetElev := aLow;
    edtCtrlDataBeInc.Text := (ftargetbearing - fcurrbearing).ToString();
    edtCtrlDataElInc.Text := (FTargetElev - fcurrelev).ToString();
    edtCtrlDataBeInc1.Text := (ftargetbearing - fcurrbearing).ToString();
    edtCtrlDataElInc1.Text := (FTargetElev - fcurrelev).ToString();
//    edtGpABE1.text := bearing.ToString();
//    edtGpaEL1.Text := alow.ToString();
  end;
end;

procedure TfrmMainFCC.FormCreate(Sender: TObject);
var
  n : Integer;
//  T: TRadarTargetSymbol;
  ShipClassName,
  ShipCallSign: string;
  V: TVehicle;
  rgnOuter, rgnInner: HRGN;
  envSce : tscenario;
  setting: string;
  StartupInfo: TStartupInfo;
begin
  BeginGame_FCC;
  FCCManager := TFCCManager.Create;
  SimCenter := FCCManager;
  SimCenter.FMap := FMap;
  FCCManager.OnPtkCommand := ptkCommand;
  FCCManager.initEvent;

  FNorthAngle := 0;
  FMapCanvas         := TCanvas.Create;
  FMapConverter := TMapXUnitConverter.Create;
  FMapConverter.FMap := FMap;
  FIndexRange := 3;
  FCurrentRange := CRangeOperation[3];
  pnlMap12km.Color := clYellow;

  VehicleMgr := TVehicleManager.Create;
  VehicleMgr.CoordConverter := FMapConverter; // converter MapX kamu

  EnableComposited(pnlSituationZone);
  FBitmapBackground := TBitmap.Create;
  FBitmapBackground.Height := imgBackgrounSituationZone.Height;
  FBitmapBackground.Width := imgBackgrounSituationZone.Width;
  FBitmapBackground.Canvas.Brush.Color := clBlack; // new color
  FBitmapBackground.Canvas.FillRect(
   Rect(
     0,
     0,
     FBitmapBackground.Width,
     FBitmapBackground.Height
    )
  );

  imgBackgrounSituationZone.Picture.Assign(FBitmapBackground);
  imgCompas.Picture.Assign(FBitmapBackground);
  InitializeForm;
//  LoadGeoset('.\data\tcms_map\Indonesia.gst');
  LoadGeoset('..\data\maps\IndonesiaNoGrid.gst');
//  SimCenter.LoadGeoset('.\data\maps\IndonesiaNoGrid.gst');
  setRegionCircle;

//  FRangeRing := TRangeRingsVisual.Create;
//  FRangeRing.Color := clWhite;

  FRings := TRadarRangeRings.Create;
  acbxDisRing.Checked := FRings.Visible;

  // siapkan sectors (contoh sesuai gambar)

  // Blind zone: dua sektor
  case vFccSetting.FccMode of
    1 : //FCC1 Mode
    begin
      AreaBlindZone := TRadarDynamicSector.Create;
      AreaBlindZone.Color := RGB(183,73,40);
      AreaBlindZone.AddSlice(225,240, 0.0, 48000.0); // center–3 km
      AreaBlindZone.AddSlice(120,135,   0.0, 48000.0);

      AreaBlindZone1 := TRadarDynamicSector.Create;
      AreaBlindZone1.Color := RGB(94,90,105);
      AreaBlindZone1.AddSlice(120,225, 0.0, 48000.0); // dari 1–3 km

      AreaGunPoint := TRadarDynamicSector.Create;
      AreaGunPoint.Color := RGB(237,83,93);
      AreaGunPoint.AddSlice(358,2, 0.0, 48000.0); // dari 1–3 km

      AreaPenembakan := TRadarDynamicSector.Create;
      AreaPenembakan.Color := RGB(53,80,75);
      AreaPenembakan.AddSlice(240,120, 0.0, 3000.0); // dari 1–3 km

      acbxShootArea.Checked := AreaPenembakan.Visible;

      AreaTracker := TRadarDynamicSector.Create;
      AreaTracker.Color := RGB(32,70,145);
      AreaTracker.AddSlice(240,120, 3000.0, 17000.0); // dari 1–3 km
      acbxTrackerArea.Checked := AreaTracker.Visible;
    end;
    2 : //FCC2 Mode
    begin
      AreaBlindZone := TRadarDynamicSector.Create;
      AreaBlindZone.Color := RGB(183,73,40);
      AreaBlindZone.AddSlice(30,45, 0.0, 48000.0); // center–3 km
      AreaBlindZone.AddSlice(315,330,   0.0, 48000.0);

      AreaBlindZone1 := TRadarDynamicSector.Create;
      AreaBlindZone1.Color := RGB(94,90,105);
      AreaBlindZone1.AddSlice(330,30, 0.0, 48000.0); // dari 1–3 km

      AreaGunPoint := TRadarDynamicSector.Create;
      AreaGunPoint.Color := RGB(237,83,93);
      AreaGunPoint.AddSlice(177,183, 0.0, 48000.0); // dari 1–3 km

      AreaPenembakan := TRadarDynamicSector.Create;
      AreaPenembakan.Color := RGB(53,80,75);
      AreaPenembakan.AddSlice(45,315, 0.0, 6700.0); // dari 1–3 km

      acbxShootArea.Checked := AreaPenembakan.Visible;

      AreaTracker := TRadarDynamicSector.Create;
      AreaTracker.Color := RGB(32,70,145);
      AreaTracker.AddSlice(45,315, 6700.0, 17000.0); // dari 1–3 km
      acbxTrackerArea.Checked := AreaTracker.Visible;
    end;
  end;


  FNorthInd := TRadarNorthIndicator.Create;

  FShipHeading := 0; // awal

  FBearing0 := TRadarBearing.Create(0, clWhite, '');   // sepertinya ga perlu ada

//  TargetMgr := TRadarTargetManager.Create;
//  TargetMgr.CoordConverter := FMapConverter;

//  T := TargetMgr.AddTarget(112.751, -7.199);
//  T.SetFontSymbol('Segoe UI Symbol', '▲', clLime, clYellow, 10);
//  T.TrackLabel := '001';
//
//  T := TargetMgr.AddTarget(112.760, -7.210);
//  T.CircleRadius := 5;                       // fallback circle
//  T.TrackLabel   := '002';
//
//  T := TargetMgr.AddTarget(112.771, -7.210);
//  T.LoadBitmapFromFile('.\data\Bitmap\AirUnknown.bmp');
//  T.BitmapTintColor := clYellow;
//  t.BitmapTintAlpha := 128;
//  T.TrackLabel   := '003';
//
////  // contoh tambah 2 vehicle
//  V := VehicleMgr.AddVehicle(112.781, -7.199, '004');
//  V.Symbol.SetFontSymbol('Segoe UI Symbol', '▲', clLime, clYellow, 10);
//  V.SetSpeedKts(12);
//  V.HeadingDeg := 45; // NE
//
//  V := VehicleMgr.AddVehicle(112.760, -7.230, '005');
//  // pakai bitmap tint: hitam -> kuning
//  V.Symbol.LoadBitmapFromFile('.\data\Bitmap\SurfaceUnknown.bmp');
//  V.Symbol.BitmapTintColor := RGB(255,255,0); // kuning

  case vFccSetting.FccMode of
    1 : //FCC1 Mode
    begin
      pnlFCC1.BringToFront;
      pnlTrackerFCC1.BringToFront;
      pnlBiteControlFCC1.BringToFront;
      FCurrBearing := 0;
      FCurrElev := 0;
      FTargetBearing := 0;
      FTargetElev := 0;
      LeftDrum := 250;
      RightDrum := 250;
      TargetRoundInDrum := 250;
    end;
    2 : //FCC2 Mode
    begin
      pnlFCC2.BringToFront;
      pnlTrackerFCC2.BringToFront;
      pnlBiteControlFCC2.BringToFront;
      FCurrBearing := 180;
      FCurrElev := 0;
      FTargetBearing := 180;
      FTargetElev := 0;
      LeftDrum := 200;
      RightDrum := 200;
      TargetRoundInDrum := 200;
    end;
  end;

  n := ParamCount ;
  if n < max_param then
  begin
    FCCManager.IsStandAlone := true ;
  end;

  if not FCCManager.IsStandAlone then
  begin
      InitDefault_AllConfigFromInstruktur(pServer_Ip,pServer_Port,
    pDBServer, pDBProto, pDBName, pDBUser,
    pDBPass, pShipID, pCurrentScenID);

    FCCManager.CurrentScenID := pCurrentScenID;
    FCCManager.Server_Ip := pServer_Ip;
    FCCManager.Server_Port := pServer_Port;               //TriD_IP, TriD_Port,
    FCCManager.DBServer := vDbServer.mDBServer;
    FCCManager.DBProto := vDbServer.mDBProto;
    FCCManager.DBName := vDbServer.mDBName;
    FCCManager.DBUser := vDbServer.mDBUser;
    FCCManager.DBPass := vDbServer.mDBPass;
    FCCManager.ShipID := pShipID;
    FCCManager.ClassID := pClassID;

    FCCManager.ServerIp := vBridgeServer.m2D_IP;
    FCCManager.ServerPort := vBridgeServer.m2D_Port;

    FCCManager.InitializeSimulation;

    if DataModule1.InitZDB(vDbServer.mDBServer, vDbServer.mDBProto, vDbServer.mDBName, vDbServer.mDBUser, vDbServer.mDBPass, vDbServer.mDBPort) then
    begin
      FCCManager.ShipClassID  := DataModule1.GetShipType(FCCManager.ShipID, ShipClassName);
      FCCManager.ShipName     := DataModule1.GetShipName(FCCManager.ShipID);
      FCCManager.ShipNumber := DataModule1.GetShipNoById(FCCManager.ShipID);
      FCCManager.ShipCallSign := DataModule1.GetShipCallsignByID(FCCManager.ShipID);

      FCCManager.xShip.UniqueID := dbID_to_UniqueID(FCCManager.ShipID);

//      lblKriName.Caption := 'KRI ' + Meriam57Manager.ShipCallSign + '-' + IntToStr(Meriam57Manager.ShipNumber);
    end;
    FCCManager.Env_Map := DataModule1.GetMapById(FCCManager.CurrentScenID);

    FCCManager.Get57WeaponAssigned;

//
//    if Assigned(FCCManager.AssignedWeapon) then
//    begin
//      FTargetAngleKolonka := Meriam57Manager.AssignedWeapon.Pos_H;
//      FAngleKolonka := Meriam57Manager.AssignedWeapon.Pos_H;
//
//      edtTraining.Text := FormatFloat('0.00', FTargetAngleKolonka);
//    end;
    FireAllow := True;
    rgnOuter := CreateRectRgn(0,0,Width,Height);
    rgnInner := CreateRectRgn(825,1,1280,413);

    CombineRgn(rgnOuter, rgnOuter, rgnInner, RGN_DIFF);
    SetWindowRgn(Handle, rgnOuter, True);

    FCCManager.Running := True;
  end;

  setting:= TFile.ReadAllText('settings.json', TEncoding.UTF8); // load json
  TgoBsonSerializer.Deserialize(setting, config);
  config.Video := FCCManager.ShipID.ToString() + '_' + FCCManager.AssignedWeapon.IDWeapon.ToString();
  // tambahkan kodingan untuk mengganti config.Host, config.Video, config.PosX, config.PosY, config.Width, config.Height
  // untuk testing awal tidak perlu diubah dulu
  TgoBsonSerializer.Serialize(config, setting);
  tfile.WriteAllText('settings.json', setting, TEncoding.UTF8); // save json before launch

  envSce := TScenario.Create;
  DataModule1.GetScenarioDefByID(FCCManager.CurrentScenID, envSce);
  edtWeatherDataWs.Text := envSce.Scenario_WindSpeed.ToString();
  edtWeatherDataWd.Text := envSce.Scenario_WindDir_Deg.ToString();
  edtWeatherDataTemp.Text := envSce.Scenario_Temperature.ToString();
  edtWeatherDataHumi.Text := envSce.Scenario_Humidity.ToString();
  edtWeatherDataAirP.Text := envSce.Scenario_BaroPressure.ToString();
  envSce.Free;

  FIsWeatherAuto := True;
  FIsNavAuto := True;
  FireTime := 1.00;
  FireTimeMS := 1000;

  FMap.ZoomTo((Self.FCurrentRange  * 0.0008) * 2, FMap.CenterX, FMap.CenterY);

  ZeroMemory(@ExecInfo, SizeOf(ExecInfo));
  ExecInfo.cbSize := SizeOf(ExecInfo);
  ExecInfo.fMask := SEE_MASK_NOCLOSEPROCESS; // <-- penting!
  ExecInfo.Wnd := Handle;
  ExecInfo.lpVerb := 'open';
  ExecInfo.lpFile := PChar('Viewer.exe');
  ExecInfo.nShow := SW_SHOW;

  if not ShellExecuteEx(@ExecInfo) then
    RaiseLastOSError;

  ZeroMemory(@ExecPTK, SizeOf(ExecPTK));
  ExecPTK.cbSize := SizeOf(ExecPTK);
  ExecPTK.fMask := SEE_MASK_NOCLOSEPROCESS; // <-- penting!
  ExecPTK.Wnd := Handle;
  ExecPTK.lpVerb := 'open';
  ExecPTK.lpFile := PChar('PTK.exe');
  ExecPTK.nShow := SW_SHOW;

  if not ShellExecuteEx(@ExecPTK) then
    RaiseLastOSError;
end;

procedure TfrmMainFCC.FormDestroy(Sender: TObject);
var
  i : Integer;
begin

  TerminateProcess(ExecInfo.hProcess, 0);
  CloseHandle(ExecInfo.hProcess);
  ExecInfo.hProcess := 0;

  TerminateProcess(ExecPTK.hProcess, 0);
  CloseHandle(ExecPTK.hProcess);
  ExecPTK.hProcess := 0;
//  FRangeRing.Free;
  VehicleMgr.Free;
  FCCManager.FinalizeSimulation;

  BitMapLampGrey.Free;
  BitMapLampGreen.Free;
  BitMapLampRed.Free;

  FNorthInd.Free;
  FBearing0.Free;

  AreaGunPoint.Free;
  AreaBlindZone1.Free;
  AreaTracker.Free;
  AreaBlindZone.Free;
  AreaPenembakan.Free;

  FRings.Free;

  FMapCanvas.Free;

  FCCManager.Free;
end;

procedure TfrmMainFCC.FormPaint(Sender: TObject);
begin
  DrawAngle(imgBackgrounSituationZone.Canvas);
  DrawCompas(imgCompas.Canvas);
end;

procedure TfrmMainFCC.FormShow(Sender: TObject);
//var
begin
//  WebTest.Navigate('https://www.google.com');
//  WebTest.Navigate('http://192.168.0.193:8000/index.html');
//  if WebTest.Document <> nil then
//  begin
//    Doc := WebTest.Document as IHTMLDocument2;
//    Win := Doc.parentWindow;
//    Win.execScript(Script, 'JavaScript');
//  end;

  // jalankan chrome

//  RunAppInPanel(pnlBaseVideoZone, 'C:\Program Files\Google\Chrome\Application\chrome.exe',
//    '--app="https://google.com"');

  // tunggu window chrome muncul
//  Sleep(500);

  // temukan window chrome
//  WindowHandle := FindWindow('Chrome_WidgetWin_1', nil);
//
//  if WindowHandle <> 0 then
//  begin
//    // set parent ke panel
//    Winapi.Windows.SetParent(WindowHandle, pnlBaseVideoZone.Handle);
//
//    // sesuaikan posisi
//    SetWindowLong(WindowHandle, GWL_STYLE, WS_VISIBLE);
//    SetWindowPos(WindowHandle, 0, 0, 0, pnlBaseVideoZone.Width, pnlBaseVideoZone.Height,
//                 SWP_NOZORDER or SWP_SHOWWINDOW);
//  end;
  FSelectedVehicleState := False;
  DAttackState := False;
end;

procedure TfrmMainFCC.HandleKeyByBtnName(const BtnName: string);
var
  Token: string;
  C: Char;
  RecSend : TRec3DSetWCC;
begin
  Token := ExtractToken(BtnName);

  if Token = '' then Exit;

  if (Token <> 'DAttack') then
  begin
    DAttackState := False;
  end;

  if (Token = 'SysCtrl') then
  begin
    pnlSysCtrl.Caption := 'Sys Ctrl';
  end
  else if (Token = 'LocalCtrl') then
  begin
    pnlSysCtrl.Caption := 'Local Ctrl';
  end
  else if (Token = 'Check') then
  begin
    pnlCombatLs.Caption := 'Check';
  end
  else if (Token = 'Combat') then
  begin
    pnlCombatLs.Caption := 'Combat';
  end
  else if (Token = 'Wait') then
  begin
    pnlWaitLs.Caption := 'Wait';
  end
  else if (Token = 'Ind') then
  begin
    pnlWaitLs.Caption := 'IND';
  end
  else if (Token = 'Autonomous') then
  begin
    pnlWaitLs.Caption := 'Autonomous';
  end
  else if (Token = 'DAttack') then
  begin
    pnlWaitLs.Caption := 'D.Attack';
    DAttackState := True;
  end
  else if (Token = 'VFire') then
  begin
    pnlWaitLs.Caption := 'V.Fire';
  end
  else if (Token = 'LDrum') then
  begin
    DrumPosState := False;
    TargetRoundInDrum := LeftDrum;
  end
  else if (Token = 'RDrum') then
  begin
    DrumPosState := True;
    TargetRoundInDrum := RightDrum;
  end
  else if (Token = 'High') then
  begin
    pnlGpRate.Caption := 'High';
    HighFR := True;
    MiddleFR := False;
    LowFR := False;

  end
  else if (Token = 'Middle') then
  begin
    pnlGpRate.Caption := 'Middle';
    HighFR := False;
    MiddleFR := True;
    LowFR := False;

  end
  else if (Token = 'Low') then
  begin
    pnlGpRate.Caption := 'Low';
    HighFR := False;
    MiddleFR := False;
    LowFR := True;

  end
  else if (Token = 'ServoOn') then
  begin
    if IsServoOn then
    begin
      IsServoOn := False;
      imgGunStateServoFCC2.Picture.Bitmap := BitMapLampRed;
      imgGunStateServo.Picture.Bitmap := BitMapLampRed;
    end
    else
    begin
      IsServoOn := True;
      imgGunStateServoFCC2.Picture.Bitmap := BitMapLampGreen;
      imgGunStateServo.Picture.Bitmap := BitMapLampGreen;
    end;
  end
  else if (Token = 'ReturnZero') then
  begin
    // Send Deassign ke 3D, matikan tracked sama aimed dan nyalain return zero
    IsReturnZero := True;
    FSelectedVehicleState := False;
//    FCCManager.SelectedVehicle.

    case vFccSetting.FccMode of
      1 : //FCC1 Mode
      begin
        FTargetBearing := 0;
        imgGunStateReturnZero.Picture.Bitmap := BitMapLampGreen;
        imgCtrlStateTracked.Picture.Bitmap := BitMapLampGrey;
      end;
      2 : //FCC2 Mode
      begin
        FTargetBearing := 180;
        imgGunStateReturnZeroFCC2.Picture.Bitmap := BitMapLampGreen;
        imgCtrlStateTrackedFCC2.Picture.Bitmap := BitMapLampGrey;
      end;
    end;

    FTargetElev := 0;
    edtCtrlDataBeInc.Text := (0 - fcurrbearing).ToString();
    edtCtrlDataElInc.Text := (0 - fcurrelev).ToString();
    edtCtrlDataBeInc1.Text := (0 - fcurrbearing).ToString();
    edtCtrlDataElInc1.Text := (0 - fcurrelev).ToString();

    RecSend.ShipID              := FCCManager.ShipID;
    RecSend.mWeaponID           := FCCManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID         := 0;
    RecSend.mMissileID          := 0;
    RecSend.mMissileNumber      := 0;
    RecSend.mOrderID            := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := 0;

    RecSend.mModeID             := 0;
    RecSend.mAutoCorrectElev    := 0;
    RecSend.mAutoCorrectBearing := 0;

    RecSend.mBalistikID         := 0;
    RecSend.mSalvoRate          := 0;


    RecSend.mOrderID := __ORD_CANNON_DEASSIGNED;
    FCCManager.NetSendTo3D_OrderCannon(RecSend);
  end
  else if (Token = 'CalSetting') or (Token = 'btnCalSetting') or (Token = 'btn_CalSetting')  then
  begin
    pnlCalSetting.BringToFront;
    edtDeltaBESetting.SetFocus;
    activePanel := 1;
  end
  else if (Token = 'WeatherSetting') or (Token = 'btnWeatherSetting') or (Token = 'btn_WeatherSetting')  then
  begin
    edtWeatherSettingWs.Text := edtWeatherDataWs.Text;
    edtWeatherSettingWd.Text := edtWeatherDataWd.Text;
    edtWeatherSettingTemp.Text := edtWeatherDataTemp.Text;
    edtWeatherSettingHumi.Text := edtWeatherDataHumi.Text;
    edtWeatherSettingAirP.Text := edtWeatherDataAirP.Text;

    onRbWeatherSetting(Self);

    pnlWeatherSetting.BringToFront;
//    edtWeatherSettingWs.SetFocus;
    activePanel := 2;
  end
  else if (Token = 'avSetting') or (Token = 'btnNavSetting') or (Token = 'btn_NavSetting')  then
  begin
    edtNavSettingHeading.Text := edtNavDataHeading.Text;
    edtNavSettingPitch.Text := edtNavDataPitch.Text;
    edtNavSettingLON.Text := edtNavDataLON.Text;
    edtNavSettingALT.Text := '0.00';
    edtNavSettingSpeed.Text := edtNavDataSpeed.Text;
    edtNavSettingRoll.Text := edtNavDataRoll.Text;
    edtNavSettingLAT.Text := edtNavDataLAT.Text;

    onRbNavSetting(Self);

    pnlNavSetting.BringToFront;

    activePanel := 3;
  end
  else if (Token = 'RrSetting') or (Token = 'btnRrSetting') or (Token = 'btn_RrSetting')  then
  begin // harus bikin global variabel buat left drum dan right drum fcc 1 dan fcc 2
    edtRRSettingLeftDrum.Text := leftdrum.ToString();
    edtRRSettingRightDrum.Text := rightdrum.ToString();

    pnlRRSetting.BringToFront;
    edtRRSettingLeftDrum.SetFocus;
    activePanel := 4;
  end
  else if (Token = 'TimeSetting') or (Token = 'btnTimeSetting') or (Token = 'btn_TimeSetting')  then
  begin
    edtTimeSettingTime.Text := FormatFloat('0.00', StrToFloat(pnlGpTime.Caption));

    pnlTimeSetting.BringToFront;
    edtTimeSettingTime.SetFocus;

    activePanel := 5;
  end
  else if (Token = 'DAttackSetting') or (Token = 'btnDAttackSetting') or (Token = 'btn_DAttackSetting')  then
  begin
//    edtTimeSettingTime.Text := FormatFloat('0.00', StrToFloat(pnlGpTime.Caption));

    pnlDAttackSetting.BringToFront;
    edtLonDirectAttack.SetFocus;

    activePanel := 6;
  end
  else if (Token = 'btnVFireSetting')  then
  begin
    fireClick;
  end
  else if Token = 'Confirm' then
  begin
    case activePanel of
      1: //cal setting
      begin
        edtLastDeltaBE.Text := FormatFloat('0.00', StrToFloat(edtDeltaBESetting.Text));
        edtLastDeltaEL.Text := FormatFloat('0.00', StrToFloat(edtDeltaELSetting.Text));
        edtLastDeltaD.Text := FormatFloat('0.00', StrToFloat(edtDeltaDSetting.Text));

        edtLastDeltaBE1.Text := FormatFloat('0.00', StrToFloat(edtDeltaBESetting.Text));
        edtLastDeltaEL1.Text := FormatFloat('0.00', StrToFloat(edtDeltaELSetting.Text));
        edtLastDeltaD1.Text := FormatFloat('0.00', StrToFloat(edtDeltaDSetting.Text));
        pnlIndWth.BringToFront;
      end;
      2: // weather setting
      begin
        edtWeatherDataWs.Text := edtWeatherSettingWs.Text;
        edtWeatherDataWd.Text := edtWeatherSettingWd.Text;
        edtWeatherDataTemp.Text := edtWeatherSettingTemp.Text;
        edtWeatherDataHumi.Text := edtWeatherSettingHumi.Text;
        edtWeatherDataAirP.Text := edtWeatherSettingAirP.Text;
        pnlIndWth.BringToFront;
      end;
      3: // Nav Setting
      begin
        edtNavDataHeading.Text := edtNavSettingHeading.Text;
        edtNavDataPitch.Text := edtNavSettingPitch.Text;
        edtNavDataRoll.Text := edtNavSettingRoll.Text;
        edtNavDataLON.Text := edtNavSettingLON.Text;
        edtNavDataLAT.Text := edtNavSettingLAT.Text;
        pnlIndWth.BringToFront;
      end;
      4: // RR Setting
      begin
        if not DrumPosState then
          TargetRoundInDrum := StrToInt(edtRRSettingLeftDrum.Text)
        else
          TargetRoundInDrum := StrToInt(edtRRSettingRightDrum.Text);
        LeftDrum := StrToInt(edtRRSettingLeftDrum.Text);
        RightDrum := StrToInt(edtRRSettingRightDrum.Text);
        pnlIndWth.BringToFront;
      end;
      5: // Time Setting
      begin
        FireTime := StrToFloat(edtTimeSettingTime.Text);
        FireTimeMS :=  Round(FireTime * 1000);
        pnlGpTime.Caption := FormatFloat('0.00', FireTime);
        pnlIndWth.BringToFront;
      end;
      6: // D.Attack Setting
      begin
        pnlIndWth.BringToFront;
      end;
    end;
  end
  else if Token = 'Cancel' then
  begin
    pnlIndWth.BringToFront;

    if activePanel = 6 then
    begin
      edtLonDirectAttack.Text := '0.00000000';
      edtLatDirectAttack.Text := '0.00000000';
      edtAltDirectAttack.Text := '0';
    end;
  end;
  if not (ActiveControl is TEdit) then Exit;

  // ---------------- LETTERS ----------------
  if (Length(Token) = 1) and (Token[1] in ['A'..'Z']) then
  begin
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord(Token[1]), 0);
    Exit;
  end;

  // ---------------- NUMBERS ----------------
  if (Length(Token) = 1) and (Token[1] in ['0'..'9']) then
  begin
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord(Token[1]), 0);
    Exit;
  end;

  // ---------------- SPECIAL TOKENS ----------------
  if Token = 'Dot' then
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord('.'), 0)

  else if Token = 'Minus' then
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord('-'), 0)

  else if Token = 'Plus' then
    PostMessage(ActiveControl.Handle, WM_CHAR, Ord('+'), 0)

  else if Token = 'Backspace' then
    PostMessage(ActiveControl.Handle, WM_CHAR, VK_BACK, 0)

  else if Token = 'Del' then
  begin
      PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_DELETE, 0);
      PostMessage(ActiveControl.Handle, WM_KEYUP, VK_DELETE, 0);
  end

  else if Token = 'Enter' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_RETURN, 0)

  else if Token = 'Cancel' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_ESCAPE, 0)

  else if Token = 'Confirm' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_RETURN, 0)

  // ---------------- ARROWS ----------------
  else if Token = 'Up' then
    SelectNext(ActiveControl, False, True)

  else if Token = 'Down' then
    SelectNext(ActiveControl, True, True)

  else if Token = 'Left' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_LEFT, 0)

  else if Token = 'Right' then
    PostMessage(ActiveControl.Handle, WM_KEYDOWN, VK_RIGHT, 0)



end;


procedure TfrmMainFCC.imgCompasClick(Sender: TObject);
begin
  if Assigned(FCCManager) then
  begin
    FCCManager.IsTrueMotion := not FCCManager.IsTrueMotion;
  end;
end;

procedure TfrmMainFCC.InitializeForm;
//var
//envSce : TScenario;
begin
  // light from image list
  //  0 grey
  //  1 green
  //  2 red
  //  3 grey
  //  4 green
  //  5 red
  //  6 yellow

//  BitMapLampGrey
  BitMapLampGrey := TBitmap.Create;
  BitMapLampGreen := TBitmap.Create;
  BitMapLampRed := TBitmap.Create;
  imgListLight.GetBitmap(0, BitMapLampGrey);
  imgListLight.GetBitmap(1, BitMapLampGreen);
  imgListLight.GetBitmap(2, BitMapLampRed);

  case vFccSetting.FccMode of
    1: //FCC1
    begin
      //  initialize panel indikator control state
      imgCtrlStateFCC.Picture.Bitmap := BitMapLampGreen;
      imgCtrlStateTracked.Picture.Bitmap := BitMapLampGreen;
      imgCtrlStateDataReady.Picture.Bitmap := BitMapLampGrey;
      imgCtrlStateAimed.Picture.Bitmap :=  BitMapLampGrey;
      imgCtrlStateLimitZone.Picture.Bitmap := BitMapLampGreen;
      imgCtrlStateFireAllow.Picture.Bitmap := BitMapLampGreen;
      imgCtrlStateFiring.Picture.Bitmap := BitMapLampGrey;

      //  initialize panel indikator Gun state
      imgGunStateCtrlBy.Picture.Bitmap := BitMapLampGreen;
      imgGunStateServo.Picture.Bitmap := BitMapLampRed;
      imgGunStateFC.Picture.Bitmap := BitMapLampGreen;
      imgGunStateReturnZero.Picture.Bitmap := BitMapLampGrey;

      //  initialize panel indikator Bite Device state
      imgBiteDvcStateFCC.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcState730B.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateEO.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateTR.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateTCC.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateSIE.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateSR.Picture.Bitmap := BitMapLampGreen;
    end;
    2: //FCC2
    begin
      //  initialize panel indikator control state
      imgCtrlStateFCC2.Picture.Bitmap :=  BitMapLampGreen;
      imgCtrlStateTrackedFCC2.Picture.Bitmap := BitMapLampGrey;
      imgCtrlStateDataReadyFCC2.Picture.Bitmap := BitMapLampGrey;
      imgCtrlStateAimedFCC2.Picture.Bitmap := BitMapLampGrey;
      imgCtrlStateLimitZoneFCC2.Picture.Bitmap := BitMapLampGreen;
      imgCtrlStateFireAllowFCC2.Picture.Bitmap := BitMapLampGreen;
      imgCtrlStateFiringFCC2.Picture.Bitmap := BitMapLampGrey;

      //  initialize panel indikator Gun state
      imgGunStateCtrlByFCC2.Picture.Bitmap := BitMapLampGreen;
      imgGunStateServoFCC2.Picture.Bitmap := BitMapLampRed;
      imgGunStateFCFCC2.Picture.Bitmap := BitMapLampGrey;
      imgGunStateReturnZeroFCC2.Picture.Bitmap := BitMapLampGrey;

      //  initialize panel indikator Bite Device state
      imgBiteDvcStateFCC2.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcState57.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateEOFcc2.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateTRFcc2.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateTCCFcc2.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateSIEFcc2.Picture.Bitmap := BitMapLampGreen;
      imgBiteDvcStateSRFcc2.Picture.Bitmap := BitMapLampGreen;
    end;
  end;

//  envSce := TScenario.Create;
//  DataModule1.GetEnviBySceID(FCCManager.CurrentScenID, envSce);
//  edtWeatherDataWs.Text := envSce.Scenario_WindSpeed.ToString();
//  edtWeatherDataWd.Text := envSce.Scenario_WindDir_Deg.ToString();
//  edtWeatherDataTemp.Text := envSce.Scenario_Temperature.ToString();
//  edtWeatherDataHumi.Text := envSce.Scenario_Humidity.ToString();
//  edtWeatherDataAirP.Text := envSce.Scenario_BaroPressure.ToString();
//  envSce.Free;

end;

procedure TfrmMainFCC.LoadGeoset(const aGst: string);
var i: integer;
  z: OleVariant;
  mInfo : CMapXLayerInfo;
begin

  InitOleVariant(z);
  FMap.Layers.RemoveAll;

  if (aGst <> '') and  FileExists(aGst) then begin
    FMap.Geoset := aGst;
    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw ;
    mInfo.AddParameter('Name', 'Animation');
    FLyrDraw := FMap.Layers.Add(mInfo, 1);
    FMap.Layers.AnimationLayer := FLyrDraw;
    FMap.BackColor := CBackgroundMapColor;
    FMap.MapUnit := miUnitNauticalMile;
    FMap.CenterX := 112.75;
    fmap.CenterY := -7.2;
    FMap.ZoomTo((Self.FCurrentRange  * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);
  end
end;

function TfrmMainFCC.MeterHeight: Integer;
begin
  Result := FMap.Height;
end;

function TfrmMainFCC.MeterWidth: Integer;
begin
  Result := FMap.width;
end;

procedure TfrmMainFCC.onRbNavSetting(Sender: TObject);
begin
  if rbNavAuto.Checked then
  begin
    edtNavSettingHeading.Text := FormatFloat('0.00', FCCManager.xShip.Heading);
    edtNavSettingPitch.Text := FormatFloat('0.00', FCCManager.xShip.Pitch);
    edtNavSettingLON.Text := FormatFloat('0.000000', FCCManager.xShip.PositionX);
    edtNavSettingALT.Text := FormatFloat('0.00', FCCManager.xShip.PositionZ);
    edtNavSettingSpeed.Text := FormatFloat('0.00', FCCManager.xShip.Speed);
    edtNavSettingRoll.Text := FormatFloat('0.00', FCCManager.xShip.Roll);
    edtNavSettingLAT.Text := FormatFloat('0.000000', FCCManager.xShip.PositionY);

    edtNavSettingHeading.Enabled := False;
    edtNavSettingPitch.Enabled := False;
    edtNavSettingLON.Enabled := False;
    edtNavSettingALT.Enabled := False;
    edtNavSettingSpeed.Enabled := False;
    edtNavSettingRoll.Enabled := False;
    edtNavSettingLAT.Enabled := False;

    FIsNavAuto := True;
  end;


  if rbNavrManual.Checked then
  begin
    edtNavSettingHeading.Enabled := True;
    edtNavSettingPitch.Enabled := True;
    edtNavSettingLON.Enabled := True;
    edtNavSettingALT.Enabled := True;
    edtNavSettingSpeed.Enabled := True;
    edtNavSettingRoll.Enabled := True;
    edtNavSettingLAT.Enabled := True;

    edtNavSettingHeading.setfocus;

    FIsNavAuto := False;
  end;

end;

procedure TfrmMainFCC.onRbWeatherSetting(Sender: TObject);
var
envSce : TScenario;
begin
  if rbWeatherAuto.Checked then
  begin
    envSce := TScenario.Create;
    DataModule1.GetScenarioDefByID(FCCManager.CurrentScenID, envSce);
    edtWeatherSettingWs.Text := envSce.Scenario_WindSpeed.ToString();
    edtWeatherSettingWd.Text := envSce.Scenario_WindDir_Deg.ToString();
    edtWeatherSettingTemp.Text := envSce.Scenario_Temperature.ToString();
    edtWeatherSettingHumi.Text := envSce.Scenario_Humidity.ToString();
    edtWeatherSettingAirP.Text := envSce.Scenario_BaroPressure.ToString();
    envSce.Free;
    edtWeatherSettingWs.Enabled := False;
    edtWeatherSettingWd.Enabled := False;
    edtWeatherSettingTemp.Enabled := False;
    edtWeatherSettingHumi.Enabled := False;
    edtWeatherSettingAirP.Enabled := False;

    FIsWeatherAuto := True;
  end;

  if rbWeatherManual.Checked then
  begin

    edtWeatherSettingWs.Enabled := True;
    edtWeatherSettingWd.Enabled := True;
    edtWeatherSettingTemp.Enabled := True;
    edtWeatherSettingHumi.Enabled := True;
    edtWeatherSettingAirP.Enabled := True;

    edtWeatherSettingWs.SetFocus;

    FIsWeatherAuto := False;
  end;
end;

procedure TfrmMainFCC.pnlFireFcc2Click(Sender: TObject);
var
  RecSend : TRec3DSetWCC;
  aLow, aHigh: Double;
  range,rangem, bearing : Double;
  bmp: TBitmap;
  RoundToShoot : Integer;
begin
  if Assigned(FCCManager.SelectedVehicle) then
  begin
    if DAttackState then
    begin
      DAttackFire;
      Exit;
    end;

    if not InsideZone then
    Exit;
    range := CalcRange(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    rangem := range * C_NauticalMile_To_Metre;
    bearing := CalcBearing(FCCManager.xShip.PositionX, FCCManager.xShip.PositionY, FCCManager.SelectedVehicle.PosX, FCCManager.SelectedVehicle.PosY);
    // range = 3000 m, target lebih rendah 25 m
    ComputeBallisticAngleVacuum(rangem, FCCManager.SelectedVehicle.PosZ, 800, aLow, aHigh);

    RecSend.ShipID          := FCCManager.ShipID;
    RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID     := 0;
    RecSend.mMissileID      := 0;
    RecSend.mMissileNumber  := 0;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID);

    case vFccSetting.FccMode of
      1 : //FCC1 Mode
      begin
        RecSend.mModeID             := 3;
      end;
      2 : //FCC2 Mode
      begin
        RecSend.mModeID             := 1;
      end;
    end;
    RecSend.mAutoCorrectElev    := aLow;
    RecSend.mAutoCorrectBearing := bearing;

    RecSend.mBalistikID         := 0;
    RecSend.mSalvoRate          := 30;

    if (not DrumPosState) and (LeftDrum = 0) then // kalau left drum kosong, langsung exit, jangan fire
    begin
      Exit;
    end
    else if (DrumPosState) and (RightDrum = 0) then // kalau right drum kosong, langsung exit
    begin
      Exit;
    end;
    RecSend.mOrderID := __ORD_CANNON_START_F;
    FCCManager.NetSendTo3D_OrderCannon(RecSend);

//    IsFiring := True;

    imgCtrlStateFiringFCC2.Picture.Bitmap := BitMapLampGreen;
    imgCtrlStateFiring.Picture.Bitmap := BitMapLampGreen;

    // PEMISAH ANTARA START FIRE AND STOP FIRE

    RecSend.ShipID          := FCCManager.ShipID;
    RecSend.mWeaponID       := FCCManager.AssignedWeapon.IDWeapon;
    RecSend.mLauncherID     := 0;
    RecSend.mMissileID      := 0;
    RecSend.mMissileNumber  := 0;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := UniqueID_To_dbID(FCCManager.SelectedVehicle.UniqueID);

    RoundToShoot := 0;
    case vFccSetting.FccMode of
      1 : //FCC1 Mode
      begin
        RecSend.mModeID             := 3;

        RoundToShoot := Round(firetime * 35);
        if not DrumPosState then // kurangi left drum
        begin
          if RoundToShoot <= LeftDrum then
          begin
            ActualFireTimeMS := Round(RoundToShoot/35);
          end
          else
          begin
            RoundToShoot := LeftDrum;
            ActualFireTimeMS := FireTimeMS;
          end;
        end
        else if DrumPosState then // kurangi right drum
        begin
          if RoundToShoot <= RightDrum then
          begin
            ActualFireTimeMS := Round(RoundToShoot/35);
          end
          else
          begin
            RoundToShoot := RightDrum;
            ActualFireTimeMS := FireTimeMS;
          end;
        end;


        if not DrumPosState then // kurangi left drum
        begin
          TargetRoundInDrum := LeftDrum - RoundToShoot;
        end
        else if DrumPosState then // kurangi right drum
        begin
          TargetRoundInDrum := RightDrum - RoundToShoot;
        end;
        pnlFire.Enabled := False;
        pnlFireFcc2.Enabled := False;
//        Sleep(1000);
        Application.ProcessMessages;
        Sleep(ActualFireTimeMS);

      end;
      2 : //FCC2 Mode
      begin
        RecSend.mModeID             := 1;
        Application.ProcessMessages;
        pnlFire.Enabled := False;
        pnlFireFcc2.Enabled := False;
//        Sleep(1000);
//        if  (edtLowRR.Text = '0') or (edtHighRR.text = '0') then
//          Exit;
        RoundToShoot := Round(firetime * 4);
        if not DrumPosState then // kurangi left drum
        begin
          if RoundToShoot <= LeftDrum then
          begin
            ActualFireTimeMS := Round(RoundToShoot/4);
          end
          else
          begin
            RoundToShoot := LeftDrum;
            ActualFireTimeMS := FireTimeMS;
          end;
        end
        else if DrumPosState then // kurangi right drum
        begin
          if RoundToShoot <= RightDrum then
          begin
            ActualFireTimeMS := Round(RoundToShoot/4);
          end
          else
          begin
            RoundToShoot := RightDrum;
            ActualFireTimeMS := FireTimeMS;
          end;
        end;

//        Sleep(500);

        if not DrumPosState then // kurangi left drum
        begin
          TargetRoundInDrum := LeftDrum - RoundToShoot;
        end
        else if DrumPosState then // kurangi right drum
        begin
          TargetRoundInDrum := RightDrum - RoundToShoot;
        end;

        pnlFire.Enabled := False;
        pnlFireFcc2.Enabled := False;
        Application.ProcessMessages;
        Sleep(Round(FireTimeMS));

//        Sleep(Round(FireTimeMS/2));
//        if not DrumPosState then // kurangi left drum
//        begin
//          TargetRoundInDrum := LeftDrum - 4;
//        end
//        else if DrumPosState then // kurangi right drum
//        begin
//          TargetRoundInDrum := RightDrum - 4;
//        end
      end;
    end;
    RecSend.mAutoCorrectElev    := aLow;
    RecSend.mAutoCorrectBearing := bearing;

    RecSend.mBalistikID         := 0;
    RecSend.mSalvoRate          := 30;


    RecSend.mOrderID := __ORD_CANNON_STOP_F;
    FCCManager.NetSendTo3D_OrderCannon(RecSend);

    pnlFire.Enabled := True;
    pnlFireFcc2.Enabled := True;

//    IsFiring := false;

    imgCtrlStateFiringFCC2.Picture.Bitmap := BitMapLampGrey;
    imgCtrlStateFiring.Picture.Bitmap := BitMapLampgrey;
  end;
end;

procedure TfrmMainFCC.pnlMapRangeClick(Sender: TObject);
begin
  ResetColorRange;
  TPanel(Sender).Color := clYellow;

  Self.FIndexRange := TPanel(Sender).Tag;
  self.FCurrentRange := CRangeOperation[TPanel(Sender).Tag];
//  FMap.ZoomTo((Self.FCurrentRange  * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);
  FMap.ZoomTo((Self.FCurrentRange  * 0.0008) * 2, FMap.CenterX, FMap.CenterY);
end;

procedure TfrmMainFCC.ptkCommand(const str: string);
begin
  HandleKeyByBtnName(str);
end;

procedure TfrmMainFCC.ResetColorRange;
begin
  pnlMap1point5km.Color := clAqua;
  pnlMap3km.Color := clAqua;
  pnlMap6km.Color := clAqua;
  pnlMap12km.Color := clAqua;
  pnlMap24km.Color := clAqua;
  pnlMap48km.Color := clAqua;
end;

function TfrmMainFCC.Rotate(Width, Height, Radius: Integer;
  Degrees: Double): Winapi.Windows.TPoint;
var
  Angle: Double;
  W, H: Integer;
//  HeadingView : THeadingRadarView;
begin
//  if Assigned(NavSimCenter.NAV_Radar.HeadingView) then
//  begin
//   HeadingView := uRadarNavManager.NavSimCenter.NAV_Radar.getHeadingLine;
//   if HeadingView.HeadingMode = sbmCourseUp then
//   begin
//       Angle := HeadingView.Heading;
//       if Angle < 0 then Angle := CBaseAngle - Angle;
//       Angle := CBaseAngle - Angle;
//       Angle := ConvCompass_To_Cartesian(Angle);
//       Angle := ConvCustomAngleStart(degrees,Angle);
//       Angle := Angle*C_DegToRad;
//   end
//   else
//   //if HeadingView.HeadingMode = sbmCourseUp then
//      Angle  := ConvCartesian_To_Compass(Degrees)*C_DegToRad;
//  end
//  else
     Angle := ConvCartesian_To_Compass(Degrees)*C_DegToRad;

  W := Width div 2;
  H := Height div 2;
  Result.X := W + Round(Cos(Angle) * Radius);
  Result.Y := H + Round(Sin(Angle) * Radius);
  Result.Y := (H * 2) - Result.Y;
end;

procedure TfrmMainFCC.setRegionCircle;
const brd = 30;
var eRgn: HRGN;
    r : TRect;
    rcxMap, rcyMap: integer;
    left,top,right,bottom : Integer;
    diffBeetwinWH : Integer;  //differnt beetwin width and height width - height, kemudian dibagi dua sebagai batas left dan right,supaya lingkarannya tetap center.
begin
  rCXMap := FMap.Width  shr 1;
  rCYMap := FMap.Height shr 1;

//  r := Rect(222,50, FMap.Height + 110, FMap.Height - 50);
  diffBeetwinWH := (pnlSituationZone.Width - pnlSituationZone.Height) div 2;

  top := 50;
  bottom := pnlSituationZone.Height - top;
  left := diffBeetwinWH + top;
  right := pnlSituationZone.Width - left;

  FCircleRect  := Rect(left,top, right, bottom);

  eRgn := CreateEllipticRgn(FCircleRect.Left, FCircleRect.Top, FCircleRect.Right, FCircleRect.Bottom);
  SetWindowRgn(FMap.Handle, eRgn, true);

  // center & radius dalam koordinat FMap (DC yang dipakai DrawUserLayer)
  FCircleCX := (FCircleRect.Left + FCircleRect.Right) div 2;
  FCircleCY := (FCircleRect.Top  + FCircleRect.Bottom) div 2;
  FCircleR  := (FCircleRect.Right - FCircleRect.Left) div 2;

  //global Form Koord
  rCx := rcxMap - FMap.Left;
  rCy := rCYMap + FMap.Top;
end;

procedure TfrmMainFCC.ShowInfoCursor(const x, y: integer);
var
  mx, my: double;
  sx, sy: single;
  z: double;
  s: string;
begin
  sx := x;
  sy := y;

  FMap.ConvertCoord(sx, sy, mx, my, miScreenToMap);

  lblMapLon.Caption := 'LON ' + FormatFloat('0.000', mx);
  lblMapLat.Caption := 'LAT ' + FormatFloat('0.000', my);
end;

procedure TfrmMainFCC.tmrUpdateFormTimer(Sender: TObject);
begin
//  if FNorthAngle < 360 then
//    Inc(FNorthAngle)
//  else
//    FNorthAngle := 0;

  imgCompas.Repaint;

  lblBiteTimeSystemValue.Caption := FormatDateTime('hh:nn:ss',now);

  if Assigned(FCCManager) then
  begin
    if FIsNavAuto then
    begin
      if Assigned(FCCManager.xShip) then
      begin
        edtNavDataLAT.Text := FormatFloat('0.000000', FCCManager.xShip.PositionY);
        edtNavDataLON.Text := FormatFloat('0.000000', FCCManager.xShip.PositionX);
        edtNavDataSpeed.Text := FormatFloat('0.00', FCCManager.xShip.Speed);
        edtNavDataHeading.Text := FormatFloat('0.00', FCCManager.xShip.Heading);
        edtNavDataPitch.Text := FormatFloat('0.00', FCCManager.xShip.Pitch);
        edtNavDataRoll.Text := FormatFloat('0.00', FCCManager.xShip.Roll);
//        edtNavDataVoyage.Text := FormatFloat('0.00', FCCManager.xShip.);

        if not FCCManager.IsTrueMotion then begin
          Fmap.CenterX := FCCManager.xShip.PositionX;
          Fmap.CenterY := FCCManager.xShip.PositionY;
        //    FMap.Rotation := 0;
          FNorthAngle := 0;
        end
        else
        begin
          FNorthAngle := -FCCManager.xShip.Heading;;
        //    FMap.Rotation := -FCCManager.xShip.Heading;
        end;
      end;
    end;

    if FIsWeatherAuto then
    begin

    end;
  end;
end;

procedure TfrmMainFCC.tmrUpdateHeadingTimer(Sender: TObject);
var
  i, tempPR : Integer;
  RandomDeltaX,RandomDeltaY : Double;
  lastBearing, lastElev, DiffBearing, DiffElev : Double;
begin
  DiffBearing := 0;
  case vFccSetting.FccMode of
    1 : //FCC1 Mode
      begin
        if FTargetElev > FCurrElev then  // change elev
        begin
          if FTargetElev - 0.4 < FCurrElev then
          begin
            DiffElev := Abs(FTargetElev - FCurrElev);
            DiffElev := DiffElev * 100;
            FCurrElev := FTargetElev;
            edtGpaEL.text := FCurrElev.ToString();
            edtCtrlDataEL.Text := FCurrElev.ToString();
          end
          else
          begin
            DiffElev := 0.4 * 100;
            FCurrElev := FCurrElev + 0.4;
            edtGpaEL.text := FCurrElev.ToString();
            edtCtrlDataEL.Text := FCurrElev.ToString();
          end;
        end

        else if FTargetElev < FCurrElev then
        begin
          if FTargetElev + 0.4 > FCurrElev then
          begin
            DiffElev := Abs(FTargetElev - FCurrElev);
            FCurrElev := FTargetElev;
            edtGpaEL.text := FCurrElev.ToString();
            edtCtrlDataEL.Text := FCurrElev.ToString();
          end

          else
          begin
            DiffElev := 0.4 * 100;
            FCurrElev := FCurrElev - 0.4;
            edtGpaEL.text := FCurrElev.ToString();
            edtCtrlDataEL.Text := FCurrElev.ToString();
          end;
        end;

        if FTargetBearing > FCurrBearing then // change bearing
        begin
          if FTargetBearing - 0.5 < FCurrBearing then
          begin
            DiffBearing := Abs(FTargetBearing - FCurrBearing);
            DiffBearing := DiffBearing * 100;
            FCurrBearing := FTargetBearing;
            edtGpABE.text := FCurrBearing.ToString();
            edtCtrlDataBE.Text := FCurrBearing.ToString();
          end
          else
          begin
            if Abs(FTargetBearing - FCurrBearing) < 180 then
            begin
              DiffBearing := 0.5 * 100;
              FCurrBearing := FCurrBearing + 0.5;
              if FCurrBearing >= 360 then FCurrBearing := FCurrBearing - 360;

              edtGpABE.text := FCurrBearing.ToString();
              edtCtrlDataBE.Text := FCurrBearing.ToString();
            end
            else
            begin
              DiffBearing := 0.5 * 100;
              FCurrBearing := FCurrBearing - 0.5;
              if FCurrBearing < 0 then FCurrBearing := FCurrBearing + 360;
              edtGpABE.text := FCurrBearing.ToString();
              edtCtrlDataBE.Text := FCurrBearing.ToString();
            end;
          end;
        end

        else if FTargetBearing < FCurrBearing then
        begin
          if FTargetBearing + 0.5 > FCurrBearing then
          begin
            DiffBearing := Abs(FTargetBearing - FCurrBearing);
            FCurrBearing := FTargetBearing;
            edtGpABE.text := FCurrBearing.ToString();
            edtCtrlDataBE.Text := FCurrBearing.ToString();
          end

          else
          begin
            if Abs(FTargetBearing - FCurrBearing) < 180 then
            begin
              DiffBearing := 0.5 * 100;
              FCurrBearing := FCurrBearing - 0.5;
              if FCurrBearing < 0 then FCurrBearing := FCurrBearing + 360;
              edtGpABE.text := FCurrBearing.ToString();
              edtCtrlDataBE.Text := FCurrBearing.ToString();
            end
            else
            begin
              DiffBearing := 0.5 * 100;
              FCurrBearing := FCurrBearing + 0.5;
              if FCurrBearing >= 360 then FCurrBearing := FCurrBearing - 360;
              edtGpABE.text := FCurrBearing.ToString();
              edtCtrlDataBE.Text := FCurrBearing.ToString();
            end;
          end;
        end;

        edtCtrlDataBeS.Text := diffbearing.ToString();
        edtCtrlDataElS.Text := diffelev.ToString();

        if FSelectedVehicleState then
        begin
          imgCtrlStateTracked.Picture.Bitmap := BitMapLampGreen;
        end
        else
        begin
          imgCtrlStateTracked.Picture.Bitmap := BitMapLampGrey;
        end;

        if not DrumPosState and (TargetRoundInDrum < LeftDrum) then // kurangi left drum
        begin
          tempPR := StrToInt(pnlGpPr.Caption);
          tempPR := tempPR +1;
          pnlGpPr.Caption := tempPR.ToString();
          LeftDrum := LeftDrum - 1;
        end
        else if DrumPosState and (TargetRoundInDrum < RightDrum) then // kurangi right drum
        begin
          tempPR := StrToInt(pnlGpPr.Caption);
          tempPR := tempPR +1;
          pnlGpPr.Caption := tempPR.ToString();
          RightDrum := RightDrum - 1;
        end;

        pnlGpRr.Caption := (LeftDrum + RightDrum).ToString();

      end;
    2 : //FCC2 Mode
      begin
        if FTargetElev > FCurrElev then  // change elev
        begin
          if FTargetElev - 0.4 < FCurrElev then
          begin
            DiffElev := Abs(FTargetElev - FCurrElev);
            DiffElev := DiffElev * 100;
            FCurrElev := FTargetElev;
            edtGpaEL1.text := FCurrElev.ToString();
            edtCtrlDataEL1.Text := FCurrElev.ToString();
          end
          else
          begin
            DiffElev := 0.4 * 100;
            FCurrElev := FCurrElev + 0.4;
            edtGpaEL1.text := FCurrElev.ToString();
            edtCtrlDataEL1.Text := FCurrElev.ToString();
          end;
        end

        else if FTargetElev < FCurrElev then
        begin
          if FTargetElev + 0.4 > FCurrElev then
          begin
            DiffElev := Abs(FTargetElev - FCurrElev);
            FCurrElev := FTargetElev;
            edtGpaEL1.text := FCurrElev.ToString();
            edtCtrlDataEL1.Text := FCurrElev.ToString();
          end

          else
          begin
            DiffElev := 0.4 * 100;
            FCurrElev := FCurrElev - 0.4;
            edtGpaEL1.text := FCurrElev.ToString();
            edtCtrlDataEL1.Text := FCurrElev.ToString();
          end;
        end;

        if FTargetBearing > FCurrBearing then // change bearing
        begin
          if FTargetBearing - 0.5 < FCurrBearing then
          begin
            DiffBearing := Abs(FTargetBearing - FCurrBearing);
            DiffBearing := DiffBearing * 100;
            FCurrBearing := FTargetBearing;
            edtGpABE1.text := FCurrBearing.ToString();
            edtCtrlDataBE1.Text := FCurrBearing.ToString();
          end
          else
          begin
            if Abs(FTargetBearing - FCurrBearing) < 180 then
            begin
              DiffBearing := 0.5 * 100;
              FCurrBearing := FCurrBearing + 0.5;
              if FCurrBearing >= 360 then FCurrBearing := FCurrBearing - 360;
              edtGpABE1.text := FCurrBearing.ToString();
              edtCtrlDataBE1.Text := FCurrBearing.ToString();
            end
            else
            begin
              DiffBearing := 0.5 * 100;
              FCurrBearing := FCurrBearing - 0.5;
              if FCurrBearing < 0 then FCurrBearing := FCurrBearing + 360;
              edtGpABE1.text := FCurrBearing.ToString();
              edtCtrlDataBE1.Text := FCurrBearing.ToString();
            end;
          end;
        end

        else if FTargetBearing < FCurrBearing then
        begin
          if FTargetBearing + 0.5 > FCurrBearing then
          begin
            DiffBearing := Abs(FTargetBearing - FCurrBearing);
            FCurrBearing := FTargetBearing;
            edtGpABE1.text := FCurrBearing.ToString();
            edtCtrlDataBE1.Text := FCurrBearing.ToString();
          end

          else
          begin
            if Abs(FTargetBearing - FCurrBearing) < 180 then
            begin
              DiffBearing := 0.5 * 100;
              FCurrBearing := FCurrBearing - 0.5;
              if FCurrBearing < 0 then FCurrBearing := FCurrBearing + 360;
              edtGpABE1.text := FCurrBearing.ToString();
              edtCtrlDataBE1.Text := FCurrBearing.ToString();
            end
            else
            begin
              DiffBearing := 0.5 * 100;
              FCurrBearing := FCurrBearing + 0.5;
              if FCurrBearing >= 360 then FCurrBearing := FCurrBearing - 360;
              edtGpABE1.text := FCurrBearing.ToString();
              edtCtrlDataBE1.Text := FCurrBearing.ToString();

            end;
          end;
        end;

        edtCtrlDataBeS1.Text := diffbearing.ToString();
        edtCtrlDataElS1.Text := diffelev.ToString();

        if FSelectedVehicleState and not IsReturnZero then
        begin
          imgCtrlStateTrackedFCC2.Picture.Bitmap := BitMapLampGreen;
        end
        else
        begin
          imgCtrlStateTrackedFCC2.Picture.Bitmap := BitMapLampGrey;
        end;

        if not DrumPosState and (TargetRoundInDrum < LeftDrum) then // kurangi left drum
        begin
          tempPR := StrToInt(edtLowPR.Text);
          tempPR := tempPR +1;
          edtLowPR.Text := tempPR.ToString();
          LeftDrum := LeftDrum - 1;
        end
        else if DrumPosState and (TargetRoundInDrum < RightDrum) then // kurangi right drum
        begin
          tempPR := StrToInt(edtHighPR.Text);
          tempPR := tempPR +1;
          edtHighPR.Text := tempPR.ToString();
          RightDrum := RightDrum - 1;
        end;

        edtLowRR.Text := LeftDrum.ToString();
        edtHighRR.Text := RightDrum.ToString();

      end;
  end;

//  for i := 0 to TargetMgr.Count - 1 do
//  begin
//    RandomDeltaX := RandomRange(0, 1 + 1) * 0.01;
//    RandomDeltaY := RandomRange(0, 1 + 1) * 0.01;
//
//    TargetMgr.Items(i).MapX := TargetMgr.Items(i).MapX + RandomDeltaX;
//    TargetMgr.Items(i).MapY := TargetMgr.Items(i).MapY + RandomDeltaY;
//  end;
//  FMap.Refresh;

//  if Assigned(FCCManager) then
//  begin
//    if Assigned(FCCManager.xShip) then
//    begin
//      FCCManager.xShip.Heading := FCCManager.xShip.Heading + 1;
//    end;
//  end;
end;

end.
