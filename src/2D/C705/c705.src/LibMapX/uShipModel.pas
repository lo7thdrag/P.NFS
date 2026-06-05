unit uShipModel;

interface

type
  { --- DATA DOMAIN: The Ship Object --- }
  TShipContact = class
  public
    ID: Integer;
    Name: string;
    Lat, Lon, Heading, Speed: Double;
    LastHit: Double; // Persistence (Phosphor decay)
    IsTracked: Boolean; // ARPA state
    isDetected: Boolean;
    Domain: Integer;  // Domain Surface = 1

    constructor Create; overload;
    constructor Create(AID: Integer; AName: string;
      ALat, ALon, AHdg, ASpd: Double); overload;

    procedure AssignFrom(const AShipContact: TShipContact);
  end;

implementation

{ TShipContact }

constructor TShipContact.Create;
begin
  ID := -1;
  Name := '';
  Lat := 0.0;
  Lon := 0.0;
  Heading := 0.0;
  Speed := 0.0;
  LastHit := 0.0;
  IsTracked := False;
  isDetected := False;
  Domain := 1;
end;

constructor TShipContact.Create(AID: Integer; AName: string; ALat, ALon, AHdg,
  ASpd: Double);
begin
  ID := AID;
  Name := AName;
  Lat := ALat;
  Lon := ALon;
  Heading := AHdg;
  Speed := ASpd;
  LastHit := 0;
  IsTracked := False;
  isDetected := False;
  Domain := 1;
end;

procedure TShipContact.AssignFrom(const AShipContact: TShipContact);
begin
  ID := AShipContact.ID;
  Name := AShipContact.Name;
  Lat := AShipContact.Lat;
  Lon := AShipContact.Lon;
  Heading := AShipContact.Heading;
  Speed := AShipContact.Speed;
  LastHit := AShipContact.LastHit;
  IsTracked := AShipContact.IsTracked;
  isDetected := AShipContact.isDetected;
  Domain := AShipContact.Domain;
end;

end.
