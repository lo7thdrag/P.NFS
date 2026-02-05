unit uPhysicsEngine;

interface

uses
  System.Contnrs, System.Math,

  uShipModel;

type

  { --- PHYSICS DOMAIN: Movement Engine --- }
  TMovementEngine = class
  private
    FContacts: TObjectList;
  public
    constructor Create(ASharedList: TObjectList);
    procedure Update(DeltaTimeSeconds: Double);
  end;

implementation

{ TMovementEngine }

constructor TMovementEngine.Create(ASharedList: TObjectList);
begin
  FContacts := ASharedList;
end;

procedure TMovementEngine.Update(DeltaTimeSeconds: Double);
var
  i: Integer;
  Ship: TShipContact;
  Hours, LatAdj: Double;
begin
  Hours := DeltaTimeSeconds / 3600.0;
  for i := 0 to FContacts.Count - 1 do
  begin
    Ship := TShipContact(FContacts[i]);
    LatAdj := Cos(DegToRad(Ship.Lat));
    Ship.Lat := Ship.Lat + (Ship.Speed * Cos(DegToRad(Ship.Heading)) *
      Hours / 60.0);
    Ship.Lon := Ship.Lon + (Ship.Speed * Sin(DegToRad(Ship.Heading)) * Hours /
      (60.0 * Max(0.001, LatAdj)));
  end;
end;

end.
