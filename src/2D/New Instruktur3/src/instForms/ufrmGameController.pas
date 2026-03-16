
unit ufrmGameController;

interface

uses

  MapXLib_TLB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, AdvSmoothTabPager, CurvyControls, AdvSmoothButton,
  ComCtrls, ExtCtrls, VrControls, VrWheel, AdvSmoothToggleButton, ShellAPI, idUDPClient,
  AdvSmoothPanel, OleCtrls, AdvSmoothLabel, StdCtrls, IniFiles,
  AdvPageControl,RzButton, {acPNG,} jpeg, Buttons, VrTrackBar, Mask, MaskEdEx, AdvEdit,

  uClassDatabase, ufrmMainInstruktur, ufrmSceEditor, uDataModule, uGlobalVar,
  uInstrukturManager, uTCPDatatype, uCMSetting, uBaseCoordSystem, uBaseConstan, ufReportEvent ,
  ufInstLog, uBaseFunction, uInstrukturObjects, uTrajectory, uSimulationManager, uQuery,
  RzPanel, ufrmTrajectoryView, AdvTrackBar, SpeedButtonImage,
  Vcl.Imaging.pngimage;


type
  TWindData = record
    win_x: double;
    win_y: double;
  end;

  TSeaState = record
    wavescale: string[6] ;
    windspeed: double;
    windlength: double;
    windorientation: double;
  end;

  TfrmGameController = class(TForm)
    TabMain: TAdvSmoothTabPager;
    tsPlatform: TAdvSmoothTabPage;
    tsClient: TAdvSmoothTabPage;
    tsEnvironment: TAdvSmoothTabPage;
    MiniMap1: TMap;
    mmfrmMain: TMainMenu;
    Application1: TMenuItem;
    DisplayController1: TMenuItem;
    DisplayFiringCommandProcedure1: TMenuItem;
    Exit1: TMenuItem;
    Scenario1: TMenuItem;
    q: TMenuItem;
    ScenarioPlay1: TMenuItem;
    ScenariosTOP1: TMenuItem;
    ScenarioReport1: TMenuItem;
    pmClient: TPopupMenu;
    pmClientStop: TMenuItem;
    mniShutdown1: TMenuItem;
    mniRestart1: TMenuItem;
    mniShutdown2: TMenuItem;
    mniRestartAll1: TMenuItem;
    mniShutdownAll1: TMenuItem;
    N2: TMenuItem;
    pmClient2: TPopupMenu;
    mni1: TMenuItem;
    mni2: TMenuItem;
    mni3: TMenuItem;
    mni4: TMenuItem;
    mni5: TMenuItem;
    mni6: TMenuItem;
    mni7: TMenuItem;
    tmrStatus: TTimer;
    mniool1: TMenuItem;
    Restart2DServer1: TMenuItem;
    mniLog1: TMenuItem;
    Help1: TMenuItem;
    Start1: TMenuItem;
    Start2: TMenuItem;
    Manual1: TMenuItem;
    Komando1: TMenuItem;
    pmLvWeapon: TPopupMenu;
    On1: TMenuItem;
    Off1: TMenuItem;
    tmrRBU: TTimer;
    RestartAllCommunication1: TMenuItem;
    ShutdownCommunication1: TMenuItem;
    N1: TMenuItem;
    ShutdownServer1: TMenuItem;
    RestartServer1: TMenuItem;
    CloseAllCommunication1: TMenuItem;
    tsTrajectory: TAdvSmoothTabPage;
    tsSelectShipWeaponTrajectory: TAdvSmoothPanel;
    AdvSmoothTabPager1: TAdvSmoothTabPager;
    AdvSmoothTabPage1: TAdvSmoothTabPage;
    lvRuntimeShipTrajectory: TListView;
    AdvSmoothTabPage2: TAdvSmoothTabPage;
    lvRuntimeMissileTrajectory: TListView;
    tsTrajectoryMapview: TAdvSmoothTabPager;
    tsMapViewTrajectory: TAdvSmoothTabPage;
    tsTrajectoryView: TAdvSmoothTabPage;
    pnlTrajectory: TAdvSmoothPanel;
    advsmthlbl1: TAdvSmoothLabel;
    cbbMapMiniZoom: TComboBox;
    btnSelectObj: TAdvSmoothButton;
    AdvSmoothPanel1: TAdvSmoothPanel;
    AdvSmoothButton1: TAdvSmoothButton;
    imgTrajectory: TImage;
    tmrTrajectory: TTimer;
    ProfilKetinggian1: TMenuItem;
    tmrSeaState: TTimer;
    pnlHeader: TAdvSmoothPanel;
    imgHeaderProject: TImage;
    pnlInfo: TAdvSmoothPanel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    pnlMain: TPanel;
    pnlClient: TPanel;
    pnlClientLayout: TPanel;
    imgRuangIns: TImage;
    pnlSparator: TPanel;
    pnlClientSetting: TAdvSmoothPanel;
    btnSettingClient: TAdvSmoothButton;
    pnlClientList: TAdvSmoothPanel;
    lvClient: TListView;
    pnlReport: TPanel;
    pnlController: TPanel;
    pnlEnvironment: TPanel;
    mmoReport: TMemo;
    pnlScenario: TPanel;
    pnlPlatformLeft: TPanel;
    TabSelectObject: TAdvSmoothTabPager;
    tsSelectShip: TAdvSmoothTabPage;
    tsSelectWeapon: TAdvSmoothTabPage;
    pnlControlObject: TAdvSmoothPanel;
    btnRemoveObject: TAdvSmoothButton;
    btnRepostObject: TAdvSmoothButton;
    pnlPlatformRight: TPanel;
    pnlPlatfromUp: TAdvSmoothPanel;
    tabControl: TAdvSmoothTabPager;
    pnlPlayerCamera: TAdvSmoothPanel;
    lblPinCamera: TAdvSmoothLabel;
    pnlCameraSelectID: TAdvSmoothPanel;
    lbl223: TAdvSmoothLabel;
    cbSelectIDCamera: TCurvyCombo;
    btnCameraLock: TAdvSmoothButton;
    btnCameraUnlock: TAdvSmoothButton;
    pnlCameraMove: TAdvSmoothPanel;
    btnCamMoveUp: TRzShapeButton;
    btnCamMoveLef: TRzShapeButton;
    btnCamMoveRight: TRzShapeButton;
    btnCamMoveDown: TRzShapeButton;
    btnCamMoveForward: TRzShapeButton;
    btnCamMoveBack: TRzShapeButton;
    pnlCameraRotateOld: TAdvSmoothPanel;
    btnCamRotateOldUp: TRzShapeButton;
    btnCamRotateOldLeft: TRzShapeButton;
    btnCamRotateOldRight: TRzShapeButton;
    btnCamRotateOldDown: TRzShapeButton;
    pnlCameraMode: TAdvSmoothPanel;
    lblCameraMode: TAdvSmoothLabel;
    btnCamPin: TAdvSmoothButton;
    btnFreeCam: TAdvSmoothButton;
    pnlCameraViewGadipake: TPanel;
    lblCameraView: TAdvSmoothLabel;
    pnlCameraView: TAdvSmoothPanel;
    btnCamViewFront: TRzShapeButton;
    btnCamViewLeft: TRzShapeButton;
    btnCamViewRight: TRzShapeButton;
    btnCamViewBack: TRzShapeButton;
    btnCamViewTop: TRzShapeButton;
    pnlCameraRotate1Gadipake: TPanel;
    lblCameraRotate: TAdvSmoothLabel;
    pnlCameraRotate: TAdvSmoothPanel;
    vrWheelCameraRotateY: TVrWheel;
    vrWheelCameraRotateX: TVrWheel;
    lblRotateX: TAdvSmoothLabel;
    lblRotateY: TAdvSmoothLabel;
    pnlPinCamera: TAdvSmoothPanel;
    wheelAzimut: TVrWheel;
    lblAzimut: TAdvSmoothLabel;
    bvlVertical: TBevel;
    lblAzimuthVal: TAdvSmoothLabel;
    lblRange: TAdvSmoothLabel;
    lblMinRange: TAdvSmoothLabel;
    lblMaxRange: TAdvSmoothLabel;
    lblMinElevation: TAdvSmoothLabel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    lblElevation: TAdvSmoothLabel;
    bvlHorizontal: TBevel;
    edtAzimut: TEdit;
    trackBarRange: TAdvTrackBar;
    edtRangeValue: TEdit;
    edtElevationValue: TEdit;
    trackBarElevation: TAdvTrackBar;
    pnlPlatformBottom: TAdvSmoothPanel;
    pnlLaunchWeapon: TAdvSmoothPanel;
    pgWeapon: TAdvPageControl;
    pgtwTorpedoSUT: TAdvTabSheet;
    scrlbxTOCOS: TScrollBox;
    lbl53: TLabel;
    lbl52: TLabel;
    lbl21: TLabel;
    lbl20: TLabel;
    lbl19: TLabel;
    lbl18: TLabel;
    lbl42: TLabel;
    lbl51: TLabel;
    lbl85: TLabel;
    lbl87: TLabel;
    lbl89: TLabel;
    lbl91: TLabel;
    lbl92: TLabel;
    lbl93: TLabel;
    lbl86: TLabel;
    lbl88: TLabel;
    btnTorpSutTarget: TSpeedButton;
    edtTorpSUTSafeDis: TEdit;
    edtTorpSUTDepth: TEdit;
    edtTorpSUTCourse: TEdit;
    edtTorpedoSUTEnDis: TEdit;
    cbbLauncherID: TComboBox;
    btnSearchTorpedoSUT: TAdvSmoothButton;
    btnHomingTorpedoSUT: TAdvSmoothButton;
    btnhandleTorpedoSUT: TAdvSmoothButton;
    btnFireTorpodoSUT: TAdvSmoothButton;
    edtTorpSUTTargetID: TEdit;
    cbbTorpMissile: TComboBox;
    cbbTorpSUTNumber: TComboBox;
    cbbTorpSUTTargetType: TComboBox;
    cbbTorpPredMode: TComboBox;
    cbbTorpSutSpeed: TComboBox;
    edtTampung: TEdit;
    edtTorpSutRange: TEdit;
    btnLoadingTorpedoSUT: TAdvSmoothButton;
    pgtwAsroc: TAdvTabSheet;
    scrlbxAsroc: TScrollBox;
    lbl29: TLabel;
    lbl26: TLabel;
    lbl25: TLabel;
    lbl24: TLabel;
    lbl17: TLabel;
    lbl16: TLabel;
    lbl11: TLabel;
    lbl94: TLabel;
    lbl95: TLabel;
    lbl96: TLabel;
    lbl97: TLabel;
    lbl98: TLabel;
    lbl99: TLabel;
    lbl100: TLabel;
    lbl101: TLabel;
    lbl102: TLabel;
    lbl103: TLabel;
    btnAsrocTarget: TSpeedButton;
    btnAsrocAssign: TAdvSmoothButton;
    eAsrocNumber: TEdit;
    eAsrocTargetID: TEdit;
    eAsrocRange: TEdit;
    eAsrocMissileID: TEdit;
    eAsrocLauncherID: TEdit;
    eAsrocDepth: TEdit;
    eAsrocCorrRange: TEdit;
    eAsrocBearing: TEdit;
    btnAsrocFire: TAdvSmoothButton;
    btnAsrocDeAssign: TAdvSmoothButton;
    cbbAsrocMissileType: TComboBox;
    cbbAsrocFuze: TComboBox;
    btnLoadingAsroc: TAdvSmoothButton;
    cbbAsrocMissileID: TComboBox;
    pgtwRBU6000: TAdvTabSheet;
    scrlbxRBU6000: TScrollBox;
    lbl75: TLabel;
    lbl74: TLabel;
    lbl73: TLabel;
    lbl72: TLabel;
    lbl71: TLabel;
    lbl70: TLabel;
    lbl47: TLabel;
    lbl34: TLabel;
    lbl33: TLabel;
    lbl32: TLabel;
    lbl31: TLabel;
    lbl12: TLabel;
    lbl104: TLabel;
    lbl105: TLabel;
    lbl106: TLabel;
    lbl107: TLabel;
    lbl108: TLabel;
    lbl109: TLabel;
    lbl76: TLabel;
    lbl77: TLabel;
    lbl46: TLabel;
    btnRBUsetPos: TSpeedButton;
    eRBUTargetID: TEdit;
    eRBU6000MissilieID: TEdit;
    eRBU6000Depth: TEdit;
    eRBU6000CorrElev: TEdit;
    eRBU6000CorrBearing: TEdit;
    eRBU6000Bearing: TEdit;
    eRBU6000Balistik: TEdit;
    eRBU6000Number: TEdit;
    btnRBU6000Loading: TAdvSmoothButton;
    btnRBU6000Fire: TAdvSmoothButton;
    btnRBU6000DeAssign: TAdvSmoothButton;
    btnRBU6000Auto: TAdvSmoothButton;
    btnRBU6000Assign: TAdvSmoothButton;
    btnRBUStartFire: TAdvSmoothButton;
    btnRBUStopFire: TAdvSmoothButton;
    cbbrbuLauncherId: TComboBox;
    cbbRBUassigntment: TComboBox;
    eRBU6000Range: TEdit;
    cbbRBUSalvoCount: TComboBox;
    pgtwTorpedoA244: TAdvTabSheet;
    scrlbxTorpedoA244: TScrollBox;
    lbl56: TLabel;
    lbl54: TLabel;
    lbl4: TLabel;
    lbl15: TLabel;
    lbl14: TLabel;
    lbl13: TLabel;
    lbl110: TLabel;
    lbl111: TLabel;
    lbl112: TLabel;
    lbl113: TLabel;
    lbl114: TLabel;
    lbl115: TLabel;
    lbl116: TLabel;
    lbl2: TLabel;
    lbl23: TLabel;
    lbl67: TLabel;
    lbl69: TLabel;
    lbl82: TLabel;
    lbl83: TLabel;
    edtSPS_Number: TEdit;
    edtSPS_ISC: TEdit;
    btnFireSps: TAdvSmoothButton;
    cbbA244Launcher: TComboBox;
    cbbA244MissID: TComboBox;
    cbbA244MissID2: TComboBox;
    cbbWTR: TComboBox;
    cbbISD: TComboBox;
    cbbISD2: TComboBox;
    cbbISR: TComboBox;
    cbbPRG: TComboBox;
    cbbCEI: TComboBox;
    cbbCEI2: TComboBox;
    cbbFLO: TComboBox;
    cbbFLO2: TComboBox;
    cbbACM: TComboBox;
    cbbACE: TComboBox;
    cbbDOP: TComboBox;
    btnLoadingTorpA244: TAdvSmoothButton;
    pgtwDefault: TAdvTabSheet;
    lblInfo: TLabel;
    pgtwWCCCannon: TAdvTabSheet;
    scrlbxWCC: TScrollBox;
    lbl9: TLabel;
    lbl8: TLabel;
    lbl7: TLabel;
    lbl68: TLabel;
    lbl6: TLabel;
    lbl48: TLabel;
    lbl45: TLabel;
    lbl44: TLabel;
    lbl10: TLabel;
    lbl117: TLabel;
    lbl118: TLabel;
    lbl119: TLabel;
    lbl120: TLabel;
    btnSelectCanonTarget: TSpeedButton;
    lbl22: TLabel;
    lbl27: TLabel;
    btnCannonAssigned: TAdvSmoothButton;
    edtCannonTargetID: TEdit;
    edtCannonMissileNumber: TEdit;
    edtCannonMissileID: TEdit;
    edtCannonLauncherID: TEdit;
    edtCannonCorrElev: TEdit;
    edtCannonCorrBearing: TEdit;
    btnWCannonCease: TAdvSmoothButton;
    btnCannonStartFire: TAdvSmoothButton;
    btnCannonFire: TAdvSmoothButton;
    btnCannonDeassigned: TAdvSmoothButton;
    cbbCannonModeID: TComboBox;
    cbbCannonBalistikID: TComboBox;
    cbbSalvoRate: TComboBox;
    pgtwTetral: TAdvTabSheet;
    scrlbxTetral: TScrollBox;
    lbl55: TLabel;
    lbl50: TLabel;
    lbl5: TLabel;
    lbl49: TLabel;
    lbl121: TLabel;
    lbl122: TLabel;
    lbl123: TLabel;
    lbl124: TLabel;
    lbl125: TLabel;
    lbl126: TLabel;
    lbl127: TLabel;
    edtTetral_TRange: TEdit;
    edtTetral_TElev: TEdit;
    edtTetral_TBearing: TEdit;
    edtTetral_Number: TEdit;
    btnTetral_Fire: TAdvSmoothButton;
    btnTetral_Assign: TAdvSmoothButton;
    cbbTetralLaunch: TComboBox;
    btnSetPosTetral: TAdvSmoothButton;
    btnLoadingTetral: TAdvSmoothButton;
    cbbTetral_Missile: TComboBox;
    pgtwMistral: TAdvTabSheet;
    scrlbxMistral: TScrollBox;
    lbl128: TLabel;
    lbl129: TLabel;
    lbl130: TLabel;
    lbl131: TLabel;
    lbl132: TLabel;
    lbl133: TLabel;
    lbl134: TLabel;
    lbl135: TLabel;
    lbl136: TLabel;
    lbl137: TLabel;
    lbl138: TLabel;
    btnMistral_Assign: TAdvSmoothButton;
    edtMistral_TRange: TEdit;
    edtMistral_TElev: TEdit;
    edtMistral_TBearing: TEdit;
    edtMistral_Number: TEdit;
    btnMistral_Fire: TAdvSmoothButton;
    cbbMistralLaunch: TComboBox;
    btnSetPosMistral: TAdvSmoothButton;
    btnLoadingMistral: TAdvSmoothButton;
    cbbMistralMissileID: TComboBox;
    pgtwStrella: TAdvTabSheet;
    scrlbxStrella: TScrollBox;
    lbl139: TLabel;
    lbl140: TLabel;
    lbl141: TLabel;
    lbl142: TLabel;
    lbl143: TLabel;
    lbl144: TLabel;
    lbl145: TLabel;
    lbl146: TLabel;
    lbl147: TLabel;
    lbl148: TLabel;
    lbl149: TLabel;
    edtStrella_TRange: TEdit;
    edtStrella_TElev: TEdit;
    edtStrella_TBearing: TEdit;
    edtStrella_Number: TEdit;
    btnStrella_Fire: TAdvSmoothButton;
    btnStrella_Assign: TAdvSmoothButton;
    cbbStrellaLauncher: TComboBox;
    btnSetPosStrella: TAdvSmoothButton;
    btnLoadingStrella: TAdvSmoothButton;
    cbbStrelaMissileID: TComboBox;
    pgtwExocetMM40: TAdvTabSheet;
    scrlbxExocetMM40: TScrollBox;
    lbl66: TLabel;
    lbl64: TLabel;
    lbl63: TLabel;
    lbl62: TLabel;
    lbl61: TLabel;
    lbl60: TLabel;
    lbl59: TLabel;
    lbl58: TLabel;
    lbl150: TLabel;
    lbl151: TLabel;
    lbl152: TLabel;
    lbl153: TLabel;
    lbl154: TLabel;
    lbl155: TLabel;
    lbl156: TLabel;
    lbl157: TLabel;
    lbl158: TLabel;
    lbl159: TLabel;
    lbl160: TLabel;
    btnExocet40_Fire: TAdvSmoothButton;
    edtExocet40_TRange: TEdit;
    edtExocet40_TerminalRange: TEdit;
    edtExocet40_TBearing: TEdit;
    edtExocet40_ObstacleRange: TEdit;
    edtExocet40_ObstacleAlt: TEdit;
    edtExocet40_ApproachRange: TEdit;
    btnTrack: TAdvSmoothButton;
    cbbExocet40_AngularMode: TComboBox;
    cbbExocet40_AgilityMode: TComboBox;
    cbbExocet40_InitialStepMode: TComboBox;
    cbbExocet40_Missile: TComboBox;
    cbbExocet40_Number: TComboBox;
    cbbExxocetLauncher: TComboBox;
    chkExxoMask_13: TCheckBox;
    chkExxoMask_14: TCheckBox;
    chkExxoMask_15: TCheckBox;
    chkExxoMask_16: TCheckBox;
    chkExxoMask_5: TCheckBox;
    chkExxoMask_6: TCheckBox;
    chkExxoMask_7: TCheckBox;
    chkExxoMask_8: TCheckBox;
    chkExxoMask_9: TCheckBox;
    chkExxoMask_10: TCheckBox;
    chkExxoMask_11: TCheckBox;
    chkExxoMask_12: TCheckBox;
    chkExxoMask_1: TCheckBox;
    chkExxoMask_2: TCheckBox;
    chkExxoMask_3: TCheckBox;
    chkExxoMask_4: TCheckBox;
    btnLoadingExocet: TAdvSmoothButton;
    edtExxocet40_LeftAngle: TEdit;
    edtExxocet40_RightAngle: TEdit;
    edtExxocet40_FarRange: TEdit;
    edtExxocet40_NearRange: TEdit;
    edtExxocet40_SeekOpenX: TEdit;
    edtExxocet40_SeekOpenY: TEdit;
    edtExxocet40_OpenSeekerHead: TEdit;
    cbbExocet40_ApproachRange: TComboBox;
    pgtwYAHKONT: TAdvTabSheet;
    scrlbxYakhont: TScrollBox;
    lbl161: TLabel;
    lbl162: TLabel;
    lbl163: TLabel;
    lbl164: TLabel;
    lbl165: TLabel;
    lbl166: TLabel;
    lbl167: TLabel;
    lbl168: TLabel;
    lbl169: TLabel;
    lbl170: TLabel;
    lbl78: TLabel;
    lbl79: TLabel;
    lbl80: TLabel;
    lbl81: TLabel;
    lbl171: TLabel;
    lbl172: TLabel;
    lblcoorXyakhont: TLabel;
    lblcoorYyakhont: TLabel;
    edtYahkont_TRange: TEdit;
    edtYahkont_TBearing: TEdit;
    edtYahkont_Number: TEdit;
    edtYahkont_Missile: TEdit;
    btnYahkont_Fire_: TAdvSmoothButton;
    btnSetPosYahkont: TAdvSmoothButton;
    cbbYahkontLauncher: TComboBox;
    chkYahkontM1: TCheckBox;
    chkYahkontM2: TCheckBox;
    chkYahkontM3: TCheckBox;
    chkYahkontM4: TCheckBox;
    txt3: TStaticText;
    txt4: TStaticText;
    btnLoadingYakhont: TAdvSmoothButton;
    btnReleaseYakhont: TAdvSmoothButton;
    pgtwC802: TAdvTabSheet;
    scrlbxC802: TScrollBox;
    lbl173: TLabel;
    lbl174: TLabel;
    lbl175: TLabel;
    lbl176: TLabel;
    lbl177: TLabel;
    lbl178: TLabel;
    lbl179: TLabel;
    lbl38: TLabel;
    lbl65: TLabel;
    lblKoorYc802: TLabel;
    lblkoorXc802: TLabel;
    edtC802_Number: TEdit;
    edtC802_Missile: TEdit;
    cbbC802Launcher: TComboBox;
    btnC802_Fire: TAdvSmoothButton;
    edtC802_TBearing: TEdit;
    btnSetPosC802: TAdvSmoothButton;
    edtC802_TRange: TEdit;
    txt1: TStaticText;
    txt2: TStaticText;
    btnLoadingC802: TAdvSmoothButton;
    pnl1: TPanel;
    pnlImageObject: TAdvSmoothPanel;
    lblShipName: TAdvSmoothLabel;
    pnlWeapon: TAdvSmoothPanel;
    lvWeapon: TListView;
    lblCameraMove: TAdvSmoothLabel;
    lblCameraRotate2: TAdvSmoothLabel;
    lvRuntimeMissile: TListView;
    lvRuntimeShip: TListView;
    imgShip: TImage;
    lblLongVal: TAdvSmoothLabel;
    lblLatValue: TAdvSmoothLabel;
    lblZVal: TAdvSmoothLabel;
    lblZCord: TAdvSmoothLabel;
    lblLong: TAdvSmoothLabel;
    lblHeading: TAdvSmoothLabel;
    lblHeadingVal: TAdvSmoothLabel;
    lblSpeedVal: TAdvSmoothLabel;
    lblPitch: TAdvSmoothLabel;
    lblPitchVal: TAdvSmoothLabel;
    lblRollVal: TAdvSmoothLabel;
    lblRoll: TAdvSmoothLabel;
    lblSpeed: TAdvSmoothLabel;
    lblLat: TAdvSmoothLabel;
    img3DNAFS: TImage;
    img3DNSFS: TImage;
    img3DNSSFS: TImage;
    imgC705: TImage;
    img57Manual: TImage;
    imgMR103: TImage;
    img57Digital: TImage;
    imgMR35: TImage;
    imgC802: TImage;
    imgYakhont: TImage;
    imgTDS76: TImage;
    imgMK4NSFS: TImage;
    imgMK3NSFS: TImage;
    imgMK3NSSFS: TImage;
    imgMK4NSSFS: TImage;
    imgSUT: TImage;
    imgRBUDigital: TImage;
    imgRBUAnalog: TImage;
    imgInstrukturNSSFS: TImage;
    imgInstrukturNSFS: TImage;
    imgInstrukturNAFS: TImage;
    imgServerNSSFS: TImage;
    imgServerNAFS: TImage;
    imgServerNSFS: TImage;
    imgTracket730: TImage;
    imgCIWS730: TImage;
    imgMR203: TImage;
    imgAK230: TImage;
    imgMK4NAFS: TImage;
    imgMK3NAFS: TImage;
    imgClient: TImage;
    imgScenario: TImage;
    imgController: TImage;
    imgEnvironment: TImage;
    imgReport: TImage;
    imageC802: TImage;
    imageYahkont: TImage;
    pnlListScenario: TAdvSmoothPanel;
    lblGameName: TLabel;
    imgEdit: TImage;
    imgNew: TImage;
    imgDelete: TImage;
    lvListScen: TListView;
    pnlsprScen1: TPanel;
    pnlMainScenario: TAdvSmoothPanel;
    pnlDetailScenario: TAdvSmoothPanel;
    advsmthlbl3: TAdvSmoothLabel;
    advsmthlbl2: TAdvSmoothLabel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    AdvSmoothLabel4: TAdvSmoothLabel;
    mmoKetSce: TMemo;
    cbbPort: TComboBox;
    lvKri: TListView;
    lvTarget: TListView;
    lvGeneral: TListView;
    pnlHeaderScenario: TAdvSmoothPanel;
    lblScenarioName: TLabel;
    pnlsprScen2: TPanel;
    pnlEnviScenario: TAdvSmoothPanel;
    AdvSmoothLabel5: TAdvSmoothLabel;
    AdvSmoothLabel6: TAdvSmoothLabel;
    advsmthlbl4: TAdvSmoothLabel;
    AdvSmoothLabel14: TAdvSmoothLabel;
    VrWindDirection: TVrWheel;
    VrCurrentDirection: TVrWheel;
    AdvSmoothLabel15: TAdvSmoothLabel;
    advsmthlbl5: TAdvSmoothLabel;
    advsmthlbl7: TAdvSmoothLabel;
    advsmthlbl6: TAdvSmoothLabel;
    advsmthlbl8: TAdvSmoothLabel;
    trckBarSeaState: TTrackBar;
    trckBarCurrentSpeed: TTrackBar;
    trckBarWindSpeed: TTrackBar;
    trckBarTemperature: TTrackBar;
    trckBarBarometer: TTrackBar;
    trckBarHumidity: TTrackBar;
    trckBarFogHeight: TTrackBar;
    edtWindSpeed: TEdit;
    edtCurrentSpeed: TEdit;
    edtTemperature: TEdit;
    edtBarometer: TEdit;
    edtHumidity: TEdit;
    edtFogHeight: TEdit;
    edtSeaState: TEdit;
    pnlsprScen3: TPanel;
    AdvSmoothPanel6: TAdvSmoothPanel;
    lblPortEnv: TLabel;
    btnRefreshClient: TAdvSmoothButton;
    btnLoadScenario: TAdvSmoothButton;
    btnStopScenario: TAdvSmoothButton;
    pnlPlatform: TPanel;
    imgPlatform: TImage;
    AdvSmoothPanel5: TAdvSmoothPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    grpSeaState: TGroupBox;
    tbSeaState: TVrTrackBar;
    GroupBox2: TGroupBox;
    tbWindSpeed: TVrTrackBar;
    grpCurrentSpeed: TGroupBox;
    tbSeaSpeed: TVrTrackBar;
    GroupBox4: TGroupBox;
    tbTemp: TVrTrackBar;
    GroupBox5: TGroupBox;
    tbBaroPressure: TVrTrackBar;
    GroupBox6: TGroupBox;
    tbFogIntensity: TVrTrackBar;
    GroupBox7: TGroupBox;
    tbHumidity: TVrTrackBar;
    AdvSmoothPanel4: TAdvSmoothPanel;
    Label4: TLabel;
    vrwhlWindDirec: TVrWheel;
    lblWindDirection: TLabel;
    Label6: TLabel;
    AdvSmoothPanel3: TAdvSmoothPanel;
    Label1: TLabel;
    vrwhlSeaDirection: TVrWheel;
    Label2: TLabel;
    lblCurrentDirection: TLabel;
    Label3: TLabel;
    StaticText1: TStaticText;
    lblStartDegC802: TLabel;
    Label7: TLabel;
    StaticText2: TStaticText;
    lblEndDegC802: TLabel;
    Label16: TLabel;
    StaticText3: TStaticText;
    lblMinRangeC802: TLabel;
    Label18: TLabel;
    StaticText4: TStaticText;
    lblMaxRangeC802: TLabel;
    Label5: TLabel;
    StaticText5: TStaticText;
    lblStartYakhont: TLabel;
    lblEndYakhont: TLabel;
    StaticText6: TStaticText;
    Label19: TLabel;
    Label20: TLabel;
    StaticText7: TStaticText;
    lblMinYakhont: TLabel;
    lblMaxYakhont: TLabel;
    StaticText8: TStaticText;
    Label31: TLabel;
    imageRBU6000: TImage;
    Label32: TLabel;
    StaticText9: TStaticText;
    lblStartRBU: TLabel;
    Label34: TLabel;
    StaticText10: TStaticText;
    lblEndRBU: TLabel;
    Label36: TLabel;
    StaticText11: TStaticText;
    lblMinRBU: TLabel;
    lblMaxRBU: TLabel;
    StaticText12: TStaticText;
    Label39: TLabel;
    imageTorpedoSUT: TImage;
    Label40: TLabel;
    StaticText13: TStaticText;
    lblStartSUT: TLabel;
    Label42: TLabel;
    StaticText14: TStaticText;
    lblEndSUT: TLabel;
    Label44: TLabel;
    StaticText15: TStaticText;
    lblMinSUT: TLabel;
    lblMaxSUT: TLabel;
    StaticText16: TStaticText;
    Label47: TLabel;
    imageTpoA244: TImage;
    Label48: TLabel;
    StaticText17: TStaticText;
    lblStartA244s: TLabel;
    lblEndA244s: TLabel;
    StaticText18: TStaticText;
    Label51: TLabel;
    Label52: TLabel;
    StaticText19: TStaticText;
    lblMinA244s: TLabel;
    lblMaxA244s: TLabel;
    StaticText20: TStaticText;
    Label55: TLabel;
    imageTetral: TImage;
    Label56: TLabel;
    StaticText21: TStaticText;
    lblStartTetral: TLabel;
    lblEndTetral: TLabel;
    StaticText22: TStaticText;
    Label59: TLabel;
    Label60: TLabel;
    StaticText23: TStaticText;
    lblMinTetral: TLabel;
    lblMaxTetral: TLabel;
    StaticText24: TStaticText;
    Label63: TLabel;
    imageExocetMM40: TImage;
    Label64: TLabel;
    StaticText25: TStaticText;
    lblStartMM40: TLabel;
    Label66: TLabel;
    StaticText26: TStaticText;
    lblEndMM40: TLabel;
    Label68: TLabel;
    StaticText27: TStaticText;
    lblMinMM40: TLabel;
    lblMaxMM40: TLabel;
    StaticText28: TStaticText;
    Label71: TLabel;
    imageStrella: TImage;
    Label72: TLabel;
    StaticText29: TStaticText;
    lblStartStrella: TLabel;
    Label74: TLabel;
    StaticText30: TStaticText;
    lblEndStrella: TLabel;
    Label76: TLabel;
    StaticText31: TStaticText;
    lblMinStrella: TLabel;
    lblMaxStrella: TLabel;
    StaticText32: TStaticText;
    Label79: TLabel;
    imageCannon76: TImage;
    Label80: TLabel;
    StaticText33: TStaticText;
    lblStartCannon76: TLabel;
    Label82: TLabel;
    StaticText34: TStaticText;
    lblEndCannon76: TLabel;
    Label84: TLabel;
    StaticText35: TStaticText;
    lblMinCannon76: TLabel;
    lblMaxCannon76: TLabel;
    StaticText36: TStaticText;
    Label87: TLabel;
    imageMistral: TImage;
    Label88: TLabel;
    StaticText37: TStaticText;
    lblStartMistral: TLabel;
    Label90: TLabel;
    StaticText38: TStaticText;
    lblEndMistral: TLabel;
    Label92: TLabel;
    StaticText39: TStaticText;
    lblMinMistral: TLabel;
    lblMaxMistral: TLabel;
    StaticText40: TStaticText;
    Label95: TLabel;
    imageAsroc: TImage;
    Label96: TLabel;
    StaticText41: TStaticText;
    lblStartAsroc: TLabel;
    Label98: TLabel;
    StaticText42: TStaticText;
    lblEndAsroc: TLabel;
    Label100: TLabel;
    StaticText43: TStaticText;
    lblMinAsroc: TLabel;
    lblMaxAsroc: TLabel;
    StaticText44: TStaticText;
    Label103: TLabel;
    pgtwCannonAK230: TAdvTabSheet;
    scrlbxCannonAK230: TScrollBox;
    imageCannonAK230: TImage;
    Label17: TLabel;
    lblStartAK230: TLabel;
    Label35: TLabel;
    lblEndAK230: TLabel;
    Label41: TLabel;
    lblMinAK230: TLabel;
    Label45: TLabel;
    lblMaxAK230: TLabel;
    StaticText57: TStaticText;
    StaticText58: TStaticText;
    StaticText59: TStaticText;
    StaticText60: TStaticText;
    pgtwVlMica: TAdvTabSheet;
    ScrollBox4: TScrollBox;
    imageVlMica: TImage;
    Label46: TLabel;
    lblStartVlMica: TLabel;
    Label58: TLabel;
    lblEndVlMica: TLabel;
    Label67: TLabel;
    lblMinVlMica: TLabel;
    Label75: TLabel;
    lblMaxVlMica: TLabel;
    StaticText77: TStaticText;
    StaticText78: TStaticText;
    StaticText79: TStaticText;
    StaticText80: TStaticText;
    pnlListShip: TAdvSmoothPanel;
    Label54: TLabel;
    btnNewShip: TImage;
    btnEditShip: TImage;
    btnDeleteShip: TImage;
    lvShipList: TListView;
    pnlDetailShip: TAdvSmoothPanel;
    AdvSmoothLabel7: TAdvSmoothLabel;
    pnlHeaderShip: TAdvSmoothPanel;
    lblShipName1: TLabel;
    pnlDimension: TAdvSmoothPanel;
    AdvSmoothLabel16: TAdvSmoothLabel;
    AdvSmoothLabel18: TAdvSmoothLabel;
    AdvSmoothLabel20: TAdvSmoothLabel;
    AdvSmoothLabel23: TAdvSmoothLabel;
    AdvSmoothLabel24: TAdvSmoothLabel;
    AdvSmoothLabel26: TAdvSmoothLabel;
    AdvSmoothLabel8: TAdvSmoothLabel;
    edtShipHeight: TEdit;
    edtShipwidth: TEdit;
    edtShipLength: TEdit;
    pnlPicture1: TAdvSmoothPanel;
    ImgKRI: TImage;
    pnlDetailWeapon: TAdvSmoothPanel;
    pnlDetail: TAdvSmoothPanel;
    AdvSmoothLabel11: TAdvSmoothLabel;
    AdvSmoothLabel19: TAdvSmoothLabel;
    AdvSmoothLabel36: TAdvSmoothLabel;
    AdvSmoothLabel37: TAdvSmoothLabel;
    AdvSmoothLabel38: TAdvSmoothLabel;
    AdvSmoothLabel39: TAdvSmoothLabel;
    advsmthlbl9: TAdvSmoothLabel;
    AdvSmoothLabel40: TAdvSmoothLabel;
    AdvSmoothLabel10: TAdvSmoothLabel;
    edtSwitch: TEdit;
    edt3DActor: TEdit;
    edtPosHeading: TEdit;
    edtPosPitch: TEdit;
    edtDOF1: TEdit;
    edtDOF2: TEdit;
    edtModelBody: TEdit;
    edtModelSpout: TEdit;
    edtLethality: TEdit;
    pnl2DRelated: TAdvSmoothPanel;
    AdvSmoothLabel44: TAdvSmoothLabel;
    lvDetail: TListView;
    pnlRangeYakhont: TPanel;
    btnCannonAssigned23: TAdvSmoothButton;
    btnCannonDeassigned23: TAdvSmoothButton;
    btnCannonFire23: TAdvSmoothButton;
    btnCannonStartFire23: TAdvSmoothButton;
    btnSelectCanonTarget23: TSpeedButton;
    btnWCannonCease23: TAdvSmoothButton;
    cbbCannonBalistikID23: TComboBox;
    cbbCannonModeID23: TComboBox;
    cbbSalvoRate23: TComboBox;
    edtCannonCorrBearing23: TEdit;
    edtCannonCorrElev23: TEdit;
    edtCannonLauncherID23: TEdit;
    edtCannonMissileID23: TEdit;
    edtCannonMissileNumber23: TEdit;
    edtCannonTargetID23: TEdit;
    Label70: TLabel;
    Label78: TLabel;
    Label83: TLabel;
    Label86: TLabel;
    Label91: TLabel;
    Label94: TLabel;
    Label97: TLabel;
    Label99: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label105: TLabel;
    Label107: TLabel;
    Label109: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    pnlProperties: TAdvSmoothPanel;
    AdvSmoothLabel52: TAdvSmoothLabel;
    AdvSmoothLabel21: TAdvSmoothLabel;
    AdvSmoothLabel25: TAdvSmoothLabel;
    AdvSmoothLabel27: TAdvSmoothLabel;
    AdvSmoothLabel17: TAdvSmoothLabel;
    edtShipMaxSpeed: TEdit;
    edtShipMaxSpeedAstern: TEdit;
    edtDamageSustainability: TEdit;
    AdvSmoothLabel28: TAdvSmoothLabel;
    AdvSmoothLabel22: TAdvSmoothLabel;
    AdvSmoothLabel30: TAdvSmoothLabel;
    AdvSmoothLabel35: TAdvSmoothLabel;
    edtShipHeelFactor: TEdit;
    AdvSmoothLabel34: TAdvSmoothLabel;
    edtShipShaftUp: TEdit;
    AdvSmoothLabel33: TAdvSmoothLabel;
    edtShipTacDiameter: TEdit;
    AdvSmoothLabel32: TAdvSmoothLabel;
    edtShipTrimFactor: TEdit;
    edtShipRudderSwingRate: TEdit;
    edtShipThrottleRate: TEdit;
    AdvSmoothLabel31: TAdvSmoothLabel;
    edtShipDisplacement: TEdit;
    AdvSmoothLabel9: TAdvSmoothLabel;
    AdvSmoothLabel29: TAdvSmoothLabel;
    AdvSmoothPanel14: TAdvSmoothPanel;
    AdvSmoothLabel42: TAdvSmoothLabel;
    lvWeaponSelect: TListView;
    pnl2: TPanel;
    pnl3: TPanel;
    pnlMainShip: TAdvSmoothPanel;
    edtClass: TEdit;
    pnl4: TPanel;
    edtWindDirection: TEdit;
    edtCurrentDirection: TEdit;
    edtPortSeaState: TEdit;
    edtPortWindSpeed: TEdit;
    edtPortCurrentSpeed: TEdit;
    edtPortTemp: TEdit;
    edtPortBarometer: TEdit;
    edtPortHumidity: TEdit;
    edtFogIntensity: TEdit;
    imgMK4SPS: TImage;
    imgMK3SPS: TImage;
    procedure DisplayController1Click(Sender: TObject);
    procedure TabMainChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSelectObjectChange(Sender: TObject);
    procedure TabControlChange(Sender: TObject);
    procedure qClick(Sender: TObject);
    procedure lvClientMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnRefreshClientClick(Sender: TObject);
    procedure btnRemoveObjectClick(Sender: TObject);
    procedure cbbMapMiniZoomChange(Sender: TObject);
    procedure lvRuntimeShipClick(Sender: TObject);
    procedure btnSelectObjClick(Sender: TObject);
    procedure lvRuntimeMissileClick(Sender: TObject);
    procedure btnSettingClientClick(Sender: TObject);
    procedure btnFireTorpodoSUTClick(Sender: TObject);
    procedure btnAsrocFireClick(Sender: TObject);
    procedure btnRBU6000FireClick(Sender: TObject);
    procedure btnFireSpsClick(Sender: TObject);
    procedure btnExocet40_FireClick(Sender: TObject);
    procedure btnTetral_FireClick(Sender: TObject);
    procedure btnMistral_FireClick(Sender: TObject);
    procedure btnStrella_FireClick(Sender: TObject);
    procedure btnCannonStartFireClick(Sender: TObject);
    procedure btnCannonStartFire23Click(Sender: TObject);
    procedure btnYahkont_Fire_Click(Sender: TObject);
    procedure btnC802_FireClick(Sender : Tobject);
    procedure btnPlayerCameraUnlockClick(Sender: TObject);
    procedure vrWheelCameraRotateXChange(Sender: TObject);
    procedure vrWheelCameraRotateYChange(Sender: TObject);
    procedure vrWheelCameraRotateYMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure vrWheelCameraRotateXMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCameraUnlockClick(Sender: TObject);
    procedure btnCameraLockClick(Sender: TObject);
    procedure tmrStatusTimer(Sender: TObject);
    procedure mniLog1Click(Sender: TObject);
    procedure lvClientChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
	procedure cbbA244LauncherChange(Sender: TObject);
    procedure cbbWTRChange(Sender: TObject);

    procedure vrwhlSeaDirectionChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvClientCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure btnRepostObjectClick(Sender: TObject);
    procedure cbbRBUassigntmentChange(Sender: TObject);
    procedure btnTorpSutTargetClick(Sender: TObject);
    procedure btnAsrocTargetClick(Sender: TObject);
	procedure edtTampungChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSelectCanonTargetClick(Sender: TObject);
    procedure tbSeaStateMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbWindSpeedMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbSeaSpeedMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbTempMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbBaroPressureMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbHumidityMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbFogIntensityMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
//    procedure vrwhlWindDirecMouseUp(Sender: TObject; Button: TMouseButton;
//      Shift: TShiftState; X, Y: Integer);
//    procedure vrwhlSeaDirectionMouseUp(Sender: TObject;
//      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lvWeaponMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure On1Click(Sender: TObject);
    procedure eRBU6000RangeKeyPress(Sender: TObject; var Key: Char);
    procedure tmrRBUTimer(Sender: TObject);
    procedure tbSeaStateChange(Sender: TObject);
    procedure tbWindSpeedChange(Sender: TObject);
    procedure tbSeaSpeedChange(Sender: TObject);
    procedure tbTempChange(Sender: TObject);
    procedure tbBaroPressureChange(Sender: TObject);
    procedure tbHumidityChange(Sender: TObject);
    procedure tbFogIntensityChange(Sender: TObject);
    procedure vrwhlWindDirecChange(Sender: TObject);
    procedure RestartAllCommunication1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure tsTrajectoryMapviewChange(Sender: TObject);
    procedure ProfilKetinggian1Click(Sender: TObject);
    procedure btnCanonTest3DMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCanonTest3DMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnstoprotateClick(Sender: TObject);
    procedure btn1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn1Click(Sender: TObject);
    procedure tmrSeaStateTimer(Sender: TObject);
    procedure btnCamPinClick(Sender: TObject);
    procedure wheelAzimutChange(Sender: TObject);
    procedure trackBarRangeChange(Sender: TObject);
    procedure trackBarElevationChange(Sender: TObject);
    procedure edtAzimutExit(Sender: TObject);
    procedure btnFreeCamClick(Sender: TObject);
    procedure edtAzimutKeyPress(Sender: TObject; var Key: Char);
    procedure wheelAzimutMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure trackBarRangeMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtRangeValueExit(Sender: TObject);
    procedure edtRangeValueKeyPress(Sender: TObject; var Key: Char);
    procedure edtElevationValueExit(Sender: TObject);
    procedure edtElevationValueKeyPress(Sender: TObject; var Key: Char);
    procedure trackBarElevationMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MainMenuClick(Sender: TObject);
    procedure MainMenuMouseEnter(Sender: TObject);
    procedure MainMenuMouseLeave(Sender: TObject);
    procedure lvListScenKeyPress(Sender: TObject; var Key: Char);
    procedure imgEditClick(Sender: TObject);
    procedure lvListScenClick(Sender: TObject);
    procedure imgDeleteClick(Sender: TObject);
    procedure imgNewClick(Sender: TObject);
    procedure btnLoadScenarioClick(Sender: TObject);
    procedure btnStopScenarioClick(Sender: TObject);
    procedure lvShipListClick(Sender: TObject);
    procedure ClearAllDetail;
    procedure lvWeaponSelectSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvWeaponClick(Sender: TObject);
    procedure btnPlayerCameraLockClick(Sender: TObject);
    procedure btnCamViewOldLeftClick(Sender: TObject);
    procedure btnCamViewLeftClick(Sender: TObject);
    procedure btnCamMoveLefMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCamRotateOldLeftMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCamMoveLefMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnCamRotateOldLeftMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbSelectIDCameraChange(Sender: TObject);
    procedure mni3Click(Sender: TObject);
    procedure btnNewShipClick(Sender: TObject);
    procedure btnEditShipClick(Sender: TObject);
    procedure btnDeleteShipClick(Sender: TObject);
    procedure AdvSmoothPanel2Click(Sender: TObject);
    procedure VrWindDirectionChange(Sender: TObject);
    procedure VrCurrentDirectionChange(Sender: TObject);
    procedure edtPortSeaStateKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortWindSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortCurrentSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortTempKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortBarometerKeyPress(Sender: TObject; var Key: Char);
    procedure edtPortHumidityKeyPress(Sender: TObject; var Key: Char);
    procedure edtFogIntensityKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    ObserverID : integer ;
    onOffMode  : Integer;
    sceIDINI   : Integer;
    unlockCam  : boolean;

    Ship_ID: Integer;
    Ship_Name: string;
    Weapon_ID: Integer;
    Weapon_Name: string;

    ScaleHeight, ScaleWidht : Integer; // for trajectory

    //Trajectory
    FTrajectory : TTrajectory;

    scenarioGameName : string;

    procedure ClearScenarioDescData;
    procedure ClearListViewData(const aListView: TListView);
    procedure ClearListShipData(const aListView: TListView);
    procedure OnChangeEnvironment;

    procedure WakeOnLan(const AMacAddress : string); //yoga
    procedure UpdateEnvy;
    procedure SetObjectCreate;
    procedure SetHandleEvent;
    procedure SetImgSelectConsole;

    procedure CurrentShipItemSendCommandPlayerCamera ( const orderID, LockID : integer);
    procedure CurrentShipItemSendCommandPlayerLockSideCamera ( const orderID, TypeLock, LockID : integer);

    procedure CurrentShipItemSendCommanPlayerEvent( const orderID, valInt : Integer;
                                                    const valDbl : double);
//    procedure CurrentShipItemSendCommanPlayerEvent( const orderID, eventID, eventType : Integer;
//                                                    const SpeedPlayer, DesiredValue : double);

    procedure LoadImageLight(var Aimage : TImage; imgStat : string; const stat : byte);

  public

    ServerState : Byte; // 1: connected; 0: else
    { Public declarations }
    procedure SetFormLayout;
    procedure SetProject;
    procedure SetFormEnvironment;
    procedure AssignStatus(ShipID, WeaponID, LauncherID, MissileID : Byte; AssignStatus : Boolean );
    procedure RefreshFormWeapon(const WeaponName : string);
    procedure VisibleStatusShip( aValue : Boolean ; Mode : Integer);

    procedure ShowDefaultPageWeapon ( isDefault : boolean );

    function IsMenuItemExist( const shipID : integer ) : boolean ;
    function IsMenuItem2Exist (const shipID : integer ) : boolean ;

    procedure RunClientFromPopupMenu(Sender: TObject);
    procedure RunClientFromPopupSubMenu(Sender: TObject);
    procedure AutoRefresh;

    {$REGION ' Scenario Procedure '}

    procedure ShowScenario;
    procedure UpdateScenarioData;
    procedure ClearScenarioData;

    {$ENDREGION}

    {$REGION ' ShowShip Procedure '}

    procedure ShowShip;
    procedure UpdateShipData;
    procedure ClearShipData;

    {$ENDREGION}

    procedure FillClientList;
    procedure CekLight;
    procedure AddMenuWithShipID (const shipID : integer);
    procedure DeleteMenuWithShipID (const shipID : integer);
    procedure DeleteAllMenuPopUpMenu;
    procedure ClearAllVisibleConsole;
    procedure SelectConsole;
    procedure execPDF(Sender : TObject);
    procedure menuHelp;
    function getSPSIP : string;
    procedure wtrChange;
    procedure StatusWeapon(shipid : Integer; weaponid : Byte ; value : Single; launcher :Byte );
    procedure readOnOffMode;
    procedure SetDefaultEnvirontment;

    procedure ShowWeaponPanel(WeaponID, LauncherID : integer);
    procedure SelectShip(aObject: TInsObject);

    procedure CreateTrajectory;
    procedure DestroyTrajectory;
  end;

const
  LoadImgOff      = '..\data\images\NFS instruktur - interface\imageIns\OFFLINE.bmp';
  LoadImgOn       = '..\data\images\NFS instruktur - interface\imageIns\ONLINE.bmp';
  LoadImgRunning  = '..\data\images\NFS instruktur - interface\imageIns\RUNNING.bmp';

  LoadScreenOff      = '..\data\images\NFS instruktur - interface\imageIns\screen\ScreenOffline.bmp';
  LoadScreenOn       = '..\data\images\NFS instruktur - interface\imageIns\screen\ScreenOnline.bmp';
  LoadScreenRunning  = '..\data\images\NFS instruktur - interface\imageIns\screen\ScreenRunning.bmp';

  LoadScreenServerOff      = '..\data\images\NFS instruktur - interface\imageIns\screen\ScreenOffline2.bmp';
  LoadScreenServerOn       = '..\data\images\NFS instruktur - interface\imageIns\screen\ScreenOnline2.bmp';
  LoadScreenServerRunning  = '..\data\images\NFS instruktur - interface\imageIns\screen\ScreenRunning2.bmp';

  OFFLINE = 0;
  ONLINE  = 1;
  RUNNING = 2;


var
  frmGameController: TfrmGameController;


implementation

uses DateUtils, ufListScenario, Math, ufrmeLeftControl, ufEnvi, ufrmShipEditor;

{$R *.dfm}

const
  APP_LAUNCH  = 'RUNNING';
  APP_IDLE    = 'ONLINE';
  APP_OFF     = 'OFFLINE';

  idx_cub   = 0;
  idx_name  = 1;
  idx_type  = 2;
  idx_ip    = 3;
  idx_st    = 4;
  idx_ship  = 5;

  aFogHeight : array[1..10] of double = (0.0002,0.0005,0.0008,0.0012,0.0022,0.0052,0.0082,0.012,0.02,0.1);

  c_aSeaState : array [0..9] of TSeaState =(
    (wavescale: '1e-009'; windspeed:  1.5; windlength: 0.5; windorientation: 0.0),
    (wavescale: '1e-009'; windspeed:  5.0; windlength: 1.5; windorientation: 0.0),
    (wavescale: '1e-009'; windspeed:  8.0; windlength: 3.0; windorientation: 0.0),
    (wavescale: '1e-009'; windspeed:  9.0; windlength: 3.0; windorientation: 0.0),
    (wavescale: '2e-009'; windspeed: 10.5; windlength: 3.0; windorientation: 0.0),
    (wavescale: '5e-009'; windspeed: 12.0; windlength: 3.0; windorientation: 0.0),
    (wavescale: '5e-009'; windspeed: 14.5; windlength: 3.0; windorientation: 0.0),
    (wavescale: '5e-009'; windspeed: 18.0; windlength: 3.5; windorientation: 0.0),
    (wavescale: '5e-009'; windspeed: 20.5; windlength: 4.0; windorientation: 0.0),
    (wavescale: '5e-009'; windspeed: 23.5; windlength: 5.0; windorientation: 0.0)

  );

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

procedure TfrmGameController.FormCreate(Sender: TObject);
begin
  SetObjectCreate;
  SetHandleEvent;
  SetImgSelectConsole;
  menuHelp;
  readOnOffMode;
//  frmListScenario.tmrPlayScenario.Enabled := False;
  unlockCam := False;
  //tmrSeaState.Enabled := True;
  frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.firstCekOpenGroupBar := False;

  EnableComposited(pnlMain);
//  EnableComposited(pnlMapInset);
end;

procedure TfrmGameController.DisplayController1Click(Sender: TObject);
begin
  case TComponent(sender).Tag of
    1 : frmMainInstruktur.SetFormLayout;
   // 2 : frmFiringCommand.SetFormLayout;
  end;
end;

{ ----------------------------------------------------------------------------------------- }
{ Set Form}
procedure TfrmGameController.SetFormEnvironment;
var
  i : integer;
  aOverlap : Integer;

  strPathRotary,
  strPathImage,
  strPathEnvy      : string;

begin
  strPathRotary := '..\data\images\NFS instruktur - interface\bmp\controller platform\rotary\';
  strPathImage  := '..\data\images\NFS instruktur - interface\bmp\controller platform\';
  strPathEnvy   := '..\data\images\NFS instruktur - interface\bmp\controller environment\';

  { Tab Main }
  TabMain.TabSettings.Height := 50;
  TabMain.TabSettings.Width  := Width div 5;

  { Tab Select Object }
//  TabSelectObject.TabSettings.Height := 40;
//  TabSelectObject.TabSettings.Width  := TabSelectObject.Width div 2;

  { Tab Control }
  TabControl.TabSettings.Height := 40;
  TabControl.TabSettings.Width  := TabControl.Width div 4;

  { Tab Camera n Map View}
  { Camera View 1}
  aOverlap                := (pnlPlayerCamera.Width - 20
                              - pnlCameraView.Width - pnlCameraRotate.Width - pnlCameraRotateOld.Width
                               - pnlCameraMove.Width) div 2;


//  pnlCameraSelectID.Top        := pnlStatusObject.Top + ((pnlStatusObject.Height div 2) - (pnlCameraSelectID.Height div 2));
//  pnlCameraSelectID.Left       := aOverlap;
//  pnlCameraView.Top            := 40 + pnlCameraView.Height - 120;
//  pnlCameraView.Left           := aOverlap;
//  pnlCameraRotate.Top          := 40 + pnlCameraView.Height - 120;
//  pnlCameraRotate.Left         := pnlCameraView.Left + pnlCameraView.Width + 10;
//  pnlCameraRotateOld.Top       := 40 + pnlCameraView.Height - 120;
//  pnlCameraRotateOld.Left      := pnlCameraRotate.Left + pnlCameraRotate.Width + 10;
//  pnlCameraMove.Top            := 40 + pnlCameraView.Height - 120;
//  pnlCameraMove.Left           := pnlCameraRotateOld.Left + pnlCameraRotateOld.Width + 10;
//
//  pnlCameraSelectID.Width       :=  pnlCameraRotate.Width + pnlCameraRotateOld.Width +
//                                    pnlCameraMove.Width + pnlCameraView.Width + 30;
//
//  //btnCameraLock.Left      := pnlCameraSelectID.Left + pnlCameraSelectID.Width + 10;
//  //btnCameraUnlock.Left    := btnCameraLock.Left + btnCameraLock.Width;
//
//  lblCameraView.Top       := 40 + pnlCameraView.Height - 150;
//  lblCameraView.Left      := aOverlap;
//  lblCameraRotate.Top     := 40 + pnlCameraView.Height - 150;
//  lblCameraRotate.Left    := pnlCameraRotate.Left;
//  lblCameraRotate2.top    := 40 + pnlCameraView.Height - 150;
//  lblCameraRotate2.Left   := pnlCameraRotateOld.Left;
//  lblCameraMove.Top       := 40 + pnlCameraView.Height - 150;
//  lblCameraMove.Left      := pnlCameraMove.Left;
//
//  { Wheel Camera }
//  vrWheelCameraRotateX.BackImage.LoadFromFile(strPathRotary + 'button_rotate camera 150.bmp');
//  vrWheelCameraRotateX.Radius       := 60;
//  vrWheelCameraRotateX.Transparent  := false;
//
//  vrWheelCameraRotateY.BackImage.LoadFromFile(strPathRotary + 'button_rotate camera 150.bmp');
//  vrWheelCameraRotateY.Radius       := 60;
//  vrWheelCameraRotateY.Transparent  := false;

//  pnlRuangIns.Width  := imgRuangIns.Width + 20;
//  pnlRuangIns.Height := imgRuangIns.Height + 20;
//  pnlRuangIns.Top    := 75;
//  pnlRuangIns.Left   := 0;
 // imgRuangIns.Left := 5;
 // imgRuangIns.top  := pnlRuangIns.Top + ;
//  lvClient.Top := 0;
//  lvClient.Left := imgRuangIns.Width + 30;
//
//  lvClient.Width := tsClient.Width - imgRuangIns.Width - 30;
//  lvClient.Align := alRight;

  { Listview Client}
//  for i:= 1 to lvClient.Columns.Count - 1 do
//  begin
//    if i = 3 then begin
//      lvClient.Columns[i].Width := lvClient.Columns[0].Width;
//    end
//    else if i = 6 then begin
//      lvClient.Columns[i].Width := ((lvClient.Width - lvClient.Columns[0].Width) div (lvClient.Columns.Count -1)) +
//      lvClient.Columns[0].Width;
//    end
//    else begin
//      lvClient.Columns[i].Width := (lvClient.Width - lvClient.Columns[0].Width) div (lvClient.Columns.Count -1);
//    end;
//
//    end;

  //Environment
  {wheel}
  vrwhlWindDirec.BackImage.LoadFromFile(strPathEnvy + 'button_rotary.bmp');
  vrwhlWindDirec.Radius       := 60;
  vrwhlWindDirec.Transparent  := True;

  vrwhlSeaDirection.BackImage.LoadFromFile(strPathEnvy + 'button_rotary.bmp');
  vrwhlSeaDirection.Radius       := 60;
  vrwhlSeaDirection.Transparent  := True;

  ShowDefaultPageWeapon(true);
end;

procedure TfrmGameController.FillClientList;
var
  i  : integer;
  li : TListItem;

  ListClient : TList;
  Client     : TClient;
  ClientList : TClientList;
  worldproject : string;
begin
  { Fill Client List }
//  for i:= 0 to lvClient.Items.Count -1 do
//  begin
//    if Assigned(lvClient.Items[i].Data) then
//      TObject(lvClient.Items[i].Data).Free;
//
//    lvClient.Items[i].Data := nil;
//  end;
//  lvClient.Items.Clear;
  ClearListViewData(lvClient);

  worldproject := SimManager.instProjectSet.World;

  ListClient := TList.Create;
  try
    DataModule1.GetAllListClient(ListClient);

    for i:= 0 to ListClient.Count -1 do
    begin
      if Assigned(ListClient.Items[i]) then begin

        Client := TClient(ListClient.Items[i]);

        li := lvClient.FindCaption(0, FormatFloat('00', Client.C_ID ), false, true, false);

        {Jika server atau instruktur dilompati}

//        if Client.C_Cubicle  = 'SERVER' then
//          Continue;
        if Client.C_Console  = 'INSTRUKTUR NAFS' then
            Continue
        else if Client.C_Console  = 'INSTRUKTUR NSFS' then
            Continue
        else if Client.C_Console  = 'INSTRUKTUR NSSFS' then
            Continue;

        if Client.C_GameType = 0 then       // Filter menurut game type
        begin
          if worldproject = 'NAFS' then
          begin
            with lvClient.Items.Add do
            begin
              ClientList := TClientList.Create;
              ClientList.Id           := Client.C_ID;
              ClientList.Cli_Cubicle  := Client.C_Cubicle;
              ClientList.Cli_Console  := Client.C_Console;
              ClientList.Cli_Type     := Client.C_Type;
              ClientList.Cli_IP       := Client.C_Ip;
              ClientList.Cli_Status   := Client.C_Status;
              ClientList.WeaponID     := Client.C_WeaponID;

              Caption := IntToStr(lvClient.Items.Count);
              SubItems.Add(Client.C_Cubicle);
              SubItems.Add(Client.C_Console);
              SubItems.Add(Client.C_Type);
              SubItems.Add(Client.C_Ip);
              SubItems.Add(Client.C_Status);
              SubItems.Add(Client.C_Ship);
              SubItems.Add('');

              Data := ClientList;
            end;
          end;
          Continue;
        end
        else if Client.C_GameType = 1 then
        begin
          if worldproject = 'NSFS' then
          begin
            with lvClient.Items.Add do
            begin
              ClientList := TClientList.Create;
              ClientList.Id           := Client.C_ID;
              ClientList.Cli_Cubicle  := Client.C_Cubicle;
              ClientList.Cli_Console  := Client.C_Console;
              ClientList.Cli_Type     := Client.C_Type;
              ClientList.Cli_IP       := Client.C_Ip;
              ClientList.Cli_Status   := Client.C_Status;
              ClientList.WeaponID     := Client.C_WeaponID;

              Caption := IntToStr(lvClient.Items.Count);
              SubItems.Add(Client.C_Cubicle);
              SubItems.Add(Client.C_Console);
              SubItems.Add(Client.C_Type);
              SubItems.Add(Client.C_Ip);
              SubItems.Add(Client.C_Status);
              SubItems.Add(Client.C_Ship);
              SubItems.Add('');

              Data := ClientList;
            end;
          end;
          Continue;
        end
        else if Client.C_GameType = 2 then
        begin
          if worldproject = 'NSSFS' then
          begin
            with lvClient.Items.Add do
            begin
              ClientList := TClientList.Create;
              ClientList.Id           := Client.C_ID;
              ClientList.Cli_Cubicle  := Client.C_Cubicle;
              ClientList.Cli_Console  := Client.C_Console;
              ClientList.Cli_Type     := Client.C_Type;
              ClientList.Cli_IP       := Client.C_Ip;
              ClientList.Cli_Status   := Client.C_Status;
              ClientList.WeaponID     := Client.C_WeaponID;

              Caption := IntToStr(lvClient.Items.Count);
              SubItems.Add(Client.C_Cubicle);
              SubItems.Add(Client.C_Console);
              SubItems.Add(Client.C_Type);
              SubItems.Add(Client.C_Ip);
              SubItems.Add(Client.C_Status);
              SubItems.Add(Client.C_Ship);
              SubItems.Add('');

              Data := ClientList;
            end;
          end;
          Continue;
        end;

        if not Assigned(li) then
        begin
          with lvClient.Items.Add do
          begin
            ClientList := TClientList.Create;
            ClientList.Id           := Client.C_ID;
            ClientList.Cli_Cubicle  := Client.C_Cubicle;
            ClientList.Cli_Console  := Client.C_Console;
            ClientList.Cli_Type     := Client.C_Type;
            ClientList.Cli_IP       := Client.C_Ip;
            ClientList.Cli_Status   := Client.C_Status;
            ClientList.WeaponID     := Client.C_WeaponID;
  //          ClientList.Cli_SHIPID   := Client.C_Ship;
  //          ClientList.Cli_LAUNCHERID   := StrToInt(Client.C_LauncherID);


            Caption := IntToStr(Client.C_ID);
            SubItems.Add(Client.C_Cubicle);
            SubItems.Add(Client.C_Console);
            SubItems.Add(Client.C_Type);
            SubItems.Add(Client.C_Ip);
            SubItems.Add(Client.C_Status);
            SubItems.Add(Client.C_Ship);
            SubItems.Add('');


            Data := ClientList;
          end;
        end;
      end;
    end;

    CekLight;
  finally
    ClearAList(ListClient);
    ListClient.Free;
  end;
end;

procedure TfrmGameController.SetFormLayout;
var
  i : integer;
begin
  { Set Game Controller }
  DefaultMonitor := dmDesktop;

  if SimManager.instMonitorSet.ContollerDisplay > Screen.MonitorCount then
    SimManager.instMonitorSet.ContollerDisplay := 0;

  Height       := Screen.Monitors[SimManager.instMonitorSet.ContollerDisplay].Height;
  Top          := Screen.Monitors[SimManager.instMonitorSet.ContollerDisplay].Top;
  Left         := Screen.Monitors[SimManager.instMonitorSet.ContollerDisplay].Left;
  width        := Screen.Monitors[SimManager.instMonitorSet.ContollerDisplay].Width;

  FillClientList;

  Show;
end;

procedure TfrmGameController.TabMainChange(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to TabMain.AdvSmoothTabPageCount -1 do
  begin
    TabMain.AdvSmoothTabPages[i].TabAppearance.Appearance.SimpleLayout := True;
  end;
  TabMain.ActivePage.TabAppearance.Appearance.SimpleLayout := False;
  if TabMain.ActivePage = tsClient then
  begin
    AutoRefresh;
  end;

  if TabMain.ActivePage = tsTrajectory then
  begin
    tsTrajectoryMapview.ActivePage := tsTrajectoryView ;
  end;

end;

procedure TfrmGameController.TabSelectObjectChange(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to TabSelectObject.AdvSmoothTabPageCount -1 do
  begin
    TabSelectObject.AdvSmoothTabPages[i].TabAppearance.Appearance.SimpleLayout := True;
  end;
  TabSelectObject.ActivePage.TabAppearance.Appearance.SimpleLayout := False;
  VisibleStatusShip(false, 1);
  if TabSelectObject.ActivePage = tsSelectWeapon then
  begin
    lvWeapon.Items.Clear;
    pgWeapon.ActivePage  := pgtwDefault;
    SimManager.TrackObject := nil;
    frmMainInstruktur.FrameControlLeft.NillAllSet;
    frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;
    frmMainInstruktur.FrameControlLeft.FrameGuidance.pnlGuidanceControlChoices.Visible := False;
    frmMainInstruktur.FrameControlLeft.FrameGuidance.pnlBack.BringToFront;
  end;

  lvWeapon.Items.Clear;
end;

procedure TfrmGameController.TabControlChange(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to TabControl.AdvSmoothTabPageCount -1 do
  begin
    TabControl.AdvSmoothTabPages[i].TabAppearance.Appearance.SimpleLayout := True;
  end;
  TabControl.ActivePage.TabAppearance.Appearance.SimpleLayout := False;
end;

procedure TfrmGameController.SetHandleEvent;
begin
  
end;

procedure TfrmGameController.SetObjectCreate;
var
  i : integer;
begin
  for i := 0 to TabMain.AdvSmoothTabPageCount -1 do
  begin
    TabMain.AdvSmoothTabPages[i].TabAppearance.Appearance.SimpleLayout := True;
  end;
  TabMain.ActivePage.TabAppearance.Appearance.SimpleLayout := False;

  for i := 0 to TabControl.AdvSmoothTabPageCount -1 do
  begin
    TabControl.AdvSmoothTabPages[i].TabAppearance.Appearance.SimpleLayout := True;
  end;

  for i := 0 to TabSelectObject.AdvSmoothTabPageCount -1 do
  begin
    TabSelectObject.AdvSmoothTabPages[i].TabAppearance.Appearance.SimpleLayout := True;
  end;
  TabSelectObject.ActivePage.TabAppearance.Appearance.SimpleLayout := False;

  VisibleStatusShip(False, 1);

  TabMain.ActivePage := tsPlatform;
end;

procedure TfrmGameController.SetProject;
var
  strPath, worldproject : string;
begin
  {$REGION ' Setting Header '}
  strPath := '..\data\images\NFS instruktur - interface\imageIns\';

  worldproject := SimManager.instProjectSet.World;

  if worldproject = 'NAFS' then
  begin
    imgHeaderProject.Picture.LoadFromFile(strPath + 'nafs_.bmp');
//    pnlMainMenu.Fill.Color := $00D0875A;
  end
  else if worldproject = 'NSFS' then
  begin
    imgHeaderProject.Picture.LoadFromFile(strPath + 'nsfs_.bmp');
//    pnlMainMenu.Fill.Color := $0040220F;
  end
  else if worldproject = 'NSSFS' then
  begin
    imgHeaderProject.Picture.LoadFromFile(strPath + 'nssfs_.bmp');
//    pnlMainMenu.Fill.Color := $0058524F;
  end;
  {$ENDREGION}

  {$REGION ' Setting Panel '}
//  if worldproject = 'NAFS' then
//  begin
//    FrameControlLeft.pnlUp.Fill.Color := $00D0875A;
//  end
//  else if worldproject = 'NSFS' then
//  begin
//    FrameControlLeft.pnlUp.Fill.Color := $0040220F;
//  end
//  else if worldproject = 'NSSFS' then
//  begin
//    FrameControlLeft.pnlUp.Fill.Color := $0058524F;
//  end;

  {$ENDREGION}
end;

{ ----------------------------------------------------------------------------------------- }

{ ----------------------------------------------------------------------------------------- }
{ Scenario Menu }
procedure TfrmGameController.qClick(Sender: TObject);
var
  btnSelected : integer;
begin
  case TComponent(Sender).Tag of
    1 :
    begin
      frmGameController.Close;
      //frmFiringCommand.Close;

      SimManager.isDatabaseMode := True;

      frmSceEditor.isNew := True;

      frmSceEditor.SetFormLayout;
      frmSceEditor.SetFormEnvironment;
      frmMainInstruktur.lblCekRunning.Caption := 'Editing';
      frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;
    end;

    2 : ;//frmReportEvent.Show;

    3 :
    begin
      if SimManager.fGamePlayType = gpmReplay then
      begin
        ShowMessage('Stop Replay first to play Scenario');
        exit;
      end;

      if frmMainInstruktur.lblCekRunning.Caption = 'Play' then
      begin
        ShowMessage('Stop Scenario Play First');
        Exit;
      end;

      frmListScenario.btnOk.Tag := 1;
      frmListScenario.btnOk.Enabled        := False;
      frmListScenario.lblGameName.Visible  := True;
      frmListScenario.edtGameName.Visible  := True;
      frmListScenario.btnRemove.Visible    := False;
      frmListScenario.ShowModal;

    end;

    4 :
    begin
      btnSelected := 6;   // mrYes
      if SimManager.fGamePlayType = gpmScenAndRecord then   begin
        frmMainInstruktur.btnRecordStart.Hint := 'OffRecord';
        frmMainInstruktur.btnRecordStart.ImageIndex    := 0;
        SimManager.StopRecording;
        btnSelected := MessageDlg('Instruktur :: stop recording and stop scenario',
                   mtConfirmation,[mbYes,mbNo],0);
      end;
      if btnSelected = mrYes then
      begin
        frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;
        if Length(SimManager.bridgeSet.mServer.m3D_IP) > 0 then
          SimManager.StopToClientOnIP(SimManager.bridgeSet.mServer.m3D_IP);
        frmMainInstruktur.Caption := 'Firing System Instruktur';
        frmMainInstruktur.cekCaption  := frmMainInstruktur.Caption;
        SimManager.NetSendStatusGame(0, 2);
        SimManager.NetSendTo3D_SetCommandOrder(0, ORD_REFRESH_CLIENT, 0, 0,0,0,0) ;
        frmMainInstruktur.deleteLeftFrame;
        SetDefaultEnvirontment;

        //dendy sementara
//        lvRuntimeShipTrajectory.Items.Clear;
        ClearListViewData(lvRuntimeShipTrajectory);
//        lvRuntimeMissileTrajectory.Items.Clear;
        ClearListViewData(lvRuntimeMissileTrajectory);
        frmMainInstruktur.FrameControlLeft.Width := 0;
      end;
    end;
  end;
end;
{ ----------------------------------------------------------------------------------------- }

procedure TfrmGameController.VisibleStatusShip(aValue: Boolean; Mode : integer);
begin
  lblShipName.Visible   := aValue;
  lblLat.Visible        := aValue;
  lblLong.Visible       := aValue;
  lblZCord.Visible      := aValue;
  lblHeading.Visible    := aValue;
  lblSpeed.Visible      := aValue;
  lblLatValue.Visible   := aValue;
  lblLongVal.Visible    := aValue;
  lblZVal.Visible       := aValue;
  lblHeadingVal.Visible := aValue;
  lblSpeedVal.Visible   := aValue;

  case Mode of
    1 :
    begin
      lblPitch.Visible      := aValue;
      lblRoll.Visible       := aValue;

      lblPitchVal.Visible   := aValue;
      lblRollVal.Visible    := aValue;
    end;
  end;
end;

procedure TfrmGameController.VrCurrentDirectionChange(Sender: TObject);
var
  valTemp : Integer;

begin
  if VrCurrentDirection.Position < 180 then
  begin
    valTemp := (180 + VrCurrentDirection.Position);
  end
  else
  begin
    valTemp := (VrCurrentDirection.Position - 180);
  end;
  edtCurrentDirection.Text := IntToStr(valTemp);
end;

procedure TfrmGameController.lvRuntimeMissileClick(Sender: TObject);
var
  Weapon : TWeapon;
begin
  VisibleStatusShip(False, 1);
  lvRuntimeShip.Selected := nil;
  lvWeapon.Items.Clear;

  if Assigned(TListView(sender).Selected) then
  begin
    if Assigned(TListView(Sender).Selected.Data) then
    begin
      Weapon := TWeapon(TListView(Sender).Selected.Data);

      VisibleStatusShip(true, 2);

      if Weapon.z <= 0 then lblZCord.Caption.Text := 'Depth'
      else lblZCord.Caption.Text := 'Altitude';

      lblShipName.Caption.Text    := Weapon.MissileName + '-' +
                                     IntToStr(Weapon.launcherID) + '.' +
                                     IntToStr(Weapon.missileID) + '.' +
                                     IntToStr(Weapon.MissileNumber);

      lblLatValue.Caption.Text    := FormatFloat('0.0000',Weapon.Y);
      lblLongVal.Caption.Text     := FormatFloat('0.0000',Weapon.X);
      lblZVal.Caption.Text        := FormatFloat('0.00',Abs(Weapon.Z));
      lblHeadingVal.Caption.Text  := FormatFloat('0.00',Weapon.heading);
    end;
  end;
end;

procedure TfrmGameController.lvRuntimeShipClick(Sender: TObject);
var
  i, j, x, flag : integer;

  Weapon        : TWeapon;
  WeaponShip    : TWeaponGetList;
  Vehicle       : TVehicle;
  listWeaponSce,
  ListWeapon    : TList;
  status        : string;
  sceWeapon     : TScenarioWeapon;
  strPicture    : string;

  weaponOnShipTemp :  TWeaponOnShip;
begin
  VisibleStatusShip(false, 1);
  lvRuntimeMissile.Selected := nil;

  if Assigned(TListView(sender).Selected) then
  begin
    if Assigned(TListView(Sender).Selected.Data) then
    begin
      Ship_ID := TVehicle(TListView(Sender).Selected.Data).Vehicle_ID;
      Ship_Name := TVehicle(TListView(Sender).Selected.Data).Vehicle_Name;

      strPicture := '..\Data\imageship\' +
      TVehicle(TListView(Sender).Selected.Data).Vehicle_Name + '.png';

      Vehicle := TVehicle(TListView(Sender).Selected.Data);

      VisibleStatusShip(true, 1);

      case Vehicle.Vehicle_Type of
        1 : lblZCord.Caption.Text := 'Depth';
        2 : lblZCord.Caption.Text := 'Altitude';
        3 : lblZCord.Caption.Text := 'Depth';
      end;

      lblShipName.Caption.Text    := Vehicle.Vehicle_Name +' ( ID '+IntToStr(Vehicle.Vehicle_ID) + ' )';
      lblLatValue.Caption.Text    := FormatFloat('0.0000',Vehicle.Vehicle_Y);
      lblLongVal.Caption.Text     := FormatFloat('0.0000',Vehicle.Vehicle_X);
      lblZVal.Caption.Text        := FormatFloat('0.00',Abs(Vehicle.Vehicle_Z));
      lblHeadingVal.Caption.Text  := FormatFloat('0.00',Vehicle.Vehicle_Heading);
      lblSpeedVal.Caption.Text    := FormatFloat('0.00',Vehicle.Vehicle_Speed);
      lblPitchVal.Caption.Text    := FormatFloat('0.00',Vehicle.Vehicle_Pitch);
      lblRollVal.Caption.Text     := FormatFloat('0.00',Vehicle.Vehicle_Roll);

      frmMainInstruktur.MainMap.CenterX := Vehicle.Vehicle_X;
      frmMainInstruktur.MainMap.CenterY := Vehicle.Vehicle_Y;
      frmMainInstruktur.SetTrackObject;

      if FileExists(strPicture) then
      begin
        imgShip.Picture.LoadFromFile(strPicture);
      end;
    end;

    ShowDefaultPageWeapon(true);

    ClearListViewData(lvWeapon);

    try
      if Assigned(SimManager.TrackObject) then
      begin
        for i := 0 to SimManager.TrackObject.WeaponOnShip_List.Count-1 do
        begin
          weaponOnShipTemp := TWeaponOnShip(SimManager.TrackObject.WeaponOnShip_List[i]);

          Weapon := TWeapon.Create;

          Weapon.WeaponID := weaponOnShipTemp.Weapon_ID;
          Weapon.launcherID := weaponOnShipTemp.Weapon_Launcher;
          Weapon.MissileName := weaponOnShipTemp.Weapon_Name;

          with lvWeapon.Items.Add do
          begin
            Data := Weapon;
            Caption := weaponOnShipTemp.Weapon_Name;
            SubItems.Add(IntToStr(weaponOnShipTemp.Weapon_Launcher));

            if (weaponOnShipTemp.Weapon_Name = 'Moc Console') or (weaponOnShipTemp.Weapon_Name = 'Moc PKR Console') or
               (weaponOnShipTemp.Weapon_Name = 'RBU6000') or (weaponOnShipTemp.Weapon_Name = 'Cannon 40')or
               (weaponOnShipTemp.Weapon_Name = 'Cannon 120') or (weaponOnShipTemp.Weapon_Name = 'Cannon 57')or
               (weaponOnShipTemp.Weapon_Name = 'Cannon 76') or (weaponOnShipTemp.Weapon_Name = 'Cannon AK230')or
               (weaponOnShipTemp.Weapon_Name = 'Cannon 35') or (weaponOnShipTemp.Weapon_Name = 'Cannon Type 730') or
               (weaponOnShipTemp.Weapon_Name = 'Exocet MM40') or (weaponOnShipTemp.Weapon_Name = 'Exocet MM38') then
            begin
              SubItems.Add('Automatic')
            end
            else
            begin
              if weaponOnShipTemp.Weapon_Status = 1 then
                SubItems.Add('On')
              else
                SubItems.Add('Off')
            end;
          end;
        end;
      end;

    finally

    end;
  end
  else
  begin
    lvWeapon.Items.Clear;
    ShowDefaultPageWeapon(true);
    lblInfo.Caption := '';
    SimManager.TrackObject := nil;
    frmMainInstruktur.FrameControlLeft.NillAllSet;
    frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;
    frmMainInstruktur.FrameControlLeft.FrameGuidance.pnlGuidanceControlChoices.Visible := False;
    frmMainInstruktur.FrameControlLeft.FrameGuidance.pnlBack.BringToFront;

  end;
end;

procedure TfrmGameController.lvShipListClick(Sender: TObject);
begin
  if lvShipList.Selected = nil then
    Exit;

  UpdateShipData;

end;

{ --------------------------------------------------------------------- }
{ Pop Up Menu }
function TfrmGameController.IsMenuItemExist( const shipID: integer): boolean;
var
  i : integer ;
  menuItem : TMenuItem;
begin
  Result := false ;
  for i:=0 to pmClient.Items.Count - 1 do
  begin
    menuItem := pmClient.Items[i];
    if menuItem.Name = 'pmShip'+IntToStr(shipID) then
    begin
      Result := true ;
      Break;
    end;
  end;
end;


function TfrmGameController.IsMenuItem2Exist(
  const shipID: integer): boolean;
var
  i : integer ;
  menuItem : TMenuItem;
begin
  Result := false ;
  for i:=0 to pmClient2.Items.Count - 1 do
  begin
    menuItem := pmClient2.Items[i];
    if menuItem.Name = 'pm2Ship'+IntToStr(shipID) then
    begin
      Result := true ;
      Break;
    end;
  end;
end;

procedure TfrmGameController.AddMenuWithShipID(const shipID: integer);
var
  i : integer;

  menuItem,
  subItem : TMenuItem;
begin
  { Add Menu for PmClient }
  if not IsMenuItemExist(shipID) then
  begin
    menuItem := TMenuItem.Create(pmClient);
    menuItem.Name    := 'pmShip'+IntToStr(shipID);
    menuItem.Caption := DataModule1.GetShipName(shipID);
    menuItem.OnClick := RunClientFromPopupMenu;
    menuItem.Tag     := shipID;
    pmClient.Items.Add(menuItem);
  end;

  { Add Menu for PmClient2 }
  if not IsMenuItem2Exist(shipID) then
  begin
    menuItem := TMenuItem.Create(pmClient2);
    menuItem.Name    := 'pm2Ship'+IntToStr(shipID);
    menuItem.Caption := DataModule1.GetShipName(shipID);
    menuItem.Tag     := shipID;
    pmClient2.Items.Add(menuItem);

    for i := 1 to 3 do
    begin
      subItem := TMenuItem.Create(pmClient2);
      subItem.Caption   := 'Launcher ' + IntToStr(i);
      subItem.Tag       := shipID;
      subItem.Hint      := IntToStr(i);
      subItem.OnClick   := RunClientFromPopupSubMenu;
      //subItem.Items[1].Enabled := False;
      menuItem.Add(subItem);
    end;
  end;
end;

procedure TfrmGameController.DeleteMenuWithShipID(const shipID: integer);
var
  i : integer ;
  menuItem : TMenuItem;
begin
  { Delete Menu for PmClient }
  for i:=0 to pmClient.Items.Count - 1 do
  begin
    menuItem := pmClient.Items[i];
    if menuItem.Name = 'pmShip'+IntToStr(shipID) then
    begin
      pmClient.Items.Delete(i);
      FreeAndNil(menuItem);
      Break;
    end;
  end;

  { Delete Menu for PmClient2 }
  for i:=0 to pmClient2.Items.Count - 1 do
  begin
    menuItem := pmClient2.Items[i];
    if menuItem.Name = 'pm2Ship'+IntToStr(shipID) then
    begin
      pmClient2.Items.Delete(i);
      FreeAndNil(menuItem);
      Break;
    end;
  end;
end;

procedure TfrmGameController.DeleteAllMenuPopUpMenu;
var
  i : Integer;
  menuItem : TMenuItem;
begin
  { Delete all item in pop up menu }
  for i := pmClient.Items.Count -1 downto 0 do
  begin
    menuItem := pmClient.Items[i];
    if menuItem.Tag = -1 then Continue;

    pmClient.Items.Delete(i);
    FreeAndNil(menuItem);
  end;

  { Delete all item in pop up menu }
  for i := pmClient2.Items.Count -1 downto 0 do
  begin
    menuItem := pmClient2.Items[i];
    if menuItem.Tag = -1 then Continue;

    pmClient2.Items.Delete(i);
    FreeAndNil(menuItem);
  end;
end;

function TfrmGameController.getSPSIP : string;
begin

end;

procedure TfrmGameController.btnNewShipClick(Sender: TObject);
begin

  SimManager.isDatabaseMode := True;

  frmShipEditor.isNew := True;

  frmShipEditor.SetFormWeapon;
  frmShipEditor.ClearVisualForm;

  frmMainInstruktur.lblCekRunning.Caption := 'Editing';
//  frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;
end;

procedure TfrmGameController.btnEditShipClick(Sender: TObject);
begin
  if lvShipList.Selected <> nil then
  begin
    frmShipEditor.SetFormWeapon;
    frmShipEditor.isNew := false;

    frmShipEditor.Ship_Name := lvShipList.Selected.SubItems[0];
    frmShipEditor.Ship_ID := StrToInt(lvShipList.Selected.Caption);

    frmShipEditor.UpdateVisualForm;
    frmMainInstruktur.lblCekRunning.Caption := 'Editing';
  end
  else
  begin
    ShowMessage('Select Ship Name First' );
  end;

end;

procedure TfrmGameController.imgDeleteClick(Sender: TObject);
var
  id : Integer;
begin
  if lvListScen.Selected <> nil then
  begin
    id :=  StrToInt(lvListScen.Selected.Caption);
    DataModule1.DeleteScenario(id);

    ShowMessage('Scenario ' + lvListScen.Selected.SubItems[0] + ' successfully deleted');

    ClearScenarioData;

  end
  else
    ShowMessage('Select Scenario First');

  ShowShip;
end;

procedure TfrmGameController.imgEditClick(Sender: TObject);
begin
  if lvListScen.Selected <> nil then
  begin
    frmSceEditor.Scenario_ID  := StrToInt(lvListScen.Selected.Caption);
    frmSceEditor.ScenarioName := lvListScen.Selected.SubItems[0];

    frmSceEditor.isNew := false;
    frmSceEditor.UpdateVisualForm;
    frmSceEditor.SetFormLayout;
    frmMainInstruktur.lblCekRunning.Caption := 'Editing';
    frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;

    Close;
  end
  else
  begin
    ShowMessage('Select Scenario First');
  end;
end;

procedure TfrmGameController.imgNewClick(Sender: TObject);
begin
  Close;
  //frmFiringCommand.Close;

  SimManager.isDatabaseMode := True;

  frmSceEditor.isNew := True;

  frmSceEditor.SetFormLayout;
  frmSceEditor.SetFormEnvironment;
  frmMainInstruktur.lblCekRunning.Caption := 'Editing';
  frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;
end;

procedure TfrmGameController.RunClientFromPopupMenu(Sender: TObject);
var
  shipID      : integer ;
  isOnline    : Boolean;
  ipClient    : string;
  i           : Integer;
  kapal       : string;
  senjata     : string;
  ipSPS       : string;
  ipMOC1      : string;
begin
  if not (Sender is TMenuItem) then exit;

  isOnline    := False;
  shipID      := TMenuItem(sender).Tag;

  if lvClient.Selected <> nil then
  begin
    isOnline := lvClient.Selected.SubItems[idx_st] = APP_IDLE;
    ipClient := lvClient.Selected.SubItems[idx_ip];
    senjata  := lvClient.Selected.SubItems[idx_name];
    kapal    := DataModule1.GetShipName(shipID);


    if isOnline then begin
      if senjata = 'MOC-1' then begin
        SimManager.InstrukturSendLaunchCommand(ipClient, IntToStr(shipID), '0');
        //DataModule1.updateShipName(ipClient, kapal);
        ipSPS := lvClient.Items[17].SubItems[idx_ip];
        SimManager.InstrukturSendLaunchCommand(ipSPS, IntToStr(shipID), '0');
        //DataModule1.updateShipName(ipSPS, kapal);
      end
      else if  senjata = 'SPS115' then begin
        SimManager.InstrukturSendLaunchCommand(ipClient, IntToStr(shipID), '0');
        //DataModule1.updateShipName(ipClient, kapal);
        ipMOC1 := lvClient.Items[5].SubItems[idx_ip];
        SimManager.InstrukturSendLaunchCommand(ipMOC1, IntToStr(shipID), '0');
        //DataModule1.updateShipName(ipMOC1, kapal);
      end
      else begin
        SimManager.InstrukturSendLaunchCommand(ipClient, IntToStr(shipID), '0');
        //DataModule1.updateShipName(ipClient, kapal);
      end;
    end;
  end;
  AutoRefresh;
  end;


procedure TfrmGameController.RunClientFromPopupSubMenu(Sender: TObject);
var
  shipID      : integer;
  launcherID  : Integer;
  isOnline    : Boolean;
  ipClient    : string;
  i           : Integer;
  kapal       : string;
begin
  if not (Sender is TMenuItem) then exit;

  isOnline    := False;
  shipID      := TMenuItem(sender).Tag;
  launcherID  := StrToInt(TMenuItem(sender).Hint);


  if lvClient.Selected <> nil then
  begin
    isOnline := lvClient.Selected.SubItems[idx_st] = APP_IDLE;
    ipClient := lvClient.Selected.SubItems[idx_ip];
    kapal := DataModule1.GetShipName(shipID);
    //dendy cek
    if isOnline then
    begin
      SimManager.InstrukturSendLaunchCommand(ipClient, IntToStr(shipID), IntToStr(launcherID));
      //DataModule1.updateShipName(ipClient, kapal);
    end;
  end;
  AutoRefresh;
end;

procedure TfrmGameController.lvClientMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p : TPoint;

  I,J,k: integer;

  WeaponID : integer;

  ShipID : integer;
  ListWeapon : TList;
  WeaponList : TWeaponGetList;
  ClientConsole : TClientList;
  isFound, RbuLauncher1Ready, RbuLauncher2Ready : Boolean;
  ShipClass, ShipClass2 : string;

  ShipID2 : integer;
  ListWeapon2 : TList;
  listWeaponSce, listWeaponSce2 : TList;
  WeaponList2 : TWeaponGetList;
  isFound2 : Boolean;
  sceWeapon : TScenarioWeapon;
begin
  if ( Button = mbright ) then
  begin
    GetCursorPos(p);

    if Assigned(lvClient.Selected) then
    begin
      if not Assigned(lvClient.Selected.Data) then
        Exit;
      WeaponID := TClientList(lvClient.Selected.Data).WeaponID;

      if ( lvClient.Selected.SubItems[idx_type] = '3D-W' ) then
      begin
        for i:= 0 to pmClient2.Items.Count -1 do
          pmClient2.Items[i].Enabled := True;

        { Check Available Except MOC }
        try
          ListWeapon2 := TList.Create;
          for i:= 0 to pmClient2.Items.Count -1 do
          begin
            ShipID2 := pmClient2.Items[i].Tag;

            if ShipID2 <= 0 then Continue;
            if weaponID = 0 then continue;

//            ListWeapon2.Clear;
            ClearAList(ListWeapon2);
            DataModule1.GetListWeaponOnShip(ShipID2, ListWeapon2);

            isFound2 := False;
            for j:= 0 to ListWeapon2.Count -1 do
            begin
              if Assigned(ListWeapon2.Items[j]) then begin

                WeaponList2 := TWeaponGetList(ListWeapon2.Items[j]);

                if WeaponList2.IDWeapon = WeaponID then //WeaponID then     coba yakhont
                begin
                  if WeaponList2.IDWeapon = C_DBID_CANNON40 then
                  begin
                    DataModule1.GetShipType(ShipID2,ShipClass2);
                    if ShipClass2 = 'Fatahillah' then
                    begin
                      isFound2 := False;
                    end
                    else
                    begin
                      isFound2 := True;
                    end;
                  end
                  else
                  begin
                    isFound2 := True;
                  end;

                  Break;
                end;
              end;
            end;

            if not isFound2 then
              pmClient2.Items[i].Enabled := false
            else
            begin

              pmClient2.Items[i].Enabled := True;

              if (lvClient.Selected.SubItems.Strings[5] = DeleteAmpersand(pmClient2.Items[i].Caption))then
                pmClient2.Items[i].Enabled := False
              else
              pmClient2.Items[i].Enabled := true;


              if (lvClient.Selected.SubItems[1] = 'TDS Meriam 57') then
              begin
                pmClient2.Items[i].Items[0].Enabled := False;
                pmClient2.Items[i].Items[1].Enabled := False;
                pmClient2.Items[i].Items[2].Enabled := False;

                DataModule1.GetListWeaponOnShipBySceID(0, pmClient.Items[i].Tag, listWeaponSce);

                for k := 0 to listWeaponSce.Count-1 do
                begin
                  sceWeapon := TScenarioWeapon(listWeaponSce.Items[k]);
                  if (sceWeapon.LauncherID = 2) and (sceWeapon.WeaponID = C_DBID_CANNON57) and (sceWeapon.ShipID = ShipID2)   then
                  begin
                      pmClient2.Items[i].Items[1].Enabled := True;
                  end;
                end;

                ClearAList(listWeaponSce);
                listWeaponSce.Free;

              end
              else if (lvClient.Selected.SubItems[1] = 'TDS Meriam 40') then
              begin
                DataModule1.GetShipType(ShipID2,ShipClass2);
                pmClient2.Items[i].Items[0].Enabled := False;
                pmClient2.Items[i].Items[1].Enabled := False;
                pmClient2.Items[i].Items[2].Enabled := False;

                DataModule1.GetListWeaponOnShipBySceID(0, pmClient.Items[i].Tag, listWeaponSce);

                for k := 0 to listWeaponSce.Count-1 do
                begin
                  sceWeapon := TScenarioWeapon(listWeaponSce.Items[k]);
                  if sceWeapon.WeaponID = C_DBID_CANNON40 then
                  begin
                    if ShipClass2 <> 'Fatahillah' then
                    begin
                      if sceWeapon.LauncherID = 2 then
                      begin
                          pmClient2.Items[i].Items[1].Enabled := True;
                      end
                      else if sceWeapon.LauncherID = 3 then
                      begin
                          pmClient2.Items[i].Items[2].Enabled := True;
                      end;
                    end;
                  end;

                end;

                ClearAList(listWeaponSce);
                listWeaponSce.Free;

              end
              else if (lvClient.Selected.SubItems[1] = 'MISTRAL') then
              begin
               pmClient2.Items[i].Items[0].Enabled := False;
               pmClient2.Items[i].Items[1].Enabled := False;
               pmClient2.Items[i].Items[2].Enabled := False;

                DataModule1.GetListWeaponOnShipBySceID(0, pmClient.Items[i].Tag, listWeaponSce);

                for k := 0 to listWeaponSce.Count-1 do
                begin
                  sceWeapon := TScenarioWeapon(listWeaponSce.Items[k]);

                  if (sceWeapon.WeaponID = C_DBID_MISTRAL) and (sceWeapon.ShipID = ShipID2) then
                  begin
                    if sceWeapon.LauncherID = 1 then
                    begin
                        pmClient2.Items[i].Items[0].Enabled := True;
                    end
                    else if sceWeapon.LauncherID = 2 then
                    begin
                        pmClient2.Items[i].Items[1].Enabled := True;
                    end
                    else if sceWeapon.LauncherID = 3 then
                    begin
                        pmClient2.Items[i].Items[2].Enabled := True;
                    end;
                  end;

                end;

                ClearAList(listWeaponSce);
                listWeaponSce.Free;

              end
              else if (lvClient.Selected.SubItems[1] = 'STRELLA') then
              begin
                pmClient2.Items[i].Items[0].Enabled := False;
                pmClient2.Items[i].Items[1].Enabled := False;
                pmClient2.Items[i].Items[2].Enabled := False;

                DataModule1.GetListWeaponOnShipBySceID(0, pmClient.Items[i].Tag, listWeaponSce);

                for k := 0 to listWeaponSce.Count-1 do
                begin
                  sceWeapon := TScenarioWeapon(listWeaponSce.Items[k]);

                  if (sceWeapon.WeaponID = C_DBID_STRELA) and (sceWeapon.ShipID = ShipID2) then
                  begin
                    if sceWeapon.LauncherID = 1 then
                    begin
                        pmClient2.Items[i].Items[0].Enabled := True;
                    end
                    else if sceWeapon.LauncherID = 2 then
                    begin
                        pmClient2.Items[i].Items[1].Enabled := True;
                    end
                    else if sceWeapon.LauncherID = 3 then
                    begin
                        pmClient2.Items[i].Items[2].Enabled := True;
                    end;

                  end;

                end;

                ClearAList(listWeaponSce);
                listWeaponSce.Free;

              end;


            end;
          end;
        finally
          ListWeapon2.Free;
        end;
        pmClient2.Popup(p.X, p.Y);
      end
      else
      begin
        for i:= 0 to pmClient.Items.Count -1 do
          pmClient.Items[i].Enabled := true;

        if (lvClient.Selected.SubItems[idx_name] = 'MOC-1') or
           (lvClient.Selected.SubItems[idx_name] = 'MOC-2') then
        begin
          for i:= 0 to pmClient.Items.Count -1 do
          begin
            isFound := False;
            ShipID := pmClient.Items[i].Tag;

            if ShipID <= 0 then Continue;
            //if weaponID = 0 then continue;

            DataModule1.GetShipType(ShipID,ShipClass);
            if ShipClass = 'Diponegoro ( Sigma )' then
            begin
              isFound := true;
            end;

            if not isFound then
                pmClient.Items[i].Enabled := false
            else
            begin


              if (lvClient.Selected.SubItems.Strings[5] = DeleteAmpersand(pmClient.Items[i].Caption))then
                pmClient.Items[i].Enabled := False
              else
               pmClient.Items[i].Enabled := true;
            end;
          end;
        end

        else if (lvClient.Selected.SubItems[1] = 'WCC') then
        begin
          for i:= 0 to pmClient.Items.Count -1 do
          begin
            isFound := False;
            ShipID := pmClient.Items[i].Tag;

            if ShipID <= 0 then Continue;
            //if weaponID = 0 then continue;

            DataModule1.GetShipType(ShipID,ShipClass);
            if ShipClass = 'Fatahillah' then
            begin
              isFound := true;
            end;

            if not isFound then
                pmClient.Items[i].Enabled := false
            else
            begin

              if (lvClient.Selected.SubItems.Strings[5] = DeleteAmpersand(pmClient.Items[i].Caption))then
                pmClient.Items[i].Enabled := False
              else
               pmClient.Items[i].Enabled := true;

              if (lvClient.Selected.SubItems[1] = 'WCC') then
              begin
                pmClient.Items[i].Enabled := False;
                DataModule1.GetListWeaponOnShipBySceID(0, pmClient.Items[i].Tag, listWeaponSce2);

                for k := 0 to listWeaponSce2.Count-1 do
                begin

                  sceWeapon := TScenarioWeapon(listWeaponSce2.Items[k]);
                  if (sceWeapon.WeaponID = C_DBID_CANNON120) and (sceWeapon.ShipID = ShipID) then
                  begin
                    if sceWeapon.LauncherID = 1 then
                    begin
                       pmClient.Items[i].Enabled := True;
                    end;

                  end;
                end;

                ClearAList(listWeaponSce2);
                listWeaponSce2.Free;

              end;

            end;
          end;
        end

        else
        begin
        { Check Available Except MOC }
          try
            ListWeapon := TList.Create;
            for i:= 0 to pmClient.Items.Count -1 do
            begin
              ShipID := pmClient.Items[i].Tag;

              if ShipID <= 0 then Continue;
              if weaponID = 0 then continue;

              ListWeapon.Clear;
              DataModule1.GetListWeaponOnShip(ShipID, ListWeapon);

              isFound := False;
              for j:= 0 to ListWeapon.Count -1 do
              begin
                WeaponList := TWeaponGetList(ListWeapon.Items[j]);

                if WeaponList.IDWeapon = WeaponID then
                begin
                  isFound := True;
                  Break;
                end;

              end;

              if not isFound then
                pmClient.Items[i].Enabled := false
              else
              begin

                if (lvClient.Selected.SubItems.Strings[5] = DeleteAmpersand(pmClient.Items[i].Caption))then
                  pmClient.Items[i].Enabled := False
                else
                 pmClient.Items[i].Enabled := true;



                if (lvClient.Selected.SubItems[1] = 'RBU 6000') then
                begin
                  pmClient.Items[i].Enabled := False;
                  DataModule1.GetListWeaponOnShipBySceID(0, pmClient.Items[i].Tag, listWeaponSce2);

                  for k := 0 to listWeaponSce2.Count-1 do
                  begin

                    sceWeapon := TScenarioWeapon(listWeaponSce2.Items[k]);
                    if (sceWeapon.WeaponID = C_DBID_RBU6000) and (sceWeapon.ShipID = ShipID) then
                    begin
                      if sceWeapon.LauncherID = 1 then
                      begin
                         RbuLauncher1Ready := True;
                      end;
                      if sceWeapon.LauncherID = 2 then
                      begin
                         RbuLauncher2Ready := True;
                      end;
                    end;
                  end;

                  ClearAList(listWeaponSce2);
                  listWeaponSce2.Free;

                  if (RbuLauncher1Ready = True) and (RbuLauncher2Ready = True) then
                  begin
                    pmClient.Items[i].Enabled := True;
                  end;

                  RbuLauncher1Ready  := False;
                  RbuLauncher2Ready := False;

                end
                else if (lvClient.Selected.SubItems[1] = 'Asroc') then
                begin
                  pmClient.Items[i].Enabled := False;
                  DataModule1.GetListWeaponOnShipBySceID(0, pmClient.Items[i].Tag, listWeaponSce2);

                  for k := 0 to listWeaponSce2.Count-1 do
                  begin

                    sceWeapon := TScenarioWeapon(listWeaponSce2.Items[k]);
                    if (sceWeapon.WeaponID = C_DBID_ASROC) and (sceWeapon.ShipID = ShipID) then
                    begin
                      if sceWeapon.LauncherID = 1 then
                      begin
                         pmClient.Items[i].Enabled := True;
                      end;

                    end;
                  end;

                  ClearAList(listWeaponSce2);
                  listWeaponSce2.Free;

                end;

              end;
            end;
          finally
            ClearAList(ListWeapon);
            ListWeapon.Free;
          end;
        end;
        pmClient.Popup(p.X, p.Y);
      end;
    end;
  end
  else
  begin
     SelectConsole;
  end;
end;

procedure TfrmGameController.lvListScenClick(Sender: TObject);
var
  aDateTime : TDatetime;
  formatDate : string;
begin
  if lvListScen.Selected = nil then
    Exit;

  aDateTime := Now;
  DateTimeToString(formatDate, 'ddmmyy_hhnnss', aDateTime);
  scenarioGameName := lvListScen.Selected.SubItems[0]+'_'+formatDate;

  UpdateScenarioData;

end;

procedure TfrmGameController.lvListScenKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #13 then
//  begin
////    btnOkClick(btnOK);
//  end;
end;

{ --------------------------------------------------------------------- }

procedure TfrmGameController.btnRefreshClientClick(Sender: TObject);
var
  i : integer;
begin
  FillClientList;

  for i := 0 to lvClient.Items.Count -1 do
  begin
    if (lvClient.Items[i].SubItems[1] = 'SERVER NSFS') or (lvClient.Items[i].SubItems[1] = 'SERVER NAFS') or
       (lvClient.Items[i].SubItems[1] = 'SERVER NSSFS') then
    begin
      if ServerState = 1 then
        lvClient.Items[i].SubItems[4] := 'ONLINE';
    end;

    lvClient.Items[i].SubItems[4] := 'OFFLINE';
  end;

  SimManager.CheckStatusConsole;
  Sleep(100);

  btnRefreshClient.Enabled := false;
  tmrStatus.Enabled        := true;
end;

{ ---------------------------------------------------------------------- }
{ Firing Command }
{ C802 }
procedure TfrmGameController.btnC802_FireClick(Sender: TObject);
var
  isValid : Boolean;

  i,
  ShipID,
  weaponID,
  LauncherID,
  MissileID,
  MissileNumber,
  TargetID : Integer;
  rangDeg  : TRangDeg;
  recRangDeg : TList;
  Vehicle    : TVehicle;

  mTargetBearing, mTargetRange : Single;

  RecSend   : TRecData_C802;
  RecSend2  : TRecObjectAssigned;
  C802LauncherID : string;
begin
  isValid := True;

  if cbbC802Launcher.Text = 'kanan 1' then begin
    C802LauncherID := IntToStr(1);
    end
  else if cbbC802Launcher.Text = 'kiri 1' then begin
    C802LauncherID := IntToStr(2);
  end
  else if cbbC802Launcher.Text = 'kanan 2' then begin
    C802LauncherID := IntToStr(3);
  end
  else begin
    C802LauncherID := IntToStr(4);
  end;


  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToInt(C802LauncherID, LauncherID) then isValid := False;

  if not TryStrToInt(edtC802_Number.Text, MissileNumber) then isValid := False;
  if not TryStrToInt(edtC802_Missile.Text, MissileID) then isValid := False;

  if not TryStrToFloat(edtC802_TBearing.Text, mTargetBearing) then isValid := False;
  if not TryStrToFloat(edtC802_TRange.Text, mTargetRange) then isValid := False;

  if Sender = btnSetPosC802 then
  begin
    SimManager.FMap.CurrentTool := TOOL_SELECT_COORD_C802;
  end;

  weaponID := 7;
  recRangDeg := TList.Create;
  DataModule1.getRangDeg(ShipID, weaponID, LauncherID, recRangDeg);


  for i := 0 to recRangDeg.count -1 do
  begin
    rangDeg := TRangDeg(recRangDeg[i]);
  end;

  Vehicle := TVehicle(frmGameController.lvRuntimeShip.Selected.Data);

  if isValid then
  begin
    mTargetRange := mTargetRange * C_NauticalMile_To_Metre;

    RecSend.ShipID         := ShipID;
    RecSend.mLauncherID    := LauncherID;
    RecSend.mMissileID     := MissileID;
    RecSend.mMissileNumber := MissileNumber;
    RecSend.OrderID        := 0;

    if (StrToFloat(edtC802_TBearing.Text)< Vehicle.Vehicle_Heading )then
    begin
      RecSend.mTargetBearing := (mTargetBearing + (Vehicle.Vehicle_Heading-360));
    end
    else
    begin
      RecSend.mTargetBearing := mTargetBearing + Vehicle.Vehicle_Heading;
    end;

    RecSend.mTargetRange   := mTargetRange;

    RecSend.mWeaponID      := C_DBID_C802;

    case TComponent(sender).Tag of
      //fire
      1 : begin
            if (StrToFloat(edtC802_TRange.Text) > rangDeg.rangeMin) and (StrToFloat(edtC802_TRange.Text) < rangDeg.rangeMax) then
            begin

               if (StrToFloat(edtC802_TBearing.Text) > rangDeg.startDeg ) and  (StrToFloat(edtC802_TBearing.Text) < rangDeg.endDeg ) then
               begin
//                 RecSend.OrderID := __ORD_C802_FIRE;
                 RecSend.OrderID := __ORD_C802_TAKE_OFF;
                 SimManager.NetSendTo3D_OrderMissile_C802(RecSend);
               end;

            end;

          end;
      2 : begin
            RecSend.OrderID := __ORD_C802_LOADING;
            SimManager.NetSendTo3D_OrderMissile_C802(RecSend);
          end;
    end;
  end;
end;

{ Yakhont }
procedure TfrmGameController.btnYahkont_Fire_Click(Sender: TObject);
var
  isValid : Boolean;

  ShipID, weaponID, i,
  LauncherID,
  MissileID,
  MissileNumber,
  TargetID : Integer;

  Missile1,
  Missile2,
  Missile3,
  Missile4 : integer;

  mTargetBearing, mTargetRange : Single;

  RecSend           : TRecData_Yakhont;
  RecSend2          : TRecObjectAssigned;
  yakhontLauncherID,
  M1,M2,M3,M4       : string;
  recRangDeg        : TList;
  rangDeg           : TRangDeg;
begin
  isValid := True;

  if cbbYahkontLauncher.Text = 'Missile 1' then
  begin
    yakhontLauncherID := IntToStr(1);
  end
  else if cbbYahkontLauncher.Text = 'Missile 2' then
  begin
    yakhontLauncherID := IntToStr(2);
  end
  else if cbbYahkontLauncher.Text = 'Missile 3' then
  begin
    yakhontLauncherID := IntToStr(3);
  end
  else
  begin
    yakhontLauncherID := IntToStr(4);
  end;

  if chkYahkontM1.Checked = True then
  begin
     M1 := '1';
  end
  else
     M1 := '0';
  if chkYahkontM2.Checked = True then
  begin
     M2 := '1';
  end
  else
     M2 := '0';
  if chkYahkontM3.Checked = True then
  begin
     M3 := '1';
  end
  else
     M3 := '0';
  if chkYahkontM4.Checked = True then
  begin
     M4 := '1';
  end
  else
     M4 := '0';

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToInt(yakhontLauncherID, LauncherID) then isValid := False;
  if not TryStrToInt(edtYahkont_Number.Text, MissileNumber) then isValid := False;
  if not TryStrToInt(edtYahkont_Missile.Text, MissileID) then isValid := False;

  if not TryStrToFloat(edtYahkont_TBearing.Text, mTargetBearing) then isValid := False;
  if not TryStrToFloat(edtYahkont_TRange.Text, mTargetRange) then isValid := False;

  if not TryStrToInt(M1, Missile1) then isValid := False;
  if not TryStrToInt(M2, Missile2) then isValid := False;
  if not TryStrToInt(M3, Missile3) then isValid := False;
  if not TryStrToInt(M4, Missile4) then isValid := False;

  if sender = btnSetPosYahkont then
  begin
    SimManager.FMap.CurrentTool := TOOL_SELECT_COORD_YAKHONT;
  end;

  weaponID := 6;
  recRangDeg := TList.Create;
  DataModule1.getRangDeg(ShipID, weaponID, LauncherID, recRangDeg);


  for i := 0 to recRangDeg.count -1 do
  begin
    rangDeg := TRangDeg(recRangDeg[i]);
  end;

  if isValid then
  begin
    mTargetRange := mTargetRange * C_NauticalMile_To_Metre;

    RecSend.ShipID         := ShipID;
    RecSend.mLauncherID    := LauncherID;
    RecSend.mMissileID     := MissileID;
    RecSend.mMissileNumber := MissileNumber;
    RecSend.OrderID        := 0;

    RecSend.mTargetBearing := mTargetBearing;
    RecSend.mTargetRange   := mTargetRange;

    RecSend.mWeaponID      := C_DBID_YAKHONT;

    RecSend.mMissile1      := Missile1;
    RecSend.mMissile2      := Missile2;
    RecSend.mMissile3      := Missile3;
    RecSend.mMissile4      := Missile4;

    case TComponent(sender).Tag of
      //fire
      1 : begin
            if(StrToFloat(edtYahkont_TRange.Text) > rangDeg.rangeMin) and (StrToFloat(edtYahkont_TRange.Text) < rangDeg.rangeMax) then
            begin
              RecSend.OrderID := __ORD_Yahkont_FIRE;
              SimManager.NetSendTo3D_OrderMissile_YAHKONT(RecSend);
            end
            else
            Exit;
          end;
      2 : begin
            RecSend.OrderID := __ORD_Yahkont_LOADING;
            SimManager.NetSendTo3D_OrderMissile_YAHKONT(RecSend);
          end;
      3 : begin
            RecSend.OrderID := __ORD_Yahkont_RELEASE;
            SimManager.NetSendTo3D_OrderMissile_YAHKONT(RecSend);
          end;
    end;
  end;
end;

{ Exocet MM40 }
procedure TfrmGameController.btnExocet40_FireClick(Sender: TObject);
var
  ShipID, weaponID,
  launcherID,
  MissileID,
  MissileNumber : integer;

  mTBearing,
  mTRange,
  mObstacle_Alt,
  mObstacle_Range,
  mApproach_Range,
  mTerminal_Range  : Single;

  mLeft_Angle       : Single;
  mRight_Angle      : Single;
  mFar_Range        : Single;
  mNear_Range       : Single;

  Masking_1, Masking_2, Masking_3, Masking_4,
  Masking_5, Masking_6, Masking_7, Masking_8,
  Masking_9, Masking_10, Masking_11, Masking_12,
  Masking_13, Masking_14, Masking_15, Masking_16 : Integer;

  mSeekerOpenHeading : Single;
  mSeekerOpenPosX, mSeekerOpenPosY : Double;

  mAngular_Mode,
  mAgility_Mode,
  mInitialStep_Mode : Integer;

  isvalid : Boolean;

  recrangdeg : TList;
  RecSend : TRec3DSetExocet_40;
  exoLauncherID : string;
  rangdeg :TRangDeg;
  i : integer;
begin
  isValid := True;

  Masking_1 := 0;
  Masking_2 := 0;
  Masking_3 := 0;
  Masking_4 := 0;
  Masking_5 := 0;
  Masking_6 := 0;
  Masking_7 := 0;
  Masking_8 := 0;
  Masking_9 := 0;
  Masking_10:= 0;
  Masking_11:= 0;
  Masking_12:= 0;
  Masking_13:= 0;
  Masking_14:= 0;
  Masking_15:= 0;
  Masking_16:= 0;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToFloat(edtExocet40_TBearing.Text,mTBearing) then isvalid := False;
  if not TryStrToFloat(edtExocet40_TRange.Text,mTRange) then isvalid := False;

  if not TryStrToFloat(edtExocet40_ObstacleAlt.Text, mObstacle_Alt) then isvalid := False;
  if not TryStrToFloat(edtExocet40_ObstacleRange.Text, mObstacle_Range) then isvalid := False;
  //if not TryStrToFloat(edtExocet40_ApproachRange.Text, mApproach_Range) then isvalid := False;
  if not TryStrToFloat(edtExocet40_TerminalRange.Text, mTerminal_Range) then isvalid := False;

  if not TryStrToFloat(edtExxocet40_LeftAngle.Text, mLeft_Angle) then isvalid := False;
  if not TryStrToFloat(edtExxocet40_RightAngle.Text, mRight_Angle) then isvalid := False;
  if not TryStrToFloat(edtExxocet40_FarRange.Text, mFar_Range) then isvalid := False;
  if not TryStrToFloat(edtExxocet40_NearRange.Text, mNear_Range) then isvalid := False;
  if not TryStrToFloat(edtExxocet40_SeekOpenX.Text, mSeekerOpenPosX) then isvalid := False;
  if not TryStrToFloat(edtExxocet40_SeekOpenY.Text, mSeekerOpenPosY) then isvalid := False;
  if not TryStrToFloat(edtExxocet40_OpenSeekerHead.Text, mSeekerOpenHeading) then isvalid := False;

  if cbbExxocetLauncher.Text = 'kanan' then begin
    launcherID := 1;
  end
  else begin
    launcherID := 2;
  end;


  mAngular_Mode     := cbbExocet40_AngularMode.ItemIndex;
  mAgility_Mode     := cbbExocet40_AgilityMode.ItemIndex;
  mInitialStep_Mode := cbbExocet40_InitialStepMode.ItemIndex;
  MissileID         := cbbExocet40_Missile.ItemIndex + 1;
  MissileNumber     := cbbExocet40_Number.ItemIndex + 1;
  mApproach_Range   := cbbExocet40_ApproachRange.ItemIndex + 2;

  if chkExxoMask_1.Checked = True then
    Masking_1 := 1;
  if chkExxoMask_2.Checked = True then
    Masking_2 := 1;
  if chkExxoMask_3.Checked = True then
  Masking_3 := 1;
  if chkExxoMask_4.Checked = True then
  Masking_4 := 1;
  if chkExxoMask_5.Checked = True then
  Masking_5 := 1;
  if chkExxoMask_6.Checked = True then
    Masking_6 := 1;
  if chkExxoMask_7.Checked = True then
    Masking_7 := 1;
  if chkExxoMask_8.Checked = True then
    Masking_8 := 1;
  if chkExxoMask_9.Checked = True then
  Masking_9 := 1;
  if chkExxoMask_10.Checked = True then
    Masking_10 := 1;
  if chkExxoMask_11.Checked = True then
    Masking_11 := 1;
  if chkExxoMask_12.Checked = True then
    Masking_12 := 1;
  if chkExxoMask_13.Checked = True then
    Masking_13 := 1;
  if chkExxoMask_14.Checked = True then
    Masking_14 := 1;
  if chkExxoMask_15.Checked = True then
    Masking_15 := 1;
  if chkExxoMask_16.Checked = True then
    Masking_16 := 1;

  if TComponent(sender).Tag = 2 then SimManager.FMap.CurrentTool := TOOL_SELECT_COORD;

  if isvalid then
  begin
     mTRange                         := mTRange * C_NauticalMile_To_Metre;
     mApproach_Range                 := mApproach_Range * 1828.8;

     RecSend.shipID                  := ShipID;
     RecSend.mWeaponID               := C_DBID_EXOCET_MM40;
     RecSend.mLauncherID             := launcherID;
     RecSend.mMissileID              := MissileID;
     RecSend.mMissileNumber          := MissileNumber;

     RecSend.sOrder                  := __ORD_EXOCET_40_FIRE;

     RecSend.mTBearing               := mTBearing;
     RecSend.mTRange                 := mTRange;

     RecSend.mAngular_Mode           := mAngular_Mode;
     RecSend.mAgility_Mode           := mAgility_Mode;
     RecSend.mInitialStep_Mode       := mInitialStep_Mode;

     RecSend.mObstacle_Alt           := mObstacle_Alt;
     RecSend.mObstacle_Range         := mObstacle_Range;
     RecSend.mApproach_Range         := mApproach_Range;
     RecSend.mTerminal_Range         := mTerminal_Range;

     RecSend.mLeft_Angle             := mLeft_Angle;
     RecSend.mRight_Angle            := mRight_Angle;
     RecSend.mFar_Range              := mFar_Range;
     RecSend.mNear_Range             := mNear_Range;

     RecSend.mMasking1               := Masking_1;
     RecSend.mMasking2               := Masking_2;
     RecSend.mMasking3               := Masking_3;
     RecSend.mMasking4               := Masking_4;
     RecSend.mMasking5               := Masking_5;
     RecSend.mMasking6               := Masking_6;
     RecSend.mMasking7               := Masking_7;
     RecSend.mMasking8               := Masking_8;
     RecSend.mMasking9               := Masking_9;
     RecSend.mMasking10              := Masking_10;
     RecSend.mMasking11              := Masking_11;
     RecSend.mMasking12              := Masking_12;
     RecSend.mMasking13              := Masking_13;
     RecSend.mMasking14              := Masking_14;
     RecSend.mMasking15              := Masking_15;
     RecSend.mMasking16              := Masking_16;
     RecSend.mSeekerOpenPosX         := mSeekerOpenPosX;
     RecSend.mSeekerOpenPosY         := mSeekerOpenPosY;
     RecSend.mSeekerOpenHeading      := mSeekerOpenHeading;

     case TComponent(sender).Tag of
        1 : begin
//              if ((mTBearing >= rangdeg.startDeg) and (mTBearing <= rangdeg.endDeg)
//              and (mTRange >= rangdeg.rangeMin) and (mTRange <= rangdeg.rangeMax))
//              then begin
                SimManager.NetSendTo3D_OrderMissileExocet_MM40(RecSend);
//              end;
            end;

        4 : begin
              RecSend.sOrder  := __ORD_EXOCET_40_LOADING;
              SimManager.NetSendTo3D_OrderMissileExocet_MM40(RecSend);
            end;
     end;

  end;

end;

{ Strella }
procedure TfrmGameController.btnStopScenarioClick(Sender: TObject);
var
  btnSelected : integer;
begin
  btnSelected := 6;   // mrYes
  if SimManager.fGamePlayType = gpmScenAndRecord then   begin
    frmMainInstruktur.btnRecordStart.Hint := 'OffRecord';
    frmMainInstruktur.btnRecordStart.ImageIndex    := 0;
    SimManager.StopRecording;
    btnSelected := MessageDlg('Instruktur :: stop recording and stop scenario',
               mtConfirmation,[mbYes,mbNo],0);
  end;
  if btnSelected = mrYes then
  begin
    frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;
    if Length(SimManager.bridgeSet.mServer.m3D_IP) > 0 then
      SimManager.StopToClientOnIP(SimManager.bridgeSet.mServer.m3D_IP);
    frmMainInstruktur.Caption := 'Firing System Instruktur';
    frmMainInstruktur.cekCaption  := frmMainInstruktur.Caption;
    SimManager.NetSendStatusGame(0, 2);
    SimManager.NetSendTo3D_SetCommandOrder(0, ORD_REFRESH_CLIENT, 0, 0,0,0,0) ;
    frmMainInstruktur.deleteLeftFrame;
    SetDefaultEnvirontment;

    //dendy sementara
//        lvRuntimeShipTrajectory.Items.Clear;
    ClearListViewData(lvRuntimeShipTrajectory);
//        lvRuntimeMissileTrajectory.Items.Clear;
    ClearListViewData(lvRuntimeMissileTrajectory);
    frmMainInstruktur.FrameControlLeft.Width := 0;
  end;
end;

procedure TfrmGameController.btnStrella_FireClick(Sender: TObject);
var
  isValid          : Boolean;

  i,
  weaponID,
  ShipID,
  LauncherID,
  MissileID,
  MissileNumber    : Integer;

  recRangDeg       : TList;
  rangDeg          : TRangDeg;

  mTargetBearing,
  mTargetRange,
  mTargetElevasi   : Single;

  RecSend          : TRec3DSetStrella;
  Idlauncher       : String ;
begin
  if cbbStrellaLauncher.Text = 'kiri' then begin
    Idlauncher := IntToStr(1);
  end
  else if cbbStrellaLauncher.Text = 'kanan' then begin
    Idlauncher := IntToStr(2);
  end;


  isValid := True;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToInt(Idlauncher, LauncherID) then isValid := False;
  if not TryStrToInt(cbbStrelaMissileID.Text, MissileID) then isValid := False;
  if not TryStrToInt(edtStrella_Number.Text, MissileNumber) then isValid := False;

  if not TryStrToFloat(edtStrella_TBearing.Text, mTargetBearing) then isValid := False;
  if not TryStrToFloat(edtStrella_TRange.Text, mTargetRange) then isValid := False;
  if not TryStrToFloat(edtStrella_TElev.Text, mTargetElevasi) then isValid := False;

  if Sender = btnSetPosStrella then
  begin
    SimManager.FMap.CurrentTool := TOOL_SELECT_COORD_STRELLA;
  end;

  weaponID := 9;
  recRangDeg := TList.Create;
  DataModule1.getRangDeg(ShipID, weaponID, LauncherID, recRangDeg);


  for i := 0 to recRangDeg.count -1 do
  begin
    rangDeg := TRangDeg(recRangDeg[i]);
  end;

  if isValid then
  begin
    mTargetRange := mTargetRange * C_NauticalMile_To_Metre;

    RecSend.ShipID         := ShipID;
    RecSend.mLauncherID    := LauncherID;
    RecSend.mMissileID     := MissileID;
    RecSend.mMissileNumber := MissileNumber;
    RecSend.OrderID        := 0;

    RecSend.mTargetBearing := mTargetBearing;
    RecSend.mTargetRange   := mTargetRange;
    RecSend.mTargetElev    := mTargetElevasi;

    RecSend.mWeaponID      := C_DBID_STRELA;

    case TComponent(sender).Tag of
      //fire
      1 : begin
             if (StrToFloat(edtStrella_TRange.Text) > rangDeg.rangeMin) and (StrToFloat(edtStrella_TRange.Text) < rangDeg.rangeMax) then
             begin

                 if (StrToFloat(edtStrella_TBearing.Text) > rangDeg.startDeg ) and  (StrToFloat(edtStrella_TBearing.Text) < rangDeg.endDeg ) then
                 begin
                   RecSend.OrderID := __ORD_STRELLA_FIRE;
                   SimManager.NetSendTo3D_OrderMissileStrella(RecSend);
                 end;

             end;

          end;
      //assign
      2 : begin
            RecSend.OrderID := __ORD_STRELLA_ASSIGN;
            SimManager.NetSendTo3D_OrderMissileStrella(RecSend);
          end;
      //loading
      3 : begin
            RecSend.OrderID := __ORD_STRELLA_LOADING;
            SimManager.NetSendTo3D_OrderMissileStrella(RecSend);
          end;
    end;
  end;
end;

{ Mistral }
procedure TfrmGameController.btnMistral_FireClick(Sender: TObject);
var
  isValid         : Boolean;

  ShipID, weaponID,
  LauncherID, i,
  MissileID,
  MissileNumber   : Integer;

  mTargetBearing,
  mTargetRange,
  mTargetElevasi  : Single;

  RecSend         : TRec3DSetMistral;
  Idlauncher      : string;
  recRangDeg      : TList;
  rangDeg         : TRangDeg;
begin
   if cbbMistralLaunch.Text = 'kiri' then begin
    Idlauncher := IntToStr(1);
  end
  else if cbbMistralLaunch.Text = 'kanan' then begin
    Idlauncher := IntToStr(2);
  end;
  isValid := True;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToInt(Idlauncher, LauncherID) then isValid := False;
  if not TryStrToInt(cbbMistralMissileID.Text, MissileID) then isValid := False;
  if not TryStrToInt(edtMistral_Number.Text, MissileNumber) then isValid := False;

  if not TryStrToFloat(edtMistral_TBearing.Text, mTargetBearing) then isValid := False;
  if not TryStrToFloat(edtMistral_TRange.Text, mTargetRange) then isValid := False;
  if not TryStrToFloat(edtMistral_TElev.Text, mTargetElevasi) then isValid := False;

  if Sender = btnSetPosMistral then
  begin
    SimManager.FMap.CurrentTool := TOOL_SELECT_COORD_MISTRAL;
  end;

  weaponID := 8;
  recRangDeg := TList.Create;
  DataModule1.getRangDeg(ShipID, weaponID, LauncherID, recRangDeg);

  for i := 0 to recRangDeg.count -1 do begin
    rangDeg := TRangDeg(recRangDeg[i]);
  end;

  if isValid then
  begin
    mTargetRange := mTargetRange * C_NauticalMile_To_Metre;

    RecSend.ShipID         := ShipID;
    RecSend.mLauncherID    := LauncherID;
    RecSend.mMissileID     := MissileID;
    RecSend.mMissileNumber := MissileNumber;
    RecSend.OrderID        := 0;

    RecSend.mTargetBearing := mTargetBearing;
    RecSend.mTargetRange   := mTargetRange;
    RecSend.mTargetElev    := mTargetElevasi;

    RecSend.mWeaponID      := C_DBID_MISTRAL;

    case TComponent(sender).Tag of
      //Fire
      1 : begin
            if((mTargetRange >= rangdeg.rangeMin * C_NauticalMile_To_Metre) and
              (mTargetRange <= rangdeg.rangeMax * C_NauticalMile_To_Metre)) and
              ((mTargetBearing >= rangdeg.startDeg) and (mTargetBearing <= rangdeg.endDeg))then begin
              RecSend.OrderID := __ORD_MISTRAL_FIRE;
              SimManager.NetSendTo3D_OrderMissileMistral(RecSend);
            end;

          end;
      //Assign
      2 : begin
            RecSend.OrderID := __ORD_MISTRAL_ASSIGN;
            SimManager.NetSendTo3D_OrderMissileMistral(RecSend);
          end;
      //Loading
      3 : begin
            RecSend.OrderID := __ORD_MISTRAL_LOADING;
            SimManager.NetSendTo3D_OrderMissileMistral(RecSend);
          end;
    end;
  end;
end;


{ Tetral }
procedure TfrmGameController.btnTetral_FireClick(Sender: TObject);
var
  isValid : Boolean;

  ShipID, i,
  LauncherID, weaponID,
  MissileID,
  MissileNumber   : Integer;

  mTargetBearing,
  mTargetRange,
  mTargetElevasi  : Single;

  RecSend         : TRec3DSetTetral;
  Idlauncher      : string;
  recRangDeg      : TList;
  rangDeg         : TRangDeg;
begin
   if cbbTetralLaunch.Text = 'kiri' then
   begin
    Idlauncher := IntToStr(1);
  end
  else if cbbTetralLaunch.Text = 'kanan' then begin
    Idlauncher := IntToStr(2);
  end;

  isValid := True;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToInt(Idlauncher, LauncherID) then isValid := False;
  if not TryStrToInt(cbbTetral_Missile.Text, MissileID) then isValid := False;
  if not TryStrToInt(edtTetral_Number.Text, MissileNumber) then isValid := False;

  if not TryStrToFloat(edtTetral_TBearing.Text, mTargetBearing) then isValid := False;
  if not TryStrToFloat(edtTetral_TRange.Text, mTargetRange) then isValid := False;
  if not TryStrToFloat(edtTetral_TElev.Text, mTargetElevasi) then isValid := False;

  if Sender = btnSetPosTetral then
  begin
    SimManager.FMap.CurrentTool := TOOL_SELECT_TETRAL_TARGET;
  end;

  weaponID := 5;
  recRangDeg := TList.Create;
  DataModule1.getRangDeg(ShipID, weaponID, LauncherID, recRangDeg);

  for i := 0 to recRangDeg.count -1 do begin
    rangDeg := TRangDeg(recRangDeg[i]);
  end;

  if isValid then
  begin
    mTargetRange := mTargetRange * C_NauticalMile_To_Metre;

    RecSend.ShipID           := ShipID;
    RecSend.mLauncherID      := LauncherID;
    RecSend.mMissileID       := MissileID;
    RecSend.mMissileNumber   := MissileNumber;
    RecSend.OrderID          := 0;

    RecSend.mTargetBearing   := mTargetBearing;
    RecSend.mTargetRange     := mTargetRange;
    RecSend.mTargetElev      := mTargetElevasi;

    RecSend.mWeaponID        := C_DBID_TETRAL;

    case TComponent(sender).Tag of
      //Fire
      1 : begin
           if((mTargetRange >= rangdeg.rangeMin * C_NauticalMile_To_Metre) and
              (mTargetRange <= rangdeg.rangeMax * C_NauticalMile_To_Metre)) and
              ((((mTargetBearing >= rangdeg.startDeg) and (mTargetBearing <= 360)) or((mTargetBearing >= 0)
              and (mTargetBearing <= rangDeg.endDeg)))) and (LauncherID = 1) then begin
             RecSend.OrderID := __ORD_TETRAL_FIRE;
             SimManager.NetSendTo3D_OrderMissileTetral(RecSend);
           end
           else if (mTargetRange >= rangdeg.rangeMin * C_NauticalMile_To_Metre) and
              (mTargetRange <= rangdeg.rangeMax * C_NauticalMile_To_Metre) and (mTargetBearing >= rangDeg.startDeg)
               and (mTargetBearing <= rangDeg.endDeg) and (LauncherID = 2) then begin
                RecSend.OrderID := __ORD_TETRAL_FIRE;
                SimManager.NetSendTo3D_OrderMissileTetral(RecSend);
               end;
          end;
      //Assign
      2 : begin
            RecSend.OrderID := __ORD_TETRAL_ASSIGN;
            SimManager.NetSendTo3D_OrderMissileTetral(RecSend);
          end;
      //Loading
      3 : begin
            RecSend.OrderID := __ORD_TETRAL_LOADING;
            SimManager.NetSendTo3D_OrderMissileTetral(RecSend);
          end;
    end;

  end;
end;

{ Cannon }
procedure TfrmGameController.btnCannonStartFire23Click(Sender: TObject);
var
  Item : TListItem;
  ItemWeapon : TListItem;

  isValid : Boolean;

  ShipID, salvoRate,
  WeaponID,
  LauncherID,
  MissileID,
  MissileNumber : Integer;

  TargetID,
  ModeID,
  BalistikID : integer;

  CorrectBearing,
  CorrectElev : Double;

  RecSend : TRec3DSetWCC;

  Weapon : TWeapon;
begin
  isValid := True;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvWeapon.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  if not Assigned(lvWeapon.Selected.Data) then Exit;
  ShipID    := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;
  WeaponID  := TWeapon(lvWeapon.Selected.Data).WeaponID;

  if not TryStrToInt(edtCannonLauncherID23.Text , LauncherID) then isValid := False;
  if not TryStrToInt(edtCannonMissileID23.Text, MissileID) then isValid := false;
  if not TryStrToInt(edtCannonLauncherID23.Text, LauncherID) then isValid := False;
  if not TryStrToInt(edtCannonMissileNumber23.Text, MissileNumber) then isValid := false;

  if not TryStrToInt(edtCannonTargetID23.Text, TargetID) then isValid := false;
  if not TryStrToFloat(edtCannonCorrElev23.Text, CorrectElev) then isValid := false;
  if not TryStrToFloat(edtCannonCorrBearing23.Text, CorrectBearing) then isValid := False;
  if not TryStrToInt(cbbSalvoRate23.Text , salvoRate) then isValid := False;

  ModeID := cbbCannonModeID23.ItemIndex + 1;
  BalistikID := cbbCannonBalistikID23.ItemIndex;

  if isValid then
  begin
    RecSend.ShipID          := ShipID;
    RecSend.mWeaponID       := WeaponID;
    RecSend.mLauncherID     := LauncherID;
    RecSend.mMissileID      := MissileID;
    RecSend.mMissileNumber  := MissileNumber;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := TargetID;
    RecSend.mModeID             := ModeID;
    RecSend.mAutoCorrectElev    := CorrectElev;
    RecSend.mAutoCorrectBearing := CorrectBearing;

    RecSend.mBalistikID         := BalistikID;
    RecSend.mSalvoRate          := salvoRate;

    case TComponent(sender).Tag of
      //fire
      1 : begin
            RecSend.mOrderID := __ORD_CANNON_START_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Cease
      2 : begin
            RecSend.mOrderID := __ORD_CANNON_STOP_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Assigned
      3 : begin
            RecSend.mOrderID := __ORD_CANNON_ASSIGNED;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Deassigned
      4 : begin
            RecSend.mOrderID := __ORD_CANNON_DEASSIGNED;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Fire
      5 : begin
            RecSend.mOrderID := __ORD_CANNON_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;

    end;
  end;
end;

procedure TfrmGameController.btnCannonStartFireClick(Sender: TObject);
var
  Item : TListItem;
  ItemWeapon : TListItem;

  isValid : Boolean;

  ShipID, salvoRate,
  WeaponID,
  LauncherID,
  MissileID,
  MissileNumber : Integer;

  TargetID,
  ModeID,
  BalistikID : integer;

  CorrectBearing,
  CorrectElev : Double;

  RecSend : TRec3DSetWCC;

  Weapon : TWeapon;
begin
  isValid := True;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvWeapon.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  if not Assigned(lvWeapon.Selected.Data) then Exit;
  ShipID    := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;
  WeaponID  := TWeapon(lvWeapon.Selected.Data).WeaponID;

//  if not TryStrToInt(edtCannonLauncherID.Text , LauncherID) then isValid := False;
  if not TryStrToInt(edtCannonMissileID.Text, MissileID) then isValid := false;
  if not TryStrToInt(edtCannonLauncherID.Text, LauncherID) then isValid := False;
  if not TryStrToInt(edtCannonMissileNumber.Text, MissileNumber) then isValid := false;

  if not TryStrToInt(edtCannonTargetID.Text, TargetID) then isValid := false;
  if not TryStrToFloat(edtCannonCorrElev.Text, CorrectElev) then isValid := false;
  if not TryStrToFloat(edtCannonCorrBearing.Text, CorrectBearing) then isValid := False;
  if not TryStrToInt(cbbSalvoRate.Text , salvoRate) then isValid := False;

  ModeID := cbbCannonModeID.ItemIndex + 1;
  BalistikID := cbbCannonBalistikID.ItemIndex;

  if isValid then
  begin
    RecSend.ShipID          := ShipID;
    RecSend.mWeaponID       := WeaponID;
    RecSend.mLauncherID     := LauncherID;
    RecSend.mMissileID      := MissileID;
    RecSend.mMissileNumber  := MissileNumber;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := TargetID;
    RecSend.mModeID             := ModeID;
    RecSend.mAutoCorrectElev    := CorrectElev;
    RecSend.mAutoCorrectBearing := CorrectBearing;

    RecSend.mBalistikID         := BalistikID;
    RecSend.mSalvoRate          := salvoRate;

    case TComponent(sender).Tag of
      //fire
      1 : begin
            RecSend.mOrderID := __ORD_CANNON_START_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Cease
      2 : begin
            RecSend.mOrderID := __ORD_CANNON_STOP_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Assigned
      3 : begin
            RecSend.mOrderID := __ORD_CANNON_ASSIGNED;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Deassigned
      4 : begin
            RecSend.mOrderID := __ORD_CANNON_DEASSIGNED;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Fire
      5 : begin
            RecSend.mOrderID := __ORD_CANNON_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;

    end;
  end;
end;

{ RBU }
procedure TfrmGameController.btnRBU6000FireClick(Sender: TObject);
var
   valid : boolean ;

   i,
   shipID,
   launcherID,
   MissileNumber,
   missileID,
   MissileType,
   TargetID,
   CountSalvo,
   weaponID  : integer ;

   recRangDeg  :TList;

   rangDeg     : TRangDeg;

   bearing, range, depth,
   Corrbearing, Correlev      : double;

   RecSend : TRec3DSetRBU;
   Idlauncher : string;
   
begin
  if cbbrbuLauncherId.Text = 'kanan' then
  begin
    Idlauncher := IntToStr(1);
  end
  else if cbbrbuLauncherId.Text = 'kiri' then
  begin
    Idlauncher := IntToStr(2);
  end;

   valid  := true ;

   if not Assigned(lvRuntimeShip.Selected) then Exit;
   if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
   ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

   if not TryStrToFloat(eRBU6000Bearing.Text, bearing) then valid := false;
   if not TryStrToFloat(eRBU6000Range.Text, range) then valid := false;
   if not TryStrToInt(eRBU6000MissilieID.Text, missileID) then valid := false;
   if not TryStrToInt(Idlauncher, launcherID) then valid := false;
   if not TryStrToInt(eRBU6000Balistik.Text, MissileType) then valid := False;
   if not TryStrToInt(eRBU6000Number.Text, MissileNumber) then valid := False;
   if not TryStrToInt(eRBUTargetID.Text, TargetID) then valid := False;
   if not TryStrToInt(cbbRBUSalvoCount.Text, CountSalvo) then valid := False;
   if not TryStrToFloat(eRBU6000CorrBearing.Text, Corrbearing) then valid := False;
   if not TryStrToFloat(eRBU6000CorrElev.Text, Correlev) then valid := False;
   if not TryStrToFloat(eRBU6000Depth.Text, depth) then valid := False;

   if Sender = btnRBUsetPos then
  begin
    SimManager.FMap.CurrentTool := TOOL_SELECT_COORD_RBU;
  end;

  weaponID := 2;
  recRangDeg := TList.Create;
  DataModule1.getRangDeg(ShipID, weaponID, LauncherID, recRangDeg);


  for i := 0 to recRangDeg.count -1 do
  begin
    rangDeg := TRangDeg(recRangDeg[i]);
  end;

   if valid then
   begin
     range := range * C_NauticalMile_To_Metre;

     RecSend.ShipID         := shipID;
     RecSend.mWeaponID      := C_DBID_RBU6000;
     RecSend.mLauncherID    := launcherID;
     RecSend.mMissileID     := missileID;
     RecSend.mMissileNumber := MissileNumber;
     RecSend.mTargetID      := TargetID;
     RecSend.mCount         := CountSalvo;

     RecSend.mMissileType   := MissileType;
     RecSend.OrderID        := 0;
     RecSend.mLncrBearing   := bearing;
     RecSend.mLncRange      := range;
     RecSend.mCorrBearing   := Corrbearing;
     RecSend.mCorrElev      := Correlev;
     RecSend.mTargetDepth   := depth;

     case TComponent(sender).Tag of
       //assign
       1 : begin
             RecSend.OrderID := __ORD_RBU_ASSIGNED;
             SimManager.NetSendTo3D_OrderMissileRBU6000(RecSend);
           end;
       //deassign
       2 : begin
             RecSend.OrderID := __ORD_RBU_DEASSIGNED;
             SimManager.NetSendTo3D_OrderMissileRBU6000(RecSend);
           end;
       //fire
       3 : begin
             RecSend.OrderID := __ORD_RBU_FIRE;
             SimManager.NetSendTo3D_OrderMissileRBU6000(RecSend);
           end;
       //loading
       4 : begin
             tmrRBU.Enabled := True;
             btnRBUStartFire.Enabled := False;
             btnRBU6000Assign.Enabled := False;
             RecSend.OrderID := __ORD_RBU_LOADING;
             SimManager.NetSendTo3D_OrderMissileRBU6000(RecSend);
           end;
       //Automatic
       5 : begin
             RecSend.OrderID := __ORD_RBU_AUTO;
             SimManager.NetSendTo3D_OrderMissileRBU6000(RecSend);
           end;
       //Start Fire
       6 : begin

             if (StrToFloat(eRBU6000Bearing.Text) > rangDeg.startDeg ) or  (StrToFloat(eRBU6000Bearing.Text) < rangDeg.endDeg ) then
                 begin
                   RecSend.OrderID := __ORD_RBU_STARTF;
                   SimManager.NetSendTo3D_OrderMissileRBU6000(RecSend);
                 end;
           end;
       //Stop Fire
       7 : begin
             RecSend.OrderID := __ORD_RBU_STOPF;
             SimManager.NetSendTo3D_OrderMissileRBU6000(RecSend);
           end;
     end;
   end ;
end;

{ Asroc }
procedure TfrmGameController.MainMenuClick(Sender: TObject);
begin
  case TImage(Sender).Tag of
    0:
    begin
      pnlClient.BringToFront;
    end;
    1:
    begin
      pnlScenario.BringToFront;
      ShowScenario;
    end;
    2:
    begin
      pnlPlatform.BringToFront;
      ShowShip;
    end;
    3:
    begin
      if frmMainInstruktur.lblCekRunning.Caption <> 'Play' then
        exit;

      pnlController.BringToFront;
    end;
    4:
    begin
      if frmMainInstruktur.lblCekRunning.Caption <> 'Play' then
        exit;

      pnlEnvironment.BringToFront;
    end;
    5:
    begin
      if frmMainInstruktur.lblCekRunning.Caption <> 'Play' then
        exit;

      pnlReport.BringToFront;
    end;
  end;
end;

procedure TfrmGameController.MainMenuMouseEnter(Sender: TObject);
begin
  case TImage(Sender).Tag of
    0:
    begin
      TImage(Sender).Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\' + TImage(Sender).Name + '_.png');
    end;
    1:
    begin
      TImage(Sender).Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\' + TImage(Sender).Name + '_.png');
    end;
    2:
    begin
      TImage(Sender).Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\' + TImage(Sender).Name + '_.png');
    end;
    3:
    begin
      if frmMainInstruktur.lblCekRunning.Caption <> 'Play' then
        exit;

      TImage(Sender).Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\' + TImage(Sender).Name + '_.png');
    end;
    4:
    begin
      if frmMainInstruktur.lblCekRunning.Caption <> 'Play' then
        exit;

      TImage(Sender).Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\' + TImage(Sender).Name + '_.png');
    end;
    5:
    begin
      if frmMainInstruktur.lblCekRunning.Caption <> 'Play' then
        exit;

      TImage(Sender).Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\' + TImage(Sender).Name + '_.png');
    end;
  end;
end;


procedure TfrmGameController.MainMenuMouseLeave(Sender: TObject);
begin
  TImage(Sender).Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\' + TImage(Sender).Name + '.png');
end;

procedure TfrmGameController.btnAsrocFireClick(Sender: TObject);
var
  valid : boolean ;

  shipID, lcrID , MissileNumber, MissileID, TargetID,
  mslID, MissileType, Fuze: integer ;

  bearing, range, depth, CorrRange : double;

  i: Integer;

  RecSend : TRec3DSetAsrock;
begin
  valid := true ;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToInt(eAsrocLauncherID.Text, lcrID) then valid := false;
  if not TryStrToInt(eAsrocNumber.Text, MissileNumber) then valid := false;
  if not TryStrToInt(cbbAsrocMissileID.Text, MissileID) then valid := false;
  if not TryStrToInt(eAsrocTargetID.Text, TargetID) then valid := false;

  if not TryStrToFloat(eAsrocBearing.Text, bearing) then valid := false;
  if not TryStrToFloat(eAsrocRange.Text, range) then valid := false;
  if not TryStrToFloat(eAsrocDepth.Text, depth) then valid := False;
  if not TryStrToFloat(eAsrocCorrRange.Text, CorrRange) then valid := false;


  MissileType := cbbAsrocMissileType.ItemIndex+1;
  Fuze := cbbAsrocFuze.ItemIndex + 1;

  if valid then
  begin
     range := range * C_NauticalMile_To_Metre;

     RecSend.ShipID         := shipID;
     RecSend.mWeaponID      := C_DBID_ASROC;
     RecSend.mLauncherID    := lcrID;
     RecSend.mMissileID     := MissileID;
     RecSend.mMissileNumber := MissileNumber;
         
     RecSend.mMissile_Type  := MissileType;
     RecSend.mTargetID      := TargetID;
     RecSend.OrderID        := 0;
     RecSend.mTargetBearing := bearing;
     RecSend.mTargetRange   := range;
     RecSend.mTargetDepth   := depth;
     RecSend.mFuzeType      := Fuze;

     RecSend.mCorrRange     := CorrRange;

     case TComponent(sender).Tag of
        //assign
        1 : begin
              RecSend.OrderID := __ORD_ASROCK_ASSIGNED;
              SimManager.NetSendTo3D_OrderMissileAsroc (RecSend);
            end;
        //deassign
        2 : begin
              RecSend.OrderID := __ORD_ASROCK_DEASSIGNED;
              SimManager.NetSendTo3D_OrderMissileAsroc (RecSend);
            end;
        //fire
        3 : begin
              RecSend.OrderID := __ORD_ASROCK_FIRE;
              SimManager.NetSendTo3D_OrderMissileAsroc (RecSend);
            end;
        //loading    
        4 : begin
              RecSend.OrderID := __ORD_ASROCK_LOADING;
              SimManager.NetSendTo3D_OrderMissileAsroc(RecSend);
            end;
     end;

  end ;
end;

{ Torpedo SUT }
procedure TfrmGameController.btnFireTorpodoSUTClick(Sender: TObject);
var
  shipID, lcrID, preDM,
  MissileNumber, i,
  MissileID, TargetID,
  TargetType, weaponID           : integer ;

  mCourse, mSpeed, mDepth,
  mSafedistance, mEnabledistance : double ;

  isvalid               : Boolean;
  RecSend               : TRecSetTorpedoSUT;
  TorpSpeed, Idlauncher : String;
  rangeTarget           : Double;
  recRangDeg            : TList;
  rangDeg               : TRangDeg;
begin
  if cbbTorpSutSpeed.Text = 'Low' then
  begin
    TorpSpeed := IntToStr(18);
  end
  else if cbbTorpSutSpeed.Text = 'Medium' then
  begin
    TorpSpeed := IntToStr(23);
  end
  else if cbbTorpSutSpeed.Text = 'High' then
  begin
    TorpSpeed := IntToStr(34);
  end;

  if cbbLauncherID.Text = 'kiri' then
  begin
    Idlauncher := IntToStr(1);
	  frmMainInstruktur.searchTorpSUT(1);
  end
  else if cbbLauncherID.Text = 'kanan' then
  begin
   Idlauncher := IntToStr(2);
   frmMainInstruktur.searchTorpSUT(2);
  end;

  isvalid := True;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToFloat(edtTorpSUTCourse.Text,mCourse) then isvalid := False;
  if not TryStrToFloat(TorpSpeed , mSpeed) then isvalid := False;
  if not TryStrToFloat(edtTorpSUTDepth.Text,mDepth) then isvalid := False;
  if not TryStrToFloat(edtTorpSUTSafeDis.Text, mSafedistance) then isvalid := False;
  if not TryStrToFloat(edtTorpedoSUTEnDis.Text, mEnabledistance) then isvalid := False;

  if not TryStrToInt(edtTorpSUTTargetID.Text, TargetID) then isvalid := false;
  if not TryStrToInt(Idlauncher, lcrID) then isvalid := false;

  if edtTorpSutRange.Text = '' then
  begin
    edtTorpSutRange.Text := '0';
  end;

  rangeTarget   := StrToFloat(edtTorpSutRange.Text);
  preDM         := cbbTorpPredMode.ItemIndex + 1;
  MissileID     := cbbTorpMissile.ItemIndex+2;
  MissileNumber := cbbTorpSUTNumber.ItemIndex+2;
  TargetType    := cbbTorpSUTTargetType.ItemIndex + 1;

  weaponID := 4;
  recRangDeg := TList.Create;
  DataModule1.getRangDeg(ShipID, weaponID, lcrID, recRangDeg);

  for i := 0 to recRangDeg.count -1 do
  begin
    rangDeg := TRangDeg(recRangDeg[i]);
  end;

  if isvalid then
  begin
    RecSend.mT_ID                 := TargetID;
    RecSend.ShipID                := shipID;
    RecSend.mWeaponID             := C_DBID_TORPEDO_SUT;
    RecSend.mLauncherID           := lcrID;
    RecSend.mMissileID            := MissileID;
    RecSend.mMissileNumber        := MissileNumber;

    RecSend.OrderID               := 0;
    RecSend.mTorpedoCourse        := mCourse;
    RecSend.mTorpedoSpeed         := mSpeed;
    RecSend.mTorpedoDepth         := mDepth;
    RecSend.mTorpedoSafeDistance  := mSafedistance;
    RecSend.mTorpedoEnDis         := mEnabledistance;
    RecSend.mpredm                := preDM;
    RecSend.mTargetType           := TargetType;

    case TComponent(sender).Tag of
      //Fire
      1 : begin
            if (rangeTarget >= rangDeg.rangeMin) and (rangeTarget <= rangDeg.rangeMax) then
            begin
              RecSend.OrderID := __ORD_TORPEDOSUT_FIRED;
              SimManager.NetSendTo3D_OrderMissileSUT(RecSend);
		     	    if edtTampung.Text = '0' then begin
                edtTampung.Text := '1';
              end;
            end;

          end;
      //Navigate
      2 : begin
            RecSend.OrderID := __ORD_TORPEDOSUT_NAVIGATE;
            SimManager.NetSendTo3D_OrderMissileSUT(RecSend);
          end;
      //Homming
      3 : begin
            RecSend.OrderID := __ORD_TORPEDOSUT_HOMING;
            SimManager.NetSendTo3D_OrderMissileSUT(RecSend);
          end;
      //Search
      4 : begin
            RecSend.OrderID := __ORD_TORPEDOSUT_SEARCH;
            SimManager.NetSendTo3D_OrderMissileSUT(RecSend);
          end;
      //Loading
      5 : begin
            RecSend.OrderID := __ORD_TORPEDOSUT_LOADING;
            SimManager.NetSendTo3D_OrderMissileSUT(RecSend);
          end;
    end;
  end
  else
  begin
    ShowMessage('Input Not Valid');
  end;
end;


{ Torpedo A244 }
procedure TfrmGameController.btnFireSpsClick(Sender: TObject);
var
  RecSPS : TRecDataTorperdo;

  ShipID,
  LauncherID,
  MissileID,
  MissileNumber : Integer;

  TorpType      : Integer;

  isValid       : Boolean;
  idlauncher    : string ;

  Torp_ISC      : single;
  Torp_ISR, Torp_WTR, Torp_CEI, Torp_PRG, Torp_DOP,
  Torp_ACE, Torp_FLO, Torp_ISD, Torp_ACM : integer;
begin
  if cbbA244Launcher.Text = 'kiri' then
  begin
    Idlauncher := IntToStr(1);
  end
  else if cbbA244Launcher.Text = 'kanan' then
  begin
    Idlauncher := IntToStr(2);
  end;


//  if (cbbA244MissID2.Text = '1') or (cbbA244MissID.Text = '2') then begin
//    MissileID := 1;
//  end
//  else if (cbbA244MissID2.Text = '3') or (cbbA244MissID.Text = '4') then begin
//    MissileID := 2;
//  end
//  else if (cbbA244MissID2.Text = '5') or (cbbA244MissID.Text = '6') then begin
//    MissileID := 3;
//  end;

  if idlauncher = '1' then
  begin
    MissileID := cbbA244MissID.ItemIndex + 1;
  end
  else if idlauncher = '2' then
  begin
    MissileID := cbbA244MissID2.ItemIndex + 1;
  end;
//  ShowMessage(cbbA244MissID.Text);

  if cbbWTR.Text = 'SH' then begin
    Torp_WTR := 1;
  end
  else if cbbWTR.Text = 'DP' then begin
    Torp_WTR := 2;
  end;

  if cbbPRG.Text = 'HE' then begin
    Torp_PRG := 1;
  end
  else if cbbPRG.Text = 'SP' then begin
    Torp_PRG := 2;
  end;

  if cbbACM.Text = 'ACT' then begin
    Torp_ACM := 1;
  end
  else if cbbACM.Text = 'PAS' then begin
    Torp_ACM := 2;
  end
  else if cbbACM.Text = 'MIX' then begin
    Torp_ACM := 3;
  end;

  if cbbDOP.Text = 'FM' then begin
    Torp_DOP := 1;
  end
  else if cbbDOP.Text = 'CW' then begin
    Torp_DOP := 2;
  end;

  isValid := True;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  ShipID := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;

  if not TryStrToInt(Idlauncher, LauncherID) then isValid := False;
  //if not TryStrToInt(cbbA244MissID.Text, MissileID) then isValid := False;
  if not TryStrToInt(edtSPS_Number.Text, MissileNumber) then isValid := False;

  if not TryStrToFloat(edtSPS_ISC.Text, Torp_ISC) then isValid := False;
  if not TryStrToInt(cbbISR.Text, Torp_ISR) then isValid := False;

  if cbbWTR.Text = 'DP' then begin
    if not TryStrToInt(cbbCEI.Text, Torp_CEI) then isValid := False;
    if not TryStrToInt(cbbFLO2.Text, Torp_FLO) then isValid := False;
    if not TryStrToInt(cbbISD2.Text, Torp_ISD) then isValid := False;
  end
  else if cbbWTR.Text = 'SH' then begin
    if not TryStrToInt(cbbCEI2.Text, Torp_CEI) then isValid := False;
    if not TryStrToInt(cbbFLO.Text, Torp_FLO) then isValid := False;
    if not TryStrToInt(cbbISD.Text, Torp_ISD) then isValid := False;
  end;

  if not TryStrToInt(cbbACE.Text, Torp_ACE) then isValid := False;



  if isValid then
  begin
    RecSPS.ShipID         := ShipID;
    RecSPS.mWeaponID      := C_DBID_TORPEDO_A244S;
    RecSPS.mLauncherID    := LauncherID;
    RecSPS.mMissileID     := MissileID;
    RecSPS.mMissileNumber := MissileNumber;


    RecSPS.ISC         := Torp_ISC;
    RecSPS.ISR         := Torp_ISR;
    RecSPS.WTR         := Torp_WTR;
    RecSPS.CEI         := Torp_CEI;
    RecSPS.PRG         := Torp_PRG;
    RecSPS.DOP         := Torp_DOP;
    RecSPS.ACE         := Torp_ACE;
    RecSPS.FLO         := Torp_FLO;
    RecSPS.ISD         := Torp_ISD;
    RecSPS.ACM         := Torp_ACM;

    case TComponent(sender).Tag of
      //Fire
      1 : begin
            RecSPS.OrderID     := _ORD_SPS_FIRE;
            SimManager.NetSendTo3D_OrderMissileTorpedo(RecSPS);
          end;
      //Loading
      2 : begin
            RecSPS.OrderID     := _ORD_SPS_LOADING;
            SimManager.NetSendTo3D_OrderMissileTorpedo(RecSPS);
          end;
    end;

  end
  else
  begin
    ShowMessage('wrong input');
  end;
end;



{ ---------------------------------------------------------------------- }
{ Map Util }
procedure TfrmGameController.btnSelectObjClick(Sender: TObject);
var
  mapRec  : TRecMapCommand;
  Vehicle : TVehicle;
begin
  if Assigned(lvRuntimeShipTrajectory.Selected) then
  begin
    mapRec.ToolID   := miArrowTool;
    mapRec.OrderID  := OID_OBJ_Select;
    mapRec.MapID    := 1;

    if Assigned(lvRuntimeShipTrajectory.Selected.data) then
    begin
      Vehicle       := TVehicle(lvRuntimeShipTrajectory.Selected.data);
      mapRec.ShipID := Vehicle.Vehicle_ID;
      SimManager.NetSendToMap(mapRec);
    end;
  end
  else
  begin
    ShowMessage('Select Object First');
  end;
end;

procedure TfrmGameController.btnRemoveObjectClick(Sender: TObject);
var
  Vehicle : TVehicle;
begin
  if lvRuntimeShip.Selected <> nil then
  begin
    frmMainInstruktur.SetDefaultMapTool;
    if Assigned(lvRuntimeShip.Selected.Data) then
    begin
      Vehicle := TVehicle(lvRuntimeShip.Selected.Data);

      DeleteMenuWithShipID(Vehicle.Vehicle_ID);
      SimManager.NetSendTo3D_DelShipRuntime(Vehicle.Vehicle_ID);
      frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.SetWeaponGroupBar;
    end;
  end;
end;

procedure TfrmGameController.cbbMapMiniZoomChange(Sender: TObject);
var
  mapRec : TRecMapCommand;
begin
  mapRec.ToolID   := miZoomInTool;
  mapRec.OrderID  := OID_MAP;
  mapRec.Scale    := StrToInt(cbbMapMiniZoom.Text);
  mapRec.MapID    := 1;

  SimManager.NetSendToMap(mapRec);
end;

procedure TfrmGameController.btnSettingClientClick(Sender: TObject);
var
   i, l, t : integer ;
begin
   i := Monitor.MonitorNum;
   l := Screen.Monitors[i].Width  ;
   t := Screen.Monitors[i].Height  ;
   frmCMSetting.ShowThisForm(l,t);
end;

procedure TfrmGameController.ShowDefaultPageWeapon(isDefault: boolean);
var
  i : integer ;
begin
  lblInfo.Caption := 'Select weapon to use';
  if pgWeapon = nil then exit;

  for i:=0 to pgWeapon.PageCount-1 do
  begin
   if pgWeapon = nil then exit;

   if pgWeapon.Pages[i] <> nil then
   pgWeapon.Pages[i].TabVisible := False ;

  end;

  if pgWeapon = nil then exit;
  if isDefault then
  begin
     if pgtwDefault <> nil then
     begin
        pgtwDefault.TabVisible := True ;
        pgWeapon.ActivePage := pgtwDefault;
     end;
  end;

end;

procedure TfrmGameController.ShowScenario;
var
  i : integer;
  ListScenario : Tlist;
  Scenario : TScenarioList;
begin
  lvListScen.Items.Clear;

  ListScenario := TList.Create;
  DataModule1.GettAllScenario(ListScenario);

  for i := 0 to ListScenario.Count - 1 do
  begin
    Scenario := TScenarioList(ListScenario[i]);

    if Scenario.Scenario_ID = 0 then
    else
    begin
      with lvListScen.Items.Add do
      begin
        Caption := IntToStr(Scenario.Scenario_ID);
        SubItems.Add(Scenario.Scenario_Name);
        SubItems.Add(DataModule1.GetPortNameNoById(Scenario.ENV_PETA));
      end;
    end;
  end;

  ClearAList(ListScenario);
  ListScenario.Free;

end;
procedure TfrmGameController.ShowShip;
var
  i : integer;
  ListShip : Tlist;
  Ship : TVehicle;
begin
  {membersihkan lvship}
  lvShipList.Items.Clear;

  {membuat objek list}
  ListShip := TList.Create;

  {Ngambil data dari database}
  DataModule1.GetAllShip(ListShip);

  for i := 0 to ListShip.Count - 1 do
  begin
    Ship := TVehicle(ListShip[i]);

    {Ngeprint ke list view}
    with lvShipList.Items.Add do
    begin
      Caption := IntToStr(Ship.Vehicle_ID);
      SubItems.Add(Ship.Vehicle_Name);

      case Ship.Vehicle_Type of
        1: SubItems.Add('Surface');
        2: SubItems.Add('Air');
        3: SubItems.Add('Subsurface');
      end;
    end;
  end;

  {menghapus isi list}
  ClearAList(ListShip);

  {menghancurkan objek list}
  ListShip.Free;

end;

procedure TfrmGameController.ShowWeaponPanel(WeaponID, LauncherID: integer);
var
  launcher : string;
begin
  case WeaponID of
     C_DBID_ASROC : begin
            pgtwAsroc.TabVisible := True ;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Asroc is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwAsroc ;
            end;

            eAsrocLauncherID.Text := IntToStr(launcherID);
         end;
     C_DBID_RBU6000, C_DBID_RBU6000_DIGITAL : begin
            if launcherID = 1 then begin
              launcher := 'kanan';
            end
            else if launcherID = 2 then begin
              launcher := 'kiri';
            end;
            pgtwRBU6000.TabVisible := True ;

           if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'RBU is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              case WeaponID of
                C_DBID_RBU6000 : pgtwRBU6000.Caption := 'RBU 6000 Manual';
                C_DBID_RBU6000_DIGITAL : pgtwRBU6000.Caption := 'RBU 6000 Digital';
              end;
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwRBU6000 ;
           end;

            cbbrbuLauncherId.Text := launcher;
         end;
     C_DBID_TORPEDO_SUT, C_DBID_TORPEDO_BLACKSHARK : begin
            if launcherID = 1 then begin
              launcher := 'kiri';
              frmMainInstruktur.searchTorpSUT(1);
            end
            else if launcherID = 2 then begin
              launcher := 'kanan';
              frmMainInstruktur.searchTorpSUT(2);
            end;
            pgtwTorpedoSUT.TabVisible := True ;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Torpedo SUT is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwTorpedoSUT ;
            end;

            cbbLauncherID.Text := launcher;
         end;
     C_DBID_TORPEDO_A244S : begin
            if launcherID = 1 then
            begin
              launcher := 'kiri';
              cbbA244MissID.Visible  := True;
              cbbA244MissID2.Visible := False;
            end
            else if launcherID = 2 then
            begin
              launcher := 'kanan';
              cbbA244MissID.Visible  := False;
              cbbA244MissID2.Visible := True;
            end;
            pgtwTorpedoA244.TabVisible := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then
            begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Torpedo A244S is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwTorpedoA244;
            end;

            cbbA244Launcher.ItemIndex := launcherID-1;
            wtrChange;
        end;
     C_DBID_CANNON76, C_DBID_CANNON57, C_DBID_CANNON57_DIGITAL,
     C_DBID_CANNON_AK230, C_DBID_CANNON_TYPE_730,
     C_DBID_CANNON35, C_DBID_CANNON40, C_DBID_CANNON120 :
        begin
            pgtwWCCCannon.TabVisible         := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Cannon is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              case WeaponID of
                C_DBID_CANNON76 : pgtwWCCCannon.Caption := 'Cannon 76';
                C_DBID_CANNON57 : pgtwWCCCannon.Caption := 'Cannon 57';
                C_DBID_CANNON_AK230 : pgtwWCCCannon.Caption := 'Cannon AK230';
                C_DBID_CANNON_TYPE_730 : pgtwWCCCannon.Caption := 'Cannon Type 730';
                C_DBID_CANNON57_DIGITAL : pgtwWCCCannon.Caption := 'Cannon 57';
                C_DBID_CANNON35 : pgtwWCCCannon.Caption := 'Cannon 35';
                C_DBID_CANNON40 : pgtwWCCCannon.Caption := 'Cannon 40';
                C_DBID_CANNON120 : pgtwWCCCannon.Caption := 'Cannon 120';
                else
                  pgtwWCCCannon.Caption := 'Cannon';
              end;
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwWCCCannon ;
            end;

//            edtCannonLauncherID.Text         := IntToStr(launcherID);
              edtCannonLauncherID.Text         := '0';
        end;
     C_DBID_YAKHONT : begin

            if launcherID = 1 then begin
              launcher := 'Missile 1';
              chkYahkontM1.Checked := True;
              chkYahkontM2.Checked := False;
              chkYahkontM3.Checked := False;
              chkYahkontM4.Checked := False;
              end
              else if launcherID = 2 then begin
                launcher := 'Missile 2';
                chkYahkontM1.Checked := False;
                chkYahkontM2.Checked := True;
                chkYahkontM3.Checked := False;
                chkYahkontM4.Checked := False;
              end
              else if launcherID = 3 then begin
                launcher := 'Missile 3';
                chkYahkontM1.Checked := False;
                chkYahkontM2.Checked := False;
                chkYahkontM3.Checked := True;
                chkYahkontM4.Checked := False;
              end
              else begin
                launcher := 'Missile 4';
                chkYahkontM1.Checked := False;
                chkYahkontM2.Checked := False;
                chkYahkontM3.Checked := False;
                chkYahkontM4.Checked := True;
              end;
            cbbYahkontLauncher.Text   := launcher;
            pgtwYAHKONT.TabVisible    := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Yakhont is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwYAHKONT ;
            end;
        end;
     C_DBID_C802 : begin
            if launcherID = 1 then begin
              launcher := 'kanan 1';
              end
            else if launcherID = 2 then
            begin
              launcher := 'kiri 1';
            end
            else if launcherID = 3 then
            begin
              launcher := 'kanan 2';
            end
            else begin
              launcher := 'kiri 2';
            end;

            cbbC802Launcher.Text      := launcher;
            pgtwC802.TabVisible       := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then
            begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'C802 is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwC802 ;
            end;
        end;
     C_DBID_MISTRAL : begin
            if launcherID = 1 then
            begin
              launcher := 'kiri';
            end
            else if launcherID = 2 then
            begin
              launcher := 'kanan';
            end;

            pgtwMistral.TabVisible    := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then
            begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Mistral is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwMistral ;
            end;

            cbbMistralLaunch.Text     := launcher;
        end;
     C_DBID_STRELA : begin
            if launcherID = 1 then
            begin
              launcher := 'kiri';
            end
            else if launcherID = 2 then
            begin
              launcher := 'kanan';
            end;

            pgtwStrella.TabVisible    := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then
            begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Strela is not ready to use';
              pgWeapon.Enabled := False;
            end
            else begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwStrella ;
            end;

            cbbStrellaLauncher.Text   := launcher;
        end;
     C_DBID_EXOCET_MM40, C_DBID_EXOCET_MM38 : begin
            if launcherID = 1 then
            begin
              launcher := 'kanan';
              end
            else if launcherID = 2 then
            begin
              launcher := 'kiri';
            end;
            pgtwExocetMM40.TabVisible        := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then
            begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Exocet MM40 is not ready to use';
              pgWeapon.Enabled := False;
            end
            else
            begin
              case WeaponID of
                C_DBID_EXOCET_MM40 : pgtwExocetMM40.Caption := 'Exocet MM40';
                C_DBID_EXOCET_MM38 : pgtwExocetMM40.Caption := 'Exocet MM38';
              end;
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwExocetMM40 ;
            end;

            cbbExxocetLauncher.Text          := launcher;
            //cbbExocet40_LauncherID.ItemIndex := Weapon.launcherID - 1;
        end;
     C_DBID_TETRAL : begin
            if launcherID = 1 then
            begin
              launcher := 'kiri';
            end
            else if launcherID = 2 then
            begin
              launcher := 'kanan';
            end;
            pgtwTetral.TabVisible   := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then
            begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Tetral is not ready to use';
              pgWeapon.Enabled := False;
            end
            else
            begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwTetral ;
            end;

            cbbTetralLaunch.Text    := launcher;
        end;
     C_DBID_VLMICA : begin

            pgtwVlMica.TabVisible   := True;

            if (lvWeapon.Selected.SubItems[1] = 'Off') and (onOffMode = 1) then
            begin
              pgWeapon.ActivePage  := pgtwDefault ;
              lblInfo.Caption := 'Tetral is not ready to use';
              pgWeapon.Enabled := False;
            end
            else
            begin
              pgWeapon.Enabled := True;
              pgWeapon.ActivePage  := pgtwVlMica ;
            end;

            cbbTetralLaunch.Text    := launcher;
        end;
  else
       begin
          pgtwDefault.TabVisible := True ;
          pgWeapon.ActivePage := pgtwDefault ;
          lblInfo.Caption := 'Weapon is not ready to use';
          pgWeapon.Enabled := False;
       end;
  end;
end;

procedure TfrmGameController.lvWeaponClick(Sender: TObject);
var
  Weapon        : TWeapon;
  Vehicle       : TVehicle;
  i             : Integer;
  ClientConsole : TClientList;
  weaponPic     : string;

  ListWeaponOnShip : TList;

  ListWeaponDetail : Tlist;
  WeaponDetail     : TWeaponDetail;

  IDweapon,
  IDDetail : Integer;
begin
  if (TListView(sender).Selected <> nil) then
  begin
    Vehicle := TVehicle(lvRuntimeShip.Selected.Data);
    if Assigned(TListView(sender).Selected.Data) then
    begin
      Weapon := TWeapon(TListView(sender).Selected.Data);

      Weapon_ID := TWeapon(TListView(sender).Selected.Data).WeaponID ;
      Weapon_Name := TWeapon(TListView(sender).Selected.Data).MissileName;

      weaponPic := '..\Data\imageWeapon\' +
      TWeapon(TListView(sender).Selected.Data).MissileName + '.png';

      ShowDefaultPageWeapon(false);
      ShowWeaponPanel(Weapon.WeaponID, Weapon.launcherID);

      for i := 0 to lvClient.Items.Count-1 do
      begin
        if Assigned(frmGameController.lvClient.Items[i].Data) then
        begin
          ClientConsole :=  TClientList(lvClient.Items[i].Data);
          if (ClientConsole.WeaponID = C_DBID_STRELA) then
          begin
            if(ClientConsole.Cli_Status = 'RUNNING')and (ClientConsole.Cli_SHIPID = Vehicle.Vehicle_ID) then
            begin
              if (Weapon.launcherID = 1) and (ClientConsole.Cli_LAUNCHERID = 1) then
              begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_MISTRAL, Weapon.launcherID,0, False);
              end
              else if (Weapon.launcherID = 2) and (ClientConsole.Cli_LAUNCHERID = 2) then
              begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_MISTRAL, Weapon.launcherID,0, False);
              end;

            end
            else if (ClientConsole.Cli_Status = 'ONLINE') OR (ClientConsole.Cli_Status = 'OFFLINE') then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_STRELA, Weapon.launcherID,0, True);
            end;

          end
          else
          if (ClientConsole.WeaponID = C_DBID_MISTRAL) then
          begin
            if(ClientConsole.Cli_Status = 'RUNNING')and (ClientConsole.Cli_SHIPID = Vehicle.Vehicle_ID) then
            begin
              if (Weapon.launcherID = 1) and (ClientConsole.Cli_LAUNCHERID = 1) then
              begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_MISTRAL, Weapon.launcherID,0, False);
              end
              else if (Weapon.launcherID = 2) and (ClientConsole.Cli_LAUNCHERID = 2) then
              begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_MISTRAL, Weapon.launcherID,0, False);
              end;

            end
            else if (ClientConsole.Cli_Status = 'ONLINE') OR (ClientConsole.Cli_Status = 'OFFLINE') then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_MISTRAL, Weapon.launcherID,0, True);
            end;

          end
          else
          if (ClientConsole.WeaponID = C_DBID_CANNON40) then
          begin
            if(ClientConsole.Cli_Status = 'RUNNING')and (ClientConsole.Cli_SHIPID = Vehicle.Vehicle_ID) then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON40, Weapon.launcherID,0, False);
            end
            else if (ClientConsole.Cli_Status = 'ONLINE') OR (ClientConsole.Cli_Status = 'OFFLINE') then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON40, Weapon.launcherID,0, True);
            end;
          end
          else
          if (ClientConsole.WeaponID = C_DBID_CANNON57) then
          begin
            if(ClientConsole.Cli_Status = 'RUNNING')and (ClientConsole.Cli_SHIPID = Vehicle.Vehicle_ID) then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON57, Weapon.launcherID,0, False);
            end
            else if (ClientConsole.Cli_Status = 'ONLINE') OR (ClientConsole.Cli_Status = 'OFFLINE') then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON57, Weapon.launcherID,0, True);
            end;
          end
          else
          if (ClientConsole.WeaponID = C_DBID_CANNON_AK230) then
          begin
            if(ClientConsole.Cli_Status = 'RUNNING')and (ClientConsole.Cli_SHIPID = Vehicle.Vehicle_ID) then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON_AK230, Weapon.launcherID,0, False);
            end
            else if (ClientConsole.Cli_Status = 'ONLINE') OR (ClientConsole.Cli_Status = 'OFFLINE') then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON_AK230, Weapon.launcherID,0, True);
            end;
          end
          else
          if (ClientConsole.WeaponID = C_DBID_CANNON_TYPE_730) then
          begin
            if(ClientConsole.Cli_Status = 'RUNNING')and (ClientConsole.Cli_SHIPID = Vehicle.Vehicle_ID) then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON_TYPE_730, Weapon.launcherID,0, False);
            end
            else if (ClientConsole.Cli_Status = 'ONLINE') OR (ClientConsole.Cli_Status = 'OFFLINE') then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON_TYPE_730, Weapon.launcherID,0, True);
            end;
          end
          else
          if (ClientConsole.WeaponID = C_DBID_CANNON57_DIGITAL) then
          begin
            if(ClientConsole.Cli_Status = 'RUNNING')and (ClientConsole.Cli_SHIPID = Vehicle.Vehicle_ID) then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON57_DIGITAL, Weapon.launcherID,0, False);
            end
            else if (ClientConsole.Cli_Status = 'ONLINE') OR (ClientConsole.Cli_Status = 'OFFLINE') then
            begin
                AssignStatus(Vehicle.Vehicle_ID, C_DBID_CANNON57_DIGITAL, Weapon.launcherID,0, True);
            end;
          end;
        end;
      end;

      if FileExists(weaponPic) then
      begin
        imageC802.Picture.LoadFromFile(weaponPic);
        imageYahkont.Picture.LoadFromFile(weaponPic);
        imageTetral.Picture.LoadFromFile(weaponPic);
        imageMistral.Picture.LoadFromFile(weaponPic);
        imageStrella.Picture.LoadFromFile(weaponPic);
        imageCannon76.Picture.LoadFromFile(weaponPic);
        imageTorpedoSUT.Picture.LoadFromFile(weaponPic);
        imageRBU6000.Picture.LoadFromFile(weaponPic);
        imageTpoA244.Picture.LoadFromFile(weaponPic);
        imageExocetMM40.Picture.LoadFromFile(weaponPic);
        imageVLMica.Picture.LoadFromFile(weaponPic);
        imageCannonAK230.Picture.LoadFromFile(weaponPic);
      end;

      IDweapon := TWeapon(TListView(sender).Selected.Data).WeaponID;
      IDDetail := StrToInt(lvWeapon.Selected.SubItems[0]);

      ListWeaponOnShip := TList.Create;
      ListWeaponDetail := TList.Create;

      DataModule1.GetListWeaponOnShip(Ship_ID, ListWeaponOnShip);
      DataModule1.GetListWeaponRangeDetail(Ship_ID, IDweapon, IDDetail,  ListWeaponDetail);

      for i := 0 to ListWeaponDetail.Count - 1 do
      begin
        if Assigned(ListWeaponDetail.Items[i]) then begin
          WeaponDetail := TWeaponDetail(ListWeaponDetail.Items[i]);

          {$REGION 'BlackShark/SUT'}
          lblStartSUT.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndSUT.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinSUT.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxSUT.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'RBU 6000 Analog'}
          lblStartRBU.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndRBU.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinRBU.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxRBU.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'Torpedo A244S'}
          lblStartA244s.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndA244s.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinA244s.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxA244s.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'Cannon 76'}
          lblStartCannon76.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndCannon76.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinCannon76.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxCannon76.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'Tetral'}
          lblStartTetral.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndTetral.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinTetral.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxTetral.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'Mistral'}
          lblStartMistral.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndMistral.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinMistral.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxMistral.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'Strela'}
          lblStartStrella.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndStrella.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinStrella.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxStrella.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'Exocet MM40'}
          lblStartMM40.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndMM40.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinMM40.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxMM40.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'Yakhont'}
          lblStartYakhont.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndYakhont.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinYakhont.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxYakhont.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'C802'}
          lblStartDegC802.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndDegC802.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinRangeC802.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxRangeC802.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'Cannon AK230'}
          lblStartAK230.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndAK230.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinAK230.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxAK230.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

          {$REGION 'VL MICA'}
          lblStartVlMica.Caption := (FloatToStr(weaponDetail.StartAngle));
          lblEndVlMica.Caption   := (FloatToStr(weaponDetail.EndAngle));
          lblMinVlMica.Caption := (FloatToStr(weaponDetail.LowRange));
          lblMaxVlMica.Caption := (FloatToStr(weaponDetail.HighRange));
          {$ENDREGION}

        end;
      end;
    end;

  end
  else
  begin
    pgWeapon.ActivePage  := pgtwDefault;
  end;
end;

{ Camera }
{ ---------------------------------------------------------------------- }
procedure TfrmGameController.CurrentShipItemSendCommandPlayerCamera(
  const orderID, LockID : integer);
var
  ObjectLockID : integer;
  RecSend : spUtilityTools;

  Weapon : TWeapon;
  Vehicle : TVehicle;
begin
  if ((lvRuntimeShip.Selected = nil) and (lvRuntimeMissile.Selected = nil)) then
  begin
    ShowMessage('Select Ship Or Weapon');
    exit;
  end;

  //Set Camera Weapon
  if ((lvRuntimeShip.Selected = nil) and (lvRuntimeMissile.Selected <> nil)) then
  begin
    if Assigned(lvRuntimeMissile.Selected.Data) then
    begin
      Weapon := TWeapon(lvRuntimeMissile.Selected.Data);

      RecSend.OrderID := orderID;                       // Order ID
      RecSend.c0      := ObserverID;                    // ID Observer

      case LockID of
        1 : RecSend.c1  := PLAYER_SET_ATTACH_MISSILE;   // TypeID
        2 : RecSend.c1  := PLAYER_SET_ATTACH_MISSILE2;
      end;

      RecSend.c2      := Weapon.shipID;                 // Ship ID
      RecSend.c3      := Weapon.WeaponID;               // Weapon ID -> Scenario Base
      RecSend.c4      := Weapon.LauncherID;             // Launcher ID
      RecSend.c5      := Weapon.MissileID;              // Missile ID
      RecSend.c6      := Weapon.MissileNumber;          // Missile Number

      SimManager.NetSendTo3D_SetCommandPlayerCamera(RecSend);
    end;
  end
  else
  //Set Camera Ship
  if ((lvRuntimeShip.Selected <> nil) and (lvRuntimeMissile.Selected = nil)) then
  begin
    if Assigned(lvRuntimeShip.Selected.Data) then
    begin                                               
      Vehicle := TVehicle(lvRuntimeShip.Selected.Data);

      case Vehicle.Vehicle_Type of
        1 : ObjectLockID := LOCK_SURFACE;
        2 : ObjectLockID := LOCK_AIR;
        3 : ObjectLockID := LOCK_SUBSURFCE;
      end;

      RecSend.OrderID := orderID;                       // Order ID
      RecSend.c0      := ObserverID;                    // ID Observer

      case LockID of
        1 : RecSend.c1      := PLAYER_SET_ATTACH_SHIP;  // TypeID
        2 : RecSend.c1      := PLAYER_SET_ATTACH_SHIP2; // TypeID
      end;

      RecSend.c2      := Vehicle.Vehicle_ID;            // Ship ID
      RecSend.c3      := ObjectLockID;                  // Vehicle Type (surface, subsurface, air)
      RecSend.c4      := 0;
      RecSend.c5      := 0;
      RecSend.c6      := 0;

      SimManager.NetSendTo3D_SetCommandPlayerCamera(RecSend);
    end;
  end;
end;

procedure TfrmGameController.CurrentShipItemSendCommandPlayerLockSideCamera(
  const orderID, TypeLock, LockID: integer);
var
  ObjectLockID : integer;
  RecSend : spUtilityTools;

  Weapon : TWeapon;
  Vehicle : TVehicle;
begin
  if ((lvRuntimeShip.Selected = nil) and (lvRuntimeMissile.Selected = nil)) then
  begin
    ShowMessage('Select Ship Or Weapon');
    exit;
  end;

  //Set Camera Weapon
  if ((lvRuntimeShip.Selected = nil) and (lvRuntimeMissile.Selected <> nil)) then
  begin
    if Assigned(lvRuntimeMissile.Selected.Data) then
    begin
      Weapon := TWeapon(lvRuntimeMissile.Selected.Data);

      RecSend.OrderID := orderID;                         // Order ID
      RecSend.c0      := ObserverID;                      // ID Observer

      case LockID of
        1 : RecSend.c1      := PLAYER_SET_LOCK_OBJECT;    // TypeID ID
        2 : RecSend.c1      := PLAYER_SET_LOCK_OBJECT2;   // TypeID ID
      end;

      RecSend.c2      := TypeLock;                        // Left, Right, Front, Back, Top
      RecSend.c3      := LOCK_WEAPON;
      RecSend.c4      := 0;
      RecSend.c5      := 0;
      RecSend.c6      := 0;

      SimManager.NetSendTo3D_SetCommandPlayerCamera(RecSend);
    end;
  end
  else
  //Set Camera Ship
  if ((lvRuntimeShip.Selected <> nil) and (lvRuntimeMissile.Selected = nil)) then
  begin
    if Assigned(lvRuntimeShip.Selected.Data) then
    begin
      Vehicle := TVehicle(lvRuntimeShip.Selected.Data);

      case Vehicle.Vehicle_Type of
        1 : ObjectLockID := LOCK_SURFACE;
        2 : ObjectLockID := LOCK_AIR;
        3 : ObjectLockID := LOCK_SUBSURFCE;
      end;

      RecSend.OrderID := orderID;                         // Order ID
      RecSend.c0      := ObserverID;                      // ID Observer

      case LockID of
        1 : RecSend.c1      := PLAYER_SET_LOCK_OBJECT;    // TypeID ID
        2 : RecSend.c1      := PLAYER_SET_LOCK_OBJECT2;   // TypeID ID
      end;

      RecSend.c2      := TypeLock;                        // Left, Right, Front, Back, Top
      RecSend.c3      := ObjectLockID;                    // Vehicle Type (surface, subsurface, air)
      RecSend.c4      := 0;
      RecSend.c5      := 0;
      RecSend.c6      := 0;

      SimManager.NetSendTo3D_SetCommandPlayerCamera(RecSend);
    end;
  end;
end;

procedure TfrmGameController.CurrentShipItemSendCommanPlayerEvent(
  const orderID, valInt : Integer; const valDbl : double);
var
  rec : TRec_CameraController;
begin
  rec.cmd := orderID;                 // Order ID
  rec.valueInt      := valInt;              // ID Observer
  rec.valueDbl      := valDbl;

  SimManager.NetSendTo3D_CommandCamera(@rec);
end;

procedure TfrmGameController.btnPlayerCameraLockClick(Sender: TObject);
begin
  CurrentShipItemSendCommandPlayerCamera(TIPE_UTIL_PLAYER_SETTING, 1);
end;

procedure TfrmGameController.btnPlayerCameraUnlockClick(Sender: TObject);
var
  RecSend : spUtilityTools;
begin
  RecSend.OrderID := TIPE_UTIL_PLAYER_SETTING;  // Order ID
  RecSend.c0      := ObserverID;                // ID Observer
  RecSend.c1      := PLAYER_SET_OBSERVER;       // Event ID
  RecSend.c2      := 0;
  RecSend.c3      := 0;
  RecSend.c4      := 0;
  RecSend.c5      := 0;                         // Speed Player;
  RecSend.c6      := 0;

  SimManager.NetSendTo3D_SetCommandPlayerCamera(RecSend);
end;

procedure TfrmGameController.btnCamViewOldLeftClick(Sender: TObject);
begin
  CurrentShipItemSendCommandPlayerCamera(TIPE_UTIL_PLAYER_SETTING, 1);
  Sleep(10);

  unlockCam := False;

  case TComponent(sender).Tag of
    1 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_LEFT, 1);
    end;

    2 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_FRONT, 1);
    end;

    3 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_RIGHT, 1);
    end;

    4 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_BACK, 1);
    end;

    5 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_TOP, 1);
    end;
  end
end;

procedure TfrmGameController.btnCamViewLeftClick(Sender: TObject);
begin
  unlockCam := False;
  CurrentShipItemSendCommandPlayerCamera(TIPE_UTIL_PLAYER_SETTING, 2);
  Sleep(10);

  case TComponent(sender).Tag of
    1 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
        LOCK_SIDE_LEFT, 2);
    end;

    2 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_FRONT, 2);
    end;

    3 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_RIGHT, 2);
    end;

    4 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_BACK, 2);
    end;

    5 :
    begin
      CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING,
          LOCK_SIDE_TOP, 2);
    end;
  end
end;

procedure TfrmGameController.btnCamMoveLefMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TComponent(sender).Tag of
    6 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    7 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    8 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    9 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);

    10 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    11 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    12 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    13 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    14 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    15 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
  end;
end;

procedure TfrmGameController.btnCamRotateOldLeftMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TComponent(sender).Tag of
    6 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    7 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    8 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    9 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);

    10 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    11 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    12 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    13 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    14 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
    15 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StartMove, TComponent(sender).Tag, 0);
  end;
end;

procedure TfrmGameController.btnCamMoveLefMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TComponent(sender).Tag of
    6,7,8,9           : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StopMove, TComponent(sender).Tag, 0);
    10,11,12,13,14,15 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StopMove, TComponent(sender).Tag, 0);
  end;
end;

procedure TfrmGameController.btnCamRotateOldLeftMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  case TComponent(sender).Tag of
    6,7,8,9           : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StopMove, TComponent(sender).Tag, 0);
    10,11,12,13,14,15 : CurrentShipItemSendCommanPlayerEvent(__ORD_ID_CAMCON_StopMove, TComponent(sender).Tag, 0);
  end;
end;


procedure TfrmGameController.cbSelectIDCameraChange(Sender: TObject);
begin
  ObserverID := cbSelectIDCamera.ItemIndex;

  if ObserverID <> 0 then
    ObserverID := ObserverID + 10;
end;

{ ---------------------------------------------------------------------- }

procedure TfrmGameController.mni3Click(Sender: TObject);
var
  ip      : string;
  i       : Integer;
  RecSend : TRecData2DOrder;
  ipSPS   : string;
  ipMOC1  : string;
  AppData : tDataApplication;
begin
  if lvClient.Selected = nil then Exit;

  ip := lvClient.Selected.SubItems[3];

  case TComponent(sender).Tag of
    0 :
    begin
      if lvClient.Selected.SubItems[1] = 'MOC-1' then begin
        SimManager.InstrukturSendStopCommandIP(ip);
        //DataModule1.updateShipName(ip, '');

        ipSPS := lvClient.Items[17].SubItems[3];
        SimManager.InstrukturSendStopCommandIP(ipSPS);
        //DataModule1.updateShipName(ipSPS, '');
      end
      else if lvClient.Selected.SubItems[1] = 'SPS115' then begin
        SimManager.InstrukturSendStopCommandIP(ip);
        //DataModule1.updateShipName(ip, '');

        ipMOC1 := lvClient.Items[5].SubItems[3];
        SimManager.InstrukturSendStopCommandIP(ipMOC1);
        //DataModule1.updateShipName(ipMOC1, '');
      end
      else begin
        SimManager.InstrukturSendStopCommandIP(ip);
        //DataModule1.updateShipName(ip, '');

        AppData := GetPCConfigFromIPAddress(ip);

        RecSend.orderID   := _CM_CLIENT_MANAGE;
        RecSend.numValue  := __CM_CLIENT_STOP;
        RecSend.strValue  := ExtractFileName(AppData.c_app_name);
        RecSend.ipConsole := ip;

        SimManager.SendCommand2D_Order(RecSend);
      end;
    end;

    1 :
    begin
      RecSend.orderID   := _CM_CLIENT_MANAGE;
      RecSend.numValue  := __CM_CLIENT_RESTART;
      RecSend.strValue  := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := ip;

      SimManager.SendCommand2D_Order(RecSend);
    end;

    2 :
    begin
      RecSend.orderID   := _CM_CLIENT_MANAGE;
      RecSend.numValue  := __CM_CLIENT_SHUTDOWN;
      RecSend.strValue  := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := ip;

      if lvClient.Selected.SubItems[1] = 'MOC-1' then begin
        SimManager.SendCommand2D_Order(RecSend);

        ipSPS := lvClient.Items[17].SubItems[3];
        RecSend.ipConsole := ipSPS;
        SimManager.SendCommand2D_Order(RecSend);
      end
      else if lvClient.Selected.SubItems[1] = 'SPS115' then begin
        SimManager.SendCommand2D_Order(RecSend);

        ipMOC1 := lvClient.Items[5].SubItems[3];
        RecSend.ipConsole := ipMOC1;
        SimManager.SendCommand2D_Order(RecSend);
      end
      else begin
        SimManager.SendCommand2D_Order(RecSend);
      end;
    end;

    3 :
    begin
      RecSend.orderID   := _CM_CLIENT_MANAGE;
      RecSend.numValue  := __CM_CLIENT_RESTART_ALL;
      RecSend.strValue  := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := ip;

      SimManager.SendCommand2D_Order(RecSend);
    end;

    4 :
    begin
      RecSend.orderID   := _CM_CLIENT_MANAGE;
      RecSend.numValue  := __CM_CLIENT_SHUTDOWN_ALL;
      RecSend.strValue  := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := ip;


      SimManager.SendCommand2D_Order(RecSend);
    end;

    -2 :
    begin
//      WakeOnLan(DataModule1.getMacAddress(lvClient.Selected.SubItems[3]));
      AppData := GetPCConfigFromIPAddress(ip);

      WakeOnLan(AppData.c_mac);

//      RecSend.orderID   := _CM_CLIENT_MANAGE;
      RecSend.orderID   := _CM_CLIENT_APP;
      RecSend.numValue  := __CM_CLIENT_LAUNCH;
      RecSend.strValue  := ExtractFileName(AppData.c_app_name);
      RecSend.strValue2 := AppData.c_app_params;
      RecSend.strValue3 := AppData.c_app_name_2;
      RecSend.ipConsole := ip;

      SimManager.SendCommand2D_Order(RecSend);
    end;
  end;
  AutoRefresh;
end;

procedure TfrmGameController.WakeOnLan(const AMacAddress: string);
type
      TMacAddress = array [1..6] of byte;

      TWakeRecord = packed record
        Waker : TMACAddress;
        MAC   : array[0..15] of TMACAddress;
      end;

 var i : integer;
     WR : TWakeRecord;
     MacAddress : TMacAddress;
     UDP : TIdUDPClient;
     sData : string;
begin
// Convert MAC string into MAC array
   fillchar(MacAddress,SizeOf(TMacAddress),0);
   sData := trim(AMacAddress);

   if length(sData) = 17 then begin
     for i := 1 to 6 do begin
       MacAddress[i] := StrToIntDef('$' + copy(sData,1,2),0);
       sData := copy(sData,4,17);
     end;
   end;

   for i := 1 To 6 do WR.Waker[i] := $FF;
   for i := 0 to 15 do WR.MAC[i] := MacAddress;

   // Create UDP and Broadcast data structure
   UDP := TIdUDPClient.Create(nil);
   UDP.Host := '255.255.255.255';
   UDP.Port := 7;
   UDP.BroadCastEnabled := true;
//   UDP.SendBuffer(WR,SizeOf(TWakeRecord));
   UDP.BroadcastEnabled := false;
   UDP.Free;
end;

procedure TfrmGameController.vrWheelCameraRotateXChange(Sender: TObject);
var
  newDir : Integer;
begin
  if unlockCam = False then
  begin
    if vrWheelCameraRotateX.Position < 180 then
    begin
      newDir := (180 + vrWheelCameraRotateX.Position);
    end
    else
    begin
      newDir := (vrWheelCameraRotateX.Position - 180);
    end;

    lblRotateX.Caption.Text := 'Rotate X - ' + IntToStr(newDir);
  end
  else
  begin
    ShowMessage('Select Camera View to Rotate Camera');
  end;

end;

procedure TfrmGameController.vrWheelCameraRotateYChange(Sender: TObject);
var
  newDir : Integer;
begin

  if unlockCam = False then
  begin
    if vrWheelCameraRotateY.Position < 180 then
    begin
      vrWheelCameraRotateY.Position := 180;
    end
    else if vrWheelCameraRotateY.Position > 270 then
    begin
      vrWheelCameraRotateY.Position := 270;
    end;

    if vrWheelCameraRotateY.Position < 180 then
    begin
      newDir := (180 + vrWheelCameraRotateY.Position);
    end
    else
    begin
      newDir := (vrWheelCameraRotateY.Position - 180);
    end;

    lblRotateY.Caption.Text := 'Rotate Y - ' + IntToStr(newDir);
  end
  else
  begin
    ShowMessage('Select Camera View to Rotate Camera');
  end;

end;

procedure TfrmGameController.vrWheelCameraRotateYMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  newDir : Integer;
begin
  if unlockCam = False then
  begin
    if vrWheelCameraRotateY.Position < 180 then
    begin
      newDir := (180 + vrWheelCameraRotateY.Position);
    end
    else
    begin
      newDir := (vrWheelCameraRotateY.Position - 180);
    end;

//    CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_ROTATE_ON, ROTATE_PLAYER_UP, 3, newDir);
  end
  else
  begin
    ShowMessage('Select Camera View to Rotate Camera');
  end;

end;

procedure TfrmGameController.vrWheelCameraRotateXMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  newDir : Integer;
begin
  if unlockCam = False then
  begin
    if vrWheelCameraRotateX.Position < 180 then
    begin
      newDir := (180 + vrWheelCameraRotateX.Position);
    end
    else
    begin
      newDir := (vrWheelCameraRotateX.Position - 180);
    end;

//    CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_ROTATE_ON, ROTATE_PLAYER_LEFT, 3, newDir);
  end
  else
  begin
    ShowMessage('Select Camera View to Rotate Camera');
  end;
end;

procedure TfrmGameController.btnCameraUnlockClick(Sender: TObject);
var
  RecSend : spUtilityTools;
begin
    RecSend.OrderID := TIPE_UTIL_PLAYER_SETTING;  // Order ID
    RecSend.c0      := ObserverID;                // ID Observer
    RecSend.c1      := PLAYER_SET_OBSERVER;       // Event ID
    RecSend.c2      := 0;
    RecSend.c3      := 0;
    RecSend.c4      := 0;
    RecSend.c5      := 0;                         // Speed Player;
    RecSend.c6      := 0;

    SimManager.NetSendTo3D_SetCommandPlayerCamera(RecSend);

  unlockCam := True;
end;

procedure TfrmGameController.btnCameraLockClick(Sender: TObject);
begin
  CurrentShipItemSendCommandPlayerCamera(TIPE_UTIL_PLAYER_SETTING, 2);
  CurrentShipItemSendCommandPlayerLockSideCamera(TIPE_UTIL_PLAYER_SETTING, LOCK_SIDE_LEFT, 2);
end;

procedure TfrmGameController.tmrStatusTimer(Sender: TObject);
begin
  btnRefreshClient.Enabled := True;
  tmrStatus.Enabled := false;
end;

procedure TfrmGameController.trackBarElevationChange(Sender: TObject);
begin
  edtElevationValue.Text := IntToStr(trackBarElevation.Position);
end;

procedure TfrmGameController.trackBarElevationMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  rec : TRec_CameraController;
begin
  if StrToInt(edtElevationValue.Text) < trackBarElevation.Min then
    edtElevationValue.Text := IntToStr(trackBarElevation.Min)
  else if StrToInt(edtElevationValue.Text) > trackBarElevation.Max then
    edtElevationValue.Text := IntToStr(trackBarElevation.Max);

  trackBarElevation.Position := StrToInt(edtElevationValue.Text);

  rec.cmd := __ORD_ID_CAMCON_POS_ELEVATION;
  rec.valueInt := StrToInt(edtElevationValue.Text);
  rec.valueDbl := 0;

  SimManager.NetSendTo3D_CommandCamera(@rec);
end;

procedure TfrmGameController.trackBarRangeChange(Sender: TObject);
begin
  edtRangeValue.Text := IntToStr(trackBarRange.Position);
end;

procedure TfrmGameController.trackBarRangeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  rec : TRec_CameraController;
begin
  if StrToInt(edtRangeValue.Text) < trackBarRange.Min then
    edtRangeValue.Text := IntToStr(trackBarRange.Min)
  else if StrToInt(edtRangeValue.Text) > trackBarRange.Max then
    edtRangeValue.Text := IntToStr(trackBarRange.Max);

  trackBarRange.Position := StrToInt(edtRangeValue.Text);

  rec.cmd := __ORD_ID_CAMCON_POS_RANGE;
  rec.valueInt := StrToInt(edtRangeValue.Text);
  rec.valueDbl := 0;

  SimManager.NetSendTo3D_CommandCamera(@rec);
end;

procedure TfrmGameController.LoadImageLight(var Aimage: TImage; imgStat: string; const stat: byte);
begin
  if stat = OFFLINE then
    Aimage.Picture.LoadFromFile(imgStat)
  else if stat = ONLINE then
    Aimage.Picture.LoadFromFile(imgStat)
  else if stat = RUNNING then
    Aimage.Picture.LoadFromFile(imgStat);
end;

procedure TfrmGameController.CekLight;
var
  i : integer;
  console : string;
begin
  for i := 0 to lvClient.Items.Count-1 do
  begin
    console := lvClient.Items[i].SubItems[1];

    if console = 'SERVER NSSFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgServerNSSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgServerNSSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgServerNSSFS,LoadImgRunning,RUNNING);
    end
    else if console = 'SERVER NSFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgServerNSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgServerNSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgServerNSFS,LoadImgRunning,RUNNING);
    end
    else if console = 'SERVER NAFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgServerNAFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgServerNAFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgServerNAFS,LoadImgRunning,RUNNING);
    end
    else if console = '3D DISPLAY NSSFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(img3DNSSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(img3DNSSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(img3DNSSFS,LoadImgRunning,RUNNING);
    end
    else if console = '3D DISPLAY NSFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(img3DNSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(img3DNSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(img3DNSFS,LoadImgRunning,RUNNING);
    end
    else if console = '3D DISPLAY NAFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(img3DNAFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(img3DNAFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(img3DNAFS,LoadImgRunning,RUNNING);
    end
    else if console = 'INSTRUKTUR NSSFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgInstrukturNSSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgInstrukturNSSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgInstrukturNSSFS,LoadImgRunning,RUNNING);
    end
    else if console = 'INSTRUKTUR NSFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgInstrukturNSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgInstrukturNSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgInstrukturNSFS,LoadImgRunning,RUNNING);
    end
    else if console = 'INSTRUKTUR NAFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgInstrukturNAFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgInstrukturNAFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgInstrukturNAFS,LoadImgRunning,RUNNING);
    end
    else if console = 'MK3-2H NSSFS' then             //NSSFS
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMK3NSSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMK3NSSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMK3NSSFS,LoadImgRunning,RUNNING);
    end
    else if console = 'MK3 SPS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMK3SPS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMK3SPS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMK3SPS,LoadImgRunning,RUNNING);
    end
    else if console = 'MK4 NSSFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMK4NSSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMK4NSSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMK4NSSFS,LoadImgRunning,RUNNING);
    end
    else if console = 'MK4 SPS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMK4SPS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMK4SPS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMK4SPS,LoadImgRunning,RUNNING);
    end
    else if console = 'SUT & BLACK SHARK' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgSUT,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgSUT,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgSUT,LoadImgRunning,RUNNING);
    end
    else if console = 'RBU DIGITAL' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgRBUDigital,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgRBUDigital,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgRBUDigital,LoadImgRunning,RUNNING);
    end
    else if console = 'RBU ANALOG' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgRBUAnalog,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgRBUAnalog,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgRBUAnalog,LoadImgRunning,RUNNING);
    end
    else if console = 'C-705' then         //NSFS
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgC705,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgC705,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgC705,LoadImgRunning,RUNNING);
    end
    else if console = '57-MANUAL' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(img57Manual,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(img57Manual,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(img57Manual,LoadImgRunning,RUNNING);
    end
    else if console = 'MR-103' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMR103,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMR103,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMR103,LoadImgRunning,RUNNING);
    end
    else if console = '57-DIGITAL' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(img57Digital,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(img57Digital,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(img57Digital,LoadImgRunning,RUNNING);
    end
    else if console = 'MR-35' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMR35,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMR35,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMR35,LoadImgRunning,RUNNING);
    end
    else if console = 'C-802' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgC802,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgC802,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgC802,LoadImgRunning,RUNNING);
    end
    else if console = 'YAKHONT' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgYakhont,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgYakhont,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgYakhont,LoadImgRunning,RUNNING);
    end
    else if console = 'MK3-2H' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMK3NSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMK3NSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMK3NSFS,LoadImgRunning,RUNNING);
    end
    else if console = 'MK4' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMK4NSFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMK4NSFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMK4NSFS,LoadImgRunning,RUNNING);
    end
    else if console = 'TDS FC 76MM' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgTDS76,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgTDS76,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgTDS76,LoadImgRunning,RUNNING);
    end
    else if console = 'MK3-2H NAFS' then      //NAFS
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMK3NAFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMK3NAFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMK3NAFS,LoadImgRunning,RUNNING);
    end
    else if console = 'MK4 NAFS' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMK4NAFS,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMK4NAFS,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMK4NAFS,LoadImgRunning,RUNNING);
    end
    else if console = 'AK-230' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgAK230,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgAK230,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgAK230,LoadImgRunning,RUNNING);
    end
    else if console = 'MR-203' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgMR203,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgMR203,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgMR203,LoadImgRunning,RUNNING);
    end
    else if console = 'CIWS-730' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgCIWS730,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgCIWS730,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgCIWS730,LoadImgRunning,RUNNING);
    end
    else if console = 'TRACKET 730' then
    begin
      if lvClient.Items[i].SubItems[4] = 'OFFLINE' then
        LoadImageLight(imgTracket730,LoadImgOff,OFFLINE)

      else if lvClient.Items[i].SubItems[4] = 'ONLINE' then
        LoadImageLight(imgTracket730,LoadImgOn,ONLINE)

      else if lvClient.Items[i].SubItems[4] = 'RUNNING' then
        LoadImageLight(imgTracket730,LoadImgRunning,RUNNING);
    end
  end;
end;

procedure TfrmGameController.mniLog1Click(Sender: TObject);
begin
  frmMainLog.Show;
end;

procedure TfrmGameController.SetImgSelectConsole;
begin
//  img_moc1x.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\moc1.bmp');
//  img_rbux.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\rbu.bmp');
//  img_tocosx.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\tocos.bmp');
//  img_asrocx.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\asroc.bmp');
//  img_wccx.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\wcc.bmp');
//  img_moc2x.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\moc2.bmp');
//  img_yakhontx.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\yakhont.bmp');
//  img_c802x.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\c802.bmp');
//  img_mistralx.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\mistral.bmp');
//  img_strelax.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\strela.bmp');
//  img_m40x.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\tds40.bmp');
//  img_m57x.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\tds57.bmp');

//  imgMoc1_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\sub surface-MOC1_up.bmp');
//  imgRBU_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\sub surface-RBU_up.bmp');
//  imgTocos_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\sub surface-torpedosut_up.bmp');
//  imgAsroc_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\sub surface-ASROC_up.bmp');
//  imgWCC_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\surface-120mm_up.bmp');
//  imgMoc2_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\surface-MOC2_up.bmp');
//  imgYakhont_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\surface-yakhont_up.bmp');
//  imgC802_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\surface-c802_up.bmp');
//  imgMistral_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\antiair-mistral_up.bmp');
//  imgStrela_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\antiair-strela_up.bmp');
//  imgTDS40_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\antiair-tds40mm_up.bmp');
//  imgTDS57_Amb2.Picture.LoadFromFile('..\data\images\NFS instruktur - interface\imageIns\NFS armabar\antiair-tds57mm_up.bmp');


//  img_moc1x.Left    := img_moc1.Left;
//  img_moc1x.Top     := img_moc1.Top;
//  img_rbux.Left     := img_rbu.Left;
//  img_rbux.Top      := img_rbu.Top;
//  img_tocosx.Left   := img_tocos.Left;
//  img_tocosx.Top    := img_tocos.Top;
//  img_asrocx.Left   := img_asroc.Left;
//  img_asrocx.Top    := img_asroc.Top;
//  img_wccx.Left     := img_wcc.Left;
//  img_wccx.Top      := img_wcc.Top;
//  img_moc2x.Left    := img_moc2.Left;
//  img_moc2x.Top     := img_moc2.Top;
//  img_yakhontx.Left := img_yakhont.Left;
//  img_yakhontx.Top  := img_yakhont.Top;
//  img_c802x.Left    := img_c802.Left;
//  img_c802x.Top     := img_c802.Top;
//  img_mistralx.Left := img_mistral.Left;
//  img_mistralx.Top  := img_mistral.Top;
//  img_strelax.Left  := img_strela.Left;
//  img_strelax.Top   := img_strela.Top;
//  img_m40x.Left     := img_m40.Left;
//  img_m40x.Top      := img_m40.Top;
//  img_m57x.Left     := img_m57.Left;
//  img_m57x.Top      := img_m57.Top;

//  imgFrame1.Width  := 40;
//  imgFrame1.Height := 7;
//  imgFrame1.Top  := img_Ob1.Top - 1;
//  imgFrame1.Left := img_Ob1.Left - 2;
//  img_Ob1.BringToFront;

//  imgFrame2.Width  := 40;
//  imgFrame2.Height := 7;
//  imgFrame2.Top  := img_Ob2.Top - 1;
//  imgFrame2.Left := img_Ob2.Left - 2;
//  img_Ob2.BringToFront;

//  imgFrame3.Width  := 40;
//  imgFrame3.Height := 7;
//  imgFrame3.Top  := img_Ob3.Top - 1;
//  imgFrame3.Left := img_Ob3.Left - 2;
//  img_Ob3.BringToFront;

//  imgFrame4.Width  := 40;
//  imgFrame4.Height := 7;
//  imgFrame4.Top  := img_Ob4.Top - 1;
//  imgFrame4.Left := img_Ob4.Left - 2;
//  img_Ob4.BringToFront;

  //imgFrameServer.Width  := 83;
  //imgFrameServer.Height := 14;
//  imgFrameServer.Width  := 100;
//  imgFrameServer.Height := 30;
//  imgFrameServer.Top  := img_Server.Top - 3;
//  imgFrameServer.Left := img_Server.Left - 2;
//  img_Server.BringToFront;
end;

procedure TfrmGameController.ClearAllDetail;
begin
  edtPosPitch.Text    := '';
  edtPosHeading.Text  := '';
  edtModelBody.Text   := '';
  edtModelSpout.Text  := '';
  edtDOF1.Text        := '';
  edtDOF2.Text        := '';
  edtSwitch.Text      := '';
  edt3DActor.Text     := '';

//  cbbModelBody.ItemIndex  := 0;
//  cbbModelSpout.ItemIndex := 0;
//  cbbDOF_I.ItemIndex      := 0;
//  cbbDOF_II.ItemIndex     := 0;
//  cbbSwitch.ItemIndex     := 0;
//
//  edtLauncher.Text        := '0';
//  edtUpdateHeading.Text   := '0';
//  edtUpdatePitch.Text     := '0';
//
//  btnUpdate.Visible       := false;

  lvDetail.Items.Clear;
  pnlDetail.BringToFront;
end;

procedure TfrmGameController.ClearAllVisibleConsole;
begin
//   img_moc1x.Visible := false;
//   img_rbux.Visible := false;
//   img_tocosx.Visible := false;
//   img_asrocx.Visible := false;
//   img_wccx.Visible := false;
//   img_moc2x.Visible:= false;
//   img_yakhontx.Visible := false;
//   img_c802x.Visible := false;
//   img_mistralx.Visible := false;
//   img_strelax.Visible := false;
//   img_m40x.Visible := false;
//   img_m57x.Visible := false;
//   imgFrame1.Visible := false;
//   imgFrame2.Visible := false;
//   imgFrame3.Visible := false;
//   imgFrame4.Visible := false;
//   imgFrameServer.Visible := false;

//   imgMoc1_Amb2.Visible := false;
//   imgRBU_Amb2.Visible := false;
//   imgTocos_Amb2.Visible := false;
//   imgAsroc_Amb2.Visible := false;
//   imgWCC_Amb2.Visible := false;
//   imgMoc2_Amb2.Visible:= false;
//   imgYakhont_Amb2.Visible := false;
//   imgC802_Amb2.Visible := false;
//   imgMistral_Amb2.Visible := false;
//   imgStrela_Amb2.Visible := false;
//   imgTDS40_Amb2.Visible := false;
//   imgTDS57_Amb2.Visible := false;

end;

procedure TfrmGameController.SelectConsole;
var
  console : string;
begin
  if lvClient.Selected <> nil then
  begin
    console := lvClient.Selected.SubItems[1];
    ClearAllVisibleConsole;

    if (console = 'MOC-1') or (console = 'SPS115') then
    begin
//      img_moc1x.Visible := true;
//      imgMoc1_Amb2.Visible := True;
    end
    else if console = 'MOC-2' then
    begin
//      img_moc2x.Visible := true;
//      imgMoc2_Amb2.Visible := True;
    end
    else if console = 'Yakhont' then
    begin
//      img_yakhontx.Visible := true;
//      imgYakhont_Amb2.Visible := True;
    end
    else if console = 'C-802' then
    begin
//      img_c802x.Visible := true;
//      imgC802_Amb2.Visible := True;
    end
    else if console = 'WCC' then
    begin
//      img_wccx.Visible := true;
//      imgWCC_Amb2.Visible := True;
    end
    else if console = 'MISTRAL' then
    begin
//      img_mistralx.Visible := true;
//      imgMistral_Amb2.Visible := true;
    end
    else if console = 'STRELLA' then
    begin
//      img_strelax.Visible := true;
//      imgStrela_Amb2.Visible := True;
    end
    else if console = 'TDS Meriam 57' then
    begin
//      img_m57x.Visible := true;
//      imgTDS57_Amb2.Visible := True;
    end
    else if console = 'TDS Meriam 40' then
    begin
//      img_m40x.Visible := true;
//      imgTDS40_Amb2.Visible := True;
    end
    else if console = 'Asroc' then
    begin
//      img_asrocx.Visible := true;
//      imgAsroc_Amb2.Visible := True;
    end
    else if console = 'Tocos' then
    begin
//      img_tocosx.Visible := true;
//      imgTocos_Amb2.Visible := True;
    end
    else if console = 'RBU 6000' then
    begin
//      img_rbux.Visible := true;
//      imgRBU_Amb2.Visible := True;
    end
    else if console = '3D SERVER' then
//      imgFrameServer.Visible := true
    else if console = 'OBSERVER-1' then
//      imgFrame1.Visible := true
    else if console = 'OBSERVER-2' then
//      imgFrame2.Visible := true
    else if console = 'OBSERVER-3' then
//      imgFrame3.Visible := true
    else if console = 'OBSERVER-4' then
//      imgFrame4.Visible := true;
  end;
end;

procedure TfrmGameController.lvClientChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  SelectConsole;
end;

procedure TfrmGameController.vrwhlSeaDirectionChange(Sender: TObject);
var
  valTemp : Integer;

begin
  if vrwhlSeaDirection.Position < 180 then
  begin
    valTemp := (180 + vrwhlSeaDirection.Position);
  end
  else
  begin
    valTemp := (vrwhlSeaDirection.Position - 180);
  end;
  lblCurrentDirection.Caption := IntToStr(valTemp);
  OnChangeEnvironment;
end;

procedure TfrmGameController.execPDF(Sender : TObject);
var
  readPath  : string;
  helpIni   : TIniFile;

begin

  if not (Sender is TMenuItem) then exit;

  helpIni := TIniFile.Create('..\bin\help.ini');
  //ShowMessage(DeleteAmpersand(TMenuItem(Sender).Caption));
  if TMenuItem(Sender).Tag = 0 then
  begin
    readPath := helpIni.ReadString('SettingsManual', DeleteAmpersand(TMenuItem(Sender).Caption),'Default');
  end
  else
  begin
    readPath := helpIni.ReadString('SettingsKomando', DeleteAmpersand(TMenuItem(Sender).Caption),'Default');
  end;

  shellexecute(handle,'open',PChar(readPath),'','',1);

  helpIni.Free;
end;

procedure TfrmGameController.FormDestroy(Sender: TObject);
var
  i,j : integer;
  mnItem : TMenuItem;
  mnItem2 : TMenuItem;
begin
  for i:= Help1.Count -1 downto 0 do
  begin
    mnItem := TMenuItem(Help1.Items[i]);

    for j:= mnItem.Count -1 downto 0 do
    begin
      mnItem2 := TMenuItem(mnItem.Items[j]);
      mnItem2.Free;
    end;
  end;

//  for i := 0 to lvClient.Items.Count-1 do begin
//    if Assigned(lvClient.Items[i].Data) then
//      TObject(lvClient.Items[i].Data).Free;
//  end;
//
//  for i := 0 to lvRuntimeMissile.Items.Count-1 do begin
//    if Assigned(lvRuntimeMissile.Items[i].Data) then
//      TObject(lvRuntimeMissile.Items[i].Data).Free;
//  end;
//
//  for i := 0 to lvWeapon.Items.Count-1 do begin
//    if Assigned(lvWeapon.Items[i].Data) then
//      TObject(lvWeapon.Items[i].Data).Free;
//  end;
//
//  for i := 0 to lvRuntimeShipTrajectory.Items.Count-1 do begin
//    if Assigned(lvRuntimeShipTrajectory.Items[i].Data) then
//      TObject(lvRuntimeShipTrajectory.Items[i].Data).Free;
//  end;
//
//  for i := 0 to lvRuntimeMissileTrajectory.Items.Count-1 do begin
//    if Assigned(lvRuntimeMissileTrajectory.Items[i].Data) then
//      TObject(lvRuntimeMissileTrajectory.Items[i].Data).Free;
//  end;
//
//    for i := 0 to lvRuntimeShip.Items.Count-1 do begin
//    if Assigned(lvRuntimeShip.Items[i].Data) then
//      TObject(lvRuntimeShip.Items[i].Data).Free;
//  end;

  ClearListViewData(lvClient);
  ClearListViewData(lvRuntimeMissile);
  ClearListViewData(lvWeapon);
  ClearListViewData(lvClient);
  ClearListViewData(lvRuntimeMissileTrajectory);
  ClearListViewData(lvRuntimeShip);

end;

procedure TfrmGameController.menuHelp;
var
    mySubManual, mySubCommando   : TMenuItem;
    helpIni       : TIniFile;
    tempString    : TStrings;
    tempString2   : TStrings;
    i, j          : Integer;
    readPath      : string;
begin
  helpIni     := TIniFile.Create('..\bin\help.ini');
  tempString  := TStringList.Create;
  tempString2 := TStringList.Create;

  helpIni.ReadSection('Manual', tempString);
  helpIni.ReadSection('Komando', tempString2);

  for i:= 0 to tempString.Count - 1 do begin
    //ShowMessage(helpIni.ReadString('Manual', tempString[i],'Default'));
    mySubManual := TMenuItem.Create(Self);
    mySubManual.Caption := helpIni.ReadString('Manual', tempString[i],'Default');
    Help1.Items[0].Insert(i, mySubManual);
    Help1.Items[0].Items[i].Tag := 0;
    Help1.Items[0].Items[i].OnClick := execPDF;
  end;

  for j:= 0 to tempString2.Count - 1 do begin
    mySubCommando := TMenuItem.Create(Self);
    mySubCommando.Caption := helpIni.ReadString('Komando', tempString2[j], 'Default');
    Help1.Items[1].Insert(j, mySubCommando);
    Help1.Items[1].Items[j].Tag := 1;
    Help1.Items[1].Items[j].OnClick := execPDF;
  end;

  helpIni.Free;
  tempString.Free;
  tempString2.Free;
end;



procedure TfrmGameController.lvClientCustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);

begin
  if SubItem = 5 then begin
    if Item.SubItems[4] = 'RUNNING' then begin
      Sender.Canvas.Brush.Color := clLime;
    end
    else if Item.SubItems[4] = 'ONLINE' then begin
      Sender.Canvas.Brush.Color := clYellow;
    end
    else begin
      Sender.Canvas.Brush.Color := clRed;
    end;
  end
  else  begin
    Sender.Canvas.Brush.Color := clWhite;
  end;
end;


procedure TfrmGameController.btnRepostObjectClick(Sender: TObject);
begin
  if lvRuntimeShip.Selected <> nil then
  begin
    SimManager.FMap.CurrentTool := TOOL_REPOST_OBJECT;
  end;


end;

procedure TfrmGameController.cbbRBUassigntmentChange(Sender: TObject);
begin

if cbbRBUassigntment.ItemIndex = 0 then
begin
   btnRBU6000Assign.Visible := False;
   btnRBU6000Auto.Visible   := True;
//   Label16.Visible          := False;
   eRBU6000Bearing.Visible  := False;
//   Label36.Visible          := False;
   eRBU6000Range.Visible    := False;
   lbl47.Visible            := True;
   eRBUTargetID.Visible     := True;
   lbl47.Left               := 26;
   lbl47.Top                := 34;
   eRBUTargetID.Left        := 161;
   eRBUTargetID.Top         := 34;
   lbl31.Visible            := False;
end
else if cbbRBUassigntment.ItemIndex = 1 then
begin
   btnRBU6000Assign.Visible := True;
   btnRBU6000Auto.Visible   := False;
//   Label16.Visible          := True;
   eRBU6000Bearing.Visible  := True;
//   Label36.Visible          := True;
   eRBU6000Range.Visible    := True;
   lbl47.Visible            := False;
   eRBUTargetID.Visible     := False;
   lbl31.Visible            := True;
end;

end;

procedure TfrmGameController.btnTorpSutTargetClick(Sender: TObject);
begin
  SimManager.FMap.CurrentTool := TOOL_SELECT_TORPSUT_TARGET;
end;

procedure TfrmGameController.cbbA244LauncherChange(Sender: TObject);
begin
  if cbbA244Launcher.Text = 'kiri' then
  begin
    cbbA244MissID.Visible  := True;
    cbbA244MissID2.Visible := False;
  end
  else if cbbA244Launcher.Text = 'kanan' then
  begin
    cbbA244MissID.Visible  := False;
    cbbA244MissID2.Visible := True;

  end;
end;

procedure TfrmGameController.cbbWTRChange(Sender: TObject);
begin
  wtrChange;
end;
procedure TfrmGameController.btnAsrocTargetClick(Sender: TObject);
begin
    SimManager.FMap.CurrentTool := TOOL_SELECT_ASROC_TARGET;
end;

procedure TfrmGameController.btnCamPinClick(Sender: TObject);
var
  ShipID: Word;
  RecSend: TRecCmdSetCameraTarget;
  rec : TRec_CameraController;
begin
  if not Assigned(SimManager.TrackObject) then
    Exit;
//  ShipID:= SimManager.TrackObject.FDataBaseID;
//  RecSend.ShipID:= ShipID;
//  SimManager.NetSendTo3D_CommandPinCamera(RecSend);

  // Coba Send Cam Denta
  ShipID := SimManager.TrackObject.FDataBaseID;
  rec.cmd := __ORD_ID_CAMCON_SHOW_PLATFORM;
  rec.valueInt := ShipID;
  rec.valueDbl := 0;

  SimManager.NetSendTo3D_CommandCamera(@rec);

  pnlPinCamera.Visible := True;
  pnlCameraRotateOld.Visible := False;
  pnlCameraMove.Visible := False;
end;

procedure TfrmGameController.edtAzimutExit(Sender: TObject);
var
  azimuth : Integer;
  rec : TRec_CameraController;
begin
  azimuth := StrToInt(edtAzimut.Text);

  if azimuth >= 360 then
    azimuth := 0;

  if azimuth < 180 then
    wheelAzimut.Position := azimuth + 180
  else
    wheelAzimut.Position := azimuth - 180;

  rec.cmd := __ORD_ID_CAMCON_POS_AZIMUTH;
  rec.valueInt := azimuth;
  rec.valueDbl := 0;

  SimManager.NetSendTo3D_CommandCamera(@rec);
end;

procedure TfrmGameController.edtAzimutKeyPress(Sender: TObject; var Key: Char);
var
rec : TRec_CameraController;
azimuth : Integer;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    azimuth := StrToInt(edtAzimut.Text);

    if azimuth >= 360 then
      azimuth := 0;

    if azimuth < 180 then
      wheelAzimut.Position := azimuth + 180
    else
      wheelAzimut.Position := azimuth - 180;

    rec.cmd := __ORD_ID_CAMCON_POS_AZIMUTH;
    rec.valueInt := azimuth;
    rec.valueDbl := 0;

    SimManager.NetSendTo3D_CommandCamera(@rec);
  end;
end;

procedure TfrmGameController.edtElevationValueExit(Sender: TObject);
var
  rec : TRec_CameraController;
begin

  if StrToInt(edtElevationValue.Text) < trackBarElevation.Min then
    edtElevationValue.Text := IntToStr(trackBarElevation.Min)
  else if StrToInt(edtElevationValue.Text) > trackBarElevation.Max then
    edtElevationValue.Text := IntToStr(trackBarElevation.Max);

  trackBarElevation.Position := StrToInt(edtElevationValue.Text);

  rec.cmd := __ORD_ID_CAMCON_POS_ELEVATION;
  rec.valueInt := StrToInt(edtElevationValue.Text);
  rec.valueDbl := 0;

  SimManager.NetSendTo3D_CommandCamera(@rec);
end;

procedure TfrmGameController.edtElevationValueKeyPress(Sender: TObject;
  var Key: Char);
var
  rec : TRec_CameraController;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if StrToInt(edtElevationValue.Text) < trackBarElevation.Min then
      edtElevationValue.Text := IntToStr(trackBarElevation.Min)
    else if StrToInt(edtElevationValue.Text) > trackBarElevation.Max then
      edtElevationValue.Text := IntToStr(trackBarElevation.Max);

    trackBarElevation.Position := StrToInt(edtElevationValue.Text);

    rec.cmd := __ORD_ID_CAMCON_POS_ELEVATION;
    rec.valueInt := StrToInt(edtElevationValue.Text);
    rec.valueDbl := 0;

    SimManager.NetSendTo3D_CommandCamera(@rec);
  end;
end;

procedure TfrmGameController.edtFogIntensityKeyPress(Sender: TObject;
  var Key: Char);
  var
    val : Integer;
  begin
    if Key = #13 then
    begin
      val := StrToIntDef(edtFogIntensity.Text, 0);

      if val > 3 then
        val := 3
      else if val < 0 then
        val := 0;
      edtFogIntensity.Text := IntToStr(val);
      tbFogIntensity.Position := StrToIntDef(edtFogIntensity.Text,0);
  end;
  end;

procedure TfrmGameController.edtPortBarometerKeyPress(Sender: TObject;
  var Key: Char);
   var
    val : integer;
  begin
    if Key = #13 then
    begin
      val := StrToIntDef(edtPortBarometer.Text, 0);

      if val > 5000 then
        val := 5000
      else if val < 0 then
        val := 0;
      edtPortBarometer.Text := IntToStr(val);
      tbBaroPressure.Position := StrToIntDef(edtPortBarometer.Text,0);

    end;
  end;

procedure TfrmGameController.edtPortCurrentSpeedKeyPress(Sender: TObject;
  var Key: Char);
   var
    val : Integer;
  begin
    if Key= #13 then
    begin
      val := StrToIntDef(edtPortCurrentSpeed.Text, 0) ;
      if val > 50 then
        val := 50
      else if val < 0 then
           val := 0;
      edtPortCurrentSpeed.Text := IntToStr(val);
      tbSeaSpeed.Position := StrToIntDef(edtPortCurrentSpeed.Text, 0);

    end;
  end;

procedure TfrmGameController.edtPortHumidityKeyPress(Sender: TObject;
  var Key: Char);
  var
    val : Integer;
  begin
     if Key= #13 then
    begin
      val := StrToIntDef(edtPortHumidity.Text, 0) ;
      if val > 100 then
        val := 100
      else if val < 0 then
           val := 0;
      edtPortHumidity.Text := IntToStr(val);
      tbHumidity.Position := StrToIntDef(edtPortHumidity.Text, 0);
  end;
  end;

procedure TfrmGameController.edtPortSeaStateKeyPress(Sender: TObject;
  var Key: Char);

   var
    val : Integer;
  begin
    if Key= #13 then
    begin
      val := StrToIntDef(edtPortSeaState.Text, 0) ;
      if val > 5 then
        val := 5
      else if val < 0 then
           val := 0;
      edtPortSeaState.Text := IntToStr(val);
      tbSeaState.Position := StrToIntDef(edtPortSeaState.Text, 0);

    end;
  end;

procedure TfrmGameController.edtPortTempKeyPress(Sender: TObject;
  var Key: Char);
  var
    val : integer;
begin
    if Key = #13 then
    begin
      val := StrToIntDef(edtPortTemp.Text, 0);

      if val > 100 then
        val := 100
      else if val <0 then
        val := 0;
      edtPortTemp.Text := IntToStr(val);
      tbTemp.Position := StrToIntDef(edtPortTemp.Text,0);

    end;
end;

procedure TfrmGameController.edtPortWindSpeedKeyPress(Sender: TObject;
  var Key: Char);
   var
    val : Integer;
  begin
    if Key= #13 then
    begin
      val := StrToIntDef(edtPortWindSpeed.Text, 0) ;
      if val > 50 then
        val := 50
      else if val < 0 then
           val := 0;
      edtPortWindSpeed.Text := IntToStr(val);
      tbWindSpeed.Position := StrToIntDef(edtPortWindSpeed.Text, 0);

    end;
  end;


procedure TfrmGameController.edtRangeValueExit(Sender: TObject);
var
  rec : TRec_CameraController;
begin
  if StrToInt(edtRangeValue.Text) < trackBarRange.Min then
    edtRangeValue.Text := IntToStr(trackBarRange.Min)
  else if StrToInt(edtRangeValue.Text) > trackBarRange.Max then
    edtRangeValue.Text := IntToStr(trackBarRange.Max);

  trackBarRange.Position := StrToInt(edtRangeValue.Text);

  rec.cmd := __ORD_ID_CAMCON_POS_RANGE;
  rec.valueInt := StrToInt(edtRangeValue.Text);
  rec.valueDbl := 0;

  SimManager.NetSendTo3D_CommandCamera(@rec);
end;

procedure TfrmGameController.edtRangeValueKeyPress(Sender: TObject;
  var Key: Char);
var
  rec : TRec_CameraController;
begin
  if not (Key in[#48 .. #57, #8, #13]) then
    Key := #0;

  if Key = #13 then
  begin
    if StrToInt(edtRangeValue.Text) < trackBarRange.Min then
      edtRangeValue.Text := IntToStr(trackBarRange.Min)
    else if StrToInt(edtRangeValue.Text) > trackBarRange.Max then
      edtRangeValue.Text := IntToStr(trackBarRange.Max);

    trackBarRange.Position := StrToInt(edtRangeValue.Text);

    rec.cmd := __ORD_ID_CAMCON_POS_RANGE;
    rec.valueInt := StrToInt(edtRangeValue.Text);
    rec.valueDbl := 0;

    SimManager.NetSendTo3D_CommandCamera(@rec);
  end;
end;

procedure TfrmGameController.btnFreeCamClick(Sender: TObject);
var
rec : TRec_CameraController;
begin
  rec.cmd := __ORD_ID_CAMCON_MODE;
  rec.valueInt := 0;
  rec.valueDbl := 0;

  SimManager.NetSendTo3D_CommandCamera(@rec);

  pnlPinCamera.Visible := False;
  pnlCameraRotateOld.Visible := True;
  pnlCameraMove.Visible := True;
end;

procedure TfrmGameController.edtTampungChange(Sender: TObject);
begin
  if edtTampung.Text = '0' then
  begin
    edtTorpSUTCourse.Visible := False;
    cbbTorpSutSpeed.Visible:= False;
    edtTorpSUTDepth.Visible  := False;
    btnhandleTorpedoSUT.Visible := False;
    btnHomingTorpedoSUT.Visible := False;
    btnSearchTorpedoSUT.Visible := False;
//    label7.Visible := False;
//    label6.Visible := False;
//    label5.Visible := False;
    lbl18.Visible := False;
    lbl19.Visible := False;
    lbl20.Visible := False;

//    Label60.Visible := True;
    lbl52.Visible := True;
//    label3.Visible := True;
    lbl21.Visible := True;
    lbl53.Visible := True;
    edtTorpSUTSafeDis.Visible := True;
    edtTorpedoSUTEnDis.Visible:= True;
    cbbTorpPredMode.Visible := True;
    btnFireTorpodoSUT.Visible := True;
  end
  else if edtTampung.Text = '1' then
  begin
    edtTorpSUTCourse.Visible := True;
    cbbTorpSutSpeed.Visible:= True;
    edtTorpSUTDepth.Visible  := True;
    btnhandleTorpedoSUT.Visible := True;
    btnHomingTorpedoSUT.Visible := True;
    btnSearchTorpedoSUT.Visible := True;
//    label7.Visible := True;
//    label6.Visible := True;
//    label5.Visible := True;
    lbl18.Visible := True;
    lbl19.Visible := True;
    lbl20.Visible := True;

    edtTorpSUTSafeDis.Visible := False;
    edtTorpedoSUTEnDis.Visible:= False;
    btnFireTorpodoSUT.Visible := False;
//    Label60.Visible := False;
    lbl52.Visible := False;
    lbl21.Visible  := False;
    lbl53.Visible := False;
  end;
end;

procedure TfrmGameController.AutoRefresh;
var
  i : integer;
begin
  FillClientList;

  for i := 0 to lvClient.Items.Count -1 do
  begin
    if (lvClient.Items[i].SubItems[1] = 'SERVER NSFS') or (lvClient.Items[i].SubItems[1] = 'SERVER NAFS') or
       (lvClient.Items[i].SubItems[1] = 'SERVER NSSFS') then
    begin
      if ServerState = 1 then
        lvClient.Items[i].SubItems[4] := 'ONLINE';
    end;

    lvClient.Items[i].SubItems[4] := 'OFFLINE';
  end;

  SimManager.CheckStatusConsole;
//  Sleep(100);

  btnRefreshClient.Enabled := false;
  tmrStatus.Enabled        := true;
end;

procedure TfrmGameController.FormShow(Sender: TObject);
begin
if TabMain.ActivePage = tsClient then
  begin
    AutoRefresh;
  end;
end;

procedure TfrmGameController.btnSelectCanonTargetClick(Sender: TObject);
begin
  SimManager.FMap.CurrentTool := TOOL_SELECT_CANON_TARGET;
end;

procedure TfrmGameController.tbSeaStateMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UpdateEnvy;
  SimManager.NetSendTo3D_SetCommandOrder(0, ORD_SEA_STATE, tbSeaState.Position-1, 0,0,0,0) ;
end;

procedure TfrmGameController.tbWindSpeedMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UpdateEnvy;
  SimManager.NetSendTo3D_SetCommandOrder(0, ORD_WINDSPEED, tbWindSpeed.Position, 0,0,0,0);
end;

procedure TfrmGameController.tbSeaSpeedMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UpdateEnvy;
  SimManager.NetSendTo3D_SetCommandOrder(0, ORD_CURSPEED, tbSeaSpeed.Position, 0,0,0,0) ;
end;

procedure TfrmGameController.tbTempMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UpdateEnvy;
  SimManager.NetSendTo3D_SetCommandOrder(0, ORD_TEMPERATURE, tbTemp.Position, 0,0,0,0) ;
end;

procedure TfrmGameController.tbBaroPressureMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UpdateEnvy;
  SimManager.NetSendTo3D_SetCommandOrder(0, ORD_BAROPRESSURE, tbBaroPressure.Position, 0,0,0,0);
end;

procedure TfrmGameController.tbHumidityMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  UpdateEnvy;
  SimManager.NetSendTo3D_SetCommandOrder(0, ORD_HUMIDITY, tbHumidity.Position, 0,0,0,0) ;
end;

procedure TfrmGameController.tbFogIntensityMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var
//   lowerBound, upperBound, boundary, posPercentage, position : double;
//   Val: single ;
begin
   UpdateEnvy;
//   lowerBound := 0.00005;
//   upperBound := 0.08;
//   boundary   := upperBound - lowerBound;
//   position   := ((tbFogH.MaxValue)-(tbFogH.Position-1))/ (tbFogH.MaxValue);
//   posPercentage := log10(tbFogH.MaxValue * position) / log10(tbFogH.MaxValue);
//   Val  := lowerBound + ((boundary - (posPercentage * boundary)));
//   Val := tbFogH.Position;

   SimManager.NetSendTo3D_SetCommandOrder(0, ORD_ENVI, tbFogIntensity.Position, 0,0,0,0);
end;

//procedure TfrmGameController.vrwhlSeaDirectionMouseUp(Sender: TObject;
//  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
//var
//newDir : Integer;
//begin
//
////procedure TfrmGameController.vrwhlSeaDirectionMouseUp(Sender: TObject;
////  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
////var
////newDir : Integer;
////begin
////
////  if vrwhlSeaDirection.Position < 180 then
////  begin
////   newDir := Round(180 + vrwhlSeaDirection.Position);
////  end
////  else
////  begin
////   newDir := Round(vrwhlSeaDirection.Position - 180);
////  end;
////  UpdateEnvy;
////  SimManager.NetSendTo3D_SetCommandOrder(0, ORD_CURDIRECTION, newDir, 0,0,0,0);
////end;

procedure TfrmGameController.wheelAzimutChange(Sender: TObject);
var
 azimuth : Integer;
begin
  if wheelAzimut.Position < 180 then
    azimuth := (180 + wheelAzimut.Position)
  else
    azimuth := (wheelAzimut.Position - 180);

  edtAzimut.Text := IntToStr(azimuth);
end;

procedure TfrmGameController.wheelAzimutMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 rec : TRec_CameraController;
begin
 rec.cmd := __ORD_ID_CAMCON_POS_AZIMUTH;
 rec.valueInt := StrToInt(edtAzimut.Text);

 SimManager.NetSendTo3D_CommandCamera(@rec);
end;

procedure TfrmGameController.wtrChange;
begin
  if cbbWTR.Text = 'DP' then
  begin
    cbbISD2.Visible := True;
    cbbISD.Visible  := False;
    cbbISD2.Text    := cbbISD2.Items[0];

    cbbCEI.Visible  := True;
    cbbCEI2.Visible := False;
    cbbCEI.Text     := cbbCEI.Items[0];

    cbbFLO2.Visible := True;
    cbbFLO.Visible  := False;
    cbbFLO2.Text    := cbbFLO2.Items[0];
  end
  else if cbbWTR.Text = 'SH' then
  begin
    cbbISD2.Visible := False;
    cbbISD.Visible  := True;
    cbbISD.Text     := cbbISD.Items[0];

    cbbCEI.Visible  := False;
    cbbCEI2.Visible := True;
    cbbCEI2.Text    := cbbCEI2.Items[0];

    cbbFLO2.Visible := False;
    cbbFLO.Visible  := True;
    cbbFLO.Text     := cbbFLO.Items[0];
  end;
end;

procedure TfrmGameController.UpdateEnvy;
var
  RecSkenario :TScenario;
begin
  RecSkenario := TScenario.Create;
  try
    RecSkenario.Scenario_SeaState := tbSeaState.Position;
    RecSkenario.Scenario_WindSpeed := tbWindSpeed.Position;
    RecSkenario.Scenario_CurrSpeed := tbSeaSpeed.Position;
    RecSkenario.Scenario_Temperature := tbTemp.Position;
    RecSkenario.Scenario_BaroPressure := tbBaroPressure.Position;
    RecSkenario.Scenario_Humidity := tbHumidity.Position;
    RecSkenario.Scenario_FogHeight := tbFogIntensity.Position;
    RecSkenario.Scenario_WindDir_Deg := vrwhlWindDirec.Position;
    RecSkenario.Scenario_CurrDir_Deg := vrwhlSeaDirection.Position;

    DataModule1.UpdateScenario(0, RecSkenario);
  finally
    RecSkenario.Free;
  end;
end;

procedure TfrmGameController.UpdateScenarioData;
var
  ScenarioId : Integer;

  listAllShip, listAllConsole: TList;

  ShipDetail, vehicleTemp: TVehicle;

  AllConsole: TClientConsole;
  i: Integer;
  j: Integer;

  Dx, Dy: Double;
  Mx, My: Double;

  Ship: TInsObject;

  ListScenario: TList;
  Scenario: TScenarioList;

  ListConsole: TList;
  Console: TConsole;
  Console_ID: Integer;

  { Envi }
  SceEnvi: TScenario;

  ClientList: TClientList;
begin
  lblScenarioName.Caption := '';
  mmoKetSce.Clear;

  ClearListViewData(lvKri);
  ClearListViewData(lvTarget);
  ClearListViewData(lvGeneral);

  ScenarioId := StrToInt(lvListScen.Selected.Caption);
  lblScenarioName.Caption := lvListScen.Selected.SubItems[0];


  {$REGION ' Load Environtment '}
  SceEnvi := TScenario.Create;

  try
    DataModule1.GetScenarioDefByID(ScenarioId, SceEnvi);

    mmoKetSce.Lines.Add(SceEnvi.Scenario_Desc);
    cbbPort.ItemIndex := SceEnvi.Scenario_Port;

    trckBarSeaState.Position := Round(SceEnvi.Scenario_SeaState);
    edtSeaState.Text := FloatToStr(SceEnvi.Scenario_SeaState);

    trckBarWindSpeed.Position := Round(SceEnvi.Scenario_WindSpeed);
    edtWindSpeed.Text := FloatToStr(SceEnvi.Scenario_WindSpeed);

    trckBarCurrentSpeed.Position := Round(SceEnvi.Scenario_CurrSpeed);
    edtCurrentSpeed.Text := FloatToStr(SceEnvi.Scenario_CurrSpeed);

    trckBarTemperature.Position := Round(SceEnvi.Scenario_Temperature);
    edtTemperature.Text := FloatToStr(SceEnvi.Scenario_Temperature);

    trckBarBarometer.Position := Round(SceEnvi.Scenario_BaroPressure);
    edtBarometer.Text := FloatToStr(SceEnvi.Scenario_BaroPressure);

    trckBarHumidity.Position := Round(SceEnvi.Scenario_Humidity);
    edtHumidity.Text := FloatToStr(SceEnvi.Scenario_Humidity);

    trckBarFogHeight.Position := Round (SceEnvi.Scenario_FogHeight);
    edtFogHeight.Text := FloatToStr(SceEnvi.Scenario_FogHeight);

    VrWindDirection.Position := Round (SceEnvi.Scenario_WindDir_Deg);
    VrCurrentDirection.Position := Round (SceEnvi.Scenario_CurrDir_Deg);

    if SceEnvi.Scenario_WindDir_Deg > 180 then
     VrWindDirection.position := (Round(SceEnvi.Scenario_WindDir_Deg) - 180)
    else
      VrWindDirection.position :=(Round(SceEnvi.Scenario_WindDir_Deg) + 180);

    if SceEnvi.Scenario_CurrDir_Deg > 180 then
      VrCurrentDirection.position :=(Round(SceEnvi.Scenario_CurrDir_Deg) - 180)
    else
      VrCurrentDirection.position :=(Round(SceEnvi.Scenario_CurrDir_Deg) + 180);
  finally
    SceEnvi.Free;
  end;
  {$ENDREGION}

  {$REGION ' Load Vehicle '}
  listAllShip := TList.Create;

  try
    DataModule1.GetAllShipFromScen(ScenarioId, listAllShip);

    for i := 0 to listAllShip.Count - 1 do
    begin
      if Assigned(listAllShip[i]) then
      begin
        vehicleTemp := TVehicle(listAllShip[i]);

        ShipDetail := TVehicle.Create;
        ShipDetail.Vehicle_ID := vehicleTemp.Vehicle_ID;
        ShipDetail.Vehicle_Name := vehicleTemp.Vehicle_Name;
        ShipDetail.Vehicle_Type := vehicleTemp.Vehicle_Type;
        ShipDetail.Vehicle_Ctgr := vehicleTemp.Vehicle_Ctgr;
        ShipDetail.Vehicle_No := vehicleTemp.Vehicle_No;
        ShipDetail.Vehicle_X := vehicleTemp.Vehicle_X;
        ShipDetail.Vehicle_Y := vehicleTemp.Vehicle_Y;
        ShipDetail.Vehicle_Z := vehicleTemp.Vehicle_Z;
        ShipDetail.Vehicle_Heading := vehicleTemp.Vehicle_Heading;
        ShipDetail.Vehicle_Speed := vehicleTemp.Vehicle_Speed;

        if (vehicleTemp.Vehicle_Ctgr <> 0) {and (vehicleTemp.Vehicle_Type = 1)} and (vehicleTemp.Vehicle_Target = 0) then
        begin
          {$REGION ' KRI '}
          {Syarat KRI : Vehicle_Ctgr <> 0, Vehicle_Type = 1, Vehicle_Target = 0}
          with lvKri.Items.Add do
          begin
            Data := ShipDetail;
            Caption := ShipDetail.Vehicle_Name;

            case ShipDetail.Vehicle_Type of
              1: SubItems.Add('Surface');
              2: SubItems.Add('Air');
              3: SubItems.Add('Subsurface');
            end;

            SubItems.Add(ConvLL_To_Str(ShipDetail.Vehicle_X, '0'));
            SubItems.Add(ConvLL_To_Str(ShipDetail.Vehicle_Y, '1'));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Z));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Heading));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Speed));
          end;
          {$ENDREGION}
        end
        else if (vehicleTemp.Vehicle_Ctgr = 0) {and (vehicleTemp.Vehicle_Type = 1)} and (vehicleTemp.Vehicle_Target <> 1) then
        begin
          {$REGION ' General '}
          {Syarat General : Vehicle_Ctgr = 0, Vehicle_Type = 1, Vehicle_Target <> 1}
          with lvGeneral.Items.Add do
          begin
            Data := ShipDetail;
            Caption := ShipDetail.Vehicle_Name;

            case ShipDetail.Vehicle_Type of
              1: SubItems.Add('Surface');
              2: SubItems.Add('Air');
              3: SubItems.Add('Subsurface');
            end;

            SubItems.Add(FloatToStr(ShipDetail.Vehicle_X));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Y));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Z));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Heading));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Speed));
          end;
          {$ENDREGION}
        end
        else if (vehicleTemp.Vehicle_Target = 1) then
        begin
          {$REGION ' Target '}
          {Syarat Target : Vehicle_Target = 1}
          with lvTarget.Items.Add do
          begin
            Data := ShipDetail;
            Caption := ShipDetail.Vehicle_Name;

            case ShipDetail.Vehicle_Type of
              1: SubItems.Add('Surface');
              2: SubItems.Add('Air');
              3: SubItems.Add('Subsurface');
            end;

            SubItems.Add(FloatToStr(ShipDetail.Vehicle_X));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Y));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Z));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Heading));
            SubItems.Add(FloatToStr(ShipDetail.Vehicle_Speed));
          end;
          {$ENDREGION}
        end
      end;
    end;

  finally
    ClearAList(listAllShip);
    listAllShip.Free;
  end;
  {$ENDREGION}
end;

procedure TfrmGameController.UpdateShipData;
var
  i : Integer;
//  ShipId : Integer;
  AllShip : TList;
  ShipTemp: TVehicle;

  {Var lvWeapon}
  ListWeaponOnShip : TList;
  WeaponOnShip : TWeaponGetList;
  strPicture : string;

begin
  {Membersihkan tampilan form}
  ClearShipData;

  {Membuat objek penampung}
  ShipTemp := TVehicle.Create;
  Ship_ID := StrToInt(lvShipList.Selected.Caption);

  {Mengambil data dari database}
  ShipTemp := DataModule1.GetShipByID(Ship_ID);

  if Assigned(ShipTemp) then
  begin
    lblShipName1.Caption :=  lvShipList.Selected.SubItems[0];
    edtClass.Text    :=  DataModule1.IDclassbyName(Ship_ID);

    {$REGION ' Dimensions '}
    edtShipLength.Text   := FloatToStr(ShipTemp.Vehicle_LENGTH);
    edtShipwidth.Text    := FloatToStr(ShipTemp.Vehicle_WIDTH);
    edtShipHeight.Text   := FloatToStr(ShipTemp.Vehicle_HEIGHT);
    {$ENDREGION}

    {$REGION ' Load Image '}
    strPicture := '..\Data\imageship\' + ShipTemp.Vehicle_Name + '.png';

    if FileExists(strPicture) then
    begin
      imgKRI.Picture.LoadFromFile(strPicture);
    end
    else
      imgKRI.Picture.LoadFromFile('..\Data\imageship\NoModel.png');

    {$ENDREGION}

    {$REGION ' Properties '}
    edtShipMaxSpeed.Text         := FloatToStr(ShipTemp.Vehicle_Maxspeed);
    edtShipMaxSpeedAstern.Text   := FloatToStr(ShipTemp.Vehicle_MaxspeedAstern);
    edtDamageSustainability.Text := FloatToStr(ShipTemp.Vehicle_SUSTAINABILITY);

    edtShipRudderSwingRate.Text  := FloatToStr(ShipTemp.Vehicle_RudderSwingRate);
    edtShipThrottleRate.Text     := FloatToStr(ShipTemp.Vehicle_ThrottleRate);
    edtShipDisplacement.Text     := FloatToStr(ShipTemp.Vehicle_Displacement);
    edtShipHeelFactor.Text       := FloatToStr(ShipTemp.Vehicle_HeelFactor);
    edtShipShaftUp.Text          := FloatToStr(ShipTemp.Vehicle_ShaftUp);
    edtShipTacDiameter.Text      := FloatToStr(ShipTemp.Vehicle_TacDiameter);
    edtShipTrimFactor.Text       := FloatToStr(ShipTemp.Vehicle_TrimFactor);
    {$ENDREGION}

    {$REGION ' lvWeapon '}
    lvWeaponSelect.Items.Clear;

    ListWeaponOnShip := TList.Create;

    DataModule1.GetListWeaponOnShip(Ship_ID, ListWeaponOnShip);

    if Assigned(ListWeaponOnShip) then
    begin
      for i := 0 to ListWeaponOnShip.Count-1 do
      begin
        WeaponOnShip := TWeaponGetList.Create;
        WeaponOnShip := TWeaponGetList(ListWeaponOnShip[i]);

        if Assigned(WeaponOnShip) then
        begin
          with lvWeaponSelect.Items.Add do
          begin
            Caption := IntToStr(WeaponOnShip.IDWeapon);
            SubItems.Add(DataModule1.GetNameWeaponByID(WeaponOnShip.IDWeapon));
            SubItems.Add(IntToStr(WeaponOnShip.IDDetail));
            SubItems.Add(IntToStr(WeaponOnShip.ID));
            Data := WeaponOnShip;
          end;
        end;
      end;
    end;
    {$ENDREGION}
  end;
end;

procedure TfrmGameController.lvWeaponMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    p : TPoint;
    menuitem : TMenuItem;
begin
  if Button = mbright then
  begin
    GetCursorPos(p);

    if lvWeapon.Selected.SubItems[1] = 'Automatic' then
    begin
      Exit;
    end;
    if lvWeapon.Selected.SubItems[1] = 'On' then
    begin
      pmLvWeapon.Items[0].Enabled := False;
      pmLvWeapon.Items[1].Enabled := True;
    end
    else begin
      pmLvWeapon.Items[0].Enabled := True;
      pmLvWeapon.Items[1].Enabled := False;
    end;

    pmLvWeapon.Popup(p.X , p.Y);
  end;
end;

procedure TfrmGameController.lvWeaponSelectSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
  var
    ListWeaponDetail : Tlist;
    WeaponDetail     : TWeaponDetail;

    ListWeaponOnShip : TList;
    WeaponOnShip     : TWeaponGetList;

    IDweapon,
    IDDetail : Integer;

    i : Integer;
begin

  if lvWeaponSelect.Selected = nil then
    Exit;

  IDweapon := StrToInt(lvWeaponSelect.Selected.Caption);
  IDDetail := StrToInt(lvWeaponSelect.Selected.SubItems[1]);

  lvDetail.Items.Clear;
  ListWeaponDetail := TList.Create;
  ListWeaponOnShip := TList.Create;

  DataModule1.GetListWeaponRangeDetail(Ship_ID, IDweapon, IDDetail,  ListWeaponDetail);
  DataModule1.GetListWeaponOnShip(Ship_ID, ListWeaponOnShip);

  for i := 0 to ListWeaponDetail.Count - 1 do
  begin
    WeaponDetail := TWeaponDetail(ListWeaponDetail[i]);
    if Assigned(WeaponDetail) then
    begin
      with lvDetail.Items.Add do
      begin
        Caption := IntToStr(WeaponDetail.IDType);
        SubItems.Add(WeaponDetail.DetName);
        SubItems.Add(FloatToStr(WeaponDetail.StartAngle));
        SubItems.Add(FloatToStr(WeaponDetail.EndAngle));
        SubItems.Add(FloatToStr(WeaponDetail.LowRange));
        SubItems.Add(FloatToStr(WeaponDetail.HighRange));
      end;
    end;
  end;

  for i := 0 to ListWeaponOnShip.Count - 1 do
  begin
    if Assigned(ListWeaponOnShip.Items[i]) then
    WeaponOnShip := TWeaponGetList(ListWeaponOnShip[i]);
    if (WeaponOnShip.IDShip = Ship_ID) and (WeaponOnShip.IDWeapon = IDweapon) and
        (WeaponOnShip.IDDetail = IDDetail)
    then
    begin
      edtModelBody.Text   := DataModule1.GetModelNameByID(WeaponOnShip.IDModel1);
      edtModelSpout.Text  := DataModule1.GetModelNameByID(WeaponOnShip.IDModel2);
      edtDOF1.Text        := DataModule1.GetDOFNameByID(WeaponOnShip.IDDof1);
      edtDOF2.Text        := DataModule1.GetDOFNameByID(WeaponOnShip.IDDof2);
      edtSwitch.Text      := DataModule1.GetSwitchNameByID(WeaponOnShip.IDSwitch);
      edtPosPitch.Text    := IntToStr(WeaponOnShip.Pos_P);
      edtPosHeading.Text  := IntToStr(WeaponOnShip.Pos_H);
      edtLethality.Text   := FloatToStr(DataModule1.GetLethalityByID(IDweapon));
      case WeaponOnShip.Is3DActor of
        0 : edt3DActor.Text := 'NO';
        1 : edt3DActor.Text := 'YES';
      end;
      Break;
    end;
  end;
end;

procedure TfrmGameController.On1Click(Sender: TObject);
var
  i,j : Integer;

  o: TObject;
  shipObject : TInsObject;

  temp                     : Integer;
  RecSendYakhont           : TRecData_Yakhont;
  RecSendSUT               : TRecSetTorpedoSUT;
  RecSendAsroc             : TRec3DSetAsrock;
  RecSendRBU6000           : TRec3DSetRBU;
  RecSendA244              : TRecDataTorperdo;
  RecSendTetral            : TRec3DSetTetral;
  RecSendMistral           : TRec3DSetMistral;
  RecSendStrela            : TRec3DSetStrella;
  RecSendExocetMM40        : TRec3DSetExocet_40;
  RecSendC802              : TRecData_C802;
  RecSendCannon            : TRec3DSetWCC;

  Weapon       : TWeapon;
  Vehicle : TVehicle;
begin
//  if lvWeapon.Selected = nil then Exit;
//  if lvRuntimeShip.Selected = nil then Exit;
//
//  if TMenuItem(Sender).Tag = 1 then
//  begin
//    //on
//    if Assigned(lvWeapon.Selected.Data) and
//       Assigned(lvRuntimeShip.Selected.Data) then
//    begin
//     Weapon := TWeapon(lvWeapon.Selected.Data);
//      Vehicle := TVehicle(lvRuntimeShip.Selected.Data);
//
//      DataModule1.updateSceWeapon(0, Vehicle.Vehicle_ID, Weapon.WeaponID, Weapon.launcherID);
//      ShowWeaponPanel(Weapon.WeaponID);
//      
//      SimManager.NetSendEnableWeapon(Vehicle.Vehicle_ID , Weapon.WeaponID , 1, Weapon.launcherID) ;
//    end;
//  end
//  else
//  begin
//    if Assigned(lvWeapon.Selected.Data) and
//       Assigned(lvRuntimeShip.Selected.Data) then
//    begin
//      Weapon := TWeapon(lvWeapon.Selected.Data);
//      Vehicle := TVehicle(lvRuntimeShip.Selected.Data);
//
//      DataModule1.deleteSceWeapon(0, Vehicle.Vehicle_ID, Weapon.WeaponID, Weapon.launcherID);
//      SimManager.NetSendEnableWeapon(Vehicle.Vehicle_ID , Weapon.WeaponID , 0, Weapon.launcherID) ;
//    end;
//  end;


  if lvWeapon.Selected = nil then
    Exit;

  if lvRuntimeShip.Selected = nil then
     Exit;

  if Assigned(lvWeapon.Selected.Data) and Assigned(lvRuntimeShip.Selected.Data) then
  begin
    Weapon  := TWeapon(lvWeapon.Selected.Data);
    Vehicle := TVehicle(lvRuntimeShip.Selected.Data);

    shipObject := nil;

    for i:= 0 to SimManager.MainObjList.ItemCount -1 do
    begin
      o:= SimManager.MainObjList.getObject(i);
      if Assigned(o) and (TInsObject(o).FDataBaseID = Vehicle.Vehicle_ID) then
      begin
        shipObject := TInsObject(o);
        Break;
      end;
    end;

    if Assigned(shipObject) then
    begin
      for i:= 0 to shipObject.WeaponOnShip_List.Count - 1  do
      begin
        if Assigned(shipObject.WeaponOnShip_List.Items[i]) then begin
          if (TWeaponOnShip(shipObject.WeaponOnShip_List.Items[i]).Weapon_ID = Weapon.WeaponID) and
             (TWeaponOnShip(shipObject.WeaponOnShip_List.Items[i]).Weapon_Launcher = Weapon.launcherID) then
          begin
            TWeaponOnShip(shipObject.WeaponOnShip_List.Items[i]).Weapon_Status := TComponent(sender).Tag;
          end;
        end;
      end;
    end;
  end;

  if TMenuItem(sender).Tag = 1 then
  begin
    lvWeapon.Selected.SubItems[1] := 'On';
     pgWeapon.Enabled := True;
    if lvWeapon.Selected.Caption = 'Asroc' then
    begin
      pgWeapon.ActivePage  := pgtwAsroc ;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_ASROC , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;  //buat sinkron aja

      with RecSendAsroc do
      begin
        ShipID           := temp;
        mWeaponID        := 1;  // hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_ASROCK_ON;

        mMissile_Type    := 0;
        mTargetID        := 0;
        mTargetBearing   := 0;
        mTargetRange     := 0;
        mTargetDepth     := 0;
        mFuzeType        := 0;
        mCorrRange       := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileAsroc(RecSendAsroc);    //buat 3d

    end
    else if lvWeapon.Selected.Caption = 'Rbu6000' then
    begin
      pgWeapon.ActivePage := pgtwRBU6000;
      if onOffMode = 1 then
      begin
        for j:=1 to 2 do
        begin
          DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
          ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),j);
        end;
      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_RBU6000 , 1, 1) ;
      SimManager.NetSendEnableWeapon(temp, C_DBID_RBU6000 , 1, 2) ;

      with RecSendRBU6000 do
      begin
        ShipID           := temp;
        mWeaponID        := 2;  
        mLauncherID      := 1;
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_RBU_ON;

        mCount           := 0;
        mMissileType     := 0;
        mTargetID        := 0;
        mLncrBearing     := 0;
        mLncRange        := 0;
        mTargetDepth     := 0;
        mCorrBearing     := 0;
        mCorrElev        := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileRBU6000(RecSendRBU6000);
      Sleep(10);

      RecSendRBU6000.mLauncherID := 2;

      SimManager.NetSendTo3D_OrderMissileRBU6000(RecSendRBU6000);
    end
    else if lvWeapon.Selected.Caption = 'Torpedo A244' then
    begin
      pgWeapon.ActivePage := pgtwTorpedoA244;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption + 'S'),
        StrToInt(lvWeapon.Selected.SubItems[0]));

      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption+ 'S');
      SimManager.NetSendEnableWeapon(temp, C_DBID_TORPEDO_A244S , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendA244 do
      begin
        ShipID           := temp;
        mWeaponID        := 3;  // hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_SPS_ON;

        ISC              := 0;
        ISR              := 0;
        WTR              := 0;
        CEI              := 0;
        PRG              := 0;
        DOP              := 0;
        ACE              := 0;
        FLO              := 0;
        ISD              := 0;
        ACM              := 0;
        FLO              := 0;
        ISD              := 0;
        ACM              := 0;


      end;

      SimManager.NetSendTo3D_OrderMissileTorpedo(RecSendA244);
    end
    else if lvWeapon.Selected.Caption = 'Torpedo SUT' then
    begin
      pgWeapon.ActivePage := pgtwTorpedoSUT;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;

      if lvWeapon.Selected.SubItems[0] = '1' then
      begin
        frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.btnTocosLoading.Enabled := True;
      end
      else if lvWeapon.Selected.SubItems[0] = '2' then
      begin
        frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.btnTocosLoading2.Enabled := True;
      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_TORPEDO_SUT , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendSUT do
      begin
        ShipID           := temp;
        mWeaponID        := 4;
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_TORPEDOSUT_ON;

        mT_ID                     := 0;
        mTorpedoCourse            := 0;
        mTorpedoSpeed             := 0;
        mTorpedoDepth             := 0;
        mTorpedoSafeDistance      := 0;
        mTorpedoEnDis             := 0;
        mpredm                    := 0;
        mTargetType               := 0;



      end;

      SimManager.NetSendTo3D_OrderMissileSUT(RecSendSUT);
    end
    else if lvWeapon.Selected.Caption = 'Tetral' then
    begin
      pgWeapon.ActivePage := pgtwTetral;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_TETRAL , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;


      with RecSendTetral do
      begin
        ShipID           := temp;
        mWeaponID        := 5;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_TETRAL_ON;

        mTargetBearing   := 0;
        mTargetRange     := 0;
        mTargetElev      := 0;



      end;

      SimManager.NetSendTo3D_OrderMissileTetral(RecSendTetral);
    end
    else if lvWeapon.Selected.Caption = 'Yakhont' then
    begin
      pgWeapon.ActivePage := pgtwYAHKONT;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_YAKHONT , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendYakhont do
      begin
        ShipID           := temp;
        mWeaponID        := 6;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_YAKHONT_ON;

        mMissile1         := 0;
        mMissile2         := 0;
        mMissile3         := 0;
        mMissile4         := 0;
        mTargetBearing    := 0;
        mTargetRange      := 0;

      end;

      SimManager.NetSendTo3D_OrderMissile_YAHKONT(RecSendYakhont);
    end
    else if lvWeapon.Selected.Caption = 'C802' then
    begin
      pgWeapon.ActivePage := pgtwC802;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_C802 , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendC802 do
      begin
        ShipID           := temp;
        mWeaponID        := 7;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_C802_ON;

        mTargetBearing   := 0;
        mTargetRange     := 0;

      end;

      SimManager.NetSendTo3D_OrderMissile_C802(RecSendC802);
    end
    else if lvWeapon.Selected.Caption = 'Mistral' then
    begin
      pgWeapon.ActivePage := pgtwMistral;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_MISTRAL , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendMistral do
      begin
        ShipID           := temp;
        mWeaponID        := 8;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_MISTRAL_ON;

        mTargetBearing   := 0;
        mTargetRange     := 0;
        mTargetElev      := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileMistral(RecSendMistral);
    end
    else if lvWeapon.Selected.Caption = 'Strela' then
    begin
      pgWeapon.ActivePage := pgtwStrella;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_STRELA , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendStrela do
      begin
        ShipID           := temp;
        mWeaponID        := 9;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_STRELA_ON;

        mTargetBearing   := 0;
        mTargetRange     := 0;
        mTargetElev      := 0;


      end;

      SimManager.NetSendTo3D_OrderMissileStrella(RecSendStrela);
    end
    else if lvWeapon.Selected.Caption = 'Exocet MM40' then
    begin
      pgWeapon.ActivePage := pgtwExocetMM40;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_EXOCET_MM40 , 1, StrToInt(lvWeapon.Selected.SubItems[0]));

      with RecSendExocetMM40 do
      begin
        shipID              := temp;
        mWeaponID           := 10;
        mLauncherID         := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID          := 1;
        mMissileNumber      := 1;
        sOrder              := __ORD_EXOCET_40_ON;

        mTRange             := 0;
        mTBearing           := 0;
        mAngular_Mode       := 0;
        mAgility_Mode       := 0;
        mInitialStep_Mode   := 0;
        mObstacle_Alt       := 0;
        mObstacle_Range     := 0;
        mApproach_Range     := 0;
        mTerminal_Range     := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileExocet_MM40(RecSendExocetMM40);
    end
    else if (lvWeapon.Selected.Caption = 'Cannon 40') or
            (lvWeapon.Selected.Caption = 'Cannon 76') or
            (lvWeapon.Selected.Caption = 'Cannon 120') or
            (lvWeapon.Selected.Caption = 'Cannon 57') or
            (lvWeapon.Selected.Caption = 'Cannon 57 Digital') or
            (lvWeapon.Selected.Caption = 'Cannon AK230') or
            (lvWeapon.Selected.Caption = 'Cannon Type 730') then
    begin
      pgWeapon.ActivePage := pgtwWCCCannon;
      if onOffMode = 1 then
      begin
        DataModule1.updateSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));

      end;

      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      if lvWeapon.Selected.Caption = 'Cannon 40' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON40 , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON40;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_ON;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);

      end
      else if lvWeapon.Selected.Caption = 'Cannon 76' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON76 , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON76;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_ON;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon 120' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON120 , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON120;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_ON;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon 57' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON57 , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON57;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_ON;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon AK230' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON_AK230 , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON_AK230;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_ON;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon Type 730' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON_TYPE_730 , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON_TYPE_730;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_ON;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon 57 Digital' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON57_DIGITAL , 1, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON57_DIGITAL;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_ON;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end;
    end;
  end
  else
  begin
    lvWeapon.Selected.SubItems[1] := 'Off';
    if onOffMode = 1 then
    begin
      pgWeapon.ActivePage  := pgtwDefault ;

      if lvWeapon.Selected.Caption = 'Rbu6000' then
      begin
        for j:=1 to 2 do
        begin
          DataModule1.deleteSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
          ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),j);
        end;
      end
      else if lvWeapon.Selected.Caption = 'Torpedo A244' then
      begin
        DataModule1.deleteSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption + 'S' ),
        StrToInt(lvWeapon.Selected.SubItems[0]));

      end
      else
      begin
        DataModule1.deleteSceWeapon(0, DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption)
        ,DataModule1.getWeaponIDByName(lvWeapon.Selected.Caption),
        StrToInt(lvWeapon.Selected.SubItems[0]));
      end;

    end;

    if lvWeapon.Selected.Caption = 'Asroc' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_ASROC  , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendAsroc do
      begin
        ShipID           := temp;
        mWeaponID        := 1;
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_ASROCK_OFF;

        mMissile_Type    := 0;
        mTargetID        := 0;
        mTargetBearing   := 0;
        mTargetRange     := 0;
        mTargetDepth     := 0;
        mFuzeType        := 0;
        mCorrRange       := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileAsroc(RecSendAsroc);

    end
    else if lvWeapon.Selected.Caption = 'Rbu6000' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_RBU6000 , 0, 1) ;
      SimManager.NetSendEnableWeapon(temp, C_DBID_RBU6000 , 0, 2) ;

      with RecSendRBU6000 do
      begin
        ShipID           := temp;
        mWeaponID        := 2;
        mLauncherID      := 1;
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_RBU_OFF;

        mCount           := 0;
        mMissileType     := 0;
        mTargetID        := 0;
        mLncrBearing     := 0;
        mLncRange        := 0;
        mTargetDepth     := 0;
        mCorrBearing     := 0;
        mCorrElev        := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileRBU6000(RecSendRBU6000);

      RecSendRBU6000.mLauncherID := 2;

      SimManager.NetSendTo3D_OrderMissileRBU6000(RecSendRBU6000);
    end
    else if lvWeapon.Selected.Caption = 'Torpedo A244' then
    begin
      temp := DataModule1.getShipIDByName(lvWeapon.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_TORPEDO_A244S , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendA244 do
      begin
        ShipID           := temp;
        mWeaponID        := 3;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_SPS_OFF;

        ISC             := 0;
        ISR             := 0;
        WTR             := 0;
        CEI             := 0;
        PRG             := 0;
        DOP             := 0;
        ACE             := 0;
        FLO             := 0;
        ISD             := 0;
        ACM             := 0;
        FLO             := 0;
        ISD             := 0;
        ACM             := 0;


      end;

      SimManager.NetSendTo3D_OrderMissileTorpedo(RecSendA244);
    end
    else if lvWeapon.Selected.Caption = 'Torpedo SUT' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_TORPEDO_SUT , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      if lvWeapon.Selected.SubItems[0] = '1' then begin
        frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.btnTocosLoading.Enabled := False;
      end
      else if lvWeapon.Selected.SubItems[0] = '2' then begin
        frmMainInstruktur.FrameControlLeft.FrameWeaponStatus.btnTocosLoading2.Enabled := False;
      end;

      with RecSendSUT do
      begin
        ShipID           := temp;
        mWeaponID        := 4;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_TORPEDOSUT_OFF;

        mT_ID                     := 0;
        mTorpedoCourse            := 0;
        mTorpedoSpeed             := 0;
        mTorpedoDepth             := 0;
        mTorpedoSafeDistance      := 0;
        mTorpedoEnDis             := 0;
        mpredm                    := 0;
        mTargetType               := 0;



      end;

      SimManager.NetSendTo3D_OrderMissileSUT(RecSendSUT);

    end
    else if lvWeapon.Selected.Caption = 'Tetral' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_TETRAL , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendTetral do
      begin
        ShipID           := temp;
        mWeaponID        := 5;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_TETRAL_OFF;

        mTargetBearing   := 0;
        mTargetRange     := 0;
        mTargetElev      := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileTetral(RecSendTetral);
    end
    else if lvWeapon.Selected.Caption = 'Yakhont' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_YAKHONT , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

            with RecSendYakhont do
      begin
        ShipID           := temp;
        mWeaponID        := 6;  //hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_YAKHONT_OFF;

        mMissile1         := 0;
        mMissile2         := 0;
        mMissile3         := 0;
        mMissile4         := 0;
        mTargetBearing    := 0;
        mTargetRange      := 0;

      end;

      SimManager.NetSendTo3D_OrderMissile_YAHKONT(RecSendYakhont);
    end
    else if lvWeapon.Selected.Caption = 'C802' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_C802 , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendC802 do
      begin
        ShipID           := temp;
        mWeaponID        := 7;  //hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_C802_OFF;

        mTargetBearing   := 0;
        mTargetRange     := 0;

      end;

      SimManager.NetSendTo3D_OrderMissile_C802(RecSendC802);
    end
    else if lvWeapon.Selected.Caption = 'Mistral' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_MISTRAL , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendMistral do
      begin
        ShipID           := temp;
        mWeaponID        := 8;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_MISTRAL_OFF;

        mTargetBearing   := 0;
        mTargetRange     := 0;
        mTargetElev      := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileMistral(RecSendMistral);
    end
    else if lvWeapon.Selected.Caption = 'Strela' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_STRELA , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendStrela do
      begin
        ShipID           := temp;
        mWeaponID        := 9;  // maafkan hardcore :D
        mLauncherID      := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID       := 1;
        mMissileNumber   := 1;
        OrderID          := __ORD_STRELA_OFF;

        mTargetBearing   := 0;
        mTargetRange     := 0;
        mTargetElev      := 0;


      end;

      SimManager.NetSendTo3D_OrderMissileStrella(RecSendStrela);
    end
    else if lvWeapon.Selected.Caption = 'Exocet MM40' then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      SimManager.NetSendEnableWeapon(temp, C_DBID_EXOCET_MM40 , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

      with RecSendExocetMM40 do
      begin
        shipID              := temp;
        mWeaponID           := 10;  // maafkan hardcore :D
        mLauncherID         := StrToInt(lvWeapon.Selected.SubItems[0]);
        mMissileID          := 1;
        mMissileNumber      := 1;
        sOrder              := __ORD_EXOCET_40_OFF;

        mTRange             := 0;
        mTBearing           := 0;
        mAngular_Mode       := 0;
        mAgility_Mode       := 0;
        mInitialStep_Mode   := 0;
        mObstacle_Alt       := 0;
        mObstacle_Range     := 0;
        mApproach_Range     := 0;
        mTerminal_Range     := 0;

      end;

      SimManager.NetSendTo3D_OrderMissileExocet_MM40(RecSendExocetMM40);
    end
    else if (lvWeapon.Selected.Caption = 'Cannon 40') or
            (lvWeapon.Selected.Caption = 'Cannon 76') or
            (lvWeapon.Selected.Caption = 'Cannon 120') or
            (lvWeapon.Selected.Caption = 'Cannon 57') or
            (lvWeapon.Selected.Caption = 'Cannon 57 Digital') or
            (lvWeapon.Selected.Caption = 'Cannon AK230') or
            (lvWeapon.Selected.Caption = 'Cannon Type 730')then
    begin
      temp := DataModule1.getShipIDByName(lvRuntimeShip.Selected.Caption);
      if lvWeapon.Selected.Caption = 'Cannon 40' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON40 , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON40;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_OFF;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon 76' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON76 , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON76;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_OFF;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon 120' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON120 , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON120;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_OFF;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon 57' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON57 , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON57;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_OFF;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon AK230' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON_AK230 , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON_AK230;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_OFF;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon Type 730' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON_TYPE_730 , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON_TYPE_730;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_OFF;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end
      else if lvWeapon.Selected.Caption = 'Cannon 57 Digital' then
      begin
        SimManager.NetSendEnableWeapon(temp, C_DBID_CANNON57_DIGITAL , 0, StrToInt(lvWeapon.Selected.SubItems[0])) ;

        with RecSendCannon do
        begin
          ShipID                  := temp;
          mWeaponID               := C_DBID_CANNON57_DIGITAL;
          mLauncherID             := StrToInt(lvWeapon.Selected.SubItems[0]);
          mMissileID              := 1;
          mMissileNumber          := 1;
          mOrderID                := __ORD_CANNON_OFF;

          mTargetID               := 0;
          mModeID                 := 0;
          mUpDown                 := 0;
          mAutoCorrectElev        := 0;
          mAutoCorrectBearing     := 0;
          mBalistikID             := 0;

        end;
        SimManager.NetSendTo3D_OrderCannon(RecSendCannon);
      end;

    end;


  end;
end;


procedure TfrmGameController.StatusWeapon(shipid : Integer; weaponid : Byte ; value : Single; launcher :Byte);
var
  i: Integer;

  objTemp : TObject;
  shipTemp : TInsObject;
  weaponTemp : TWeaponOnShip;

begin
  for i:= 0 to SimManager.MainObjList.ItemCount -1 do
  begin
    objTemp:= SimManager.MainObjList.getObject(i);
    if Assigned(objTemp) and (TInsObject(objTemp).FDataBaseID = shipid) then
    begin
      shipTemp := TInsObject(objTemp);
      Break;
    end;
  end;

  if Assigned(shipTemp) then
  begin
    for i:= 0 to shipTemp.WeaponOnShip_List.Count - 1  do
    begin
      weaponTemp := shipTemp.WeaponOnShip_List.Items[i];

      if Assigned(weaponTemp) then
      begin
        if (weaponTemp.Weapon_ID = weaponid) and (weaponTemp.Weapon_Launcher = launcher) then
        begin
          weaponTemp.Weapon_Status := Round(value);
        end;
      end;
    end;
  end;
end;

procedure TfrmGameController.eRBU6000RangeKeyPress(Sender: TObject;
  var Key: Char);
var
  cek : Boolean;
  range : Double;

begin
  if Key in [#13] then
  begin
    if TryStrToFloat(eRBU6000Range.Text, range) then
    begin
      if (StrToFloat(eRBU6000Range.Text) > 0.26) and (StrToFloat(eRBU6000Range.Text) < 0.82) then
      begin
        eRBU6000Balistik.Text := '1';
      end
      else if (StrToFloat(eRBU6000Range.Text) > 0.80) and (StrToFloat(eRBU6000Range.Text) < 2.98) then
      begin
        eRBU6000Balistik.Text := '2';
      end
      else
      begin
        eRBU6000Balistik.Text := '';
      end;
    end
    else
    begin
      ShowMessage('Wrong Input !!! ');
    end;


  end;
end;



procedure TfrmGameController.readOnOffMode;
var
  readPath  : string;
  helpIni   : TIniFile;
begin
  helpIni   := TIniFile.Create('..\bin\BridgeSet.ini');

  readPath  := helpIni.ReadString('OnOff', 'mode','Default');
  onOffMode := StrToInt(readPath);

  if onOffMode = 0 then
  begin
    readPath  := helpIni.ReadString('OnOff', 'scenarioID','Default');
    sceIDINI  := StrToInt(readPath);
  end;

  helpIni.Free;
end;

procedure TfrmGameController.tmrRBUTimer(Sender: TObject);
begin
  btnRBUStartFire.Enabled   := True;
  btnRBU6000Assign.Enabled  := True;
  tmrRBU.Enabled            := False;
end;


procedure TfrmGameController.OnChangeEnvironment;
var
RecSend : TRecDataEnvironment;
begin
  RecSend.seaState := tbSeaState.Position;
  RecSend.windVelocity := tbWindSpeed.Position;
  if vrwhlWindDirec.Position < 180 then
  begin
    RecSend.windHeading := (180 + vrwhlWindDirec.Position);
  end
  else
  begin
    RecSend.windHeading := (vrwhlWindDirec.Position - 180);
  end;
  RecSend.seaCurrentVelocity := tbSeaSpeed.Position;

  if vrwhlSeaDirection.Position < 180 then
  begin
    RecSend.seaCurrentHeading := (180 + vrwhlSeaDirection.Position);
  end
  else
  begin
    RecSend.seaCurrentHeading := (vrwhlSeaDirection.Position - 180);
  end;

  RecSend.temperature := tbTemp.Position;
  RecSend.humidity := tbHumidity.Position;
  RecSend.surfacePressure := tbBaroPressure.Position;
  RecSend.fogIntensity := tbFogIntensity.Position;

  SimManager.NetSendTo3D_OrderEnvironment(RecSend);

end;

procedure TfrmGameController.tbSeaStateChange(Sender: TObject);

begin
  edtPortSeaState.Text := IntToStr(tbSeaState.Position);
  if Sender.UnitName = 'VrTrackBar' then OnChangeEnvironment;
end;

procedure TfrmGameController.tbWindSpeedChange(Sender: TObject);
begin
 edtPortWindSpeed.Text := IntToStr(tbWindSpeed.Position);
 if Sender.UnitName = 'VrTrackBar' then OnChangeEnvironment;
end;

procedure TfrmGameController.tbSeaSpeedChange(Sender: TObject);
begin
  edtPortCurrentSpeed.Text := IntToStr(tbSeaSpeed.Position);
  if Sender.UnitName = 'VrTrackBar' then OnChangeEnvironment;
end;

procedure TfrmGameController.tbTempChange(Sender: TObject);
begin
  edtPortTemp.Text := IntToStr(tbTemp.Position);
  if Sender.UnitName = 'VrTrackBar' then OnChangeEnvironment;
end;

procedure TfrmGameController.tbBaroPressureChange(Sender: TObject);
begin
  edtPortBarometer.Text := IntToStr(tbBaroPressure.Position);
  if Sender.UnitName = 'VrTrackBar' then OnChangeEnvironment;
end;

procedure TfrmGameController.tbHumidityChange(Sender: TObject);
begin
  edtPortHumidity.Text := IntToStr(tbHumidity.Position);
  if Sender.UnitName = 'VrTrackBar' then OnChangeEnvironment;
end;

procedure TfrmGameController.tbFogIntensityChange(Sender: TObject);
begin
  edtFogIntensity.Text := IntToStr(tbFogIntensity.Position);
  if Sender.UnitName = 'VrTrackBar' then OnChangeEnvironment;
end;

procedure TfrmGameController.vrwhlWindDirecChange(Sender: TObject);
var
  valTemp : Integer;

begin
  if vrwhlWindDirec.Position < 180 then
  begin
    valTemp := (180 + vrwhlWindDirec.Position);
  end
  else
  begin
    valTemp := (vrwhlWindDirec.Position - 180);
  end;
  lblWindDirection.Caption := IntToStr(valTemp);
  OnChangeEnvironment;
end;

procedure TfrmGameController.VrWindDirectionChange(Sender: TObject);
var
  valTemp : Integer;

begin
  if VrWindDirection.Position < 180 then
  begin
    valTemp := (180 + VrWindDirection.Position);
  end
  else
  begin
    valTemp := (VrWindDirection.Position - 180);
  end;
  edtWindDirection.Text := IntToStr(valTemp);
end;

procedure TfrmGameController.RestartAllCommunication1Click(
  Sender: TObject);
var
  RecSend : TRecData2DOrder;
begin
  case TComponent(Sender).Tag of
    0 :
    begin
      RecSend.orderID := _CM_CLIENT_MANAGE;
      RecSend.numValue := __CM_CLIENT_CLOSEALLCOM;
      RecSend.strValue := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := '';
      SimManager.SendCommand2D_Order(RecSend);
    end;

    1 :
    begin
      RecSend.orderID := _CM_CLIENT_MANAGE;
      RecSend.numValue := __CM_CLIENT_RESTARTALLCOMM;
      RecSend.strValue := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := '';
      SimManager.SendCommand2D_Order(RecSend);
    end;

    2 :
    begin
      RecSend.orderID := _CM_CLIENT_MANAGE;
      RecSend.numValue := __CM_CLIENT_SHUTDOWNALLCOM;
      RecSend.strValue := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := '';
      SimManager.SendCommand2D_Order(RecSend);
    end;

    3 :
    begin
      RecSend.orderID := _CM_CLIENT_MANAGE;
      RecSend.numValue := __CM_CLIENT_RESTARTSERVERCOMM;
      RecSend.strValue := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := '';
      SimManager.SendCommand2D_Order(RecSend);
    end;

    4 :
    begin
      RecSend.orderID := _CM_CLIENT_MANAGE;
      RecSend.numValue := __CM_CLIENT_SHUTDOWNSERVERCOMM;
      RecSend.strValue := '';
      RecSend.strValue2 := '';
      RecSend.strValue3 := '';
      RecSend.ipConsole := '';
      SimManager.SendCommand2D_Order(RecSend);
    end;
  end;
end;

procedure TfrmGameController.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 112 then
  begin
    ShowMessage('a');
  end;
end;
procedure TfrmGameController.SetDefaultEnvirontment;
begin
  lblPortEnv.Caption := '-';
  edtPortWindSpeed.Text := '0';
  edtPortCurrentSpeed.Text := '0';
  edtPortTemp.Text := '0';
  edtPortBarometer.Text := '0';
  edtPortHumidity.Text := '0';
  edtFogIntensity.Text := '0';
  lblWindDirection.Caption := '0';
  lblCurrentDirection.Caption := '0';
end;

procedure TfrmGameController.CreateTrajectory;
begin
  FTrajectory := TTrajectory.Create;
  FTrajectory.WidthCanvas := frmGameController.imgTrajectory.Width;
  FTrajectory.heightCanvas := frmGameController.imgTrajectory.Height;
  FTrajectory.aCanvas := frmGameController.imgTrajectory.Canvas;
end;


procedure TfrmGameController.DestroyTrajectory;
begin
  FTrajectory.aCanvas := nil;
  FTrajectory.Free;
end;

procedure TfrmGameController.FormPaint(Sender: TObject);
var
  i,j,Z : integer;
  aTrajectory : TTrajectory;

  o : TObject;
  insObject : TInsObject;
  misObject : TIMissileObject;

  amShipID,
  amLauncherID,
  amMissileID,
  amWeaponID,
  amMissileNumber : integer;
  TrajecAsroc : TTrajectoryAsroc;
begin
  if Assigned(lvRuntimeMissileTrajectory.Selected) and Assigned(lvRuntimeMissileTrajectory.Selected.Data) then
  begin
    aTrajectory := TTrajectory(lvRuntimeMissileTrajectory.Selected.Data);
    amShipID := aTrajectory.ashipID;
    amLauncherID := aTrajectory.alauncherID;
    amMissileID := aTrajectory.amissileID;
    amWeaponID := aTrajectory.aWeaponID;
    amMissileNumber := aTrajectory.aMissileNumber;

    for i:= 0 to SimManager.MainObjList.ItemCount -1 do
    begin
      o:= SimManager.MainObjList.getObject(i);
      if Assigned(o) then begin
        insObject := TInsObject(o);
        if insObject is TIMissileObject then
        begin
          misObject := TIMissileObject(insObject);

          if ((misObject.ShipID = amShipID) and
              (misObject.WeaponID = amWeaponID) and
              (misObject.LauncherID = amLauncherID) and
              (misObject.MissileID = amMissileID) and
              (misObject.MissileNumber = amMissileNumber)
             ) then
          begin
            if amWeaponID = C_DBID_TORPEDO_SUT then
            begin
              FTrajectory.Draw(misObject.VHistory, 100, 100);
            end
            else if amWeaponID = C_DBID_TORPEDO_A244S then
            begin
              FTrajectory.Draw(misObject.VHistory, 400, 100);
            end
            else;
            if (amWeaponID = C_DBID_ASROC) then
            begin
              TrajecAsroc := TTrajectoryAsroc.Create;
              TTrajectoryAsroc(aTrajectory).DrawAsrocTrajectory;

            end
            else if amWeaponID = C_DBID_RBU6000 then
            begin
              FTrajectory.Draw(misObject.VHistory, 400, 100);
            end
            else if amWeaponID = C_DBID_TETRAL then
            begin
              FTrajectory.Draw(misObject.VHistory, 3200, 100);
            end
            else if amWeaponID = C_DBID_YAKHONT then
            begin
              FTrajectory.Draw(misObject.VHistory, 3700, 6000);
            end
            else if amWeaponID = C_DBID_C802 then
            begin
              FTrajectory.Draw(misObject.VHistory, 100, 2000);
            end
            else if amWeaponID = C_DBID_MISTRAL then
            begin
              FTrajectory.Draw(misObject.VHistory, 3200, 100);
            end
            else if amWeaponID = C_DBID_STRELA then
            begin
              FTrajectory.Draw(misObject.VHistory, 1200, 100);
            end
            else if amWeaponID = C_DBID_EXOCET_MM40 then
            begin
              FTrajectory.Draw(misObject.VHistory, 100, 1800);
            end
            else if amWeaponID = C_DBID_EXOCET_MM38 then
            begin
              FTrajectory.Draw(misObject.VHistory, 100, 420);
            end;
          end
        end;
      end;
    end;
  end;
end;

procedure TfrmGameController.tsTrajectoryMapviewChange(Sender: TObject);
begin
  if tsTrajectoryMapview.ActivePage = tsTrajectoryView then
  begin
     AdvSmoothTabPage1.TabEnabled := False;
     AdvSmoothTabPager1.ActivePage :=  AdvSmoothTabPage2;
  end;
  if tsTrajectoryMapview.ActivePage = tsMapViewTrajectory then
  begin
     AdvSmoothTabPage1.TabEnabled := True;
  end;
end;

procedure TfrmGameController.AdvSmoothPanel2Click(Sender: TObject);
begin
  frmMainInstruktur.show;
end;

procedure TfrmGameController.AssignStatus(ShipID, WeaponID, LauncherID,
  MissileID: Byte; AssignStatus: Boolean);
var
  i,j             : integer;
  o               : TObject;
  shipInst        : TInsObject;
  WeaponShip      : TWeaponOnShip;
  WeaponStrela    : TWeaponOn_Strella;
  WeaponMistral   : TWeaponOn_Mistral;
  WeaponCannon57  : TWeaponOn_Cannon57;
  WeaponCannon40  : TWeaponOn_Cannon40;
  WeaponCannonAK230 : TWeaponOn_CannonAK230;
  WeaponCannonType730 : TWeaponOn_CannonType730;

begin
  for i := 0 to SimManager.MainObjList.ItemCount-1 do
  begin
    o:= SimManager.MainObjList.getObject(i);
    if Assigned(o) then begin

      shipInst := TInsObject(o);
      if shipInst.FDataBaseID = shipID then
      begin
        for j:=0 to shipInst.WeaponOnShip_List.Count -1 do
        begin
          if Assigned(shipInst.WeaponOnShip_List.Items[j]) then begin

            WeaponShip := TWeaponOnShip(shipInst.WeaponOnShip_List.Items[j]);
            if (WeaponShip is TWeaponOn_Strella) and (WeaponID = C_DBID_STRELA) then
            begin
                WeaponStrela := TWeaponOn_Strella(WeaponShip);
                case LauncherID of
                  1 :
                  begin
                    WeaponStrela.AssignStatusLauncher1 := AssignStatus;
                  end;
                  2 :
                  begin
                    WeaponStrela.AssignStatusLauncher2 := AssignStatus;
                  end;

                end;
                RefreshFormWeapon(WeaponShip.Weapon_Name);
            end
            else if (WeaponShip is TWeaponOn_Mistral) and (WeaponID = C_DBID_MISTRAL) then
            begin
                WeaponMistral := TWeaponOn_Mistral(WeaponShip);
                case LauncherID of
                  1 :
                  begin
                    WeaponMistral.AssignStatusLauncher1 := AssignStatus;
                  end;
                  2 :
                  begin
                    WeaponMistral.AssignStatusLauncher2 := AssignStatus;
                  end;

                end;
                RefreshFormWeapon(WeaponShip.Weapon_Name);
            end
            else if (WeaponShip is TWeaponOn_Cannon40) and (WeaponID = C_DBID_CANNON40) then
            begin
                WeaponCannon40 := TWeaponOn_Cannon40(WeaponShip);
                case LauncherID of
                  2 :
                  begin
                    WeaponCannon40.AssignStatusLauncher2 := AssignStatus;
                  end;

                end;
                RefreshFormWeapon(WeaponShip.Weapon_Name);
            end
            else if (WeaponShip is TWeaponOn_Cannon57) and (WeaponID = C_DBID_CANNON57) then
            begin
                WeaponCannon57 := TWeaponOn_Cannon57(WeaponShip);
                case LauncherID of
                  2 :
                  begin
                    WeaponCannon57.AssignStatusLauncher2 := AssignStatus;
                  end;

                end;
                RefreshFormWeapon(WeaponShip.Weapon_Name);
            end
            else if (WeaponShip is TWeaponOn_Cannon57) and (WeaponID = C_DBID_CANNON57_DIGITAL) then
            begin
                WeaponCannon57 := TWeaponOn_Cannon57(WeaponShip);
                case LauncherID of
                  2 :
                  begin
                    WeaponCannon57.AssignStatusLauncher2 := AssignStatus;
                  end;

                end;
                RefreshFormWeapon(WeaponShip.Weapon_Name);
            end
            else if (WeaponShip is TWeaponOn_CannonAK230) and (WeaponID = C_DBID_CANNON_AK230) then
            begin
                WeaponCannonAK230 := TWeaponOn_CannonAK230(WeaponShip);
                case LauncherID of
                  2 :
                  begin
                    WeaponCannonAK230.AssignStatusLauncher2 := AssignStatus;
                  end;

                end;
                RefreshFormWeapon(WeaponShip.Weapon_Name);
            end
            else if (WeaponShip is TWeaponOn_CannonType730) and (WeaponID = C_DBID_CANNON_TYPE_730) then
            begin
                WeaponCannonType730 := TWeaponOn_CannonType730(WeaponShip);
                case LauncherID of
                  2 :
                  begin
                    WeaponCannonType730.AssignStatusLauncher2 := AssignStatus;
                  end;

                end;
                RefreshFormWeapon(WeaponShip.Weapon_Name);
            end;

          end;

        end;

      end;
    end;

  end;
end;

procedure TfrmGameController.RefreshFormWeapon(const WeaponName: string);
var
  i,j : Integer;

  TempWeaponShip : TWeaponOnShip;

  { Weapon Ship }
  WeaponShip : TWeaponOnShip;

  WeaponCannon57 : TWeaponOn_Cannon57;
  WeaponCannon40 : TWeaponOn_Cannon40;
  WeaponStrela   : TWeaponOn_Strella;
  WeaponMistral  : TWeaponOn_Mistral;
  WeaponCannonAK230 : TWeaponOn_CannonAK230;
  WeaponCannonType730 : TWeaponOn_CannonType730;
begin
  if not Assigned(SimManager.TrackObject) then
    Exit;

  for i := 0 to SimManager.TrackObject.WeaponOnShip_List.Count - 1 do
  begin
    if Assigned(TInsObject(SimManager.TrackObject).WeaponOnShip_List[i]) then begin

      weaponship := TWeaponOnShip(TInsObject(SimManager.TrackObject).WeaponOnShip_List[i]);
      if weaponship.Weapon_Name = WeaponName then
      begin
        case WeaponShip.Weapon_ID of
          C_DBID_STRELA :
          begin
            if weaponship is TWeaponOn_Strella then
            begin
              WeaponStrela := TWeaponOn_Strella(weaponship);
              case WeaponStrela.AssignStatusLauncher1 of
                False : btnStrella_Assign.Enabled := False;
                True  : btnStrella_Assign.Enabled := True;
              end;
              case WeaponStrela.AssignStatusLauncher2 of
                False : btnStrella_Assign.Enabled := False;
                True  : btnStrella_Assign.Enabled := True;
              end;
            end;
          end;
          C_DBID_MISTRAL :
          begin
            if weaponship is TWeaponOn_Mistral then
            begin
              WeaponMistral := TWeaponOn_Mistral(weaponship);
              case WeaponMistral.AssignStatusLauncher1 of
                False : btnStrella_Assign.Enabled := False;
                True  : btnStrella_Assign.Enabled := True;
              end;
              case WeaponMistral.AssignStatusLauncher2 of
                False : btnMistral_Assign.Enabled := False;
                True  : btnMistral_Assign.Enabled := True;
              end;
            end;
          end;
          C_DBID_CANNON40 :
          begin
            if weaponship is TWeaponOn_Cannon40 then
            begin
              WeaponCannon40 := TWeaponOn_Cannon40(weaponship);
              case WeaponCannon40.AssignStatusLauncher2 of
                False : btnCannonAssigned.Enabled := False;
                True  : btnCannonAssigned.Enabled := True;
              end;
            end;
          end;
          C_DBID_CANNON57, C_DBID_CANNON57_DIGITAL :
          begin
            if weaponship is TWeaponOn_Cannon57 then
            begin
              WeaponCannon57 := TWeaponOn_Cannon57(weaponship);
              case WeaponCannon57.AssignStatusLauncher2 of
                False : btnCannonAssigned23.Enabled := False;
                True  : btnCannonAssigned23.Enabled := True;
              end;
            end;
          end;
          C_DBID_CANNON_AK230 :
          begin
            if weaponship is TWeaponOn_CannonAK230 then
            begin
              WeaponCannonAK230 := TWeaponOn_CannonAK230(weaponship);
              case WeaponCannonAK230.AssignStatusLauncher2 of
                False : btnCannonAssigned23.Enabled := False;
                True  : btnCannonAssigned23.Enabled := True;
              end;
            end;
          end;
          C_DBID_CANNON_TYPE_730 :
          begin
            if weaponship is TWeaponOn_CannonType730 then
            begin
              WeaponCannonType730 := TWeaponOn_CannonType730(weaponship);
              case WeaponCannonType730.AssignStatusLauncher2 of
                False : btnCannonAssigned23.Enabled := False;
                True  : btnCannonAssigned23.Enabled := True;
              end;
            end;
          end;
        end;

      end;

    end;
  end;

end;

procedure TfrmGameController.ProfilKetinggian1Click(Sender: TObject);
begin
//  DefaultMonitor := dmDesktop;
//  Height         := Screen.Monitors[0].Height;
//  Top            := Screen.Monitors[0].Top;
//  Left           := Screen.Monitors[0].Left;
//  width          := Screen.Monitors[0].Width;
  frmTrjectoryView.Align := alClient;
  frmTrjectoryView.Visible := True;
  frmTrjectoryView.BringToFront;
  frmTrjectoryView.fltpnl1.Align := alClient;
  frmTrjectoryView.imgTrajectoryView.Align := alClient;
  frmTrjectoryView.rzgrpProfileExocet.Opened := True;
end;

procedure TfrmGameController.btnCanonTest3DMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_MOVE_ON, MOVE_PLAYER_RIGHT, 3, 0);
end;

procedure TfrmGameController.btnCanonTest3DMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_MOVE_OFF, 0, 0, 0);
end;

procedure TfrmGameController.btnDeleteShipClick(Sender: TObject);
var
  id : Integer;
begin
  if lvShipList.Selected <> nil then
  begin
    id :=  StrToInt(lvShipList.Selected.Caption);
    DataModule1.DeleteShipEditor(id);

    ShowMessage('Ship Editor ' + lvShipList.Selected.SubItems[0] + ' successfully deleted');

//    ClearVisualForm;
  end
  else
    ShowMessage('Select Ship editor First');

  ShowShip;
end;

procedure TfrmGameController.btnstoprotateClick(Sender: TObject);
begin
//  CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_MOVE_OFF, 0, 0, 0);
end;

procedure TfrmGameController.btn1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Sleep(100);
//  CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_MOVE_ON, MOVE_PLAYER_RIGHT, 3, 0);
end;

procedure TfrmGameController.btn1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_MOVE_OFF, 0, 0, 0);
end;

procedure TfrmGameController.btnLoadScenarioClick(Sender: TObject);
begin
  if lvListScen.Selected <> nil then
  begin
    if SimManager.fGamePlayType = gpmReplay then
    begin
      ShowMessage('Stop Replay first to play Scenario');
      exit;
    end;

    if frmMainInstruktur.lblCekRunning.Caption = 'Play' then
    begin
      ShowMessage('Stop Scenario Play First');
      Exit;
    end;

    DataModule1.DeleteDefaultScenario;

    CurrentScenarioID  := StrToInt(lvListScen.Selected.Caption);
    CurrentScenarioName := lvListScen.Selected.SubItems[0];
    IDGame             := DataModule1.GetGameID(CurrentScenarioID);
    SceIDTemporary     := CurrentScenarioID;

    if DataModule1.GameNameAlreadyExist(scenarioGameName) then
    begin
      ShowMessage(QuotedStr(scenarioGameName)+' is Already Exist');
      exit;
    end;

    GameName := scenarioGameName;

    //send game name...
    SimManager.NetSendGameName(GameName);
    SimManager.NetSendTo3D_SetCommandOrder(0, ORD_REFRESH_CLIENT, 0, 0,0,0,0);

    //DataModule1.DeleteDefaultScenario;

    DataModule1.FillListDefaultScenario(CurrentScenarioID);
    SimManager.NetSendStatusGame(CurrentScenarioID, 1);
//    SimManager.ServerIp := CurrentConsole3DServerAddress;
    SimManager.InstrukturSendLaunchAllCommand;
    SimManager.isDatabaseMode := False;

    ClearScenarioData;
    pnlController.BringToFront;
    frmMainInstruktur.FrameControlLeft.Width := 357;
  end
  else
    ShowMessage('Select Scenario First');
end;

procedure TfrmGameController.btn1Click(Sender: TObject);
var
  Item : TListItem;
  ItemWeapon : TListItem;

  isValid : Boolean;

  ShipID, salvoRate,
  WeaponID,
  LauncherID,
  MissileID,
  MissileNumber : Integer;

  TargetID,
  ModeID,
  BalistikID : integer;

  CorrectBearing,
  CorrectElev : Double;

  RecSend : TRec3DSetWCC;

  Weapon : TWeapon;
begin
  isValid := True;

  if not Assigned(lvRuntimeShip.Selected) then Exit;
  if not Assigned(lvWeapon.Selected) then Exit;
  if not Assigned(lvRuntimeShip.Selected.Data) then Exit;
  if not Assigned(lvWeapon.Selected.Data) then Exit;
  ShipID    := TVehicle(lvRuntimeShip.Selected.Data).Vehicle_ID;
  WeaponID  := TWeapon(lvWeapon.Selected.Data).WeaponID;

  if not TryStrToInt(edtCannonLauncherID.Text , LauncherID) then isValid := False;
  if not TryStrToInt(edtCannonMissileID.Text, MissileID) then isValid := false;
  if not TryStrToInt(edtCannonLauncherID.Text, LauncherID) then isValid := False;
  if not TryStrToInt(edtCannonMissileNumber.Text, MissileNumber) then isValid := false;

  if not TryStrToInt(edtCannonTargetID.Text, TargetID) then isValid := false;
  if not TryStrToFloat(edtCannonCorrElev.Text, CorrectElev) then isValid := false;
  if not TryStrToFloat(edtCannonCorrBearing.Text, CorrectBearing) then isValid := False;
  if not TryStrToInt(cbbSalvoRate.Text , salvoRate) then isValid := False;

  ModeID := cbbCannonModeID.ItemIndex + 1;
  BalistikID := cbbCannonBalistikID.ItemIndex;

  if isValid then
  begin
    RecSend.ShipID          := ShipID;
    RecSend.mWeaponID       := WeaponID;
    RecSend.mLauncherID     := LauncherID;
    RecSend.mMissileID      := MissileID;
    RecSend.mMissileNumber  := MissileNumber;
    RecSend.mOrderID        := 0;

    RecSend.mUpDown             := 0;
    RecSend.mTargetID           := TargetID;
    RecSend.mModeID             := ModeID;
    RecSend.mAutoCorrectElev    := CorrectElev;
    RecSend.mAutoCorrectBearing := CorrectBearing;

    RecSend.mBalistikID         := BalistikID;
    RecSend.mSalvoRate          := salvoRate;

//    CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_MOVE_ON, MOVE_PLAYER_RIGHT, 3, 0);
    case TComponent(sender).Tag of
      //fire
      1 : begin
            RecSend.mOrderID := __ORD_CANNON_START_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Cease
      2 : begin
            RecSend.mOrderID := __ORD_CANNON_STOP_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Assigned
      3 : begin
            RecSend.mOrderID := __ORD_CANNON_ASSIGNED;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Deassigned
      4 : begin
            RecSend.mOrderID := __ORD_CANNON_DEASSIGNED;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;
      //Fire
      5 : begin
            RecSend.mOrderID := __ORD_CANNON_F;
            SimManager.NetSendTo3D_OrderCannon(RecSend);
          end;

    end;
    Sleep(100);
//    CurrentShipItemSendCommanPlayerEvent(TIPE_UTIL_PLAYER_EVENT, IS_PLAYER_MOVE_OFF, 0, 0, 0);
  end;
end;

procedure TfrmGameController.SelectShip(aObject: TInsObject);
var
  Vehicle : TVehicle;
  i, j, k, l, x, flag : integer;
  Weapon        : TWeapon;
  WeaponShip    : TWeaponGetList;
  listWeaponSce,
  ListWeapon    : TList;
  status        : string;
  sceWeapon     : TScenarioWeapon;
  o: TObject;
begin
  if Assigned(aObject) then
  begin
    VisibleStatusShip(false, 1);
    lvRuntimeMissile.Selected := nil;

    if lvRuntimeShip.Items.Count = 0 then
     Exit;

    for i := 0 to lvRuntimeShip.Items.Count - 1 do
    begin
      if Assigned(frmGameController.lvRuntimeShip.Items[i].Data) then begin

        Vehicle := TVehicle(frmGameController.lvRuntimeShip.Items[i].Data);
        if aObject.FDataBaseID =  Vehicle.Vehicle_ID   then
        begin
          lvRuntimeShip.Selected := lvRuntimeShip.Items[i];
          VisibleStatusShip(true, 1);
          case Vehicle.Vehicle_Type of
            1 : lblZCord.Caption.Text := 'Depth';
            2 : lblZCord.Caption.Text := 'Altitude';
            3 : lblZCord.Caption.Text := 'Depth';
          end;

          lblShipName.Caption.Text    := Vehicle.Vehicle_Name +' ( ID '+IntToStr(Vehicle.Vehicle_ID) + ' )';
          lblLatValue.Caption.Text    := FormatFloat('0.0000',Vehicle.Vehicle_Y);
          lblLongVal.Caption.Text     := FormatFloat('0.0000',Vehicle.Vehicle_X);
          lblZVal.Caption.Text        := FormatFloat('0.00',Abs(Vehicle.Vehicle_Z));
          lblHeadingVal.Caption.Text  := FormatFloat('0.00',Vehicle.Vehicle_Heading);
          lblSpeedVal.Caption.Text    := FormatFloat('0.00',Vehicle.Vehicle_Speed);
          lblPitchVal.Caption.Text    := FormatFloat('0.00',Vehicle.Vehicle_Pitch);
          lblRollVal.Caption.Text     := FormatFloat('0.00',Vehicle.Vehicle_Roll);

          ShowDefaultPageWeapon(true);
//          for j:= lvWeapon.Items.Count -1 downto 0 do
//          begin
//            if Assigned(lvWeapon.Items[j].Data) then
//            begin
//              Weapon := TWeapon(lvWeapon.Items[j].Data);
//              if Assigned(Weapon) then
//                Weapon.Free;
//            end;
//          end;
//          lvWeapon.Items.Clear;
          ClearListViewData(lvWeapon);

          ListWeapon := TList.Create;
          listWeaponSce := TList.Create;
          try
            //status := 'On';


            DataModule1.GetListWeaponOnShip(Vehicle.Vehicle_ID, ListWeapon);


            if onOffMode = 0 then
            begin
              DataModule1.GetListWeaponOnShipBySceID(sceIDINI, Vehicle.Vehicle_ID, listWeaponSce);
            end
            else if onOffMode = 1 then
            begin
              DataModule1.GetListWeaponOnShipBySceID(0, Vehicle.Vehicle_ID, listWeaponSce);
            end;


            for k:= 0 to ListWeapon.Count -1 do
            begin
              if Assigned(ListWeapon.Items[k]) then begin
                WeaponShip := TWeaponGetList(ListWeapon.Items[k]);

                status := 'Off';
                Weapon := TWeapon.Create;
                try
                  Weapon.ParentName  := DataModule1.GetShipName(WeaponShip.IDShip);
                  Weapon.MissileName := DataModule1.GetNameWeaponByID(WeaponShip.IDWeapon);
                  Weapon.WeaponID    := WeaponShip.IDWeapon;
                  Weapon.launcherID  := WeaponShip.IDDetail;

                  //dendy mampir
                  for l := 0 to listWeaponSce.Count -1 do
                  begin
                    sceWeapon := TScenarioWeapon(listWeaponSce.Items[l]);
                    if(sceWeapon.WeaponID = Weapon.WeaponID) and (sceWeapon.LauncherID = Weapon.launcherID)
                     and (sceWeapon.ShipID = WeaponShip.IDShip) then
                    begin
                      status := 'On';
                      Break;
                    end
                  end;

                  with lvWeapon.Items.Add do
                  begin
                    Data := Weapon;

                    if not (Weapon.MissileName = 'Moc Console')
                      or not (Weapon.MissileName = 'Moc PKR Console') then  // moc nya di lewati (visible dulu)
                    begin
                      Caption := Weapon.MissileName;
                      SubItems.Add(IntToStr(Weapon.launcherID));
                      SubItems.Add(status);
                    end;
                  end;
                finally
                end;
              end;
            end;



          finally
            ClearAList(ListWeapon);
            ListWeapon.Free;
            ClearAList(listWeaponSce);
            listWeaponSce.Free;
          end;

          Break;
        end;
      end;
    end;



  end
  else
  begin
    lvWeapon.Items.Clear;
    ShowDefaultPageWeapon(true);
    lblInfo.Caption := '';
  end;

end;

procedure TfrmGameController.tmrSeaStateTimer(Sender: TObject);
begin
  if SimManager.MainObjList.ItemCount <> 0 then
  begin
    SimManager.NetSendTo3D_SetCommandOrder(0, ORD_SEA_STATE, tbSeaState.Position-1, 0,0,0,0) ;
    tmrSeaState.Enabled := False;
  end;
end;

procedure TfrmGameController.ClearListShipData(const aListView: TListView);
var
  i: Integer;
begin
  for i := 0 to aListView.Items.Count - 1 do
  begin
    if Assigned(aListView.Items[i].Data) then
    begin
      TObject(aListView.Items[i].Data).Free;
      aListView.Items[i].Data:= nil;
    end;
  end;
  aListView.Clear;
end;

procedure TfrmGameController.ClearListViewData(const aListView: TListView);
var
  i: Integer;
begin
  for i := 0 to aListView.Items.Count - 1 do
  begin
    if Assigned(aListView.Items[i].Data) then
    begin
      TObject(aListView.Items[i].Data).Free;
      aListView.Items[i].Data:= nil;
    end;
  end;
  aListView.Clear;
end;

procedure TfrmGameController.ClearScenarioData;
begin
  {$REGION ' Clear Data '}
  lblScenarioName.Caption := '---';
  mmoKetSce.Clear;
  cbbPort.ItemIndex := 0;

  ClearListViewData(lvKri);
  ClearListViewData(lvTarget);
  ClearListViewData(lvGeneral);

  trckBarSeaState.Position := 1;
  edtSeaState.Text := '1';

  trckBarWindSpeed.Position := 0;
  edtWindSpeed.Text := '0';

  trckBarCurrentSpeed.Position := 0;
  edtCurrentSpeed.Text := '0';

  trckBarTemperature.Position := 0;
  edtTemperature.Text := '0';

  trckBarBarometer.Position := 0;
  edtBarometer.Text := '0';

  trckBarHumidity.Position := 0;
  edtHumidity.Text := '0';

  trckBarFogHeight.Position := 0;
  edtFogHeight.Text := '0';

  VrWindDirection.Position := 0;
  VrCurrentDirection.Position := 0;
  {$ENDREGION}
end;

procedure TfrmGameController.ClearScenarioDescData;
begin

end;

procedure TfrmGameController.ClearShipData;
begin
  lblShipName1.Caption  := '---';
  edtClass.Text     := '';

  edtShipLength.Text  := '';
  edtShipwidth.Text   := '';
  edtShipHeight.Text  := '';

  edtShipMaxSpeed.Text         := '';
  edtShipMaxSpeedAstern.Text   := '';
  edtDamageSustainability.Text := '';
  edtShipRudderSwingRate.Text  := '';
  edtShipThrottleRate.Text     := '';
  edtShipDisplacement.Text     := '';
  edtShipHeelFactor.Text       := '';
  edtShipShaftUp.Text          := '';
  edtShipTacDiameter.Text      := '';
  edtShipTrimFactor.Text       := '';

  edtModelBody.Text   := '';
  edtDOF1.Text        := '';
  edtPosPitch.Text    := '';
  edtSwitch.Text      := '';
  edtLethality.Text   := '';
  edtModelSpout.Text  := '';
  edtDOF2.Text        := '';
  edtPosHeading.Text  := '';
  edt3DActor.Text     := '';

  ClearListShipData (lvWeaponSelect);
  ClearListShipData (lvDetail);

end;

end.


