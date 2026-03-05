unit uWaypointView;

interface

uses
  MapXLib_TLB, Vcl.Graphics,
    uMapXUnitConverter, uMapViewBase, uWaypointModel;

type
  TWaypointView = class(TMapViewBase)
  private
    FRoute: TRoutePlanning;
    FMapConverter: TMapXUnitConverter;
  public
    constructor Create(aMap: TMap;
                        aConverter: TMapXUnitConverter;
                        aRoute: TRoutePlanning); reintroduce;

    procedure Draw(aCnv: TCanvas); override;
  end;

implementation

{ TWaypointView }

constructor TWaypointView.Create(aMap: TMap; aConverter: TMapXUnitConverter;
  aRoute: TRoutePlanning);
begin
  inherited Create(aMap);

  FMapConverter := aConverter;
  FRoute := aRoute;
end;

procedure TWaypointView.Draw(aCnv: TCanvas);
var
  i: Integer;
  pt: TWaypoint;
  scrX, scrY: Integer;
begin
  if not Assigned(FRoute) then Exit;

  for i := 0 to FRoute.Waypoints.Count - 1 do
  begin
    pt := FRoute.Waypoints[i];

    // Convert world to Screen
    FMapConverter.ConvertToScreen(pt.Long, pt.Lat, scrX, scrY);

    // Draw waypoint
    aCnv.Brush.Color := clRed;
    aCnv.Pen.Color := clRed;
    aCnv.Ellipse(scrX-5, scrY-5, scrX+5, scrY+5);

    // Draw route line (garis antar titik)
    aCnv.Pen.Color := clYellow;
    if i = 0 then aCnv.MoveTo(scrX, scrY)
    else aCnv.LineTo(scrX, scrY);
  end;


end;

end.
