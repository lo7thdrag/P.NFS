unit uShipView;

interface

uses
  MapXLib_TLB, Vcl.Graphics, Winapi.Windows, System.SysUtils,
    uMapXUnitConverter, uMapViewBase, uShipModel, uVehicleManager, uCoordConverter,
    uLibSettings, Math, uC705Launcher;

type
  TShipView = class(TMapViewBase)
  private
    FVehicleMgr: TVehicleManager;

    procedure DrawC705Missiles(aCnv: TCanvas; aCvt: TCoordConverter);

    //procedure DrawMissile(aCnv: TCanvas; aCvt: TCoordConverter);
      {aCnv: TCanvas;
      aCvt: TCoordConverter;
      aLon, aLat, aBearing: Double);}

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

  { ============================== }
  { GAMBAR MISSILE C705 }
  { ============================== }
  aCnv.Pen.Color := RGB($03, $1C, $4E); //031C4E
  aCnv.Pen.Width := 2;
  DrawC705Missiles(aCnv, aCvt);

end;

procedure TShipView.DrawC705Missiles(aCnv: TCanvas; aCvt: TCoordConverter);
var
  x, y: Single;
  CenterX, CenterY: Integer;
  LeftX, LeftY: Integer;
  NoseX, NoseY: Integer;
  RightX, RightY: Integer;
  Missile: TMissileVisual;
  MissileLong, MissileLat: Double;
  DotX, DotY: Integer;
begin
  Missile := SimManager.MissileVisual;

  if not Missile.Active then
    Exit;

  MissileLong := Missile.X;
  MissileLat := Missile.Y;

  FMap.ConvertCoord(
    x,
    y,
    MissileLong,
    MissileLat,
    miMapToScreen
  );

  CenterX := Round(x);
  CenterY := Round(y);

  { Kiri bagian dasar }
  RotatePoint(
    CenterX,
    CenterY,
    -8, 8,
    Missile.Heading,
    LeftX,
    LeftY
  );

  { Ujung depan missile }
  RotatePoint(
    CenterX,
    CenterY,
    0, -12,
    Missile.Heading,
    NoseX,
    NoseY
  );

  { Kanan bagian dasar }
  RotatePoint(
    CenterX,
    CenterY,
    8, 8,
    Missile.Heading,
    RightX,
    RightY
  );

  { Titik di tengah bagian dasar missile }
  RotatePoint(
    CenterX,
    CenterY,
    0, 8,
    Missile.Heading,
    DotX,
    DotY
  );

  { Bentuk missile segitiga tanpa dasar }
  aCnv.MoveTo(LeftX, LeftY);
  aCnv.LineTo(NoseX, NoseY);
  aCnv.LineTo(RightX, RightY);

  { Titik }
  aCnv.Ellipse(
    DotX - 2,
    DotY - 2,
    DotX + 2,
    DotY + 2
  );
end;

//procedure TShipView.DrawMissile(aCnv: TCanvas; aCvt: TCoordConverter; aLon,
//  aLat, aBearing: Double);
//var
//  x, y: Single;
//  CenterX, CenterY: Integer;
//  LeftX, LeftY: Integer;
//  NoseX, NoseY: Integer;
//  RightX, RightY: Integer;
//begin
//  FMap.ConvertCoord(
//    x,
//    y,
//    aLon,
//    aLat,
//    miMapToScreen
//  );
//
//  { ================================= }
//  { Bentuk missile }
//  { ================================= }
//
//  {
//          Nose
//           /\
//          /  \
//         /    \
//        /      \
//
//           •
//  }
//
//  CenterX := Round(x);
//  CenterY := Round(y);
//
//  RotatePoint(
//    CenterX, CenterY,
//    -8, 8,
//    aBearing,
//    LeftX,
//    LeftY
//  );
//
//  RotatePoint(
//    CenterX, CenterY,
//    0, -15,
//    aBearing,
//    NoseX,
//    NoseY
//  );
//
//  RotatePoint(
//    CenterX, CenterY,
//    8, 8,
//    aBearing,
//    RightX,
//    RightY
//  );
//
//
//  aCnv.Pen.Color := clRed;
//  aCnv.Pen.Width := 2;
//  aCnv.Pen.Style := psSolid;
//
//  aCnv.Brush.Style := bsClear;
//
//
//  { Sisi kiri }
//  aCnv.MoveTo(
//    LeftX,
//    LeftY
//  );
//
//  aCnv.LineTo(
//    NoseX,
//    NoseY
//  );
//
//
//  { Sisi kanan }
//  aCnv.MoveTo(
//    NoseX,
//    NoseY
//  );
//
//  aCnv.LineTo(
//    RightX,
//    RightY
//  );
//
//
//  { ================================= }
//  { Titik di tengah bawah }
//  { ================================= }
//
//  aCnv.Brush.Style := bsSolid;
//  aCnv.Brush.Color := clRed;
//
//  aCnv.Ellipse(
//    CenterX - 2,
//    CenterY - 2,
//    CenterX + 2,
//    CenterY + 2
//  );
//end;

end.
