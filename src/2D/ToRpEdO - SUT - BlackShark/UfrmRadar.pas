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
    AdvComboBox1: TAdvComboBox;
    cbbMotionMode: TAdvComboBox;
    ImageButton1: TImageButton;
    ImageButton2: TImageButton;
    Label3: TLabel;
    FMap: TMap;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrDisplayTimer(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
      hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
  private
    { Private declarations }
    FDisplay: TRadarDisplay;
    FLastDisplayTick: UINT64;
    FDisplayFPS: Integer;
    FDeltaTimeDisplay: Double;
    FLyrDraw: CMapXLayer;
    FMapCanvas     : TCanvas;

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

procedure TfrmRadar.FMapDrawUserLayer(ASender: TObject; const Layer: IDispatch;
  hOutputDC, hAttributeDC: Integer; const RectFull, RectInvalid: IDispatch);
  var
  Tick: UINT64;
begin
  if Assigned(FMapCanvas) then
  begin
    FMapCanvas.Handle := hOutputDC;

    Tick := GetTickCount64;
    FDeltaTimeDisplay := (Tick - FLastDisplayTick) / 1000.0;
    FLastDisplayTick := Tick;

    FDisplay.Render(FDeltaTimeDisplay, FMapCanvas);
//    DrawAll(FMapCanvas, FMapConverter, FFlag);
  end;
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
  FDisplay.ContactShipHeadingVisible:= True;

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
