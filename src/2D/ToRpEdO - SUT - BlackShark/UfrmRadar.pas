unit UfrmRadar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Contnrs,
  System.Math,
  uVehicleManager,

//  uC705SimManager,
//  uShipModel,
  uRadarSensor,
  uSutBlacksharkManager,
  Vcl.StdCtrls, ImageButton, AdvCombo, Vcl.OleCtrls, MapXLib_TLB;

type
  TfrmRadar = class(TForm)
    PaintBox1: TPaintBox;
    pnlTopRadar: TPanel;
    pnlBtmRadar: TPanel;
    btnZoomIn: TButton;
    btnZoomOut: TButton;
    tmrDisplay: TTimer;
    cbbZoomScale: TAdvComboBox;
    cbbMotionMode: TAdvComboBox;
    ibBoxedZoom: TImageButton;
    ibGrab: TImageButton;
    lblZoomScaleSat: TLabel;
    FMap: TMap;
    ibZoomIn: TImageButton;
    ibZoomOut: TImageButton;
    lblMapFilter: TLabel;
    lblOwnShipCenter: TLabel;
    lblCursorCenter: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrDisplayTimer(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
    procedure ibGrabClick(Sender: TObject);
    procedure ibBoxedZoomClick(Sender: TObject);
    procedure FMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lblCursorCenterClick(Sender: TObject);
    procedure lblOwnShipCenterClick(Sender: TObject);
  private
    { Private declarations }
    FDisplay: TRadarDisplay;
    FLastDisplayTick: UINT64;
    FDisplayFPS: Integer;
    FDeltaTimeDisplay: Double;
    FLyrDraw: CMapXLayer;
    FMapCanvas     : TCanvas;
    FCursorX, FCursorY :Double;

    procedure LoadGeoset(const aGst: string); virtual;
  public
    { Public declarations }
  end;

var
  frmRadar: TfrmRadar;
  LastTick: DWORD;

implementation

{$R *.dfm}

uses uBaseFunction;

{ TfrmRadar }

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

procedure TfrmRadar.btnZoomInClick(Sender: TObject);
begin
  FDisplay.ZoomLevel := FDisplay.ZoomLevel * 1.1;
end;

procedure TfrmRadar.btnZoomOutClick(Sender: TObject);
begin
  if FDisplay.ZoomLevel > 1.0 then
    FDisplay.ZoomLevel := FDisplay.ZoomLevel / 1.1;
end;

procedure TfrmRadar.FormDestroy(Sender: TObject);
begin
  FDisplay.Free;
  FMapCanvas.Free;
end;

procedure TfrmRadar.ibBoxedZoomClick(Sender: TObject);
begin
  // zoom ke box yang dibuat
end;

procedure TfrmRadar.ibGrabClick(Sender: TObject);
begin
  // ganti mode grab kalo lagi di true motion
end;

procedure TfrmRadar.lblCursorCenterClick(Sender: TObject);
begin
  // cursor center
end;

procedure TfrmRadar.lblOwnShipCenterClick(Sender: TObject);
begin
  // ownship center
end;

procedure TfrmRadar.FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
  hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
  var
  Tick: UINT64;
  CrsrX, CrsrY : Single;
begin
  if Assigned(FMapCanvas) then
  begin
    FMapCanvas.Handle := hOutputDC;

    Tick := GetTickCount64;
    FDeltaTimeDisplay := (Tick - FLastDisplayTick) / 1000.0;
    FLastDisplayTick := Tick;

    FDisplay.Render(FDeltaTimeDisplay, FMapCanvas);
    if FCursorX <> 0 then
    begin
      FMapCanvas.Pen.Color := clWhite;
      FMapCanvas.Pen.Style := psSolid;
      FMapCanvas.Pen.Width := 1;

      FMapCanvas.Brush.Color := clWhite;
      FMapCanvas.Brush.Style := bsSolid;
      FMap.ConvertCoord(CrsrX, CrsrY, FCursorX, FCursorY, 0);

      FMapCanvas.Rectangle(Round(CrsrX)-1, Round(CrsrY)-15, Round(CrsrX)+1, Round(CrsrY)-4); // cursor bagian atas
      FMapCanvas.Rectangle(Round(CrsrX)-1, Round(CrsrY)+15, Round(CrsrX)+1, Round(CrsrY)+4); // cursor bagian bawah

      FMapCanvas.Rectangle(Round(CrsrX)-15, Round(CrsrY)-1, Round(CrsrX)-4, Round(CrsrY)+1); // cursor bagian kiri
      FMapCanvas.Rectangle(Round(CrsrX)+4, Round(CrsrY)-1, Round(CrsrX)+15, Round(CrsrY)+1); // cursor bagian kanan
    end;

//    DrawAll(FMapCanvas, FMapConverter, FFlag);
  end;
end;

procedure TfrmRadar.FMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
posX, posY :Single;
begin
  // create cursor dan gambar cursor, juga kirim posisi cursor ke blackshark manager buat di set di form cursor
  posX := x;
  posY := y;
  FMap.ConvertCoord(posX, posY, FCursorX, FCursorY, 1);
//  FMapCanvas.Pen.Color := clWhite;
//  FMapCanvas.Pen.Style := psClear;
//  FMapCanvas.Pen.Width := 1;
//
//  FMapCanvas.Brush.Color := RGB(243, 235, 118);
//  FMapCanvas.Brush.Style := bsSolid;
//  FMapCanvas.Rectangle(x-1, y-6, x+1, y-6); // cursor bagian atas
//  FMapCanvas.Rectangle(x-1, y+6, x+1, y+6); // cursor bagian bawah
end;

procedure TfrmRadar.FormCreate(Sender: TObject);
begin
//  Self.DoubleBuffered := False;
  Width := 800;
  Height := 600;

  EnableComposited(FMap);
  EnableComposited(pnlBtmRadar);
  pnlBtmRadar.DoubleBuffered := False;
  FMap.DoubleBuffered := False;
//  frmRadar.DoubleBuffered := false;


  FDisplay := TRadarDisplay.Create(FMap, 0, VehicleMgr.ObjectList);

  FDisplay.OwnShipID:= 0;
  FDisplay.RadarRangeNM:= 60.0;
  FDisplay.ZoomLevel:= 10.0;
  FDisplay.RadarRadiusPercentage:= 85.0;
  FDisplay.SweepTrailWidth:= 40;
  FDisplay.RPM:= 20.0;
  FDisplay.RangeRingCount:= 2;
  FDisplay.SectorCount:= 12;
  FDisplay.OwnShipHeadingVisible:= False;
  FDisplay.OuterRingCompassVisible:= True;
  FDisplay.SweepVisible:= False;
  FDisplay.ContactShipHeadingVisible:= false;

  FDisplay.BackgroundColor:= clBlack;
  FDisplay.CompasOuterRingColor:= clLime;
  FDisplay.RangeRingColor:= clLime;
  FDisplay.RangeRingTextColor:= clGray;
  FDisplay.SectorColor:= clGray;
  FDisplay.SectorTextColor:= clGray;
  FDisplay.OwnShipColor:= RGB(107,157,173);
  FDisplay.OwnShipHeadingColor:= clYellow;
  FDisplay.ContactTrackedColor:= clLime;
  FDisplay.ContactTrackedTextColor:= clLime;

  FLastDisplayTick := GetTickCount64;
//  FDisplayFPS:= 25;

//  tmrDisplay.Interval := Trunc(1000 / FDisplayFPS);
//  tmrDisplay.Enabled := True;

  FMapCanvas := TCanvas.Create;
  LoadGeoset('..\data\maps\IndonesiaBlackShark.gst');
end;

procedure TfrmRadar.LoadGeoset(const aGst: string);
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
    FMap.BackColor := $000000000;
    FMap.MapUnit := miUnitNauticalMile;
    FMap.CenterX := 112.75;
    fmap.CenterY := -7.2;
    FMap.ZoomTo(50, FMap.CenterX, FMap.CenterY);
  end
end;

procedure TfrmRadar.tmrDisplayTimer(Sender: TObject);
var
  Tick: UINT64;
begin
//  Tick := GetTickCount64;
//  FDeltaTimeDisplay := (Tick - FLastDisplayTick) / 1000.0;
//  FLastDisplayTick := Tick;
//  FDisplay.Update(FDeltaTimeDisplay);
end;

end.
