unit uShipView;

interface

uses
  MapXLib_TLB, Vcl.Graphics, Winapi.Windows, System.SysUtils,
    uMapXUnitConverter, uMapViewBase, uShipModel, uVehicleManager, uCoordConverter,
    uLibSettings, Math;

type
  TShipView = class(TMapViewBase)
  private
    FVehicleMgr: TVehicleManager;

  public
    constructor Create(aMap: TMap; aVehicleMgr: TVehicleManager);

    procedure Draw(aCnv: TCanvas; aCvt: TCoordConverter); override;
  end;

implementation

uses
  uC705SimManager;

{ TShipView }

constructor TShipView.Create(aMap: TMap; aVehicleMgr: TVehicleManager);
begin
  inherited Create(aMap);
  FVehicleMgr := aVehicleMgr;
end;

procedure RotatePoint(
  const CX, CY : Integer;
  const PX, PY : Double;
  const Heading : Double;
  out RX, RY : Integer);
var
  Rad : Double;
begin
  Rad := DegToRad(-Heading);

  RX := Round(
    CX + PX * Cos(Rad) + PY * Sin(Rad)
  );

  RY := Round(
    CY - PX * Sin(Rad) + PY * Cos(Rad)
  );
end;

procedure TShipView.Draw(aCnv: TCanvas; aCvt: TCoordConverter);
var
  i: Integer;
  Ship, OwnShip, TargetObj: TShipContact;
  xCntr, yCntr, xOwn, yOwn, xTar, yTar: Single;
  radiusShip, x, y, x1, y1, x2, y2: Integer;
  P1X,P1Y,
  P2X,P2Y,
  P3X,P3Y,
  P4X,P4Y : Integer;
  Hdg : Double;
  AX1,AY1,
  AX2,AY2,
  AX3,AY3 : Integer; //nose kapal
begin

  if (FVehicleMgr = nil) or (FVehicleMgr.NFSObjectList = nil) then
    Exit;

  for i := 0 to FVehicleMgr.NFSObjectList.Count - 1 do
  begin
    Ship := FVehicleMgr.NFSObjectList[i] as TShipContact;

    Hdg := Ship.Heading;

    FMap.ConvertCoord(xCntr, yCntr, Ship.Lon, Ship.Lat, miMapToScreen);

    { warna ownship }
    if Ship.ID = VOwnShip.ShipID then begin
//      aCnv.Pen.Color := clGreen;
//      aCnv.Brush.Color := clGreen;
      aCnv.Pen.Color := clBlack;
      aCnv.Brush.Color := clWhite;

      radiusShip := 10;

      x := Round(xCntr);
      y := Round(yCntr);

      aCnv.Ellipse(
        x-radiusShip,
        y-radiusShip,
        x+radiusShip,
        y+radiusShip
      );

      { garis horizontal }
      aCnv.MoveTo(x-radiusShip+2, y);
      aCnv.LineTo(x+radiusShip-2, y);

      { garis vertikal }
      aCnv.MoveTo(x, y-radiusShip+2);
      aCnv.LineTo(x, y+radiusShip-2);

      { nose kapal }
      {
      RotatePoint(
        x,
        y,
        0,
        -(radiusShip + 15),
        Hdg,
        x2,
        y2
      );

      aCnv.MoveTo(x, y);
      aCnv.LineTo(x2, y2);
      }
      RotatePoint(x,y,0,-25,Hdg,AX1,AY1);

      RotatePoint(x,y,-4,-18,Hdg,AX2,AY2);
      RotatePoint(x,y, 4,-18,Hdg,AX3,AY3);

      aCnv.MoveTo(x,y);
      aCnv.LineTo(AX1,AY1);

      aCnv.MoveTo(AX1,AY1);
      aCnv.LineTo(AX2,AY2);

      aCnv.MoveTo(AX1,AY1);
      aCnv.LineTo(AX3,AY3);
    end
    else begin
      aCnv.Pen.Color := clRed;
      aCnv.Brush.Color := clWhite;

      radiusShip := 10;

      x := Round(xCntr);
      y := Round(yCntr);

      RotatePoint(x,y,0,-radiusShip,Hdg,P1X,P1Y);
      RotatePoint(x,y,radiusShip,0,Hdg,P2X,P2Y);
      RotatePoint(x,y,0,radiusShip,Hdg,P3X,P3Y);
      RotatePoint(x,y,-radiusShip,0,Hdg,P4X,P4Y);

      aCnv.MoveTo(P1X, P1Y);
      aCnv.LineTo(P2X, P2Y);
      aCnv.LineTo(P3X, P3Y);
      aCnv.LineTo(P4X, P4Y);
      aCnv.LineTo(P1X, P1Y);

      { nose kapal }
      RotatePoint(x,y,0,-25,Hdg,AX1,AY1);

      RotatePoint(x,y,-4,-18,Hdg,AX2,AY2);
      RotatePoint(x,y, 4,-18,Hdg,AX3,AY3);

      aCnv.MoveTo(x,y);
      aCnv.LineTo(AX1,AY1);

      aCnv.MoveTo(AX1,AY1);
      aCnv.LineTo(AX2,AY2);

      aCnv.MoveTo(AX1,AY1);
      aCnv.LineTo(AX3,AY3);
    end;

    //aCnv.Pen.Color := clRed;
    aCnv.Brush.Style := bsSolid;
    //aCnv.Brush.Color := clRed;
    aCnv.Pen.Style := psSolid;
    aCnv.Pen.Width := 2;

    aCnv.Font.Name := 'Arial';
    aCnv.Font.Size := 10;
    aCnv.Font.Color := clBlack;

    SetBkMode(aCnv.Handle, TRANSPARENT);

    aCnv.TextOut(
      Round(xCntr),
      Round(yCntr) + 2 * radiusShip,
      Ship.ID.ToString
    );

    if (Ship.ID = FVehicleMgr.SelectedTargetID)
      and (SimManager.RoutePlanMode = mFiring)
       then
    begin
      aCnv.Pen.Color := clYellow;
      aCnv.Brush.Style := bsClear;

      aCnv.MoveTo(x, y - 15);
      aCnv.LineTo(x + 15, y);
      aCnv.LineTo(x, y + 15);
      aCnv.LineTo(x - 15, y);
      aCnv.LineTo(x, y - 15);
    end;
  end;

  { GAMBAR FIRING LINE }
  OwnShip := FVehicleMgr.FindObjectByID(VOwnShip.ShipID);
  TargetObj  := FVehicleMgr.FindObjectByID(FVehicleMgr.SelectedTargetID);

  if Assigned(OwnShip) and Assigned(TargetObj)
    and (SimManager.RoutePlanMode = mfiring)
    {and FVehicleMgr.isFiring}
      then
  begin

    FMap.ConvertCoord(xOwn, yOwn, OwnShip.Lon, OwnShip.Lat, miMapToScreen);
    FMap.ConvertCoord(xTar, yTar, TargetObj.Lon, TargetObj.Lat, miMapToScreen);

    aCnv.Pen.Color := clLime;
    aCnv.Pen.Width := 2;

    aCnv.MoveTo(Round(xOwn), Round(yOwn));
    aCnv.LineTo(Round(xTar), Round(yTar));

  end;

end;

end.
