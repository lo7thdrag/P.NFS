unit uSurfaceTrack;

interface
  uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows, uBaseObject, uSimulationTrack;

type
  TTrackQuality = (ttqNone, ttqNrt, ttqRt);

  TSurfaceTrack = class(TSimulationTrack)
  private
    FTrackQuality: TTrackQuality;
    FDataValidTime: TDateTime;

  public
    constructor Create; overload;
    destructor Destroy; override;
    property TrackQuality : TTrackQuality read FTrackQuality write FTrackQuality;
    property DataValidTime : TDateTime read FDataValidTime write FDataValidTime;

  end;
implementation

{ TSurfaceTrack }

constructor TSurfaceTrack.Create;
begin
  inherited Create;
  FTrackQuality := ttqNone;
  FDataValidTime := Now;
end;

destructor TSurfaceTrack.Destroy;
begin

  inherited;
end;

end.
