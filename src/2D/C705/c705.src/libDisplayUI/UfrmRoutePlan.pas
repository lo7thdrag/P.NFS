unit UfrmRoutePlan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, VrControls, VrDesign, Vcl.Imaging.pngimage,
  Vcl.Buttons, Vcl.OleCtrls, Vcl.Menus, MapXLib_TLB, Math, uCoordConverter,
  uBaseFunction, uBaseConst, uMapXUnitConverter, uLibConst, OverbyteIcsWSocket,
  uTCPDatatype, uC705SimManager, uLibSettings, uScriptC705, uShipModel,
  uVehicleManager, SpeedButtonImage, AdvGroupBox, AdvPageControl, Vcl.ComCtrls,
  VrButtons, AdvOfficeButtons;

type
  TfrmRoutePlan = class(TForm)
    {$REGION 'Components'}
    pnlBase: TPanel;
    Panel2: TPanel;
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
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label7: TLabel;
    btnSimTrain: TSpeedButton;
    Panel1: TPanel;
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
    btnExitRoutePlanCmd: TSpeedButtonImage;
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
    btnExitTargetParam: TSpeedButtonImage;
    advrbWayPt: TAdvOfficeRadioButton;
    advrbStartPt: TAdvOfficeRadioButton;
    pnlShowNav: TPanel;
    pnlShowMapInfo: TPanel;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
  protected
    //procedure DrawAngle(aCnv: TCanvas);
    //procedure DrawCompass(aCnv: TCanvas);

    function MeterWidth: Integer;
    function MeterHeight: Integer;
  private
    { Private declarations }
    FMapRect: TRect;

    FCanvas: TCanvas;

    { Map }
    FBitmapBackground: TBitmap;
    FMapCanvas: TCanvas;
    FLyrDraw: CMapXLayer;
    FCurrentRange: Double;  // meter
    FIndexRange: Integer;
    FMapConverter: TMapXUnitConverter;

    procedure SetImgBtn;

    procedure LoadInitMap;
    procedure LoadGeoset(const aGst: string); virtual;
    procedure DrawAll(aCnv: TCanvas; aCvt: TCoordConverter);

    procedure MapZoomIn;
    procedure MapZoomOut;
    procedure MapMove;
  public
    { Public declarations }
    procedure SetMonitor(aMonitorIdx, aLeft, aTop: Integer);

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

procedure TfrmRoutePlan.FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
begin
  if not Assigned(FCanvas) then
    Exit;

  FCanvas.Handle := hOutputDC;

  DrawAll(FCanvas, FMapConverter);
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

  FreeAndNil(FCanvas);

  EndC705;
end;

procedure TfrmRoutePlan.FormCreate(Sender: TObject);
begin
  Self.DoubleBuffered := False;
  EnableComposited(pnlBasemap);

  FCanvas := TCanvas.Create;

  { Load Map }
  LoadInitMap;

  { Form Show }
  Show;

  { Timer Map }
  tmrMap.Interval := 250;
  tmrMap.Enabled := True;

  { Load Button Image }
  SetImgBtn;
end;

procedure TfrmRoutePlan.FormShow(Sender: TObject);
begin
  Width := 1920;
  Height := 1080;

//  pnlBasemap.Width := Width;
//  pnlBasemap.Left := 0;
//  pnlBasemap.Top := Panel1.Top + Panel1.Height;
//  pnlBasemap.Height := Height;
  pnlBasemap.Align := alClient;

  FMapRect.Left := 5;
  FMapRect.Top := Panel1.Top + Panel1.Height + 5;
  FMapRect.Right := Width - 5;
  FMapRect.Bottom := Height - 5;

  //FMap.Visible := False;

  lblStatusMap.Caption := '';

  advpgcRoutePlanCmd.ActivePage := advtsCmdSet;
  advpgcTargetParam.ActivePage := advtsPage1;

  pnlNavInfo.Visible := False;

  pnlRoutePlanControlCmd.Left := pnlParamDisplay.Left;
  pnlRoutePlanControlCmd.Top := pnlPromptBoxMap.Top;
  pnlRoutePlanControlCmd.Visible := False;

  pnlParamDisplay.Visible := False;

  pnlWaypointLvl2.Top := pnlToolBar.Top - pnlWaypointLvl2.Height;
  pnlWaypointLvl2.Left := btnMoveMap.Left;
  pnlWaypointLvl2.Visible := False;

  pnlIslandLvl2.Top := pnlToolBar.Top - pnlWaypointLvl2.Height;
  pnlIslandLvl2.Left := btnDisplayChannel.Left;
  pnlIslandLvl2.Visible := False;
end;

{$REGION 'Map Section'}
procedure TfrmRoutePlan.MapMove;
begin
  FMap.CurrentTool := miPanTool;

  lblStatusMap.Caption := 'Move Map';
end;

procedure TfrmRoutePlan.MapZoomIn;
begin
  if self.FIndexRange > 0 then
  begin
    dec(self.FIndexRange);
    self.FCurrentRange := CRangeOperation[self.FIndexRange];
  end
  else
    self.FCurrentRange := CRangeOperation[0];

  FMap.ZoomTo((Self.FCurrentRange * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);
end;

procedure TfrmRoutePlan.MapZoomOut;
begin
  if self.FIndexRange < CCountRange - 1 then
  begin
    inc(self.FIndexRange);
    self.FCurrentRange := CRangeOperation[self.FIndexRange];
  end
  else
    self.FCurrentRange := CRangeOperation[CCountRange - 1];

  FMap.ZoomTo((Self.FCurrentRange * C_Meter_To_NauticalMile) * 2, FMap.CenterX, FMap.CenterY);
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
  FBitmapBackground.Canvas.Brush.Color := clBlack; // new color
  FBitmapBackground.Canvas.FillRect(Rect(0, 0, FBitmapBackground.Width, FBitmapBackground.Height));

  imgMapBackground.Picture.Assign(FBitmapBackground);

  LoadGeoset('.\data\mapsea\Indonesia.gst');
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
      y2 := y - 2*radiusShip;
      FCanvas.MoveTo(x1, y1);
      FCanvas.LineTo(x2, y2);

      FCanvas.TextOut(Round(xCntr), Round(yCntr) + 2*radiusShip, Ship.ID.ToString);
    end;
  end;
end;

procedure TfrmRoutePlan.tmrMapTimer(Sender: TObject);
begin
  FMap.Repaint;
end;

{$ENDREGION}

procedure TfrmRoutePlan.Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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

procedure TfrmRoutePlan.SetImgBtn;
var
  BMap: TBitmap;
  strPath: string;
begin
  strPath := '.\img\icon\Route Plan - Tool Bar\';

  {$REGION ' Button Exit Sub Window (Map Info dan Navigation Info '}
  btnExit_MapInfo.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
  btnExit_NavInfo.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
  btnExitRoutePlanCmd.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
  btnExitTargetParam.Glyph.LoadFromFile(strPath + 'btn_close.bmp');
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
  btnChangeMode.Glyph.LoadFromFile(strpath + 'Button Change Mode - Day.bmp');  // Night Mode
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

procedure TfrmRoutePlan.advpgcTargetParamChange(Sender: TObject);
begin
  btnExitTargetParam.Parent := advpgcTargetParam.ActivePage;
  advrbWayPt.Parent := advpgcTargetParam.ActivePage;
  advrbStartPt.Parent := advpgcTargetParam.ActivePage;
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

procedure TfrmRoutePlan.btnExitSubWindowClick(Sender: TObject);
begin
  case (Sender as TSpeedButtonImage).Tag of
    1: begin
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

{$REGION 'Tool Bar'}
procedure TfrmRoutePlan.btnToolBarsClick(Sender: TObject);
begin
  case (Sender as TSpeedButton).Tag of
    0: begin
      {$REGION 'Operating Mode'}
      FMap.CurrentTool := miArrowTool;
      {$ENDREGION}
    end;
    1: begin
      {$REGION 'Optimal Proportion'}
      //
      {$ENDREGION}
    end;
    2: begin
      {$REGION 'Ruler (Measuring Range)'}
      //
      {$ENDREGION}
    end;
    3: begin
      {$REGION 'Zoom In'}
      MapZoomIn;
      {$ENDREGION}
    end;
    4: begin
      {$REGION 'Zoom Out'}
      MapZoomOut;
      {$ENDREGION}
    end;
    5: begin
      {$REGION 'Move Map'}
      MapMove;
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
      {$REGION 'Change Mode'}
      //
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
      //
      {$ENDREGION}
    end;
    12: begin
      {$REGION 'Target Param Display'}
      pnlParamDisplay.Visible := not pnlParamDisplay.Visible;
      {$ENDREGION}
    end;
    13: begin
      {$REGION 'Route Control Command'}
      pnlRoutePlanControlCmd.Visible := not pnlRoutePlanControlCmd.Visible;
      {$ENDREGION}
    end;
    14: begin
      {$REGION 'Exit Route Plan'}
      Application.Terminate;
      {$ENDREGION}
    end;
  end;

end;
{$ENDREGION}

procedure TfrmRoutePlan.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop;
end;

end.

