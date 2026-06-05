unit uRadarSensor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.Contnrs, System.Math,
  Vcl.ExtCtrls, System.UITypes,

  uShipModel,
  uVehicle,
  uLibConst,
  uBaseFunction,
  uBaseConst;

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

    function UpdateRadarContactList(AShip: TVehicle): TVehicle;

    procedure ClearBackground(const ACanvas: TCanvas);
    procedure DrawSmoothSweep(CX, CY, Radius: Integer; TrailWidth: Double);
    procedure DrawCompass(CX, CY, Radius: Integer; EffRange: Double);
//    procedure DrawOwnShipHeading(CX, CY, Radius: Integer;
//      const OwnShip: TShipContact);
    procedure DrawOwnShipHeading(CX, CY, Radius: Integer;
      const OwnShip: TVehicle);

    procedure PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PaintBoxPaint(Sender: TObject);

    procedure DrawTicksDegree;
    procedure DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;
      Color: TColor; Width: Integer);
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

function Rotate(Width, Height, Radius: Integer;
  Degrees: Double): Winapi.Windows.TPoint;
var
  Angle: Double;
  W, H: Integer;
//  HeadingView : THeadingRadarView;
begin
//  if Assigned(NavSimCenter.NAV_Radar.HeadingView) then
//  begin
//   HeadingView := uRadarNavManager.NavSimCenter.NAV_Radar.getHeadingLine;
//   if HeadingView.HeadingMode = sbmCourseUp then
//   begin
//       Angle := HeadingView.Heading;
//       if Angle < 0 then Angle := CBaseAngle - Angle;
//       Angle := CBaseAngle - Angle;
//       Angle := ConvCompass_To_Cartesian(Angle);
//       Angle := ConvCustomAngleStart(degrees,Angle);
//       Angle := Angle*C_DegToRad;
//   end
//   else
//   //if HeadingView.HeadingMode = sbmCourseUp then
//      Angle  := ConvCartesian_To_Compass(Degrees)*C_DegToRad;
//  end
//  else
     Angle := ConvCartesian_To_Compass(Degrees)*C_DegToRad;

  W := Width div 2;
  H := Height div 2;
  Result.X := W + Round(Cos(Angle) * Radius);
  Result.Y := H + Round(Sin(Angle) * Radius);
  Result.Y := (H * 2) - Result.Y;
end;

//function TRadarDisplay.UpdateRadarContactList(AShip: TShipContact): TShipContact;
//var
//  i: Integer;
//  ShipContact: TShipContact;
//  isFound: Boolean;
//begin
//  Result:= nil;
//  if Assigned(AShip) then begin
//    isFound:= False;
//    for i := 0 to FRadarContacts.Count - 1 do begin
//      ShipContact:= TShipContact(FRadarContacts[i]);
//      if ShipContact.ID = AShip.ID then begin
//        isFound:= True;
//        Break;
//      end;
//    end;
//
//    if not isFound then begin
//      ShipContact:= TShipContact.Create;
//      ShipContact.AssignFrom(AShip);
//      FRadarContacts.Add(ShipContact);
//    end;
//
//    Result:= ShipContact;
//  end;
//end;

function TRadarDisplay.UpdateRadarContactList(AShip: TVehicle): TVehicle;
var
  i: Integer;
  VehicleContact: TVehicle;
  isFound: Boolean;
begin
  Result:= nil;
  if Assigned(AShip) then begin
    isFound:= False;
    for i := 0 to FRadarContacts.Count - 1 do begin
      VehicleContact:= TVehicle(FRadarContacts[i]);
      if VehicleContact.ShipID = AShip.ShipID then begin
        isFound:= True;
        Break;
      end;
    end;

    if not isFound then begin
      VehicleContact:= TVehicle.Create;
      VehicleContact.AssignFrom(AShip);
      FRadarContacts.Add(VehicleContact);
    end;

    Result:= VehicleContact;
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

procedure TRadarDisplay.DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;
  Color: TColor; Width: Integer);
begin
  Canvas.Pen.Color := Color;
  Canvas.Pen.Width := Width;
  Canvas.MoveTo(X1, Y1);
  Canvas.LineTo(X2, Y2);
end;

procedure TRadarDisplay.DrawTicksDegree;
var
  I,Size,Enlarge,StartAngle,AngleRadius: Integer;
  ticksMax,ticks,ticksEnlarge,ticksMin :integer;
  labels,decimals,labelsoffset: integer;
  Angle,AngleOffset,BaseAngle : integer;
  Increment,Degrees,CurValue,IncValue: Double;
  R: TRect;
  P1, P2: Winapi.Windows.TPoint;
  Mask,StrValue: string;
  ticksColor : TColor;
  labelsfont : TFont;

  left,top,right,bottom : Integer;
  diffBeetwinWH : Integer;  //differnt beetwin width and height width - height, kemudian dibagi dua sebagai batas left dan right,supaya lingkarannya tetap center.
begin
  Angle := 0;
  baseAngle := round(CBaseAngle);
  AngleOffset := round(CBaseAngle);
  StartAngle := BaseAngle + Angle;
  diffBeetwinWH := (FPaintBox.Width - FPaintBox.Height) div 2;

  top := 50;
  bottom := FPaintBox.Height - top;
  left := diffBeetwinWH + top;
  right := FPaintBox.Width - left;

  //draw ticks:
  FPaintBox.Canvas.Pen.Color := CForegroundColor;

  FPaintBox.Canvas.Brush.Style := bsClear;
//    R := Rect(0,0, Map.Width, Map.Height);
  R := Rect(left,top, right, bottom);
  AngleRadius := (R.right - R.left) div 2;
//    AngleRadius := 280;
  ticksmax := 16;
  ticks := round(24);
  ticksEnlarge := 5;
  ticksMin := 8;
  ticksColor := clGreen;
  labels := 24;
  decimals := 0;
  labelsoffset := 30;

  {jarum derajat}

  if Ticks >= 1 then
  begin
    Enlarge := TicksEnlarge;
    Degrees := StartAngle;
    Increment := AngleOffset/Ticks;
    FPaintBox.Canvas.Pen.Color := clRed;
    FPaintBox.Canvas.Pen.Width := 3;
    FPaintBox.Canvas.Ellipse(R.Left, R.Top, R.Right, R.Bottom);
    for I := 1 to Ticks + 1 do
    begin
//        if (Enlarge mod TicksEnlarge = 0) then
//          Size := TicksMax else Size := TicksMin;
      Size := TicksMax;
      Inc(Enlarge);
      P1 := Rotate(FPaintBox.Width, FPaintBox.Height, AngleRadius, Degrees);
      P2 := Rotate(FPaintBox.Width, FPaintBox.Height, AngleRadius + Size, Degrees);
      DrawLine(FPaintBox.Canvas, P1.X, P1.Y, P2.X, P2.Y, TicksColor, 2);
      Degrees := Degrees + Increment;
    end;
  end;


  {angka}
  labelsfont := TFont.Create();
  try
    labelsfont.Color := clYellow;
    labelsfont.Size := 10;

    if Labels >= 1 then
    begin
      FPaintBox.Canvas.Font := LabelsFont;
      CurValue := 0;
      IncValue := (360 - 0)/labels;
      Degrees := StartAngle;
      Increment := AngleOffset/labels;
      Mask := '%.' + IntToStr(Decimals) + 'f';
      for I := 1 to Labels  do
      begin
  //        P1 := Rotate(MeterWidth, MeterHeight, AngleRadius + LabelsOffset, Degrees);
        P1 := Rotate(FPaintBox.Width, FPaintBox.Height, AngleRadius + LabelsOffset, Degrees);

  //        if strlen(pchar(floattostr(CurValue))) <= 2 then
  //          begin
  //          if curValue = 0 then
  //             StrValue := '00'+Format(Mask, [CurValue])
  //          else
  //             StrValue := '0'+Format(Mask, [CurValue]);
  //          end
  //        else
        if round(CurValue) mod 30 = 0 then
        begin
          if CurValue > 180 then
             StrValue := Format(Mask, [CurValue - 360]) + '°'
          else
            StrValue := Format(Mask, [CurValue]) + '°';

          P1.X := P1.X - FPaintBox.Canvas.TextWidth(StrValue) div 2;
          P1.Y := P1.Y - FPaintBox.Canvas.TextHeight(StrValue) div 2;
          FPaintBox.Canvas.TextOut(P1.X, P1.Y, StrValue);
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue*I);
        end
        else
        begin
          Degrees := Degrees + Increment;
          CurValue := 0 + (IncValue*I);
        end;
      end;
    end;
  finally
    labelsfont.Free;
  end;


end;

//procedure TRadarDisplay.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
//  Shift: TShiftState; X, Y: Integer);
//var
//  i, CX, CY, Radius, Minus, DX, DY: Integer;
//  Ship: TShipContact;
//  PXNM, RelX, RelY, EffRange, LatAdj: Double;
//begin
//  CX := FPaintBox.Width div 2;
//  CY := FPaintBox.Height div 2;
//  Radius := Min(CX, CY);
//  Minus:= Trunc(((100.0-FRadarRadiusPercentage)/100.0)*Radius);
//  Radius:= Radius - Minus;
//  EffRange := FRadarRangeNM / FZoomLevel;
//  PXNM := Radius / EffRange;
//  LatAdj := Cos(DegToRad(FRadarCenterLat));
//  for i := 0 to FContactList.Count - 1 do
//  begin
//    Ship := TShipContact(FContactList[i]);
//    if Ship.ID = FOwnShipID then
//      Continue;
//    RelY := (Ship.Lat - FRadarCenterLat) * 60.0;
//    RelX := (Ship.Lon - FRadarCenterLon) * (60.0 * LatAdj);
//    DX := CX + Round(RelX * PXNM);
//    DY := CY - Round(RelY * PXNM);
//    if (Abs(X - DX) < 15) and (Abs(Y - DY) < 15) then
//    begin
//      Ship.IsTracked := not Ship.IsTracked;
//      Exit;
//    end;
//  end;
//end;

procedure TRadarDisplay.PaintBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i, CX, CY, Radius, Minus, DX, DY: Integer;
  V: TVehicle;
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
    V := TVehicle(FContactList[i]);
    if V.ShipID = FOwnShipID then
      Continue;
    RelY := (V.PosY - FRadarCenterLat) * 60.0;
    RelX := (V.PosX - FRadarCenterLon) * (60.0 * LatAdj);
    DX := CX + Round(RelX * PXNM);
    DY := CY - Round(RelY * PXNM);
    if (Abs(X - DX) < 15) and (Abs(Y - DY) < 15) then
    begin
      V.IsTracked := not V.IsTracked;
      Exit;
    end;
  end;
end;

procedure TRadarDisplay.PaintBoxPaint(Sender: TObject);
begin
  Render(FDeltaTime);
end;

{
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
end;
}

procedure TRadarDisplay.DrawCompass(CX, CY, Radius: Integer; EffRange: Double);
var
  i, j, RingR, PanelY: Integer;
  Rad, Ang: Double;
  S: string;
  V: TVehicle;
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
end;

//procedure TRadarDisplay.DrawOwnShipHeading(CX, CY, Radius: Integer;
//  const OwnShip: TShipContact);
//begin
//  FPaintBox.Canvas.Pen.Color := FOwnShipHeadingColor;
//  FPaintBox.Canvas.Pen.Width := 2;
//  FPaintBox.Canvas.MoveTo(CX, CY);
//  FPaintBox.Canvas.LineTo(CX + Round(Cos(DegToRad(90 - OwnShip.Heading)) *
//    Radius), CY - Round(Sin(DegToRad(90 - OwnShip.Heading)) * Radius));
//end;

procedure TRadarDisplay.DrawOwnShipHeading(CX, CY, Radius: Integer;
  const OwnShip: TVehicle);
begin
  FPaintBox.Canvas.Pen.Color := FOwnShipHeadingColor;
  FPaintBox.Canvas.Pen.Width := 2;
  FPaintBox.Canvas.MoveTo(CX, CY);
  FPaintBox.Canvas.LineTo(CX + Round(Cos(DegToRad(90 - OwnShip.HeadingDeg)) *
    Radius), CY - Round(Sin(DegToRad(90 - OwnShip.HeadingDeg)) * Radius));
end;

{
procedure TRadarDisplay.Render(ADeltaTime: Double);
var
  i, CX, CY, Radius, Minus, DX, DY, RadarDX, RadarDY, VX, VY, PanelY: Integer;
  RadarShip, Ship, OwnShip: TShipContact;
  PXNM, RX, RY, RadarRX, RadarRY, Eff, LatAdj, Vec, Bearing, RadarBearing, Diff,
  DegPerSec: Double;
begin
  CX := FPaintBox.Width div 2;
  CY := FPaintBox.Height div 2;
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
      else if (Ship.LastHit > 0.01) then
      begin

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
          Vec := 20;
          VX := RadarDX + Round(Sin(DegToRad(RadarShip.Heading)) * Vec);
          VY := RadarDY - Round(Cos(DegToRad(RadarShip.Heading)) * Vec);

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
}

procedure TRadarDisplay.Render(ADeltaTime: Double);
var
  i, CX, CY, Radius, Minus, DX, DY, RadarDX, RadarDY, VX, VY, PanelY: Integer;
  RadarShip, Ship, OwnShip: TVehicle;
  PXNM, RX, RY, RadarRX, RadarRY, Eff, LatAdj, Vec, Bearing, RadarBearing, Diff,
  DegPerSec: Double;
begin
  CX := FPaintBox.Width div 2;
  CY := FPaintBox.Height div 2;
  Radius:= Min(CX, CY);
  Minus:= Trunc(((100.0-FRadarRadiusPercentage)/100.0)*Radius);
  Radius:= Radius - Minus;

  OwnShip := nil;
  for i := 0 to FContactList.Count - 1 do
    if TVehicle(FContactList[i]).ShipID = OwnShipID then
    begin
      OwnShip := TVehicle(FContactList[i]);
      Break;
    end;
  if not Assigned(OwnShip) then
    Exit;

  FRadarCenterLat := OwnShip.PosY;
  FRadarCenterLon := OwnShip.PosX;
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

  DrawTicksDegree;
  //DrawCompass(CX, CY, Radius, Eff);

  if FOwnShipHeadingVisible then
  begin
    DrawOwnShipHeading(CX, CY, Radius, OwnShip);
  end;

  PanelY := 20;
  for i := 0 to FContactList.Count - 1 do
  begin
    Ship := TVehicle(FContactList[i]);
    RadarShip:= UpdateRadarContactList(Ship);
    RadarShip.IsTracked:= Ship.IsTracked;

    RY := (Ship.PosY - FRadarCenterLat) * 60.0;
    RX := (Ship.PosX - FRadarCenterLon) * (60.0 * LatAdj);
    RadarRY := (RadarShip.PosY - FRadarCenterLat) * 60.0;
    RadarRX := (RadarShip.PosX - FRadarCenterLon) * (60.0 * LatAdj);

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

      if Ship.ShipID = OwnShipID then
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

        FPaintBox.Canvas.TextOut(RadarDX+5, RadarDY-5, Format('%.4d',[RadarShip.ShipID]));

        if FContactShipHeadingVisible then begin
          Vec := 20;
          VX := RadarDX + Round(Sin(DegToRad(RadarShip.HeadingDeg)) * Vec);
          VY := RadarDY - Round(Cos(DegToRad(RadarShip.HeadingDeg)) * Vec);

          FPaintBox.Canvas.MoveTo(RadarDX, RadarDY);
          FPaintBox.Canvas.LineTo(VX, VY);
        end;

        if RadarShip.IsTracked then begin
          FPaintBox.Canvas.Pen.Color := FContactTrackedColor;
          FPaintBox.Canvas.Brush.Style := bsClear;
          FPaintBox.Canvas.Rectangle(RadarDX - 8, RadarDY - 8, RadarDX + 8, RadarDY + 8);

          FPaintBox.Canvas.Font.Color := FContactTrackedTextColor;
          FPaintBox.Canvas.TextOut(FPaintBox.Canvas.ClipRect.Right - 150, PanelY,
            Format('[%d] %s', [RadarShip.ShipID, RadarShip.UniqueID]));
          FPaintBox.Canvas.TextOut(FPaintBox.Canvas.ClipRect.Right - 150,
            PanelY + 15, Format('S:%0.1f K:%03.0f'#176,
            [RadarShip.Speed_mps, RadarShip.HeadingDeg]));
          Inc(PanelY, 45);
        end;

      end;
    end;
  end;



end;

end.
