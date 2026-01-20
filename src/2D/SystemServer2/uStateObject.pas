unit uStateObject;

interface

type
  TShipObject = class
  private
  public
    IDShip: Integer;

    x, y, z: Double;
    Heading, Pitch, Roll: Single;
    Speed: Single;
    Rudder: Single
  end;

implementation

end.
