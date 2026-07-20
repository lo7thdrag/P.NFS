unit UfrmRoutePlan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Generics.Collections, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, VrControls, VrDesign,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.OleCtrls, Vcl.Menus, MapXLib_TLB, Math,
  uCoordConverter, uBaseFunction, uBaseConst, uMapXUnitConverter, uLibConst,
  OverbyteIcsWSocket, uTCPDatatype, uC705SimManager, uLibSettings, uScriptC705,
  uShipModel, uVehicleManager, SpeedButtonImage, AdvGroupBox, AdvPageControl,
  Vcl.ComCtrls, VrButtons, AdvOfficeButtons,
  uWaypointModel, uWaypointView, uMapViewManager, uShipView, uCoordDataTypes,
  UfrmFoeFriendSituationPage;

type
  TEditMode = (edNone, edAddWaypoint, edMoveWaypoint, edDeleteWaypoint, edAddRoute, edDeleteRoute);

  TCurrentToolState = (stDefaultCenterView, stRuler, stZoomIn, stZoomOut, stMove, stSelectArrow, stXhairSelectTgt);

  TfrmRoutePlan = class(TForm)
    {$REGION 'Components'}
    pnlBase: TPanel;
    pnlRight: TPanel;
    img1: TImage;
    pnlEmergencyLaunch: TPanel;
    pnlTakeOff: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label2: TLabel;
    Label3: TLabel;
    pnlPortStarboard: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Label6: TLabel;
    btnImgTakeOff2: TSpeedButton;
    btnImgTakeOff1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label7: TLabel;
    btnSimTrain: TSpeedButton;
    pnlHeaderTitle: TPanel;
    pnlToolBar: TPanel;
    pnlBaseMap: TPanel;
    FMap: TMap;
    imgMapBackground: TImage;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    WCC1: TMenuItem;
    tmrMap: TTimer;
    pnlMapInfo: TPanel;
    btnExit_MapInfo: TSpeedButtonImage;
    pnlParamDisplay: TPanel;
    Label8: TLabel;
    pnlPromptBoxMap: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    lblScaleMap: TLabel;
    lblZoomRateMap: TLabel;
    lblLong_MapInfo: TLabel;
    lblLat_MapInfo: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    lblStatusMap: TLabel;
    pnlNavInfo: TPanel;
    btnExit_NavInfo: TSpeedButtonImage;
    Label18: TLabel;
    pnlPromptBoxNav: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    lblNav_LongShip: TLabel;
    lblNav_LatShip: TLabel;
    lblNav_HdgLShip: TLabel;
    lblNav_HdgRShip: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    advpgcTargetParam: TAdvPageControl;
    advtsPage1: TAdvTabSheet;
    advtsPage2: TAdvTabSheet;
    advtsPage3: TAdvTabSheet;
    advtsPage4: TAdvTabSheet;
    advgrpbxTgtInfoPg3: TAdvGroupBox;
    advgrpbxRouteInfoPg3: TAdvGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edtTgtNoPg3: TEdit;
    edtTgtLongPg3: TEdit;
    Label15: TLabel;
    edtTgtLatPg3: TEdit;
    Label16: TLabel;
    edtPortAnglePg3: TEdit;
    Label17: TLabel;
    edtStbdAnglePg3: TEdit;
    edtTgtRngPg3: TEdit;
    edtTgtAzimuPg3: TEdit;
    edtTgtHeightPg3: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    edtRouTotalPg3: TEdit;
    Label27: TLabel;
    edtRouNoPg3: TEdit;
    Label28: TLabel;
    edtFlyRngPg3: TEdit;
    Label29: TLabel;
    edtAttackAPg3: TEdit;
    Label30: TLabel;
    edtRouStatusPg3: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtLong1Pg3: TEdit;
    edtLat1Pg3: TEdit;
    Label35: TLabel;
    edtLong2Pg3: TEdit;
    edtLat2Pg3: TEdit;
    Label36: TLabel;
    edtLong3Pg3: TEdit;
    edtLat4Pg3: TEdit;
    edtLong4Pg3: TEdit;
    Label37: TLabel;
    edtLat3Pg3: TEdit;
    Label38: TLabel;
    imgUpRoutNoPg3: TImage;
    imgDownRoutNoPg3: TImage;
    btnOperatingMode: TSpeedButton;
    btnOptimalProportion: TSpeedButton;
    btnRuler: TSpeedButton;
    btnZoomIn: TSpeedButton;
    btnZoomOut: TSpeedButton;
    btnMoveMap: TSpeedButton;
    btnObstacleAvoidance: TSpeedButton;
    btnChangeMode: TSpeedButton;
    btnDisplayChannel: TSpeedButton;
    btnEditIsland: TSpeedButton;
    btnObstacleInfo: TSpeedButton;
    btnTargetParamDisplay: TSpeedButton;
    btnRouteCmdWindow: TSpeedButton;
    btnExitRoutePl: TSpeedButton;
    btnManualRoutePl: TSpeedButton;
    pnlRoutePlanControlCmd: TPanel;
    advpgcRoutePlanCmd: TAdvPageControl;
    advtsCmdSet: TAdvTabSheet;
    advtsRouteSet: TAdvTabSheet;
    AdvGroupBox1: TAdvGroupBox;
    btnExit_RoutePlanCmd: TSpeedButtonImage;
    Label39: TLabel;
    edtTgtNumber: TEdit;
    advrbDirectAttack: TAdvOfficeRadioButton;
    advrbRoutePlan1: TAdvOfficeRadioButton;
    Label40: TLabel;
    edtNumber1: TEdit;
    Image4: TImage;
    Image5: TImage;
    advrbRoutePlan2: TAdvOfficeRadioButton;
    Label41: TLabel;
    edtNumber2: TEdit;
    Label42: TLabel;
    edtAngle1: TEdit;
    Label43: TLabel;
    edtAngle3: TEdit;
    edtAngle2: TEdit;
    edtAngle4: TEdit;
    advrbAutoRoutePl: TAdvOfficeRadioButton;
    advrbManualRoutePl: TAdvOfficeRadioButton;
    btnOkRoutePlanCmd: TVrDemoButton;
    btnCancelRoutePlanCmd: TVrDemoButton;
    pnlWaypointLvl2: TPanel;
    btnCloseWaypointLvl2: TSpeedButton;
    btnAddNewRoute: TSpeedButton;
    btnMoveWaypoint: TSpeedButton;
    btnDeleteWaypoint: TSpeedButton;
    btnAddWaypoint: TSpeedButton;
    btnDelRoute: TSpeedButton;
    pnlIslandLvl2: TPanel;
    btnCloseIslandLvl2: TSpeedButton;
    btnManualDrawIsland: TSpeedButton;
    btnAutoChooseIsland: TSpeedButton;
    btnDeleteIsland: TSpeedButton;
    advgrpbxTgtInfoPg1: TAdvGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    edtTgtNoPg1: TEdit;
    edtTgtLongPg1: TEdit;
    edtTgtLatPg1: TEdit;
    edtTgtSpdPg1: TEdit;
    edtTgtCrsPg1: TEdit;
    edtTgtRngPg1: TEdit;
    edtTgtAzimuPg1: TEdit;
    edtTgtHeightPg1: TEdit;
    advgrpbxRouteInfoPg1: TAdvGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    imgUpRoutNoPg1: TImage;
    imgDownRoutNoPg1: TImage;
    edtRoutTotalPg1: TEdit;
    edtRoutNoPg1: TEdit;
    edtFlyRngPg1: TEdit;
    edtAttackAPg1: TEdit;
    edtRoutStatusPg1: TEdit;
    edtLong1Pg1: TEdit;
    edtLat1Pg1: TEdit;
    edtLong2Pg1: TEdit;
    edtLat2Pg1: TEdit;
    edtLong3Pg1: TEdit;
    edtLat4Pg1: TEdit;
    edtLong4Pg1: TEdit;
    edtLat3Pg1: TEdit;
    btnExit_TargetParam: TSpeedButtonImage;
    advrbWayPt: TAdvOfficeRadioButton;
    advrbStartPt: TAdvOfficeRadioButton;
    pnlShowNav: TPanel;
    pnlShowMapInfo: TPanel;
    pnlObstacleInfo: TPanel;
    advpgcObstacleInfo: TAdvPageControl;
    advtsNoFly: TAdvTabSheet;
    advtsPoint: TAdvTabSheet;
    advtsIsl: TAdvTabSheet;
    advtsLand: TAdvTabSheet;
    advgrpbxLandTgt1: TAdvGroupBox;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    edtInputHighLnd1: TEdit;
    edtObsHighLnd1: TEdit;
    edtTgtLnd1: TEdit;
    advgrpbxLandTgt2: TAdvGroupBox;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    edtInputHighLnd2: TEdit;
    edtObsHighLnd2: TEdit;
    edtTgtLnd2: TEdit;
    advgrpbxLandTgt3: TAdvGroupBox;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    edtInputHighLnd3: TEdit;
    edtObsHighLnd3: TEdit;
    edtTgtLnd3: TEdit;
    advgrpbxLandTgt4: TAdvGroupBox;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    edtInputHighLnd4: TEdit;
    edtObsHighLnd4: TEdit;
    edtTgtLnd4: TEdit;
    btnExit_ObstacleInfo: TSpeedButtonImage;
    btnOkObstacleInfo: TVrDemoButton;
    pnlModeOperasi: TPanel;
    tmrForm: TTimer;
    Keyboard1: TMenuItem;
    tmrServiceUpdate: TTimer;
    advgrpbxTgtInfoPg2: TAdvGroupBox;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    edtTgtNoPg2: TEdit;
    edtTgtLongPg2: TEdit;
    edtTgtLatPg2: TEdit;
    edtTgtSpdPg2: TEdit;
    edtTgtCrsPg2: TEdit;
    edtTgtRngPg2: TEdit;
    edtTgtAzimuPg2: TEdit;
    edtTgtHeightPg2: TEdit;
    advgrpbxRouteInfoPg2: TAdvGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    Label97: TLabel;
    imgUpRoutNoPg2: TImage;
    imgDownRoutNoPg2: TImage;
    edtRoutTotalPg2: TEdit;
    edtRoutNoPg2: TEdit;
    edtFlyRngPg2: TEdit;
    edtAttackAPg2: TEdit;
    edtRoutStatusPg2: TEdit;
    edtLong1Pg2: TEdit;
    edtLat1Pg2: TEdit;
    edtLong2Pg2: TEdit;
    edtLat2Pg2: TEdit;
    edtLong3Pg2: TEdit;
    edtLat4Pg2: TEdit;
    edtLong4Pg2: TEdit;
    edtLat3Pg2: TEdit;
    advgrpbxTgtInfoPg4: TAdvGroupBox;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    edtTgtNoPg4: TEdit;
    edtTgtLongPg4: TEdit;
    edtTgtLatPg4: TEdit;
    edtTgtSpdPg4: TEdit;
    edtTgtCrsPg4: TEdit;
    edtTgtRngPg4: TEdit;
    edtTgtAzimuPg4: TEdit;
    edtTgtHeightPg4: TEdit;
    advgrpbxRouteInfoPg4: TAdvGroupBox;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    imgUpRoutNoPg4: TImage;
    Image3: TImage;
    edtRoutTotalPg4: TEdit;
    edtRoutNoPg4: TEdit;
    edtFlyRngPg4: TEdit;
    edtAttackAPg4: TEdit;
    edtRoutStatusPg4: TEdit;
    edtLong1Pg4: TEdit;
    edtLat1Pg4: TEdit;
    edtLong2Pg4: TEdit;
    edtLat2Pg4: TEdit;
    edtLong3Pg4: TEdit;
    edtLat4Pg4: TEdit;
    edtLong4Pg4: TEdit;
    edtLat3Pg4: TEdit;
    advgrpbxIslTgt1: TAdvGroupBox;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    edtInputHighIsl1: TEdit;
    edtObsHighIsl1: TEdit;
    edtTgtIsl1: TEdit;
    advgrpbxIslTgt2: TAdvGroupBox;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    edtInputHighIsl2: TEdit;
    edtObsHighIsl2: TEdit;
    edtTgtIsl2: TEdit;
    advgrpbxIslTgt3: TAdvGroupBox;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    edtInputHighIsl3: TEdit;
    edtObsHighIsl3: TEdit;
    edtTgtIsl3: TEdit;
    advgrpbxIslTgt4: TAdvGroupBox;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    edtInputHighIsl4: TEdit;
    edtObsHighIsl4: TEdit;
    edtTgtIsl4: TEdit;
    advgrpbxLandPt1: TAdvGroupBox;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    edtInputHighPt1: TEdit;
    edtObsHighPt1: TEdit;
    edtTgtPt1: TEdit;
    advgrpbxLandPt2: TAdvGroupBox;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    edtInputHighPt2: TEdit;
    edtObsHighPt2: TEdit;
    edtTgtPt2: TEdit;
    advgrpbxLandPt3: TAdvGroupBox;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    edtInputHighPt3: TEdit;
    edtObsHighPt3: TEdit;
    edtTgtPt3: TEdit;
    advgrpbxLandPt4: TAdvGroupBox;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    edtInputHighPt4: TEdit;
    edtObsHighPt4: TEdit;
    edtTgtPt4: TEdit;
    advgrpbxLandFly1: TAdvGroupBox;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    edtInputHighFly1: TEdit;
    edtObsHighFly1: TEdit;
    edtTgtFly1: TEdit;
    advgrpbxLandFly2: TAdvGroupBox;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    edtInputHighFly2: TEdit;
    edtObsHighFly2: TEdit;
    edtTgtFly2: TEdit;
    advgrpbxLandFly3: TAdvGroupBox;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    edtInputHighFly3: TEdit;
    edtObsHighFly3: TEdit;
    edtTgtFly3: TEdit;
    advgrpbxLandFly4: TAdvGroupBox;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    edtInputHighFly4: TEdit;
    edtObsHighFly4: TEdit;
    edtTgtFly4: TEdit;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pnlHeaderTitleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Close1Click(Sender: TObject);
    procedure WCC1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure tmrMapTimer(Sender: TObject);
    procedure btnToolBarsClick(Sender: TObject);
    procedure advpgcTargetParamChange(Sender: TObject);
    procedure btnExitSubWindowClick(Sender: TObject);
    procedure pnlShowNavClick(Sender: TObject);
    procedure pnlShowMapInfoClick(Sender: TObject);
    procedure advpgcObstacleInfoChange(Sender: TObject);
    procedure tmrFormTimer(Sender: TObject);
    procedure btnWaypointLvl2Click(Sender: TObject);
    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Keyboard1Click(Sender: TObject);
    procedure tmrServiceUpdateTimer(Sender: TObject);
    procedure FMapMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FMapMapViewChanged(Sender: TObject);
  protected
    //procedure DrawAngle(aCnv: TCanvas);
    //procedure DrawCompass(aCnv: TCanvas);

    function MeterWidth: Integer;
    function MeterHeight: Integer;
  private
    { Private declarations }
    FMapRect: TRect;
    FCanvas: TCanvas;

    FisMapDayMode: Boolean;

    { Map }
    FBitmapBackground: TBitmap;
    FMapCanvas: TCanvas;
    FLyrDraw: CMapXLayer;
    FCurrentRange: Double;  // meter
    FIndexRange: Integer;
    FMapConverter: TMapXUnitConverter;

    TargetObj : TShipContact;

    { Route Plan Waypoint }
    FEditMode: TEditMode;
    FSelectedRoute: TRoutePlanning;
    FSelectedWaypoint: TWaypoint;

    FMapViewManager: TMapViewManager;
    FRouteList: TObjectList<TRoutePlanning>;
    FWaypointViews: TObjectList<TWaypointView>;

    FSelectMode : Boolean;
    FCurrentTool: TCurrentToolState;

    function FindShipAt(X,Y: Integer): TShipContact;
    function FindWaypointAtScreen(X, Y: Integer): TWaypoint;

    function GetCurrentMapRadius: Double; //Nm

    procedure LoadInitMap;
    procedure LoadGeoset(const aGst: string); virtual;
    procedure DrawAll(aCnv: TCanvas; aCvt: TCoordConverter);

    procedure MapZoomIn;
    procedure MapZoomOut;
    procedure MapMove;

    procedure UpdatePosOwnShip;

    procedure SetDefaultMapTool;
    procedure SetDefaultFormView;
    procedure SetDefaultViewPromptBox(aPanel: Integer);

    procedure UpdateTextScaleMap;

    procedure UpdateTargetParamPnl(aObjTgt: TShipContact; aRange: Double);
  public
    { Public declarations }

    FSelectedBearing, FSelectedRange : Double;
    strPath: string;

    procedure InitMapMainForm(const GeosetPath: string);

    procedure SetImgBtn;
    procedure SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
    procedure SetTopMonitor(aMoniHeight: Integer);
    procedure SetFormMonitor(aForm: TForm; aMonitorIndex: Integer);

    procedure RegisterEvents;
    procedure TakeOffBtnChanged(Sender: TObject);

    property SelectMode: Boolean read FSelectMode write FSelectMode;

  end;

var
  frmRoutePlan: TfrmRoutePlan;

implementation

{$R *.dfm}

uses
  uFormMgr;

const
  CMin_Z = 0;
  CMax_Z = 14;

function FixMapZoom(z: double): double;
begin
  if z >= 1.0 then
    result := Round(z)
  else
    result := 0.001 * Round(z * 1000);
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

function TfrmRoutePlan.MeterHeight: Integer;
begin
  Result := FMap.Height;
  //Result := imgBackgroundZone.Height;
end;

function TfrmRoutePlan.MeterWidth: Integer;
begin
  Result := FMap.width;
  //Result := imgBackgroundZone.Width;
end;

function TfrmRoutePlan.FindShipAt(X, Y: Integer): TShipContact;
var
  i: Integer;
  Ship: TShipContact;
  xShip, yShip: Single;
  dist: Double;
  tolerance: Integer;
begin
  Result := nil;

  if (VehicleMgr = nil) or (VehicleMgr.NFSObjectList = nil) then
    Exit;

  tolerance := 15; // radius klik (pixel)

  for i := 0 to VehicleMgr.NFSObjectList.Count - 1 do
  begin
    Ship := VehicleMgr.NFSObjectList[i] as TShipContact;

    // convert posisi kapal ke screen
    FMap.ConvertCoord(xShip, yShip, Ship.Lon, Ship.Lat, miMapToScreen);

    // hitung jarak pixel
    dist := Sqrt(Sqr(X - xShip) + Sqr(Y - yShip));

    if dist <= tolerance then
    begin
      Result := Ship;
      Exit;
    end;
  end;
end;

function TfrmRoutePlan.FindWaypointAtScreen(X, Y: Integer): TWaypoint;
var
  i, j: Integer;
  wp: TWaypoint;
  scrX, scrY: Integer;
begin
  Result := nil;

  for i := 0 to FRouteList.Count - 1 do
  begin
    for j := 0 to FRouteList[i].Waypoints.Count - 1 do
    begin
      wp := FRouteList[i].Waypoints[j];

      FMapConverter.ConvertToScreen(wp.Long, wp.Lat, scrX, scrY);

      if (Abs(scrX - X) < 6) and (Abs(scrY - Y) < 6) then
      begin
        FSelectedRoute := FRouteList[i];
        Exit(wp);
      end;
    end;
  end;
end;

procedure EnableComposited(WinControl: TWinControl);
var
  i: Integer;
  NewExStyle: DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for i := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

procedure TfrmRoutePlan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TfrmRoutePlan.FormDestroy(Sender: TObject);
begin
  if Assigned(FMapCanvas) then
    FreeAndNil(FMapCanvas);
  if Assigned(FMapConverter) then
    FreeAndNil(FMapConverter);
  if Assigned(FBitmapBackground) then
    FreeAndNil(FBitmapBackground);

  if Assigned(FWaypointViews) then
    FreeAndNil(FWaypointViews);
  if Assigned(FRouteList) then
    FreeAndNil(FRouteList);
  if Assigned(FMapViewManager) then
    FreeAndNil(FMapViewManager);

  FreeAndNil(FCanvas);

  EndC705;
end;

procedure TfrmRoutePlan.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  Width := 1920;
  Height := 1080;

  Self.DoubleBuffered := False;
  EnableComposited(pnlBasemap);

  FCanvas := TCanvas.Create;

  { Load Map }
  LoadInitMap;

  { Form Show }
  //Show;

  { Timer Map }
  tmrMap.Interval := 250;
  tmrMap.Enabled := True;

  tmrForm.Interval := 1000;
  tmrForm.Enabled := True;

  { Load Button Image }
  //strPath := '.\img\icon\Route Plan - Tool Bar\';
  //strPath := VImgPath.imgPath + '\icon\Route Plan - Tool Bar\';
  //SetImgBtn;

  FisMapDayMode := True;  // Tampilan Peta Siang Hari (Day)

  { Route Plan Waypoint }
  FEditMode := edNone;
  FRouteList := TObjectList<TRoutePlanning>.Create(True);
  FWaypointViews := TObjectList<TWaypointView>.Create(True);

  pnlHeaderTitle.Caption := '  Route Plan Software' + '(Ver: 3.3.0)';

  { Set Default Tool Bar }
  SetDefaultMapTool;
end;

procedure TfrmRoutePlan.FormShow(Sender: TObject);
begin
//  pnlBasemap.Width := Width;
//  pnlBasemap.Left := 0;
//  pnlBasemap.Top := Panel1.Top + Panel1.Height;
//  pnlBasemap.Height := Height;
  pnlBasemap.Align := alClient;

  FMapRect.Left := 5;
  FMapRect.Top := pnlHeaderTitle.Top + pnlHeaderTitle.Height + 5;
  FMapRect.Right := Width - 5;
  FMapRect.Bottom := Height - 5;

  //FMap.Visible := False;

  SetDefaultFormView;
end;

{$REGION 'Map Section'}
{----------------------------------------------------------------------------
  GetCurrentMapRadiusNM

  Mengembalikan radius area peta yang sedang ditampilkan.

  Nilai dihitung dari batas kiri dan kanan peta (Bounds) kemudian
  dikonversi menjadi Nautical Mile menggunakan CalcRange().

  Contoh:

      kiri ----------------------------- kanan
               <----- 48 NM ----->

      Radius = 24 NM

  Nilai ini digunakan untuk indikator Zoom/Range.
----------------------------------------------------------------------------}
function TfrmRoutePlan.GetCurrentMapRadius: Double;
var
  Bounds: CMapXRectangle;
begin
  Bounds := FMap.Bounds;

  Result :=
    CalcRange(
      Bounds.XMin,
      (Bounds.YMin + Bounds.YMax) / 2,
      Bounds.XMax,
      (Bounds.YMin + Bounds.YMax) / 2
    ) / 2;
end;

procedure TfrmRoutePlan.InitMapMainForm(const GeosetPath: string);
begin
  { View Draw Object di Map }
  FMapViewManager := TMapViewManager.Create;

  FMapViewManager.AddView(
    TShipView.Create(FMap, VehicleMgr)
  );

  LoadGeoset(GeosetPath);
end;

procedure TfrmRoutePlan.MapMove;
begin
  FMap.CurrentTool := miPanTool;
  FCurrentTool := stMove;
  lblStatusMap.Caption := 'Move Map';
end;

procedure TfrmRoutePlan.MapZoomIn;
begin
  FMap.CurrentTool := miZoomInTool;
  FCurrentTool := stZoomIn;
  lblStatusMap.Caption := 'Zoom In Map';
  {
  if FIndexRange > 0 then
    Dec(FIndexRange);

  SetMapRange(CRangeOperation[FIndexRange]);
  }
  {
  if self.FIndexRange > 0 then
  begin
    dec(self.FIndexRange);
    self.FCurrentRange := CRangeOperation[self.FIndexRange];
  end
  else
    self.FCurrentRange := CRangeOperation[0];

  FMap.ZoomTo((Self.FCurrentRange * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);

  //lblZoomRateMap.Caption := FloatToStr(Self.FCurrentRange * C_Meter_To_NauticalMile);
  lblZoomRateMap.Caption := Format('%8.2f', [Self.FCurrentRange * C_Meter_To_NauticalMile]);
  }
end;

procedure TfrmRoutePlan.MapZoomOut;
begin
  FMap.CurrentTool := miZoomOutTool;
  FCurrentTool := stZoomOut;
  lblStatusMap.Caption := 'Zoom Out Map';

  {
  if FIndexRange < CCountRange - 1 then
    Inc(FIndexRange);

  SetMapRange(CRangeOperation[FIndexRange]);
  }
  {
  if self.FIndexRange < CCountRange - 1 then
  begin
    inc(self.FIndexRange);
    self.FCurrentRange := CRangeOperation[self.FIndexRange];
  end
  else
    self.FCurrentRange := CRangeOperation[CCountRange - 1];

  FMap.ZoomTo((Self.FCurrentRange * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);

  lblZoomRateMap.Caption := Format('%8.2f', [Self.FCurrentRange * C_Meter_To_NauticalMile]);
  }
end;

procedure TfrmRoutePlan.LoadGeoset(const aGst: string);
var
  i: integer;
  z: OleVariant;
  mInfo: CMapXLayerInfo;
begin

  InitOleVariant(z);
  FMap.Layers.RemoveAll;

  if not FileExists(aGst) then
  begin
    ShowMessage('File ' + aGst + ' Not Found.');
    Exit;
  end;

  if (aGst <> '') and FileExists(aGst) then
  begin
    FMap.Geoset := aGst;

    mInfo := CoLayerInfo.Create;
    mInfo.type_ := miLayerInfoTypeUserDraw;
    mInfo.AddParameter('Name', 'Animation');
    FLyrDraw := FMap.Layers.Add(mInfo, 1);

    FMap.Layers.AnimationLayer := FLyrDraw;
    FMap.BackColor := $000000000;//CBackgroundMapColor;
    FMap.MapUnit := miUnitNauticalMile;

    FMap.TitleText := '';

    FMap.CenterX := 112.75;
    fmap.CenterY := -7.2;
    FMap.ZoomTo((Self.FCurrentRange * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);

    //pnlMap.Caption := 'Sudah load map';
  end
end;

procedure TfrmRoutePlan.LoadInitMap;
begin
  FMapCanvas := TCanvas.Create;
  FMapConverter := TMapXUnitConverter.Create;
  FMapConverter.FMap := FMap;
  FIndexRange := 3;
  FCurrentRange := CRangeOperation[3];

  FBitmapBackground := TBitmap.Create;
  FBitmapBackground.Height := imgMapBackground.Height;
  FBitmapBackground.Width := imgMapBackground.Width;
  FBitmapBackground.Canvas.Brush.Color := clWhite;//clBlack; // new color
  FBitmapBackground.Canvas.FillRect(Rect(0, 0, FBitmapBackground.Width, FBitmapBackground.Height));

  imgMapBackground.Picture.Assign(FBitmapBackground);

  UpdateTextScaleMap;

  //LoadGeoset('.\data\mapsea\Indonesia.gst');
//  LoadGeoset('.\.\.\.\bin\2D\data\mapsea\Indonesia.gst');
end;

procedure TfrmRoutePlan.DrawAll(aCnv: TCanvas; aCvt: TCoordConverter);
var
  pnt: Winapi.Windows.TPoint;
var
  z: double;
  c, i: Integer;
  Ship: TShipContact;
  xCntr, yCntr: Single;
  radiusShip, x, y, x1, y1, x2, y2: Integer;
begin

  aCvt.ConvertToScreen(FMap.CenterX, FMap.CenterY, pnt.X, pnt.Y);

  z := FixMapZoom(FMap.Zoom);
  c := FindClosestZoomIndex(z);
  z := ZoomIndexToScale(c);

  if VehicleMgr.NFSObjectList <> nil then
  begin
    for i := 0 to VehicleMgr.NFSObjectList.Count - 1 do
    begin
      Ship := VehicleMgr.NFSObjectList[i] as TShipContact;

      FMap.ConvertCoord(xCntr, yCntr, Ship.Lon, Ship.Lat, miMapToScreen);

      FCanvas.Pen.Color := clRed;
      FCanvas.Brush.Style := bsSolid;
      FCanvas.Brush.Color := FCanvas.Pen.Color;
      FCanvas.Pen.Style := psSolid;
      FCanvas.Pen.Width := 2;

      FCanvas.Font.Name := 'Arial';
      FCanvas.Font.Size := 10;
      FCanvas.Font.Color := clBlack;
      SetBkMode(FCanvas.Handle, TRANSPARENT);

      //FCanvas.TextOut(Round(xCntr), Round(yCntr), Ship.ID.ToString);

      //FCanvas.Ellipse(Round(x1), Round(y1), Round(x1 + 10), Round(y1 + 10));

      radiusShip := 10;
      x := Round(xCntr);
      y := Round(yCntr);

      x1 := x - radiusShip;
      y1 := y;
      x2 := x;
      y2 := y - radiusShip;
      FCanvas.MoveTo(x1, y1);
      FCanvas.LineTo(x2, y2);

      x2 := x + radiusShip;
      y2 := y;
      FCanvas.LineTo(x2, y2);

      x2 := x;
      y2 := y + radiusShip;
      FCanvas.LineTo(x2, y2);

      x2 := x - radiusShip;
      y2 := y;
      FCanvas.LineTo(x2, y2);

      x1 := x;
      y1 := y;
      x2 := x;
      y2 := y - 2 * radiusShip;
      FCanvas.MoveTo(x1, y1);
      FCanvas.LineTo(x2, y2);

      FCanvas.TextOut(Round(xCntr), Round(yCntr) + 2 * radiusShip, Ship.ID.ToString);
    end;
  end;

  { ========================= }
  { DRAW ROUTE & WAYPOINT     }
  { ========================= }

  if Assigned(FRouteList) then
  begin
    for i := 0 to FRouteList.Count - 1 do
    begin
      var Route := FRouteList[i];

      if (Route <> nil) and (Route.Waypoints <> nil) then
      begin
        FCanvas.Pen.Color := clBlue;
        FCanvas.Pen.Width := 2;
        FCanvas.Brush.Color := clYellow;
        FCanvas.Brush.Style := bsSolid;

        for var j := 0 to Route.Waypoints.Count - 1 do
        begin
          var WP := Route.Waypoints[j];

          if WP = nil then
            Continue;

          // Convert lat/lon ke screen
          FMap.ConvertCoord(xCntr, yCntr, WP.Long, WP.Lat, miMapToScreen);

          x := Round(xCntr);
          y := Round(yCntr);

          // Gambar titik waypoint (lingkaran kecil)
          FCanvas.Ellipse(x - 5, y - 5, x + 5, y + 5);

          // Gambar garis antar waypoint
          if j > 0 then
          begin
            var PrevWP := Route.Waypoints[j - 1];
            var px, py: Single;

            FMap.ConvertCoord(px, py, PrevWP.Long, PrevWP.Lat, miMapToScreen);

            FCanvas.MoveTo(Round(px), Round(py));
            FCanvas.LineTo(x, y);
          end;
        end;
      end;
    end;
  end;

end;

procedure TfrmRoutePlan.tmrFormTimer(Sender: TObject);
begin
  if Assigned(SimManager) then
  begin
    if SimManager.RoutePlanMode = mPassive then
    begin
      pnlModeOperasi.Caption := 'Passive Mode';
    end
    else if SimManager.RoutePlanMode = mFiring then
    begin
      pnlModeOperasi.Caption := 'Firing Mode';
    end;
  end;

end;

procedure TfrmRoutePlan.tmrMapTimer(Sender: TObject);
begin
  FMap.Repaint;
end;

procedure TfrmRoutePlan.tmrServiceUpdateTimer(Sender: TObject);
begin
  UpdatePosOwnShip
end;

procedure TfrmRoutePlan.UpdatePosOwnShip;
var
  OwnShip: TShipContact;
begin
  OwnShip := VehicleMgr.FindObjectByID(VOwnShip.ShipID);

  if not Assigned(OwnShip) then
    Exit;

  lblNav_LongShip.Caption := FormatLongitude(OwnShip.Lon);
  lblNav_LatShip.Caption  := FormatLatitude(OwnShip.Lat);
  lblNav_HdgLShip.Caption := FormatFloat('0.00', NormalizeHeading(OwnShip.Heading - 90));//'-90.00';
  lblNav_HdgRShip.Caption := FormatFloat('0.00', NormalizeHeading(OwnShip.Heading ++ 90));//'90.00';
end;

procedure TfrmRoutePlan.UpdateTargetParamPnl(aObjTgt: TShipContact; aRange: Double);
begin
  {$REGION 'Page1'}
  edtTgtNoPg1.Text := IntToStr(aObjTgt.ID);
  edtTgtLongPg1.Text := FormatFloat('0.00', aObjTgt.Lon);//FloatToStr(aObjTgt.Lon);
  edtTgtLatPg1.Text := FormatFloat('0.00', aObjTgt.Lat);//FloatToStr(aObjTgt.Lat);
  edtTgtSpdPg1.Text := FormatFloat('0.00', aObjTgt.Speed);//FloatToStr(aObjTgt.Speed);
  edtTgtCrsPg1.Text := FormatFloat('0.00', aObjTgt.Heading);//FloatToStr(aObjTgt.Heading);
  edtTgtRngPg1.Text := FormatFloat('0.00', aRange);//FloatToStr(aRange);
  //edtTgtAzimuPg1.Text;
  //edtTgtHeightPg1.Text;
  {$ENDREGION}
end;

procedure TfrmRoutePlan.UpdateTextScaleMap;
var
  Radius : Double; // Nm
begin
  lblZoomRateMap.Caption := FormatFloat('0.00', FMap.Zoom);

  Radius := GetCurrentMapRadius;
  { Scale anggap
    24 NM = 1 : 350000 }
  lblScaleMap.Caption := Format('1 : %.0f', [(Radius / 24.0) * 350000.0]);
end;

procedure TfrmRoutePlan.FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
begin
  if not Assigned(FCanvas) then
    Exit;

  FCanvas.Handle := hOutputDC;

  FMapViewManager.DrawAll(FCanvas, FMapConverter);

  //DrawAll(FCanvas, FMapConverter);
end;

procedure TfrmRoutePlan.FMapMapViewChanged(Sender: TObject);
begin
  if (FCurrentTool = stZoomIn) or (FCurrentTool = stZoomOut) then
    UpdateTextScaleMap;
end;

procedure TfrmRoutePlan.FMapMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  dLong, dLat: Double;
  wp: TWaypoint;
  idx: Integer;
  OwnShip: TShipContact;
  range, bearing : Double;
  Long, Lati : Double;
begin
  if Button <> mbLeft then
    Exit;

  // Pixel -> Map Coordinate (World)
  FMapConverter.ConvertToMap(X, Y, dLong, dLat);

  case FEditMode of
    edNone:
      ;

    {$REGION 'Add Route'}
    { ===== ===== }
    edAddRoute: begin
      if FRouteList.Count >= 4 then
      begin
        lblStatusMap.Caption := 'Maximum 4 routes allowed.';
        //ShowMessage('Maximum 4 routes allowed.');
        Exit;
      end;

      if Assigned(FSelectedRoute) then
      begin
        lblStatusMap.Caption := 'Finish current route first.';
        //ShowMessage('Finish current route first.');
        Exit;
      end;

      FSelectedRoute := TRoutePlanning.Create;
      FRouteList.Add(FSelectedRoute);

      // titik pertama
      FSelectedRoute.AddWaypoint(dLat, dLong);

      // Create View Manager untuk route ini
      FMapViewManager.AddView(
        TWaypointView.Create(FMap, FMapConverter, FSelectedRoute)
      );

      lblStatusMap.Caption := 'Route created. Switch to Add Waypoint mode to continue.';
      //ShowMessage('Route created. Switch to Add Waypoint mode to continue.');

      FMap.Refresh;
      {
      if FRouteList.Count >= 4 then
      begin
        //ShowMessage('Maximum 4 routes allowed');
        Exit;
      end;

      FSelectedRoute := TRoutePlanning.Create;
      FRouteList.Add(FSelectedRoute);

      FSelectedRoute.AddWaypoint(dLat, dLong); // first point

      FSelectedWaypoint := nil;

      // Draw Waypoint
      FWaypointViews.Add(
        TWaypointView.Create(FMap, FMapConverter, FSelectedRoute)
      );

      FMap.Refresh;
      }
    end;
    {$ENDREGION}

    {$REGION 'Add Waypoint'}
    { ===== ===== }
    edAddWaypoint: begin
      // Kalau belum ada route aktif ? buat baru otomatis
      if not Assigned(FSelectedRoute) then
      begin
        lblStatusMap.Caption := 'No active route. Switch to Add Route mode first.';
        //ShowMessage('No active route. Switch to Add Route mode first.');
        Exit;
      end;

      if FSelectedRoute.Waypoints.Count >= 4 then
      begin
        lblStatusMap.Caption := 'Maximum 4 waypoints per route reached. Switch to Add Route mode to create a new route.';
        //ShowMessage('Maximum 4 waypoints per route reached. Switch to Add Route mode to create a new route.');
        Exit;
      end;

      FSelectedRoute.AddWaypoint(dLat, dLong);
      if FSelectedRoute.Waypoints.Count = 4 then
      begin
        lblStatusMap.Caption := 'Route completed.';
        //ShowMessage('Route completed.');
        FSelectedRoute := nil;
      end;

      FMap.Refresh;
      {
      if not Assigned(FSelectedRoute) then
        Exit;

      if FSelectedRoute.Waypoints.Count >= 4 then
      begin
        //ShowMessage('Maximum 4 waypoint per route.');
        Exit;
      end;

      FSelectedRoute.AddWaypoint(dLat, dLong);
      FMap.Invalidate;
      }
    end;
    {$ENDREGION}

    {$REGION 'Move Waypoint'}
    { ===== ===== }
    edMoveWaypoint: begin
      // kalau belum ada yang dipilih lalu pilih dulu
      if not Assigned(FSelectedWaypoint) then
      begin
        wp := FindWaypointAtScreen(X, Y);
        if Assigned(wp) then
          FSelectedWaypoint := wp;
      end
      else
      begin
        // kalau sudah ada yang dipilih -> pindahkan
        FSelectedWaypoint.Lat := dLat;
        FSelectedWaypoint.Long := dLong;

        FSelectedWaypoint := nil;   // selesai waypoint

        FMap.Refresh;
      end;
//      if Assigned(FSelectedWaypoint) then
//      begin
//        FSelectedWaypoint.Lat := dLat;
//        FSelectedWaypoint.Long := dLong;
//
//        FMap.Invalidate;
//      end;
    end;
    {$ENDREGION}

    {$REGION 'Delete Waypoint'}
    { ===== ===== }
    edDeleteWaypoint: begin
      wp := FindWaypointAtScreen(X, Y);

      if Assigned(wp) and Assigned(FSelectedRoute) then
      begin
        //FSelectedRoute.Waypoints.Remove(wp);

        idx := FSelectedRoute.Waypoints.IndexOf(wp);
        if idx >= 0 then
          FSelectedRoute.Waypoints.Delete(idx);

        FSelectedWaypoint := nil;

        FMap.Refresh;
      end;

    end;
    {$ENDREGION}

    {$REGION 'Delete Route'}
    { ===== ===== }
    edDeleteRoute: begin
      idx := FRouteList.IndexOf(FSelectedRoute);

      if Assigned(FSelectedRoute) then
      begin
        //FRouteList.Remove(FSelectedRoute);

        if idx >= 0 then
          FRouteList.Delete(idx);

        // Delete list View nya juga
        if FWaypointViews.Count > 0 then
          FWaypointViews.Delete(FWaypointViews.Count - 1);

        FSelectedRoute := nil;
        FSelectedWaypoint := nil;

        FMap.Refresh;
      end;

    end;
    {$ENDREGION}
  end;

  TargetObj := FindShipAt(X,Y);

  if Assigned(TargetObj) then
  begin
    if (SimManager.RoutePlanMode = mFiring) then
    begin
      VehicleMgr.SelectedTargetID := TargetObj.ID;
      FMap.Refresh;
    end;

    lblNav_LongShip.Caption := (TargetObj.Lon).ToString;
    lblNav_LatShip.Caption := (TargetObj.Lat).ToString;

  end;

  if FSelectMode and (SimManager.RoutePlanMode = mFiring) and
    (FCurrentTool = stXhairSelectTgt)  then
  begin
    OwnShip := VehicleMgr.FindObjectByID(VOwnShip.ShipID);
//    FMap.ConvertCoord(X, Y, Long, Lati, miMapToScreen);

    range := CalcRange(OwnShip.Lon, OwnShip.Lat, dLong, dLat);
    FSelectedRange := range * C_NauticalMile_To_Metre;
    FSelectedBearing := CalcBearing(OwnShip.Lon, OwnShip.Lat, dLong, dLat);

    if TargetObj <> nil then begin
      UpdateTargetParamPnl(TargetObj, range);

      SimManager.StartTargetSequence;

      if Assigned(SimManager.OnTargetSelectedAction) then
        SimManager.OnTargetSelectedAction(Self, TargetObj, Range);
    end;

    //VehicleMgr.SelectedTargetID := TargetObj.ID;
    //VehicleMgr.isFiring := False;

    // Ganti Cursor ke bentuk semula
    FMap.MousePointer := miDefaultCursor;
    FMap.CurrentTool := miArrowTool;
    FCurrentTool := stSelectArrow;
  end;

end;

procedure TfrmRoutePlan.FMapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  dLong, dLat: double;
begin
  // Convert screen coordinate -> World coordinate
  FMapConverter.ConvertToMap(X, Y, dLong, dLat);

  lblLat_MapInfo.Caption := FormatLatitude(dLat);
  lblLong_MapInfo.Caption := FormatLongitude(dLong)
end;

{$ENDREGION}

{$REGION 'Tool Bar'}

procedure TfrmRoutePlan.SetImgBtn;
var
  BMap: TBitmap;
begin

  {$REGION ' Button Exit Sub Window (Map Info dan Navigation Info '}
  btnExit_MapInfo.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
  btnExit_NavInfo.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
  btnExit_RoutePlanCmd.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
  btnExit_TargetParam.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
  btnExit_ObstacleInfo.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
  {$ENDREGION}

  {$REGION ' Button Operating Mode '}
  btnOperatingMode.Glyph.LoadFromFile(strpath + 'Button Operating Mode.bmp');
  {$ENDREGION}

  {$REGION ' Button Optimal Proportion '}
  btnOptimalProportion.Glyph.LoadFromFile(strpath + 'Button Optimal Prop - Available.bmp'); // available state
  {$ENDREGION}

  {$REGION ' Button Ruler (Measuring Range) '}
  btnRuler.Glyph.LoadFromFile(strpath + 'Button Range - Available.bmp');  // available state
  {$ENDREGION}

  {$REGION ' Button Zoom In '}
  btnZoomIn.Glyph.LoadFromFile(strpath + 'Button Zoom In - Available.bmp');  // available state
  {$ENDREGION}

  {$REGION ' Button Zoom Out '}
  btnZoomOut.Glyph.LoadFromFile(strpath + 'Button Zoom Out - Available.bmp');  // available state
  {$ENDREGION}

  {$REGION ' Button Move Map '}
  btnMoveMap.Glyph.LoadFromFile(strpath + 'Button Move Map - Available.bmp');  // available state
  {$ENDREGION}

  {$REGION ' Button Manual Route Planning '}
  btnManualRoutePl.Glyph.LoadFromFile(strpath + 'Button Manual Route Plan - Available.bmp');  // available state
  {$ENDREGION}

  {$REGION ' Button Obstacle Avoidance '}
  btnObstacleAvoidance.Glyph.LoadFromFile(strpath + 'Button Obstacle Avoidance.bmp');  // obstacle avoidance check
  {$ENDREGION}

  {$REGION ' Button Change Mode (Day Mode & Night Mode '}
  if FisMapDayMode then
    btnChangeMode.Glyph.LoadFromFile(strpath + 'Button Change Mode - Day.bmp');  // Day Mode
  {$ENDREGION}

  {$REGION ' Button Display Channel '}
  btnDisplayChannel.Glyph.LoadFromFile(strpath + 'Button Display Channel.bmp');  // display channel
  {$ENDREGION}

  {$REGION ' Button Edit Island/ Edit Pulau '}
  btnEditIsland.Glyph.LoadFromFile(strpath + 'Button Edit Island.bmp');
  {$ENDREGION}

  {$REGION ' Button Obstacle Information Display '}
  btnObstacleInfo.Glyph.LoadFromFile(strpath + 'Button Obstacle Information Window - Available.bmp');  // available state
  {$ENDREGION}

  {$REGION ' Button Target Parameter '}
  btnTargetParamDisplay.Glyph.LoadFromFile(strpath + 'Button Target Param Window.bmp');
  {$ENDREGION}

  {$REGION ' Button Route Control Command '}
  btnRouteCmdWindow.Glyph.LoadFromFile(strpath + 'Button Route Comand Window - Available.bmp');
  {$ENDREGION}

  {$REGION ' Button Exit Rotue Plan '}
  btnExitRoutePl.Glyph.LoadFromFile(strpath + 'Button Exit Route Plan.bmp');
  {$ENDREGION}

end;

procedure TfrmRoutePlan.btnToolBarsClick(Sender: TObject);
var
  OwnShip: TShipContact;
begin
  FSelectMode := False;
  SimManager.RoutePlanMode := mPassive;
  FMap.MousePointer := miDefaultCursor;

  case (Sender as TSpeedButton).Tag of
    0: begin
      {$REGION 'Operating Mode'}
      //FMap.CurrentTool := miCrossCursor;
      FMap.MousePointer := miCrossCursor;
      FCurrentTool := stXhairSelectTgt;
      FSelectMode := True;

      SimManager.RoutePlanMode := mFiring;
      (Sender as TSpeedButton).Tag := 100;
      {$ENDREGION}
    end;
    100: begin
      FMap.MousePointer := miDefaultCursor;
      FMap.CurrentTool := miArrowTool;
      FCurrentTool := stSelectArrow;
      FSelectMode := False;

      SimManager.RoutePlanMode := mPassive;
      (Sender as TSpeedButton).Tag := 0;
    end;
    1: begin
      {$REGION 'Optimal Proportion / Default View'}
      FMap.CurrentTool := miArrowTool;
      FCurrentTool := stSelectArrow;

      if not Assigned(VehicleMgr) then Exit;

      OwnShip := VehicleMgr.FindObjectByID(VOwnShip.ShipID);
      if not Assigned(OwnShip) then
        Exit;

      FMap.CenterX := OwnShip.Lon;
      FMap.CenterY := OwnShip.Lat;

      // Radius 180 km
      FMap.ZoomTo(
        ((C_DefaultViewRadiusKm * 1000) * C_Meter_To_NauticalMile) * 2,
        OwnShip.Lon,
        OwnShip.Lat
      );

      FMap.Refresh;

      lblNav_LongShip.Caption := (OwnShip.Lon).ToString;
      lblNav_LatShip.Caption := (OwnShip.Lat).ToString;
      {$ENDREGION}
    end;
    2: begin
      {$REGION 'Ruler (Measuring Range)'}
      //
      {$ENDREGION}
    end;
    3: begin
      {$REGION 'Zoom In'}
      if FCurrentTool = stZoomIn then
      begin
        FMap.CurrentTool := miArrowTool;
        FCurrentTool := stSelectArrow;
        lblStatusMap.Caption := '';
      end
      else begin
        MapZoomIn;
      end;
      {$ENDREGION}
    end;
    4: begin
      {$REGION 'Zoom Out'}
      if FCurrentTool = stZoomOut then
      begin
        FMap.CurrentTool := miArrowTool;
        FCurrentTool := stSelectArrow;
        lblStatusMap.Caption := '';
      end
      else begin
        MapZoomOut;
      end;
      {$ENDREGION}
    end;
    5: begin
      {$REGION 'Move Map'}
      if FCurrentTool = stMove then
      begin
        FMap.CurrentTool := miArrowTool;
        FCurrentTool := stSelectArrow;
        lblStatusMap.Caption := '';
      end
      else begin
        MapMove;
      end;
      {$ENDREGION}
    end;
    6: begin
      {$REGION 'Manual Route Plan'}
      pnlWaypointLvl2.Visible := not pnlWaypointLvl2.Visible;
      {$ENDREGION}
    end;
    7: begin
      {$REGION 'Obstacle Avoidance'}
      //
      {$ENDREGION}
    end;
    8: begin
      {$REGION 'Change Mode (Tampilan Peta'}
      if FisMapDayMode then
      begin
        FisMapDayMode := False;
        btnChangeMode.Glyph.LoadFromFile(strpath + 'Button Change Mode - Night.bmp');   // set to Night
        //LoadGeoset(VMapSetting.MapGeosetNight);
      end
      else if not FisMapDayMode then
      begin
        FisMapDayMode := True;
        btnChangeMode.Glyph.LoadFromFile(strpath + 'Button Change Mode - Day.bmp');   // set to Day
        //LoadGeoset(VMapSetting.MapGeosetDay);
      end;
      {$ENDREGION}
    end;
    9: begin
      {$REGION 'Display Channel'}
      //
      {$ENDREGION}
    end;
    10: begin
      {$REGION 'Edit Island'}
      pnlIslandLvl2.Visible := not pnlIslandLvl2.Visible;
      {$ENDREGION}
    end;
    11: begin
      {$REGION 'Obstacle Information Display'}
      if not pnlObstacleInfo.Visible then
      begin
        pnlRoutePlanControlCmd.Visible := False;
        pnlParamDisplay.Visible := False;
      end;

      pnlObstacleInfo.Visible := not pnlObstacleInfo.Visible;

      SetDefaultViewPromptBox(4);
      {$ENDREGION}
    end;
    12: begin
      {$REGION 'Target Param Display'}
      if not pnlParamDisplay.Visible then
      begin
        pnlObstacleInfo.Visible := False;
        pnlRoutePlanControlCmd.Visible := False;
      end;

      pnlParamDisplay.Visible := not pnlParamDisplay.Visible;

      SetDefaultViewPromptBox(3);
      {$ENDREGION}
    end;
    13: begin
      {$REGION 'Route Control Command'}
      if not pnlRoutePlanControlCmd.Visible then
      begin
        pnlObstacleInfo.Visible := False;
        pnlParamDisplay.Visible := False;
      end;

      pnlRoutePlanControlCmd.Visible := not pnlRoutePlanControlCmd.Visible;

      SetDefaultViewPromptBox(5);
      {$ENDREGION}
    end;
    14: begin
      {$REGION 'Exit Route Plan'}
      Application.Terminate;
      {$ENDREGION}
    end;
  end;

end;

procedure TfrmRoutePlan.btnWaypointLvl2Click(Sender: TObject);
begin
  case (Sender as TSpeedButton).Tag of
    0: pnlWaypointLvl2.Visible := False;  // Hide Panel Waypoint Level 2
    1: FEditMode := edAddRoute;           // Add New Route
    2: FEditMode := edMoveWaypoint;       // Move Waypoint
    3: FEditMode := edDeleteWaypoint;     // Delete Waypoint
    4: FEditMode := edAddWaypoint;        // Add New Waypoint
    5: FEditMode := edDeleteRoute;        // Delete Route
  end;
end;

procedure TfrmRoutePlan.btnExitSubWindowClick(Sender: TObject);
begin
  case (Sender as TSpeedButtonImage).Tag of
    1:  begin
      // Map Info
      pnlMapInfo.Visible := False;
      pnlShowMapInfo.Visible := True;
    end;
    2: begin
      // Navigation Info
      pnlNavInfo.Visible := False;
      pnlShowNav.Visible := True;
    end;
    3: begin
      // Target Param
      pnlParamDisplay.Visible := False;
    end;
    4: begin
      // Route Plan Command
      pnlRoutePlanControlCmd.Visible := False;
    end;
  end;
end;

procedure TfrmRoutePlan.advpgcObstacleInfoChange(Sender: TObject);
begin
  btnExit_ObstacleInfo.Parent := advpgcObstacleInfo.ActivePage;
  btnOkObstacleInfo.Parent := advpgcObstacleInfo.ActivePage;
end;

procedure TfrmRoutePlan.advpgcTargetParamChange(Sender: TObject);
begin
  btnExit_TargetParam.Parent := advpgcTargetParam.ActivePage;
  advrbWayPt.Parent := advpgcTargetParam.ActivePage;
  advrbStartPt.Parent := advpgcTargetParam.ActivePage;
end;

procedure TfrmRoutePlan.SetDefaultFormView;
var
  deltaWidth: integer;
begin
  lblStatusMap.Caption := '';

  advpgcRoutePlanCmd.ActivePage := advtsCmdSet;
  advpgcTargetParam.ActivePage := advtsPage1;

  pnlModeOperasi.Top := pnlHeaderTitle.Top + pnlHeaderTitle.Height;
  pnlModeOperasi.Left := pnlBase.Left;
  pnlModeOperasi.Caption := 'Passive Mode';   // default mode operasi route plan

  // Panel Parameter Display / Sub Window-3
  pnlParamDisplay.Left := pnlBase.Width - pnlParamDisplay.Width;
  pnlParamDisplay.Top := pnlHeaderTitle.Top + pnlHeaderTitle.Height;
  pnlParamDisplay.Visible := False;

  deltaWidth := pnlParamDisplay.Width - pnlObstacleInfo.Width;

  // Panel Obstacle Information / Sub Window-4
  pnlObstacleInfo.Left := pnlParamDisplay.Left + deltaWidth;
  pnlObstacleInfo.Top := pnlParamDisplay.Top;
  pnlObstacleInfo.Visible := False;

  pnlRoutePlanControlCmd.Left := pnlParamDisplay.Left;
  pnlRoutePlanControlCmd.Top := pnlParamDisplay.Top;
  pnlRoutePlanControlCmd.Visible := False;

  // Panel Map Info / Sub window-1
  pnlMapInfo.Left := pnlBase.Left;
  pnlMapInfo.Visible := True;
  lblZoomRateMap.Caption := Format('%8.2f', [Self.FCurrentRange * C_Meter_To_NauticalMile]);

  pnlNavInfo.Visible := False;

  pnlWaypointLvl2.Top := pnlToolBar.Top - pnlWaypointLvl2.Height;
  pnlWaypointLvl2.Left := btnMoveMap.Left;
  pnlWaypointLvl2.Visible := False;

  pnlIslandLvl2.Top := pnlToolBar.Top - pnlWaypointLvl2.Height;
  pnlIslandLvl2.Left := btnDisplayChannel.Left;
  pnlIslandLvl2.Visible := False;

  UpdateTextScaleMap;
end;

procedure TfrmRoutePlan.SetDefaultMapTool;
begin
  FMap.CurrentTool := miArrowTool;
  FCurrentTool := stSelectArrow;
  lblStatusMap.Caption := '';
end;

procedure TfrmRoutePlan.SetDefaultViewPromptBox(aPanel: Integer);
begin
  {
   SubWindow PromptBox panel 3 : Window Parameter Sasaran;
   SubWindow PromptBox panel 4 : Window Parameter Obstacle;
   SubWindow PromptBox panel 5 : Window Parameter Route Control Command;

   ** angka sesuai di manual book
  }

  case aPanel of
    3: begin
      {$REGION 'Target Param Display Prompt Box'}
      if pnlParamDisplay.Visible then
      begin
        advpgcTargetParam.ActivePage := advtsPage1;
        advrbWayPt.Parent := advpgcTargetParam.ActivePage;
        advrbStartPt.Parent := advpgcTargetParam.ActivePage;
      end;
      {$ENDREGION}
    end;
    4: begin
      {$REGION 'Obstacle Information Display Prompt Box'}
      if pnlObstacleInfo.Visible then
      begin
        advpgcObstacleInfo.ActivePage := advtsLand;
        btnExit_ObstacleInfo.Parent := advpgcObstacleInfo.ActivePage;
        btnOkObstacleInfo.Parent := advpgcObstacleInfo.ActivePage;
      end;
      {$ENDREGION}
    end;
    5: begin
      {$REGION 'Route Control Command Prompt Box'}
      if pnlRoutePlanControlCmd.Visible then
      begin
        advpgcRoutePlanCmd.ActivePage := advtsCmdSet;
        btnExit_RoutePlanCmd.Parent := advpgcRoutePlanCmd.ActivePage;
      end;
      {$ENDREGION}
    end;
  end;

end;

procedure TfrmRoutePlan.pnlShowMapInfoClick(Sender: TObject);
begin
  pnlShowMapInfo.Visible := False;
  pnlMapInfo.Visible := True;
end;

procedure TfrmRoutePlan.pnlShowNavClick(Sender: TObject);
begin
  pnlShowNav.Visible := False;
  pnlNavInfo.Visible := True;
end;

{$ENDREGION}

procedure TfrmRoutePlan.pnlHeaderTitleMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // Show Images instead of Map
  if (ssShift in Shift) then
  begin
    imgMapBackground.Visible := not imgMapBackground.Visible;

//    if imgMap.Visible = False then
//      pnlBaseMap.Visible := False
//    else
//      pnlBaseMap.Visible := True;

    imgMapBackground.BringToFront;
  end;
end;

procedure TfrmRoutePlan.Close1Click(Sender: TObject);
begin
  Application.Terminate;
  //Close;
end;

procedure TfrmRoutePlan.WCC1Click(Sender: TObject);
begin
  // pindah ke form WCC ketika 1 monitor menggunakan PopupMenu
  SwitchView(vmWCC);
end;

procedure TfrmRoutePlan.Keyboard1Click(Sender: TObject);
begin
  // munculin form keyboard
  SwitchView(vmKeyboard);
end;

procedure TfrmRoutePlan.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
  Position := poDesigned;
  WindowState := wsNormal;

  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop;

  if VIdentSetting.ModeDebug then
    ShowMessage(Format('Route Plan di Monitor %d Top=%d',[aMonitorIdx,Screen.Monitors[aMonitorIdx].Top]));
end;

procedure TfrmRoutePlan.SetTopMonitor(aMoniHeight: Integer);
var
  idxMainMoni: Integer;
  R: TRect;
begin
//  Position := poDesigned;
//  WindowState := wsNormal;

  idxMainMoni := 0;

  Left := Screen.Monitors[idxMainMoni].WorkareaRect.Left;
  Top := aMoniHeight;

  if VIdentSetting.ModeDebug then
    ShowMessage('Route Plan Top=' + IntToStr(frmRoutePlan.Top));
end;

procedure TfrmRoutePlan.RegisterEvents;
begin
  if Assigned(SimManager) then begin
    SimManager.OnTakeOffChanged := TakeOffBtnChanged;
  end;
end;

procedure TfrmRoutePlan.TakeOffBtnChanged(Sender: TObject);
begin
  if Assigned(SimManager) then begin
    if SimManager.MissileTakeOff then begin
      btnImgTakeOff1.Glyph.LoadFromFile(VImgPath.imgPath + '\'+ 'no1-glowing.bmp');
      btnImgTakeOff2.Glyph.LoadFromFile(VImgPath.imgPath + '\'+ 'no2-glowing.bmp');
    end
    else begin
      btnImgTakeOff1.Glyph.LoadFromFile(VImgPath.imgPath + '\'+ 'no1-normal.bmp');
      btnImgTakeOff2.Glyph.LoadFromFile(VImgPath.imgPath + '\'+ 'no2-normal.bmp');
    end;
  end;
end;

procedure TfrmRoutePlan.SetFormMonitor(aForm: TForm; aMonitorIndex: Integer);
var
  M: TMonitor;
begin
  if aMonitorIndex >= Screen.MonitorCount then Exit;

  M := Screen.Monitors[aMonitorIndex];

  aForm.Left := M.Left;
  aForm.Top := M.Top;
end;

end.

