unit uWaypointModel;

interface

uses
  System.Generics.Collections;

type
  TWaypoint = class
  public
    Lat: double;
    Long: double;
  end;

  TRoutePlanning = class
  private
    FWaypoints: TObjectList<TWaypoint>;
  public
    constructor Create;
    destructor Destroy; override;

    function AddWaypoint(aLat, aLong: Double): TWaypoint;

    property Waypoints: TObjectList<TWaypoint> read FWaypoints;
  end;

implementation

{ TRoutePlanning }

constructor TRoutePlanning.Create;
begin
  FWaypoints := TObjectList<TWaypoint>.Create(True);
end;

destructor TRoutePlanning.Destroy;
begin
  FWaypoints.Free;
  inherited;
end;

function TRoutePlanning.AddWaypoint(aLat, aLong: Double): TWaypoint;
begin
  Result := TWaypoint.Create;
  Result.Lat := aLat;
  Result.Long := aLong;
  FWaypoints.Add(Result);
end;

end.
