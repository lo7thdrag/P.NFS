unit uRulerView;

interface

uses
  MapXLib_TLB, Vcl.Graphics, Winapi.Windows, System.SysUtils,
  uMapXUnitConverter, uMapViewBase, uShipModel, uVehicleManager, uCoordConverter,
  uLibSettings, Math, uC705Launcher, uBaseFunction,
  System.Generics.Collections;

type
  TRulerMeasurement = record
    StartLong, StartLat,
    EndLong, EndLat,
    Range, Bearing : Double;
  end;

  TRulerView = class(TMapViewBase)
  private
    FMeasurements : TList<TRulerMeasurement>;

    FHasStartPoint,
    FHasCursorPoint : Boolean;
    FStartLong, FStartLat,
    FCursorLong, FCursorLat: Double;

  public
    constructor Create(aMap: TMap);
    destructor Destroy; override;

    procedure SetStartPoint(aLong, aLat: Double);
    procedure SetCursorPoint(aLong, aLat: Double);
    procedure FinishMeasurement(aLong, aLat: Double);

    procedure Clear;

    procedure Draw(aCnv: TCanvas; aCvt: TCoordConverter); override;

    property HasStartPoint: Boolean read FHasStartPoint;
  end;

implementation

uses
  uC705SimManager;

{ TRulerView }

constructor TRulerView.Create(aMap: TMap);
begin
  inherited Create(aMap);

  FMeasurements := TList<TRulerMeasurement>.create;

  FHasStartPoint := False;
  FHasCursorPoint := False;
end;

destructor TRulerView.Destroy;
begin
  FMeasurements.Free;

  inherited;
end;

procedure TRulerView.Draw(aCnv: TCanvas; aCvt: TCoordConverter);
var
  aMeasurement: TRulerMeasurement;

  x1, y1: Single;
  x2, y2: Single;

  StartLong, StartLat: Double;
  EndLong, EndLat: Double;

  MidX, MidY: Integer;

  Text: string;
begin
//  inherited;
  { ============================== }
  { HASIL PENGUKURAN YANG SUDAH FIX }
  { ============================== }

  for aMeasurement in FMeasurements do
  begin
    StartLong := aMeasurement.StartLong;
    StartLat  := aMeasurement.StartLat;

    EndLong := aMeasurement.EndLong;
    EndLat  := aMeasurement.EndLat;

    FMap.ConvertCoord(
      x1,
      y1,
      StartLong,
      StartLat,
      miMapToScreen
    );

    FMap.ConvertCoord(
      x2,
      y2,
      EndLong,
      EndLat,
      miMapToScreen
    );

    aCnv.Pen.Style := psDash;
    aCnv.Pen.Width := 1;
    aCnv.Pen.Color := RGB($AA, $00, $00);

    aCnv.MoveTo(
      Round(x1),
      Round(y1)
    );

    aCnv.LineTo(
      Round(x2),
      Round(y2)
    );

    { ============================== }
    { TEXT DI TENGAH GARIS }
    { ============================== }

    MidX := Round((x1 + x2) / 2);
    MidY := Round((y1 + y2) / 2);

    Text := Format(
      'Range=%.0f, Course=%.0f',
      [aMeasurement.Range, aMeasurement.Bearing]
    );

    aCnv.Font.Name := 'Arial';
    aCnv.Font.Size := 10;
    aCnv.Font.Color := RGB($AA, $00, $00);

    SetBkMode(
      aCnv.Handle,
      TRANSPARENT
    );

    aCnv.TextOut(
      MidX,
      MidY,
      Text
    );
  end;

  { ============================== }
  { GARIS SEMENTARA KE CURSOR }
  { ============================== }

  if FHasStartPoint and FHasCursorPoint then
  begin
    FMap.ConvertCoord(
      x1,
      y1,
      FStartLong,
      FStartLat,
      miMapToScreen
    );

    FMap.ConvertCoord(
      x2,
      y2,
      FCursorLong,
      FCursorLat,
      miMapToScreen
    );

    aCnv.Pen.Style := psDash;
    aCnv.Pen.Width := 1;
    aCnv.Pen.Color := RGB($AA, $00, $00);

    aCnv.MoveTo(
      Round(x1),
      Round(y1)
    );

    aCnv.LineTo(
      Round(x2),
      Round(y2)
    );
  end;

  { Kembalikan pen ke normal }
  aCnv.Pen.Style := psSolid;
end;

procedure TRulerView.Clear;
begin
  // Clear ketika klik kanan mouse
  FMeasurements.Clear;

  FHasStartPoint := False;
  FHasCursorPoint := False;
end;

procedure TRulerView.FinishMeasurement(aLong, aLat: Double);
var
  aMeasurement : TRulerMeasurement;
begin
  // Saat titik kedua diklik
  if not FHasStartPoint then
    Exit;

  aMeasurement.StartLong := FStartLong;
  aMeasurement.StartLat := FStartLat;

  aMeasurement.EndLong := aLong;
  aMeasurement.EndLat := aLat;

  aMeasurement.Range := CalcRange(FStartLong, FStartLat, aLong, aLat);
  aMeasurement.Bearing := CalcBearing(FStartLong, FStartLat, aLong, aLat);

  FMeasurements.Add(aMeasurement);

  // Reset untuk pengukuran berikutnya
  FHasStartPoint := False;
  FHasCursorPoint := False;
end;

procedure TRulerView.SetCursorPoint(aLong, aLat: Double);
begin
  // Saat cursor bergerak
  if not FHasStartPoint then
    Exit;

  FCursorLong := aLong;
  FCursorLat := aLat;

  FHasCursorPoint := True;
end;

procedure TRulerView.SetStartPoint(aLong, aLat: Double);
begin
  // Saat klik titik pertama
  FStartLong := aLong;
  FStartLat := aLat;

  FHasStartPoint := True;
  FHasCursorPoint := False;
end;

end.
