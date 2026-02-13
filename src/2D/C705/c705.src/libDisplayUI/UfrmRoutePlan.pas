unit UfrmRoutePlan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, VrControls, VrDesign, Vcl.Imaging.pngimage,
  Vcl.Buttons, Vcl.OleCtrls, Vcl.Menus, MapXLib_TLB, Math, uCoordConverter,
  uBaseFunction, uBaseConst, uMapXUnitConverter, uLibConst, OverbyteIcsWSocket,
  uTCPDatatype, uC705SimManager, uLibSettings, uScriptC705, uShipModel,
  uVehicleManager, SpeedButtonImage, AdvGroupBox, AdvPageControl, Vcl.ComCtrls;

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
    btnExitRoutePl: TSpeedButtonImage;
    btnOperatingMode: TSpeedButtonImage;
    btnOptimalProportion: TSpeedButtonImage;
    btnRuler: TSpeedButtonImage;
    btnZoomIn: TSpeedButtonImage;
    btnZoomOut: TSpeedButtonImage;
    btnMoveMap: TSpeedButtonImage;
    btnManualRoutePl: TSpeedButtonImage;
    btnObstacleAvoidance: TSpeedButtonImage;
    btnChangeMode: TSpeedButtonImage;
    btnDisplayChannel: TSpeedButtonImage;
    btnEditIsland: TSpeedButtonImage;
    btnObstacleInfo: TSpeedButtonImage;
    btnTargetParamDisplay: TSpeedButtonImage;
    btnRouteCmdWindow: TSpeedButtonImage;
    advpgcTargetParam: TAdvPageControl;
    advtsPage1: TAdvTabSheet;
    advtsPage2: TAdvTabSheet;
    advtsPage3: TAdvTabSheet;
    advtsPage4: TAdvTabSheet;
    AdvGroupBox1: TAdvGroupBox;
    AdvGroupBox2: TAdvGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label15: TLabel;
    Edit3: TEdit;
    Label16: TLabel;
    Edit4: TEdit;
    Label17: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit9: TEdit;
    Label27: TLabel;
    Edit10: TEdit;
    Label28: TLabel;
    Edit11: TEdit;
    Label29: TLabel;
    Edit12: TEdit;
    Label30: TLabel;
    Edit13: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    edtLong1: TEdit;
    edtLat1: TEdit;
    Label35: TLabel;
    edtLong2: TEdit;
    edtLat2: TEdit;
    Label36: TLabel;
    edtLong3: TEdit;
    edtLat4: TEdit;
    edtLong4: TEdit;
    Label37: TLabel;
    edtLat3: TEdit;
    Label38: TLabel;
    Image2: TImage;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Close1Click(Sender: TObject);
    procedure WCC1Click(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure tmrMapTimer(Sender: TObject);
    procedure btnMoveMapClick(Sender: TObject);
  protected
    //procedure DrawAngle(aCnv: TCanvas);
    //procedure DrawCompass(aCnv: TCanvas);

    function MeterWidth: Integer;
    function MeterHeight: Integer;
  private
    { Private declarations }
    FMapRect: TRect;

    FCanvas: TCanvas;

    { Image List for Button }
    imgListClose,
    imgListOperatingMode,
    imgListOptimalProportion,
    imgListRuler,
    imgListZoomIn,
    imgListZoomOut,
    imgListMoveMap,
    imgListManualRoutePl,
    imgListObstacleAvoidance,
    imgListDisplayChannel,
    imgListChangeMode,
    imgListEditIsland,
    imgListRouteCmdWindow,
    imgListObstacleInfo,
    imgListTargetParamDisplay,
    imgListExitRoutePl : TImageList;

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
  //SetImgBtn;
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

  FreeAndNil(imgListClose);
  FreeAndNil(imgListOperatingMode);
  FreeAndNil(imgListOptimalProportion);
  FreeAndNil(imgListRuler);
  FreeAndNil(imgListZoomIn);
  FreeAndNil(imgListZoomOut);
  FreeAndNil(imgListMoveMap);
  FreeAndNil(imgListManualRoutePl);
  FreeAndNil(imgListObstacleAvoidance);
  FreeAndNil(imgListDisplayChannel);
  FreeAndNil(imgListChangeMode);
  FreeAndNil(imgListEditIsland);
  FreeAndNil(imgListRouteCmdWindow);
  FreeAndNil(imgListObstacleInfo);
  FreeAndNil(imgListTargetParamDisplay);

  EndC705;
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
end;

{$REGION 'Map Section'}
procedure TfrmRoutePlan.btnMoveMapClick(Sender: TObject);
begin
  FMap.CurrentTool := miPanTool;

  lblStatusMap.Caption := 'Move Map';
end;

procedure TfrmRoutePlan.btnZoomInClick(Sender: TObject);
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

procedure TfrmRoutePlan.btnZoomOutClick(Sender: TObject);
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
  strPath := '.\img\icon\Route Plan - Tool Bar';

  {$REGION ' Button Exit Sub Window (Map Info dan Navigation Info '}
  imgListClose := TImageList.Create(Self);
  imgListClose.Width := btnExit_MapInfo.Width;
  imgListClose.Height := btnExit_MapInfo.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strPath + 'btn_close.bmp');
  finally
    imgListClose.Add(BMap, nil);
    BMap.Free;
  end;

  btnExit_MapInfo.ImageList := imgListClose;
  btnExit_MapInfo.ImageIndex := 0;

  btnExit_NavInfo.ImageList := imgListClose;
  btnExit_MapInfo.ImageIndex := 0;
  {$ENDREGION}

  {$REGION ' Button Operating Mode '}
  imgListOperatingMode := TImageList.Create(Self);
  imgListOperatingMode.Width := btnOperatingMode.Width;
  imgListOperatingMode.Height := btnOperatingMode.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Operating Mode.bmp');
  finally
    imgListOperatingMode.Add(BMap, nil);
    BMap.Free;
  end;

  btnOperatingMode.ImageList := imgListOperatingMode;
  btnOperatingMode.ImageIndex := 0;
  {$ENDREGION}

  {$REGION ' Button Optimal Proportion '}
  imgListOptimalProportion := TImageList.Create(Self);
  imgListOptimalProportion.Width := btnOptimalProportion.Width;
  imgListOptimalProportion.Height := btnOptimalProportion.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Optimal Prop - Available.bmp');
  finally
    imgListOptimalProportion.Add(BMap, nil); // available state
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Optimal Prop - Unavailable.bmp');  // unavailable state
  finally
    imgListOptimalProportion.Add(BMap, nil);
    BMap.Free;
  end;

  btnOptimalProportion.ImageList := imgListOptimalProportion;
  btnOptimalProportion.ImageIndex := 0; // available state
  {$ENDREGION}

  {$REGION ' Button Ruler (Measuring Range) '}
  imgListRuler := TImageList.Create(Self);
  imgListRuler.Width := btnRuler.Width;
  imgListRuler.Height := btnRuler.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Range - Available.bmp');  // available state
  finally
    imgListRuler.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Range - Unavailable.bmp');  // unavailable state
  finally
    imgListRuler.Add(BMap, nil);
    BMap.Free;
  end;

  btnRuler.ImageList := imgListRuler;
  btnRuler.ImageIndex := 0; // available state
  {$ENDREGION}

  {$REGION ' Button Zoom In '}
  imgListZoomIn := TImageList.Create(Self);
  imgListZoomIn.Width := btnZoomIn.Width;
  imgListZoomIn.Height := btnZoomIn.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Zoom In - Available.bmp');  // available state
  finally
    imgListZoomIn.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Zoom In - Unavailable.bmp');  // available state
  finally
    imgListZoomIn.Add(BMap, nil);
    BMap.Free;
  end;

  btnZoomIn.ImageList := imgListZoomIn;
  btnZoomIn.ImageIndex := 0; // available state
  {$ENDREGION}

  {$REGION ' Button Zoom Out '}
  imgListZoomOut:= TImageList.Create(Self);
  imgListZoomOut.Width := btnZoomOut.Width;
  imgListZoomOut.Height := btnZoomOut.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Zoom Out - Available.bmp');  // available state
  finally
    imgListZoomOut.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Zoom Out - Unavailable.bmp');  // available state
  finally
    imgListZoomOut.Add(BMap, nil);
    BMap.Free;
  end;

  btnZoomOut.ImageList := imgListZoomOut;
  btnZoomOut.ImageIndex := 0; // available state
  {$ENDREGION}

  {$REGION ' Button Move Map '}
  imgListMoveMap := TImageList.Create(Self);
  imgListMoveMap.Width := btnMoveMap.Width;
  imgListMoveMap.Height := btnMoveMap.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Move Map - Available.bmp');  // available state
  finally
    imgListMoveMap.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Move Map - Unavailable.bmp');  // unavailable state
  finally
    imgListMoveMap.Add(BMap, nil);
    BMap.Free;
  end;

  btnMoveMap.ImageList := imgListMoveMap;
  btnMoveMap.ImageIndex := 0; // available state
  {$ENDREGION}

  {$REGION ' Button Manual Route Planning '}
  imgListManualRoutePl := TImageList.Create(Self);
  imgListManualRoutePl.Width := btnManualRoutePl.Width;
  imgListManualRoutePl.Height := btnManualRoutePl.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Manual Route Plan - Available.bmp');  // available state
  finally
    imgListManualRoutePl.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Manual Route Plan - Unavailable.bmp');  // unavailable state
  finally
    imgListManualRoutePl.Add(BMap, nil);
    BMap.Free;
  end;

  btnManualRoutePl.ImageList := imgListManualRoutePl;
  btnManualRoutePl.ImageIndex := 0; // available state
  {$ENDREGION}

  {$REGION ' Button Obstacle Avoidance '}
  imgListObstacleAvoidance := TImageList.Create(Self);
  imgListObstacleAvoidance.Width := btnObstacleAvoidance.Width;
  imgListObstacleAvoidance.Height := btnObstacleAvoidance.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Obstacle Avoidance.bmp');  // obstacle avoidance check
  finally
    imgListObstacleAvoidance.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Obstacle Avoidance - Exit.bmp');  // exit obstacle avoidance
  finally
    imgListObstacleAvoidance.Add(BMap, nil);
    BMap.Free;
  end;

  btnObstacleAvoidance.ImageList := imgListObstacleAvoidance;
  btnObstacleAvoidance.ImageIndex := 0; // obstacle avoidance check
  {$ENDREGION}

  {$REGION ' Button Change Mode (Day Mode & Night Mode '}
  imgListChangeMode := TImageList.Create(Self);
  imgListChangeMode.Width := btnChangeMode.Width;
  imgListChangeMode.Height := btnChangeMode.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Change Mode - Day.bmp');  // Night Mode
  finally
    imgListChangeMode.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Change Mode - Night.bmp');  // Night Mode
  finally
    imgListChangeMode.Add(BMap, nil);
    BMap.Free;
  end;

  btnChangeMode.ImageList := imgListChangeMode;
  btnChangeMode.ImageIndex := 0; // Night Mode
  {$ENDREGION}

  {$REGION ' Button Display Channel '}
  imgListDisplayChannel := TImageList.Create(Self);
  imgListDisplayChannel.Width := btnDisplayChannel.Width;
  imgListDisplayChannel.Height := btnDisplayChannel.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Display Channel.bmp');  // display channel
  finally
    imgListDisplayChannel.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Hide Channel.bmp');  // hide channel
  finally
    imgListDisplayChannel.Add(BMap, nil);
    BMap.Free;
  end;

  btnDisplayChannel.ImageList := imgListDisplayChannel;
  btnDisplayChannel.ImageIndex := 0; // display channel
  {$ENDREGION}

  {$REGION ' Button Edit Island/ Edit Pulau '}
  imgListEditIsland := TImageList.Create(Self);
  imgListEditIsland.Width := btnEditIsland.Width;
  imgListEditIsland.Height := btnEditIsland.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Edit Island.bmp');
  finally
    imgListEditIsland.Add(BMap, nil);
    BMap.Free;
  end;

  btnEditIsland.ImageList := imgListEditIsland;
  btnEditIsland.ImageIndex := 0;
  {$ENDREGION}

  {$REGION ' Button Obstacle Information Display '}
  imgListObstacleInfo := TImageList.Create(Self);
  imgListObstacleInfo.Width := btnObstacleInfo.Width;
  imgListObstacleInfo.Height := btnObstacleInfo.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Obstacle Information Window - Available.bmp');  // available state
  finally
    imgListObstacleInfo.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Obstacle Information Window - Unavailable.bmp');  // unavailable state
  finally
    imgListObstacleInfo.Add(BMap, nil);
    BMap.Free;
  end;

  btnObstacleInfo.ImageList := imgListObstacleInfo;
  btnObstacleInfo.ImageIndex := 0; // available state
  {$ENDREGION}

  {$REGION ' Button Target Parameter '}
  imgListTargetParamDisplay := TImageList.Create(Self);
  imgListTargetParamDisplay.Width := btnTargetParamDisplay.Width;
  imgListTargetParamDisplay.Height := btnTargetParamDisplay.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Target Param Window.bmp');
  finally
    imgListTargetParamDisplay.Add(BMap, nil);
    BMap.Free;
  end;

  btnTargetParamDisplay.ImageList := imgListTargetParamDisplay;
  btnTargetParamDisplay.ImageIndex := 0;
  {$ENDREGION}

  {$REGION ' Button Route Control Command '}
  imgListRouteCmdWindow := TImageList.Create(Self);
  imgListRouteCmdWindow.Width := btnRouteCmdWindow.Width;
  imgListRouteCmdWindow.Height := btnRouteCmdWindow.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Route Comand Window - Available.bmp');
  finally
    imgListRouteCmdWindow.Add(BMap, nil);
    BMap.Free;
  end;

  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Route Comand Window - Unavailable.bmp');
  finally
    imgListRouteCmdWindow.Add(BMap, nil);
    BMap.Free;
  end;

  btnRouteCmdWindow.ImageList := imgListRouteCmdWindow;
  btnRouteCmdWindow.ImageIndex := 0;
  {$ENDREGION}

  {$REGION ' Button Exit Rotue Plan '}
  imgListExitRoutePl := TImageList.Create(Self);
  imgListExitRoutePl.Width := btnExitRoutePl.Width;
  imgListExitRoutePl.Height := btnExitRoutePl.Height;
  try
    BMap := TBitmap.Create;
    BMap.LoadFromFile(strpath + 'Button Exit Route Plan.bmp');
  finally
    imgListExitRoutePl.Add(BMap, nil);
    BMap.Free;
  end;

  btnExitRoutePl.ImageList := imgListExitRoutePl;
  btnExitRoutePl.ImageIndex := 0;
  {$ENDREGION}
end;

procedure TfrmRoutePlan.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop;
end;

end.

