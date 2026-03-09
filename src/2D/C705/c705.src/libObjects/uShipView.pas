unit uShipView;

interface

uses
  MapXLib_TLB, Vcl.Graphics, Winapi.Windows, System.SysUtils,
    uMapXUnitConverter, uMapViewBase, uShipModel, uVehicleManager, uCoordConverter;

type
  TShipView = class(TMapViewBase)
  private
    FVehicleMgr: TVehicleManager;
  public
    constructor Create(aMap: TMap; aVehicleMgr: TVehicleManager);

    procedure Draw(aCnv: TCanvas; aCvt: TCoordConverter); override;
  end;

implementation

{ TShipView }

constructor TShipView.Create(aMap: TMap; aVehicleMgr: TVehicleManager);
begin
  inherited Create(aMap);
  FVehicleMgr := aVehicleMgr;
end;

procedure TShipView.Draw(aCnv: TCanvas; aCvt: TCoordConverter);
var
  i: Integer;
  Ship: TShipContact;
  xCntr, yCntr: Single;
  radiusShip, x, y, x1, y1, x2, y2: Integer;
begin

  if (FVehicleMgr = nil) or (FVehicleMgr.NFSObjectList = nil) then
    Exit;

  for i := 0 to FVehicleMgr.NFSObjectList.Count - 1 do
  begin
    Ship := FVehicleMgr.NFSObjectList[i] as TShipContact;

    FMap.ConvertCoord(xCntr, yCntr, Ship.Lon, Ship.Lat, miMapToScreen);

    aCnv.Pen.Color := clRed;
    aCnv.Brush.Style := bsSolid;
    aCnv.Brush.Color := clRed;
    aCnv.Pen.Style := psSolid;
    aCnv.Pen.Width := 2;

    aCnv.Font.Name := 'Arial';
    aCnv.Font.Size := 10;
    aCnv.Font.Color := clBlack;

    SetBkMode(aCnv.Handle, TRANSPARENT);

    radiusShip := 10;

    x := Round(xCntr);
    y := Round(yCntr);

    x1 := x - radiusShip;
    y1 := y;
    x2 := x;
    y2 := y - radiusShip;

    aCnv.MoveTo(x1, y1);
    aCnv.LineTo(x2, y2);

    x2 := x + radiusShip;
    y2 := y;
    aCnv.LineTo(x2, y2);

    x2 := x;
    y2 := y + radiusShip;
    aCnv.LineTo(x2, y2);

    x2 := x - radiusShip;
    y2 := y;
    aCnv.LineTo(x2, y2);

    x1 := x;
    y1 := y;
    x2 := x;
    y2 := y - 2 * radiusShip;

    aCnv.MoveTo(x1, y1);
    aCnv.LineTo(x2, y2);

    aCnv.TextOut(
      Round(xCntr),
      Round(yCntr) + 2 * radiusShip,
      Ship.ID.ToString
    );
  end;

end;

end.
