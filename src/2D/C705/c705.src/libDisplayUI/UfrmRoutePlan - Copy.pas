unit UfrmRoutePlan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, VrControls, VrDesign, Vcl.Imaging.pngimage,
  Vcl.Buttons, Vcl.OleCtrls, Vcl.Menus, MapXLib_TLB, Math, uCoordConverter,
  uBaseFunction, uBaseConst, uMapXUnitConverter, uLibConst, OverbyteIcsWSocket,
  uTCPDatatype, uC705SimManager, uLibSettings, uScriptC705, uShipModel,
  uVehicleManager, SpeedButtonImage;

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
    pnlExitRoutePl: TPanel;
    imgExitRoutePl: TImage;
    pnlDefaultView: TPanel;
    imgDefaultView: TImage;
    pnlRuler: TPanel;
    imgRuler: TImage;
    pnlZoomIn: TPanel;
    imgZoomIn: TImage;
    pnlZoomOut: TPanel;
    imgZoomOut: TImage;
    pnlMove: TPanel;
    imgMove: TImage;
    pnlUnavailableState: TPanel;
    imgUnavailableState: TImage;
    pnlExitObstacle: TPanel;
    imgExitObstacle: TImage;
    pnlNightMode: TPanel;
    imgNightMode: TImage;
    pnlDisplayCh: TPanel;
    imgDIsplayCh: TImage;
    pnlPulau: TPanel;
    imgPulau: TImage;
    pnlInformation: TPanel;
    imgInformation: TImage;
    pnlTargetParam: TPanel;
    imgTargetParam: TImage;
    pnlRouteCtrlCommand: TPanel;
    imgRouteCtrlCommand: TImage;
    pnlShiftOpMode: TPanel;
    imgShiftOpMode: TImage;
    imgMapBackground: TImage;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    WCC1: TMenuItem;
    tmrMap: TTimer;
    pnlMapInfo: TPanel;
    btnExit_MapInfo: TSpeedButtonImage;
    Panel4: TPanel;
    Label8: TLabel;
    pnlPromptBoxMap: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label17: TLabel;
    pnlNavInfo: TPanel;
    btnExit_NavInfo: TSpeedButtonImage;
    Label18: TLabel;
    pnlPromptBoxNav: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Close1Click(Sender: TObject);
    procedure WCC1Click(Sender: TObject);
    procedure imgZoomInClick(Sender: TObject);
    procedure imgZoomOutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch; hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure tmrMapTimer(Sender: TObject);
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
    imgListClose: TImageList;

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
  SetImgBtn;
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
procedure TfrmRoutePlan.imgZoomInClick(Sender: TObject);
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

procedure TfrmRoutePlan.imgZoomOutClick(Sender: TObject);
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
  strPath := '.\img\icon\';

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
  btnExit_MapInfo.ImageList := 0;
  {$ENDREGION}
end;

procedure TfrmRoutePlan.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop;
end;

end.

