unit uRadarSensor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Contnrs, System.Math,
  Vcl.ExtCtrls, System.UITypes,

  uShipModel;

type

  { --- SENSOR DOMAIN: Radar Display --- }
  TRadarDisplay = class
  private
    FPaintBox: TPaintBox;

    FContactList, FRadarContacts: TObjectList;

    FOwnShipID: Integer;
    FRadarRangeNM, FZoomLevel, FRPM: Double;
    FDeltaTime: Double;

    FSweepAngle: Double;
    FRadarCenterLat, FRadarCenterLon: Double;
    FOwnShipHeadingVisible: Boolean;
    FContactShipHEadingVisible: Boolean;

    FSweepTrailWidth: Double;
    FSectorCount: Integer;
    FRangeRingCount: Integer;

    FOuterRingCompassVisible: Boolean;
    FSweepVisible: Boolean;

    FRadarRadiusPercentage: Double;

    FBackgroundColor: TColor;
    FCompasOuterRingColor: TColor;
    FRangeRingColor: TColor;
    FRangeRingTextColor: TColor;
    FSectorColor: TColor;
    FSectorTextColor: TColor;
    FOwnShipColor: TColor;
    FOwnShipHeadingColor: TColor;
    FContactTrackedColor: TColor;
    FContactTrackedTextColor: TColor;

    function UpdateRadarContactList(AShip: TShipContact): TShipContact;

    procedure ClearBackground(const ACanvas: TCanvas);
    procedure DrawSmoothSweep(CX, CY, Radius: Integer; TrailWidth: Double);
    procedure DrawCompass(CX, CY, Radius: Integer; EffRange: Double);
    procedure DrawOwnShipHeading(CX, CY, Radius: Integer;
      const OwnShip: TShipContact);

    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxPaint(Sender: TObject);
  public


    constructor Create(const APaintBox: TPaintBox; AOwnShipID: Integer; AContactList: TObjectList);
    destructor Destroy; override;
    procedure Render(ADeltaTime: Double);
    procedure Update(ADeltaTime: Double);

    property RadarCenterLat: Double read FRadarCenterLat;
    property RadarCenterLon: Double read FRadarCenterLon;

    property OwnShipID: Integer read FOwnShipID write FOwnShipID;
    property RadarRangeNM: Double read FRadarRangeNM write FRadarRangeNM;
    property ZoomLevel: Double read FZoomLevel write FZoomLevel;
    property RPM: Double read FRPM write FRPM;

    property RangeRingCount: Integer read FRangeRingCount write FRangeRingCount;
    property SectorCount: Integer read FSectorCount write FSectorCount;
    property SweepTrailWidth: Double read FSweepTrailWidth write FSweepTrailWidth;
    property OwnShipHeadingVisible: Boolean read FOwnShipHeadingVisible write FOwnShipHeadingVisible;
    property OuterRingCompassVisible: Boolean read FOuterRingCompassVisible write FOuterRingCompassVisible;
    property SweepVisible: Boolean read FSweepVisible write FSweepVisible;
    property ContactShipHEadingVisible: Boolean read FContactShipHEadingVisible write FContactShipHEadingVisible;
    property RadarRadiusPercentage: Double read FRadarRadiusPercentage write FRadarRadiusPercentage;

    property BackgroundColor: TColor read FBackgroundColor write FBackgroundColor;
    property CompasOuterRingColor: TColor read FCompasOuterRingColor write FCompasOuterRingColor;
    property RangeRingColor: TColor read FRangeRingColor write FRangeRingColor;
    property RangeRingTextColor: TColor read FRangeRingTextColor write FRangeRingTextColor;
    property SectorColor: TColor read FSectorColor write FSectorColor;
    property SectorTextColor: TColor read FSectorTextColor write FSectorTextColor;
    property OwnShipColor: TColor read FOwnShipColor write FOwnShipColor;
    property OwnShipHeadingColor: TColor read FOwnShipHeadingColor write FOwnShipHeadingColor;
    property ContactTrackedColor: TColor read FContactTrackedColor write FContactTrackedColor;
    property ContactTrackedTextColor: TColor read FContactTrackedTextColor write FContactTrackedTextColor;
  end;

implementation

{ TRadarDisplay }

constructor TRadarDisplay.Create(const APaintBox: TPaintBox;
  AOwnShipID: Integer; AContactList: TObjectList);
begin
  FContactList:= AContactList;
  FRadarContacts := TObjectList.Create(True);
  FPaintBox := APaintBox;
  FPaintBox.OnMouseDown:= PaintBoxMouseDown;
  FPaintBox.OnPaint:= PaintBoxPaint;
  OwnShipID := AOwnShipID;
  RadarRangeNM := 6.0;
  ZoomLevel := 1.0;
  FSweepTrailWidth := 45.0;
  RPM := 24.0;
  FSweepAngle := 0;
end;

destructor TRadarDisplay.Destroy;
begin
  FRadarContacts.Free;
end;

procedure TRadarDisplay.Update(ADeltaTime: Double);
begin
  FDeltaTime:= ADeltaTime;
  FPaintBox.Invalidate;
end;

function TRadarDisplay.UpdateRadarContactList(AShip: TShipContact): TShipContact;
var
  i: Integer;
  ShipContact: TShipContact;
  isFound: Boolean;
begin
  Result:= nil;
  if Assigned(AShip) then begin
    isFound:= False;
    for i := 0 to FRadarContacts.Count - 1 do begin
      ShipContact:= TShipContact(FRadarContacts[i]);
      if ShipContact.ID = AShip.ID then begin
        isFound:= True;
        Break;
      end;
    end;

    if not isFound then begin
      ShipContact:= TShipContact.Create;
      ShipContact.AssignFrom(AShip);
      FRadarContacts.Add(ShipContact);
    end;

    Result:= ShipContact;
  end;
end;

procedure TRadarDisplay.ClearBackground(const ACanvas: TCanvas);
begin
  ACanvas.Brush.Color := FBackgroundColor;
  ACanvas.FillRect(ACanvas.ClipRect);
end;

procedure TRadarDisplay.DrawSmoothSweep(CX, CY, Radius: Integer;
  TrailWidth: Double);
var
  x, y, DistSq, RadSq: Integer;
  PAngle, ADiff: Double;
  P: PRGBTriple;
  Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    Bmp.PixelFormat := pf24bit;
    Bmp.Width := FPaintBox.Canvas.ClipRect.Width;
    Bmp.Height := FPaintBox.Canvas.ClipRect.Height;
    Bmp.Canvas.Brush.Color := FBackgroundColor;
    Bmp.Canvas.FillRect(Bmp.Canvas.ClipRect);

    RadSq := Sqr(Radius);
    for y := Max(0, CY - Radius) to Min(Bmp.Height - 1, CY + Radius) do
    begin
      P := Bmp.ScanLine[y];
      Inc(P, Max(0, CX - Radius));
      for x := Max(0, CX - Radius) to Min(Bmp.Width - 1, CX + Radius) do
      begin
        DistSq := Sqr(x - CX) + Sqr(y - CY);
        if DistSq <= RadSq then
        begin
          PAngle := RadToDeg(ArcTan2(x - CX, CY - y));
          if PAngle < 0 then
            PAngle := PAngle + 360;
          ADiff := FSweepAngle - PAngle;
          if ADiff < 0 then
            ADiff := ADiff + 360;
          if ADiff <= TrailWidth then
            P^.rgbtGreen := Round(110 * (1 - (ADiff / TrailWidth)));
        end;
        Inc(P);
      end;
    end;
    FPaintBox.Canvas.Draw(0, 0, Bmp);
  finally
    Bmp.Free;
  end;
end;

procedure TRadarDisplay.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i, CX, CY, Radius, Minus, DX, DY: Integer;
  Ship: TShipContact;
  PXNM, RelX, RelY, EffRange, LatAdj: Double;
begin
  CX := FPaintBox.Width div 2;
  CY := FPaintBox.Height div 2;
  Radius := Min(CX, CY);
  Minus:= Trunc(((100.0-FRadarRadiusPercentage)/100.0)*Radius);
  Radius:= Radius - Minus;
  EffRange := FRadarRangeNM / FZoomLevel;
  PXNM := Radius / EffRange;
  LatAdj := Cos(DegToRad(FRadarCenterLat));
  for i := 0 to FContactList.Count - 1 do
  begin
    Ship := TShipContact(FContactList[i]);
    if Ship.ID = FOwnShipID then
      Continue;
    RelY := (Ship.Lat - FRadarCenterLat) * 60.0;
    RelX := (Ship.Lon - FRadarCenterLon) * (60.0 * LatAdj);
    DX := CX + Round(RelX * PXNM);
    DY := CY - Round(RelY * PXNM);
    if (Abs(X - DX) < 15) and (Abs(Y - DY) < 15) then
    begin
      Ship.IsTracked := not Ship.IsTracked;
      Exit;
    end;
  end;
end;

procedure TRadarDisplay.PaintBoxPaint(Sender: TObject);
begin
  Render(FDeltaTime);
end;

procedure TRadarDisplay.DrawCompass(CX, CY, Radius: Integer; EffRange: Double);
var
  i, j, RingR, PanelY: Integer;
  Rad, Ang: Double;
  S: string;
  Ship: TShipContact;
begin
  FPaintBox.Canvas.Brush.Style := bsClear;
  FPaintBox.Canvas.Font.Color := FSectorTextColor;

  FPaintBox.Canvas.Pen.Style := psSolid;
  FPaintBox.Canvas.Pen.Color := FSectorColor;

  // Draw Sectors
  for i := 0 to FSectorCount - 1 do
  begin
    Ang := i * (360 / FSectorCount);
    Rad := DegToRad(90 - Ang);
    FPaintBox.Canvas.MoveTo(CX, CY);
    FPaintBox.Canvas.LineTo(CX + Round(Cos(Rad) * Radius),
      CY - Round(Sin(Rad) * Radius));

    FPaintBox.Canvas.Font.Color := FSectorTextColor;
//    S := IntToStr(Round(Ang));
    S := Format('%.3d',[Round(Ang)]);
    // Position text slightly outside the main radius
    FPaintBox.Canvas.TextOut(CX + Round(Cos(Rad) * (Radius + 20)) -
      (FPaintBox.Canvas.TextWidth(S) div 2), CY - Round(Sin(Rad) * (Radius + 20)) -
      (FPaintBox.Canvas.TextHeight(S) div 2), S);

    // Draw small tick marks
    FPaintBox.Canvas.MoveTo(CX + Round(Cos(Rad) * Radius),
      CY - Round(Sin(Rad) * Radius));
    FPaintBox.Canvas.LineTo(CX + Round(Cos(Rad) * (Radius + 5)),
      CY - Round(Sin(Rad) * (Radius + 5)));
  end;

  // Draw Range Rings
  FPaintBox.Canvas.Pen.Style := psSolid;
  FPaintBox.Canvas.Pen.Color := FRangeRingColor;
  if FRangeRingCount>0 then
    for j := 1 to (FRangeRingCount + 1) do
    begin
      RingR := Round((Radius / (FRangeRingCount + 1)) * j);
      FPaintBox.Canvas.Ellipse(CX - RingR, CY - RingR, CX + RingR, CY + RingR);

      // Range Label (Distance from center)
      S := Format('%0.1f', [(EffRange / (FRangeRingCount + 1)) * j]);
      FPaintBox.Canvas.Font.Color := FRangeRingTextColor;
      FPaintBox.Canvas.TextOut(CX + 5, CY - RingR - 12, S + 'nmi');
    end;

  // Draw Outer Compass Ring
  if FOuterRingCompassVisible then begin
    FPaintBox.Canvas.Pen.Style := psSolid;
    FPaintBox.Canvas.Pen.Color := FCompasOuterRingColor;
    FPaintBox.Canvas.Ellipse(CX - Radius, CY - Radius, CX + Radius, CY + Radius);
  end;

//  PanelY := 20;
//  for i := 0 to Contacts.Count - 1 do
//  begin
//    Ship := TShipContact(Contacts[i]);
//    if Ship.IsTracked then
//    begin
//      FPaintBox.Canvas.Font.Color := clYellow;
//      FPaintBox.Canvas.TextOut(FPaintBox.Canvas.ClipRect.Right - 150, PanelY,
//        Format('[%d] %s', [Ship.ID, Ship.Name]));
//      FPaintBox.Canvas.TextOut(FPaintBox.Canvas.ClipRect.Right - 150,
//        PanelY + 15, Format('S:%0.1f K:%03.0f'#176,
//        [Ship.Speed, Ship.Heading]));
//      Inc(PanelY, 45);
//    end;
//  end;
end;

procedure TRadarDisplay.DrawOwnShipHeading(CX, CY, Radius: Integer;
  const OwnShip: TShipContact);
begin
  FPaintBox.Canvas.Pen.Color := FOwnShipHeadingColor;
  FPaintBox.Canvas.Pen.Width := 2;
  FPaintBox.Canvas.MoveTo(CX, CY);
  FPaintBox.Canvas.LineTo(CX + Round(Cos(DegToRad(90 - OwnShip.Heading)) *
    Radius), CY - Round(Sin(DegToRad(90 - OwnShip.Heading)) * Radius));
end;

procedure TRadarDisplay.Render(ADeltaTime: Double);
var
  i, CX, CY, Radius, Minus, DX, DY, RadarDX, RadarDY, VX, VY, PanelY: Integer;
  RadarShip, Ship, OwnShip: TShipContact;
  PXNM, RX, RY, RadarRX, RadarRY, Eff, LatAdj, Vec, Bearing, RadarBearing, Diff,
  DegPerSec: Double;
begin
  CX := FPaintBox.Width div 2;
  CY := FPaintBox.Height div 2;
//  Radius := Min(CX, CY) - 65;
//  Radius := Min(CX, CY) - 10;
  Radius:= Min(CX, CY);
  Minus:= Trunc(((100.0-FRadarRadiusPercentage)/100.0)*Radius);
  Radius:= Radius - Minus;

  OwnShip := nil;
  for i := 0 to FContactList.Count - 1 do
    if TShipContact(FContactList[i]).ID = OwnShipID then
    begin
      OwnShip := TShipContact(FContactList[i]);
      Break;
    end;
  if not Assigned(OwnShip) then
    Exit;

  FRadarCenterLat := OwnShip.Lat;
  FRadarCenterLon := OwnShip.Lon;
  LatAdj := Cos(DegToRad(FRadarCenterLat));
  Eff := RadarRangeNM / ZoomLevel;
  PXNM := Radius / Eff;
  DegPerSec := (RPM * 360.0) / 60.0;
  FSweepAngle := FSweepAngle + (DegPerSec * ADeltaTime);
  while FSweepAngle >= 360 do
    FSweepAngle := FSweepAngle - 360;

  ClearBackground(FPaintBox.Canvas);

  if FSweepVisible then
    DrawSmoothSweep(CX, CY, Radius, FSweepTrailWidth);

  DrawCompass(CX, CY, Radius, Eff);

  if FOwnShipHeadingVisible then
  begin
    DrawOwnShipHeading(CX, CY, Radius, OwnShip);
  end;

  PanelY := 20;
  for i := 0 to FContactList.Count - 1 do
  begin
    Ship := TShipContact(FContactList[i]);
    RadarShip:= UpdateRadarContactList(Ship);
    RadarShip.IsTracked:= Ship.IsTracked;

    RY := (Ship.Lat - FRadarCenterLat) * 60.0;
    RX := (Ship.Lon - FRadarCenterLon) * (60.0 * LatAdj);
    RadarRY := (RadarShip.Lat - FRadarCenterLat) * 60.0;
    RadarRX := (RadarShip.Lon - FRadarCenterLon) * (60.0 * LatAdj);

    Bearing := RadToDeg(ArcTan2(RX, RY));
    if Bearing < 0 then
      Bearing := Bearing + 360;
    RadarBearing := RadToDeg(ArcTan2(RadarRX, RadarRY));
    if RadarBearing < 0 then
      RadarBearing := RadarBearing + 360;

    Diff := Abs(FSweepAngle - Bearing);
    if (Diff < (DegPerSec * ADeltaTime)) or (Diff > 360 - (DegPerSec * ADeltaTime))
    then begin
      Ship.LastHit := 1.0;
//      RadarShip.LastHit:= Ship.LastHit;
      RadarShip.AssignFrom(Ship);
    end else begin
      Ship.LastHit := Max(0, Ship.LastHit - (0.2 * ADeltaTime));
      RadarShip.LastHit := Ship.LastHit;
    end;

    if Sqr(RX * PXNM) + Sqr(RY * PXNM) <= Sqr(Radius) then
    begin
      DX := CX + Round(RX * PXNM);
      DY := CY - Round(RY * PXNM);

      RadarDX := CX + Round(RadarRX * PXNM);
      RadarDY := CY - Round(RadarRY * PXNM);

      if Ship.ID = OwnShipID then
      begin
        FPaintBox.Canvas.Pen.Color := FOwnShipColor;
        FPaintBox.Canvas.Pen.Style := psSolid;
        FPaintBox.Canvas.Pen.Width := 1;
        FPaintBox.Canvas.Brush.Color := FOwnShipColor;
        FPaintBox.Canvas.Brush.Style:= bsSolid;
        FPaintBox.Canvas.Ellipse(DX - 3, DY - 3, DX + 3, DY + 3);
      end
      else if (Ship.LastHit > 0.01) {or Ship.IsTracked} then
      begin
//        if Ship.IsTracked then
//        begin
//          FPaintBox.Canvas.Pen.Color := clYellow;
//          FPaintBox.Canvas.Brush.Style := bsClear;
//          FPaintBox.Canvas.Rectangle(DX - 8, DY - 8, DX + 8, DY + 8);
//
//          FPaintBox.Canvas.Font.Color := clYellow;
//          FPaintBox.Canvas.TextOut(FPaintBox.Canvas.ClipRect.Right - 150, PanelY,
//            Format('[%d] %s', [Ship.ID, Ship.Name]));
//          FPaintBox.Canvas.TextOut(FPaintBox.Canvas.ClipRect.Right - 150,
//            PanelY + 15, Format('S:%0.1f K:%03.0f'#176,
//            [Ship.Speed, Ship.Heading]));
//          Inc(PanelY, 45);
//
//        end;

//        if FContactShipHEadingVisible then begin
//          Vec := Ship.Speed * 0.01;
//          VX := DX + Round(Sin(DegToRad(Ship.Heading)) * Vec * PXNM);
//          VY := DY - Round(Cos(DegToRad(Ship.Heading)) * Vec * PXNM);
//          FPaintBox.Canvas.Pen.Color := $00004400;
//          FPaintBox.Canvas.MoveTo(DX, DY);
//          FPaintBox.Canvas.LineTo(VX, VY);
//        end;

        // Draw Contact
        FPaintBox.Canvas.Pen.Style := psSolid;
        FPaintBox.Canvas.Pen.Width := 1;
//        FPaintBox.Canvas.Brush.Style:= bsSolid;
        FPaintBox.Canvas.Brush.Style := bsClear;
//        FPaintBox.Canvas.Brush.Color := RGB(0, Round(255 * Ship.LastHit), 0);
        FPaintBox.Canvas.Brush.Color := RGB(0, Round(255 * RadarShip.LastHit), 0);
        FPaintBox.Canvas.Pen.Color := FPaintBox.Canvas.Brush.Color;
//        FPaintBox.Canvas.Ellipse(DX - 3, DY - 3, DX + 3, DY + 3);
        FPaintBox.Canvas.Ellipse(RadarDX - 3, RadarDY - 3, RadarDX + 3, RadarDY + 3);

        // Draw Contact
        FPaintBox.Canvas.Pen.Style := psSolid;
        FPaintBox.Canvas.Pen.Width := 1;
        FPaintBox.Canvas.Brush.Style := bsClear;
        FPaintBox.Canvas.Pen.Color := clGray;

        FPaintBox.Canvas.TextOut(RadarDX+5, RadarDY-5, Format('%.4d',[RadarShip.ID]));

        if FContactShipHeadingVisible then begin
//            Vec := RadarShip.Speed * 0.01;
//            VX := DX + Round(Sin(DegToRad(RadarShip.Heading)) * Vec * PXNM);
//            VY := DY - Round(Cos(DegToRad(RadarShip.Heading)) * Vec * PXNM);
          Vec := 20;
          VX := RadarDX + Round(Sin(DegToRad(RadarShip.Heading)) * Vec);
          VY := RadarDY - Round(Cos(DegToRad(RadarShip.Heading)) * Vec);

//            FPaintBox.Canvas.MoveTo(DX, DY);
          FPaintBox.Canvas.MoveTo(RadarDX, RadarDY);
          FPaintBox.Canvas.LineTo(VX, VY);
        end;

        if RadarShip.IsTracked then begin
          FPaintBox.Canvas.Pen.Color := FContactTrackedColor;
          FPaintBox.Canvas.Brush.Style := bsClear;
          FPaintBox.Canvas.Rectangle(RadarDX - 8, RadarDY - 8, RadarDX + 8, RadarDY + 8);

          FPaintBox.Canvas.Font.Color := FContactTrackedTextColor;
          FPaintBox.Canvas.TextOut(FPaintBox.Canvas.ClipRect.Right - 150, PanelY,
            Format('[%d] %s', [RadarShip.ID, RadarShip.Name]));
          FPaintBox.Canvas.TextOut(FPaintBox.Canvas.ClipRect.Right - 150,
            PanelY + 15, Format('S:%0.1f K:%03.0f'#176,
            [RadarShip.Speed, RadarShip.Heading]));
          Inc(PanelY, 45);
        end;

      end;
    end;
  end;
end;

end.
