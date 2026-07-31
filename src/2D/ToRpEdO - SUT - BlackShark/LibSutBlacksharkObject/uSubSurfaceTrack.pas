unit uSubSurfaceTrack;

interface
  uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows, uBaseObject, uSimulationTrack;

type
  TDataReportType = (drtNone, drtSubSurface, drtDatum);
  TSubmarineConfLevel = (sclNone, sclPSLow1, sclPSLow2, sclPSHigh3, sclPSHigh4, sclProbSub, sclCertSub, sclNonSub, sclAcoPos);
  TEstimatedDepth = (tedNone, tedUnknown, tedEstShallow, tedAbvLayer, tedBlwLayer, tedEstDeep, tedBottomed, tedPerisc);

  TSubSurfaceTrack = class(TSimulationTrack)
  private
    FDataReportType: TDataReportType;
    FDatumTime: TDateTime;
    FSubmarineConfLevel: TSubmarineConfLevel;
    FEstimatedDepth: TEstimatedDepth;

  public
    constructor Create; overload;
    destructor Destroy; override;
    property DataReportType : TDataReportType read FDataReportType write FDataReportType;
    property DatumTime : TDateTime read FDatumTime write FDatumTime;
    property SubmarineConfLevel : TSubmarineConfLevel read FSubmarineConfLevel write FSubmarineConfLevel;
    property EstimatedDepth : TEstimatedDepth read FEstimatedDepth write FEstimatedDepth;

  end;
implementation

{ TSubSurfaceTrack }

constructor TSubSurfaceTrack.Create;
begin
  inherited Create;
  FDataReportType := drtSubSurface;
  FDatumTime := Now;
  FSubmarineConfLevel := sclNone;
  FEstimatedDepth := tedNone;
end;

destructor TSubSurfaceTrack.Destroy;
begin

  inherited;
end;

end.
