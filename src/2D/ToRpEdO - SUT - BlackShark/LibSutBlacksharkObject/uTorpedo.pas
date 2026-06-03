unit uTorpedo;

interface
uses
  SysUtils, Classes, Math, Graphics, uTorpedoLauncher,
  uCoordConverter, uRadarTargets, windows, uBaseObject, uVehicle;
type
  TTorpedo = class(TVehicle)
  private

  public
    // semua variabel yang hanya ada di ownship ditaruh sini
    constructor Create; overload;
    destructor Destroy; override;

  end;
implementation

{ TTorpedo }

constructor TTorpedo.Create;
begin

end;

destructor TTorpedo.Destroy;
begin

  inherited;
end;

end.
