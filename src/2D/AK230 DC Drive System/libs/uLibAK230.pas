unit uLibAK230;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Math,
  SpeedButtonImage, ExtCtrls, uDetected, uLibTDCDisplay,
  MapXLib_TLB, uBaseFunction, uTDCConstan, uBaseDataType, uBaseConstan, Types, uLibTDCClass;

type
  Ttype_of_Gun = (Gun30mm);
//==============================================================================
  TGun = class
  public
    Isfunctionalized  : Boolean;
    PowerOn           : Boolean;
    Synchronized      : Boolean;  // pada gun2,3 ato local/remote pada gun1
    GunType           : Ttype_of_Gun;
    IsAssigning       : Boolean;
    //ParPROX : Boolean;       // gun1,2,3
    AssignTo          : TFireControl;
    Bullet1Type       : byte;      // 0=IMPACT, 1=PAR PROX
    Bullet2Type       : byte;      // 0=HE TRCR, 1=PRE FRAG, gun2 or 3 only
    MuzzleVelocity    : double;
    ID                : byte;
    FireBreakTimer    : double;
    Salvo             : boolean;
    IsSalvoFiring     : Boolean;
    // cm status
    IsBlind, IsInRange: boolean;
    TOF: single; //change by bagoes
    ReadyToFire, Firing: boolean;
    Corrected: boolean;
    PHPStart, PHPEnd, PHPCounter: Integer; //change by bagoes
    PosSplash, PosBeforeCorr, LastposCorr , PosAfterCorr: t2DPoint;

    constructor Create(const Jenis: integer);
    procedure OpenFire;
  end;
//==============================================================================
  TElevationMark = class(TTDC_Cursor)
  protected
    ptH2, ptH3 : TPoint;
  public
    constructor Create;

    procedure Draw(aCnv: TCanvas);       virtual;
    procedure ConvertCoord(aMap: TMap);  override;
  end;
implementation

{ TGun }

constructor TGun.Create(const Jenis: integer);
var val: integer;
begin
  Isfunctionalized  := False;
  IsAssigning       := False;
  AssignTo          := nil;
  IsSalvoFiring := False;
  Salvo             := True;
  PHPStart          := 0;
  PHPEnd            := 0;
  PHPCounter        := -1;
  ID                := Jenis;
  case Jenis of
    1: begin
        MuzzleVelocity := C_MuzzleVel1;
        GunType := Gun30mm;
        Salvo   := False;
        PowerOn := True;
       end;

//    2: begin
//        MuzzleVelocity := C_MuzzleVel2;
//        GunType := Gun40mm;
//        PowerOn := True;
//       end;
//
//    3: begin
//        MuzzleVelocity := C_MuzzleVel3;
//        GunType := Gun40mm;
//        PowerOn := True;
//       end;
  end;

    PosBeforeCorr.X := 0.5;
    PosBeforeCorr.Y := 0.5;
    PosAfterCorr.X := 0.5;
    PosAfterCorr.Y := 0.5;
end;

procedure TGun.OpenFire;
begin

end;

{ TElevationMark }

procedure TElevationMark.ConvertCoord(aMap: TMap);
var sx, sy: single;
    pt: t2DPoint;
    sinx, cosx, headEast: extended;
const
    p = 0.95;
    p2 = 0.96;
    p3 = 0.97;
begin
  if not Visible then exit;

  headEast := C_DegToRad * (FHeading);
  SinCos(headEast, sinX, cosX );

  //aMap.ConvertCoord(sx, sy, Org.X, Org.Y , miMapToScreen);
  //ptC := Point(Round(sx), Round(sy));

  pt.x := Org.X + (FDistance * p) * cosX;
  pt.y := Org.Y + (FDistance * p) * sinX;
  aMap.ConvertCoord(sx, sy, pt.X, pt.Y , miMapToScreen);
  Center := Point(Round(sx), Round(sy));

  pt.x := Org.X + (FDistance * p2) * cosX;
  pt.y := Org.Y + (FDistance * p2) * sinX;
  aMap.ConvertCoord(sx, sy, pt.X, pt.Y , miMapToScreen);
  ptH := Point(Round(sx), Round(sy));

  pt.x := Org.X + (FDistance * p3) * cosX;
  pt.y := Org.Y + (FDistance * p3) * sinX;
  aMap.ConvertCoord(sx, sy, pt.X, pt.Y , miMapToScreen);
  ptH2 := Point(Round(sx), Round(sy));

  pt.x := Org.X + FDistance * cosX;
  pt.y := Org.Y + FDistance * sinX;
  aMap.ConvertCoord(sx, sy, pt.X, pt.Y , miMapToScreen);
  ptH3 := Point(Round(sx), Round(sy));
end;

constructor TElevationMark.Create;
begin
  inherited;

end;

procedure TElevationMark.Draw(aCnv: TCanvas);
begin
  if not Visible then exit;

  aCnv.Pen.Color := Color;
  aCnv.Pen.Width := 2;
  aCnv.Pen.Style := Style;

  aCnv.MoveTo(Center.X, Center.Y);
  aCnv.LineTo(ptH.X, ptH.Y);

  aCnv.MoveTo(ptH2.X, ptH2.Y);
  aCnv.LineTo(ptH3.X, ptH3.Y);
end;

end.
