unit uVehicle;

interface

uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows; // <-- TRadarTargetSymbol di sini

type
  // tipe koordinat posisi vehicle (samakan dengan peta kamu)
  TVehicleCoordType = (vctGeographicDeg, vctProjectedMeters);

  TVehicle = class
  private
    // state dinamis
    FPosX, FPosY, FPosZ : Double;   // Map coords (Lon/Lat deg atau meter)
    FSpeed_mps          : Double;   // m/s
    FHeadingDeg         : Double;   // 0=N, cw
    FRollDeg            : Double;   // opsional

    FCoordType          : TVehicleCoordType;

    // penautan ke peta/simbol
    FSymbol             : TRadarTargetSymbol;

    procedure SyncSymbolFromState; // push PosX/Y -> Symbol.MapX/MapY
  public
    constructor Create; overload;
    constructor Create(aSymbol: TRadarTargetSymbol); overload;
    destructor Destroy; override;

    // properti state
    property PosX      : Double read FPosX write FPosX;
    property PosY      : Double read FPosY write FPosY;
    property PosZ      : Double read FPosZ write FPosZ;
    property Speed_mps : Double read FSpeed_mps write FSpeed_mps;
    property HeadingDeg: Double read FHeadingDeg write FHeadingDeg;
    property RollDeg   : Double read FRollDeg write FRollDeg;
    property CoordType : TVehicleCoordType read FCoordType write FCoordType;

    // simbol di peta
    property Symbol    : TRadarTargetSymbol read FSymbol;

    // helper kecepatan
    procedure SetSpeedKts(AKnots: Double);
    procedure SetSpeedKmh(AKmh: Double);

    // update posisi berdasarkan speed+heading selama dt detik
    procedure UpdateKinematics(const dtSeconds: Double);

    // panggil sebelum draw (atau manager akan memanggil otomatis)
    procedure PrepareForDraw;
  end;

implementation

{ TVehicle }

constructor TVehicle.Create;
begin
  inherited Create;
  FPosX := 0; FPosY := 0; FPosZ := 0;
  FSpeed_mps := 0;
  FHeadingDeg := 0;
  FRollDeg := 0;
  FCoordType := vctGeographicDeg;

  FSymbol := TRadarTargetSymbol.Create;
  // default tampilan symbol bisa diset di sini
  FSymbol.TrackFontSize   := 8;
  FSymbol.CircleRadius    := 3;
  FSymbol.CircleColorNormal   := clLime;
  FSymbol.CircleColorSelected := clYellow;
  // contoh default: font segitiga
  // FSymbol.SetFontSymbol('Segoe UI Symbol','▲', clLime, clYellow, 10);
end;

constructor TVehicle.Create(aSymbol: TRadarTargetSymbol);
begin
  Create;
  if Assigned(aSymbol) then
  begin
    FSymbol.Free;
    FSymbol := aSymbol;
  end;
end;

destructor TVehicle.Destroy;
begin
  FSymbol.Free;
  inherited;
end;

procedure TVehicle.SetSpeedKts(AKnots: Double);
const KNOT_TO_MPS = 0.514444444;
begin
  FSpeed_mps := AKnots * KNOT_TO_MPS;
end;

procedure TVehicle.SetSpeedKmh(AKmh: Double);
const KMH_TO_MPS = 1000.0 / 3600.0;
begin
  FSpeed_mps := AKmh * KMH_TO_MPS;
end;

procedure TVehicle.UpdateKinematics(const dtSeconds: Double);
const
  R_EARTH = 6378137.0; // meter
var
  dist_m, ang, dn, de: Double;
  latRad, dLat_deg, dLon_deg: Double;
begin
  if (dtSeconds <= 0) or (FSpeed_mps = 0) then Exit;

  ang    := DegToRad(FHeadingDeg);
  dist_m := FSpeed_mps * dtSeconds;
  dn     := dist_m * Cos(ang); // north
  de     := dist_m * Sin(ang); // east

  case FCoordType of
    vctProjectedMeters:
      begin
        FPosX := FPosX + de;  // Easting
        FPosY := FPosY + dn;  // Northing
      end;
    vctGeographicDeg:
      begin
        // FPosY=Lat(deg), FPosX=Lon(deg)
        dLat_deg := (dn / R_EARTH) * (180.0 / PI);
        latRad   := DegToRad(FPosY);
        if Abs(Cos(latRad)) < 1e-9 then
          dLon_deg := 0
        else
          dLon_deg := (de / (R_EARTH * Cos(latRad))) * (180.0 / PI);

        FPosY := FPosY + dLat_deg;
        FPosX := FPosX + dLon_deg;
      end;
  end;
end;

procedure TVehicle.SyncSymbolFromState;
begin
  FSymbol.MapX := FPosX;
  FSymbol.MapY := FPosY;
end;

procedure TVehicle.PrepareForDraw;
begin
  SyncSymbolFromState;
end;

end.

