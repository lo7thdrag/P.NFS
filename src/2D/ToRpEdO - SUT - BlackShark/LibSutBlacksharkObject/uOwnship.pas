unit uOwnship;

interface
uses
  SysUtils, Classes, Math, Graphics, uTorpedoLauncher,
  uCoordConverter, uRadarTargets, windows, uBaseObject, uVehicle;

type
  TOwnShip = class(TVehicle)
  private

  public
    // semua variabel yang hanya ada di ownship ditaruh sini

    constructor Create; overload;
    destructor Destroy; override;

  end;
implementation

{ TOwnShip }

constructor TOwnShip.Create;
begin

end;

destructor TOwnShip.Destroy;
begin

  inherited;
end;

end.
