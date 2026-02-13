unit uVehicleManager;

interface

uses
  System.SysUtils, System.Contnrs, Graphics,
  uShipModel, uTCPDatatype;

type
  TVehicleManager = class
  private
    FNFSObjectList: TObjectList;

  public
    constructor Create;
    destructor Destroy; override;

    function FindObjectByID(const aID: Integer): TShipContact;
    procedure UpdateObjectList(AShipInfo: PRecData3DPosition);
    procedure DeleteObjectByID(AID: Integer);

    property NFSObjectList: TObjectList read FNFSObjectList;

end;

var
  VehicleMgr: TVehicleManager;

implementation

{ TVehicleManager }

constructor TVehicleManager.Create;
begin
  inherited;

  FNFSObjectList := TObjectList.Create;
end;

destructor TVehicleManager.Destroy;
begin
  if Assigned(FNFSObjectList) then
    FreeAndNil(FNFSObjectList);

  inherited;
end;

function TVehicleManager.FindObjectByID(const aID: Integer): TShipContact;
var
  i: Integer;
  Ship: TShipContact;
begin
  Result := nil;
  if Assigned(FNFSObjectList) then
  begin
    for i := 0 to FNFSObjectList.Count - 1 do
    begin
      Ship := TShipContact(FNFSObjectList[i]);
      if Ship.ID = AID then
      begin
        Result := Ship;
        Break;
      end;
    end;
  end;
end;

procedure TVehicleManager.UpdateObjectList(AShipInfo: PRecData3DPosition);
var
  Ship: TShipContact;
begin
  if (FNFSObjectList <> nil) and (AShipInfo <> nil) then
  begin
    Ship := FindObjectByID(Integer(AShipInfo^.ShipID));
    if not Assigned(Ship) then
    begin
      Ship := TShipContact.Create(Integer(AShipInfo^.ShipID), '', AShipInfo^.Y, AShipInfo^.X, AShipInfo^.Heading, AShipInfo^.Speed);
      FNFSObjectList.Add(Ship);
    end
    else
    begin
      Ship.Lat := AShipInfo^.Y;
      Ship.Lon := AShipInfo^.X;
      Ship.Heading := AShipInfo^.Heading;
      Ship.Speed := AShipInfo^.Speed;
    end;
  end;
end;

procedure TVehicleManager.DeleteObjectByID(AID: Integer);
var
  i: Integer;
  Ship: TShipContact;
begin
  if Assigned(FNFSObjectList) then
  begin
    for i := 0 to FNFSObjectList.Count - 1 do
    begin
      Ship := TShipContact(FNFSObjectList[i]);
      if Ship.ID = AID then
      begin
        FNFSObjectList.Delete(i);
        Break;
      end;
    end;
  end;
end;

end.
