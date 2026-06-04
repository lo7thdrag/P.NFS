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
  Vcl.StdCtrls;

type
  TfrmRadar = class(TForm)
    PaintBox1: TPaintBox;
    pnlTopRadar: TPanel;
    pnlBtmRadar: TPanel;
    btnZoomIn: TButton;
    btnZoomOut: TButton;
    tmrDisplay: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrDisplayTimer(Sender: TObject);
    procedure btnZoomInClick(Sender: TObject);
    procedure btnZoomOutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FDisplay: TRadarDisplay;
    FLastDisplayTick: UINT64;
    FDisplayFPS: Integer;
    FDeltaTimeDisplay: Double;
  public
    { Public declarations }
  end;

var
  frmRadar: TfrmRadar;
  LastTick: DWORD;

implementation

{$R *.dfm}

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
end;

procedure TfrmRadar.FormCreate(Sender: TObject);
begin
  Self.DoubleBuffered := False;
  Width := 800;
  Height := 600;

  EnableComposited(pnlBtmRadar);

  FDisplay := TRadarDisplay.Create(PaintBox1, 0, VehicleMgr.ObjectList);

  FDisplay.OwnShipID:= 0;
  FDisplay.RadarRangeNM:= 60.0;
  FDisplay.ZoomLevel:= 1.0;
  FDisplay.RadarRadiusPercentage:= 85.0;
  FDisplay.SweepTrailWidth:= 40;
  FDisplay.RPM:= 20.0;
  FDisplay.RangeRingCount:= 2;
  FDisplay.SectorCount:= 4;
  FDisplay.OwnShipHeadingVisible:= True;
  FDisplay.OuterRingCompassVisible:= True;
  FDisplay.SweepVisible:= True;
  FDisplay.ContactShipHeadingVisible:= True;

  FDisplay.BackgroundColor:= clBlack;
  FDisplay.CompasOuterRingColor:= clLime;
  FDisplay.RangeRingColor:= clLime;
  FDisplay.RangeRingTextColor:= clGray;
  FDisplay.SectorColor:= clGray;
  FDisplay.SectorTextColor:= clGray;
  FDisplay.OwnShipColor:= clLime;
  FDisplay.OwnShipHeadingColor:= clYellow;
  FDisplay.ContactTrackedColor:= clLime;
  FDisplay.ContactTrackedTextColor:= clLime;


  FLastDisplayTick := GetTickCount64;
  FDisplayFPS:= 25;

  tmrDisplay.Interval := Trunc(1000 / FDisplayFPS);
  tmrDisplay.Enabled := True;
end;

procedure TfrmRadar.FormShow(Sender: TObject);
begin
  //
end;

procedure TfrmRadar.tmrDisplayTimer(Sender: TObject);
var
  Tick: UINT64;
begin
  Tick := GetTickCount64;
  FDeltaTimeDisplay := (Tick - FLastDisplayTick) / 1000.0;
  FLastDisplayTick := Tick;
  FDisplay.Update(FDeltaTimeDisplay);
end;

end.
