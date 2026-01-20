unit uLibAK230Class;

interface

uses Dialogs, Classes, Windows, Graphics, Forms,  MapXLib_TLB, uMapWindow,
    uLibTDCClass, uLibTDCDisplay, uTDCConstan, uDetected, uLibTDCTracks,
    uBaseSimulationObject, uTCPDatatype, uBaseDataType, Math,
    {uLibWCCku,}uLibAK230, uBaseConstan, uTestShip, ufLog, uLibTDC_Object,
    uDataModule, uLibClientObject;

type
  TTMADType = (ttAPD, ttBDD, ttERBD1, ttERBD2, ttERPD);
  TFireModeWCC = (fDirectBomb, fBlindBomb, fIndBomb);

  tbrData = record
    b, r: double;
  end;

  TBallisticData = record
    MuzzleVelocity,
    BarometricPressure,
    AirTemperature,
    Humidity,
    WindSpeed,
    OwnSpeed,
    TargetSpeed : double;

  end;

  TGenericAK230Interface = class(TGenericTDCInterface)
  protected
    // elev mark
    EMarkHeading: integer;
    EFlag: boolean;
    EMarkMax, EMarkMin: integer;

    FBallData1, FBallData2, FBallData3 : TBallisticData;

    procedure SetEMarkFlag(const val: boolean);
    procedure TOMarker_SetPosition(const r, b: double);

    procedure GetRandomPosition(var x, y, z: double);
    procedure GetRandomSpeedCourse(var s, c: double; const tipe: TSIMType);

  public
     // panel WCC
//    frmWCCAtas1   : TForm;
//    frmWCCAtas2   : TForm;
//    frmWCCBawah1  : TForm;
//    frmWCCBawah2  : TForm;
//    frmScopeA     : TForm;
//    frmScopeB     : TForm;
//    frmQEK        : TForm;
//    frmAnduNala   : TForm;
//    frmBackground : TForm;

    //Console     : TWcc;
    //ColorButton : TBtnCol;

    constructor Create;
    destructor Destroy; override;

    procedure ConvertViewPosition;
    procedure Draw(aCnv : TCanvas); virtual;

    procedure Run(aDt: double);

    procedure Initialize; virtual;

    procedure ShowAllForm(const aShipClassID : integer); virtual;
    function FindToBeDeletedTrack(var IsNew: boolean; var indx: Integer): boolean;

    // ring dimmer
    procedure DrawAngle(aCnv:TCanvas);
    function MeterWidth: Integer;
    function MeterHeight: Integer;
    function WDiv2: Integer;
    function HDiv2: Integer;
    procedure RotateVarXY(Width, Height, Radius: Integer; Degrees: Double ; var sx, sy : integer );
    //function Rotate(Width, Height, Radius: Integer; Degrees: Double): TPoint;
    procedure DrawLine(Canvas: TCanvas; X1, Y1, X2, Y2: Integer;Color: TColor; Width: Integer);

  public
    // Object yg akan dikendalikan WCC
    // ListWeaponAssigned : TList;
    // TScenarioWeapon;
    MslNumb : Integer;
    GunL, GunR: TGun;
    TGM_Marker  : TTDC_Symbol; // Tracking Gate Marker
    SIM_Marker  : TTDC_Symbol;
    EMark       : TElevationMark;
    IsTGMMoveable: boolean;
    OffsetPoint_Marker  : TTDC_Symbol;
    IndBombData : tbrData;

//    WCCAndu: TAnduWCC;
//    ModulKoreksi: TFrmKoreksi;

    GunLPressed, GunRPressed : boolean;
    ActiveFC    : TFireControl;

    //  Display simbol

//    IsRRNF_on,
//    IsRadarError,
//    IsCompError,
//    IsRPC_on,
//    IsRDY_RH_MAG_on,
//    IsRDY_LH_MAG_on,
//    IsGun2Syn,
//    IsGun3Syn : Boolean;                   // untuk setting alat dari Instruktur

    SIMObject_ship1, SIMObject_ship2 : TXShip;    // Simulation Object ship

    procedure TGM_Reset;
    procedure TGM_SetPosition(const x, y: integer);
    procedure SIM_SetPosition(const x, y: double);
    procedure SetEmarkHeading;
    procedure SetEMarkConstraint(const min, max: integer);
    property EMarkFlag: boolean read EFlag write SetEMarkFlag;

    function ThrowOffMode(const pos: integer): boolean;
    procedure SetAssign_OnThrowOff(GunID : byte);

    function TestBlindArc(const Gun: byte; const Tgt: TManualTrack): boolean;
    function CekGunStatus: boolean; // blind, inrange

    function  AssignGunToFC(const Gun_ID, FCID: byte; const send: boolean= TRUE): boolean;
    function  DeAssignGun(const Gun_ID, FCID: byte; const send: boolean= TRUE): boolean;
    procedure DeassignActiveGun;


//    procedure tes(const Id : byte);

//    procedure ShowBScope(FCID: byte; const aShow, status: boolean);
//    procedure SetBScopeMarkerPos(const x,y: double);
//    function  GetBScopeMarkerPosX: double;
//    function  GetBScopeMarkerPosY: double;
//    procedure ShowAScope(const stat: ATOStat);

    //function WCC_FireGun(const Gun: byte): integer; // return TOF

    procedure SetRadarOnOff(const bOke: boolean);

    function DoBlindBomb: boolean;
    function unDoBlindBomb: boolean;
    function DoGenFix(const tFCID: byte): boolean;
    function DoIndirectBomb: boolean;
    function unDoIndirectBomb: boolean;

    procedure OffsetPoint_SetPosition(const x, y: double);

    procedure ShowSplash(TheGun: TGun; const IsShown: boolean);
    procedure ShowPHP(TheGun: TGun; const IsShown: boolean);
//    procedure ClearPHPandSplash(TheGun: TGun);
    procedure DoGunCorrection(TheGun: TGun);

    procedure SystemReset;
    procedure CreateSIMObject(const IsCreating: boolean);
    procedure ClearSIMObject;

    //procedure GetAnduData(const aFC: byte; var aData: TFireControlData);
    function IsFireControlInUse(const aFC: byte): boolean;

//    function GetAnduIndex(const aCode: string): byte;
//    procedure UpdateAnduData;

  protected
    //TheLog : TStringList;

    procedure InsertIntoPage2(const indx: integer);

    function CekDataBalistik: boolean;
    procedure AK230_FireGunLagi(const GunNumber: byte);

    procedure SetGunReady;

  public
    procedure RunGun(const aDeltaMs: double);

    function InRangeToFire(TargetPosX,TargetPosY:Double; GunType:byte): Boolean;

    procedure GetPHP(GunNumb:byte;  var X,Y,Z :Double);
    function  GetWeaponID(Gun_ID: word):word;
    function  GetGUN_by_ID(Gun_ID: word):TGun;
    function  GetModeID_Fire(TheGun : TGUN):byte;
    procedure StartCannonFire(Gun_ID : word);
    procedure StopCannonFire(Gun_ID : word);

    Procedure GetGunTOFfromDb(Gun_numb :integer; hpX, hpY, hpZ : Double);
//    procedure Update_OnAnduChange(Sender: TObject);
//    procedure Correction_OnAnduChange(Sender: TObject);
//    procedure DoCorrection_OnAnduChange(const Gun_ID, Mode : byte);

    procedure DoCorrectionInDirAndBlindBomb(TheGun: TGun; var Brg, Elv: double);
    procedure DoCorrectionManDirBomb(TheGun: TGun; var Brg, Elv: double);
    procedure DoCorrectionAutoDirBomb(TheGun: TGun;var Corr_Training, Corr_Elev: Double);
    procedure DoCorrectionDirectBomb(TheGun: TGun;var Corr_Training, Corr_Elev: Double);


    procedure LineCorrection(var oX, oY: double; GunNum : word);
    procedure RangeCorrection(var oX, oY: double; GunNum : word);

    function FindTOFandPHPpoint(Gun_numb: Word; TgtCourse, TgtSpeed:Single;
       var oX, oY, oZ: Double): Single;
    Function GetTOF(Gun_numb :Word; X1,Y1,X2,Y2,Z2: Double): Single;
    procedure CalcHitPredition(const tRange, tBearing, tSpeed, tCourse: double;
       const pSpeed: double;
       var hRange, hBearing, hTime, hSpeed: double);
    procedure Erasesplash(IdGun:Integer);
    procedure ShowSplasFrom3D(Rec : TRecSplashCannon);
    procedure RecvWCCSettingConsole(aRec: TRecStatus_Console);

    procedure DeleteAllTrack;
    procedure SetTrackShown(Isvisible : boolean);
    procedure SendEvenAK230(EvenId: Word; const Prm1 :double = 0; Prm2 : double = 0; Prm3: double = 0);
  end;
const  C_RangeBTK_InMetter = 20;
       g120mm = 1;
       g40mm = 2;

implementation

uses
  SysUtils,
  Types,
  uSimulationManager,
  uBaseFunction,
  uBaseGraphicProc,
  uLibRadar,
  uMapXFunction,
  uBScopeBaseDisplay,
  uRadarTracks,
  StdCtrls;

function UniqueID_To_dbID(const uid: string): integer;
var s: string;
begin
  s := Copy(uid, 4, Length(uid)-3);
  try
    result := StrToIntDef(Trim(s),0);
  except
    on EConvertError do begin
      result := 0;
      exit;
    end
  end;
end;



{ TGenericAK230Interface }

procedure TGenericAK230Interface.AK230_FireGunLagi(const GunNumber: byte);
var aRec      : TRecMeriam;
    TheGun    : TGun;
    indx  : byte;
    GunElevation, RangeAffected, jarakTarget, bearingTarget, pX, pY : double;
    dPt : t2DPoint;
    Mv : Double;
begin

  if not CekDataBalistik then exit;

//  case GunNumber of
//    1: begin
//      TheGun := Gun1;
//      indx := 5;//C_MuzzleV1;
//    end;
//    2: begin
//      TheGun := Gun2;
//      indx := 6;//C_MuzzleV2;
//    end;
//    3: begin
//      TheGun := Gun3;
//      indx := 7;//C_MuzzleV3;
//    end;
//  end;

  if (TheGun.AssignTo = nil) or (TheGun.AssignTo.TrackedTarget = nil) then exit;

  jarakTarget := Floor(CalcRange(xSHIP.PositionX, xSHIP.PositionY, TheGun.AssignTo.TrackedTarget.PositionX,
    TheGun.AssignTo.TrackedTarget.PositionY) * C_NauticalMiles_TO_Meter);

  bearingTarget := CalcBearing(xSHIP.PositionX, xSHIP.PositionY, TheGun.AssignTo.TrackedTarget.PositionX,
    TheGun.AssignTo.TrackedTarget.PositionY);

//  Mv := WCCAndu.Page_1[indx].GetDoubleValue;
//  GunElevation := ModulKoreksi.GetElevation(jarakTarget, Mv,
//    WCCAndu.Page_1[C_AirPressure].GetDoubleValue, WCCAndu.Page_1[C_AirTemp].GetDoubleValue,
//    WCCAndu.Humidity.GetDoubleValue, WCCAndu.Page_1[C_WindSpeed].GetDoubleValue,
//    xSHIP.Speed, TheGun.AssignTo.TrackedTarget.Speed);

//  if not WCCAndu.Page_2[C_ElCorr][GunNumber].IsEmpty then       //GunElevation in degrees
//    GunElevation := GunElevation + (WCCAndu.Page_2[C_ElCorr][GunNumber].GetDoubleValue * C_Mils_To_Degree);

//  RangeAffected := ModulKoreksi.GetTargetRange(jarakTarget, WCCAndu.Page_1[C_AirPressure].GetDoubleValue,
//    WCCAndu.Page_1[C_AirTemp].GetDoubleValue, GunElevation);

//  if not WCCAndu.Page_2[C_RGCorr][GunNumber].IsEmpty then       //RangeAffected in meters
//    RangeAffected := RangeAffected + (WCCAndu.Page_2[C_RGCorr][GunNumber].GetDoubleValue * C_Yard_To_Meter);

  //RangeAffected in NauticalMiles
  RangeAffected := RangeAffected * C_Meter_To_NauticalMiles;

//  if not WCCAndu.Page_2[C_LNCorr][GunNumber].IsEmpty then       //Bearing in degrees
//    bearingTarget := bearingTarget + (WCCAndu.Page_2[C_LNCorr][GunNumber].GetDoubleValue * C_Mils_To_Degree);

//  WCCAndu.Page_2[C_TOF][GunNumber].SetValue(jarakTarget / WCCAndu.Page_1[indx].GetDoubleValue);

  RangeBearingToCoord(RangeAffected, bearingTarget, dPt.X, dPt.Y);
  pX := xSHIP.PositionX + dPt.X * C_NauticalMile_To_Degree;
  pY := xSHIP.Positiony + dPt.Y * C_NauticalMile_To_Degree;

  if GunNumber = 1 then begin
    OBMRight.mPos.X := pX;
    OBMRight.mPos.Y := pY;
    OBMRight.Center  := ConvertToScreen(OBMRight.mPos.X, OBMRight.mPos.Y);
  end
  else begin
    OBMLeft.mPos.X := pX;
    OBMLeft.mPos.Y := pY;
    OBMLeft.Center  := ConvertToScreen(OBMLeft.mPos.X, OBMLeft.mPos.Y);
  end;

  with aRec do begin
    ShipID      := UniqueID_To_dbID(xSHIP.UniqueID);
    OrderID     :=  __ORD_CANNON_F;
    Gun_number  := GunNumber;
    X           := pX;
    Y           := pY;
  end;
  netSend.sendDataEx(C_REC_CANNON, @aRec);

//  TheGun.TOF := Ceil(WCCAndu.Page_2[C_TOF][GunNumber].GetDoubleValue);

  if TheGun.TOF <= 2 then begin
    TheGun.PHPStart := 0;
    TheGun.PHPEnd := 2;
  end
  else begin
    TheGun.PHPStart := Round(TheGun.TOF - 2);     // modif by bagoes
    TheGun.PHPEnd := Round(TheGun.TOF + 2);
  end;
  TheGun.Firing := True;
end;

function TGenericAK230Interface.AssignGunToFC(const Gun_ID, FCID: byte;
  const send: boolean): boolean;
var FC    : TFireControl;
    TheGUN: TGun;
    aRec  : TRecGunControl;
    lRec        : TRec3DSetAK230;
    //FireMod : byte;
    Bullet1Type  : byte;
    Bullet2Type  : byte;
//    fA2: TfrmWCCPanelAtas2;
    ModeID,
    TargetID  : Word;
    Range,
    CorrElev,
    CorrTraining      : Double;
begin
  result := False;

  CorrElev     := 0;
  CorrTraining := 0;
  TargetID     := 0;
  case FCID of
    1: FC := FC1;
    2: FC := FC2;
    3: FC := FC3;
    4: FC := FC4;
  end;

  TheGUN := GetGUN_by_ID(Gun_ID);

  if FC.TrackedTarget = nil then exit;

  if (TheGUN.AssignTo <> nil) then exit;

  TheGUN.AssignTo := FC;
  TheGUN.ID := Gun_ID;
//  ActiveGUN := TheGUN;
  ActiveFC  := FC;

  Bullet1Type := TheGUN.Bullet1Type;
  Bullet2Type := TheGUN.Bullet2Type;

  ModeID      := GetModeID_Fire(TheGUN);

  case ModeID of   // Correction Process
    M_DirBomb : begin
      DoCorrectionDirectBomb(TheGUN, CorrTraining, CorrElev);
      TargetID := UniqueID_To_dbID(FC.TargetUID);
    end;
    M_IndBomb_BlindBomb : begin
      DoCorrectionInDirAndBlindBomb(TheGun, CorrTraining, CorrElev);
      TargetID := 0;
      CorrTraining := CorrTraining - xSHIP.Heading;
    end;
    M_AirTarget : begin
      TargetID := UniqueID_To_dbID(FC.TargetUID);
    end;
  end;

  if FCID <> 4 then begin
    TheGUN.IsAssigning      := True;

    lRec.ShipID             := UniqueID_To_dbID(xSHIP.UniqueID);
    lRec.mWeaponID          := GetWeaponID(TheGUN.ID);
    lRec.mLauncherID        := TheGUN.ID;
    lRec.mMissileID         := TheGUN.ID;
    lRec.mMissileNumber     := 0;
    lRec.mOrderID           := __ORD_CANNON_ASSIGNED;
    lRec.mTargetID          := TargetID;
    lRec.mModeID            := ModeID;
    lRec.mUpDown            := 0;
    lRec.mAutoCorrectElev   := CorrElev;
    lRec.mAutoCorrectBearing:= CorrTraining;
    lRec.mBalistikID        := 0;

    if (netSend <> nil) then
      netSend.sendDataEx(C_REC_CANNON , @lRec);

    result := True;
  end
  else begin
    if (not FC.HasGun) and (TheGUN.AssignTo = nil) then begin
      TheGUN.AssignTo := FC;
      FC.HasGun := True;
      result := True;
    end;
  end;
  if send and result and (FCID = 4) then begin
    with aRec do begin
      ShipID := xSHIP.UniqueID;
      OrderID := OrdID_assign_gun;
      Ship_TID := FC.TrackedTarget.ShipTrackId;
      //TrackNumber := FC.TrackedTarget.TrackNumber;
      Gun_number := Gun_ID;
      AssignedTo := FCID;
      //FireMode   := FireMod;      // (SINGLE, BURST) * gun1 only
      Bullet1    := Bullet1Type;    // (PARPROX, IMPACT) gun1,2,3
      Bullet2    := Bullet1Type;    // (HE_TRACER, PRE_FRAG) * gun2,3 only
      //ControlMode:= byte;   // (remote, local) gun1,2,3
      //IsSync      : boolean;// (remote, local) gun1,2,3
      //IsBlind     : boolean;// lg blind ato ga
      //InRange     : boolean;// masuk jarak tembak ato ga
    end;
    netSend.sendDataEx(C_REC_GUN_CONTROL, @aRec);
  end;
 // WCC_FireGunLagi(Gun_ID);

  CekGunStatus;

//  fA2 := TfrmWCCPanelAtas2(frmWCCAtas2);
//  case Gun_ID of
//    1: begin
//          if Gun1.IsBlind then
//          // BtnC.UpdateImage(fA2.lmpRRNF, BtnC.redROUND_On);
//       end;
//    2: begin
//          if Gun2.IsBlind then begin
//            BtnC.UpdateImage(fA2.lmpG2BLDARC, BtnC.redROUND_On);
//          end
//          else begin
//            BtnC.UpdateImage(fA2.lmpG2BLDARC, BtnC.redROUND_Off);
//          end;
//       end;
//    3: begin
//          if Gun3.IsBlind then begin
//            BtnC.UpdateImage(fA2.lmpG3BLDARC, BtnC.redROUND_On);
//          end
//          else begin
//            BtnC.UpdateImage(fA2.lmpG3BLDARC, BtnC.redROUND_Off);
//          end;
//       end;
//  end;
end;

procedure TGenericAK230Interface.CalcHitPredition(const tRange, tBearing,
  tSpeed, tCourse, pSpeed: double; var hRange, hBearing, hTime, hSpeed: double);
var vR : double;
    tMinute: double;
    dA, dB, dC : double;
    sinA, sinB, sinC : double;
begin
//   a : target speed
//    b : relatif speed.
//    c : torpedo speed

   if  abs(pSpeed) < 0.00000001 then exit;

   dC := 180 - (tBearing - tCourse);
   sinC := sin(DegToRad(dC));
   sinA := (tSpeed * sinC)/ pSpeed;
   dA := RadToDeg(ArcSin(sinA));
   dB := 180 - dC - dA;
   sinB := Sin(DegToRad(dB));

   if  abs(sinC) < 0.00000001 then begin
      vR := pSpeed + tSpeed * cos(DegToRad(dC));
   end
   else begin
      vR := (pSpeed * sinB) / sinC;
   end;
   hBearing := tCourse + dB;

   if abs(vR) < 0.00000001 then begin
     hTime  := 99999.99;  //  tidak terkejar
     hRange := 99999.99;  //
   end
   else begin
     // hTime := (tRange / vR) / 3600;  // secon
     hTime := (tRange / pSpeed) / 3600;  // secon
     hRange := hTime * pSpeed;
   end;

   hSpeed := Vr;
end;

function TGenericAK230Interface.CekDataBalistik: boolean;
var i: integer;
begin
  // C_WindSpeed        = 1;
  // C_WindDir  		    = 2;
  // C_AirTemp  		    = 3;
  // C_AirPressure	    = 4;
  // C_MuzzleV1 		    = 5;
  // C_MuzzleV2 		    = 6;
  // C_MuzzleV3 		    = 7;
  // C_Latitude 		    = 8; // nala & rencong
  // C_CorrGun1         = 8; // singa
  // C_AirTargetHeight  = 9;
  // C_OwnSpeed 		    = 10;

  result := false;

//  for i := C_WindSpeed to C_AirTargetHeight do
//  begin
//    if (i <> C_MuzzleV3) then begin
//      if WCCAndu.Page_1[i].IsEmpty then Exit
//    end
//    else begin
//      if (shipClassID = C_ShipC_Fatahillah) and
//        (WCCAndu.Page_1[i].IsEmpty) then Exit;
//    end;
//  end;

  result := true;
end;

function TGenericAK230Interface.CekGunStatus: boolean;
var r, b: double;
begin
  SIM_Marker.Visible := TrackList.ItemCount = 0;

  if (GunL.AssignTo <> nil) and (GunL.AssignTo.Name <> 'FC4') and (GunL.AssignTo.TrackedTarget <> nil) then begin
    GunL.IsBlind := self.TestBlindArc(1, GunL.AssignTo.TrackedTarget);
    GunL.IsInRange := (CalcRange(xSHIP.PositionX, xSHIP.PositionY, GunL.AssignTo.TrackedTarget.PositionX,
    GunL.AssignTo.TrackedTarget.PositionY) < C_GUN1_RANGE);
  end
  else begin
    GunL.IsBlind := False;
    GunL.IsInRange := False;
  end;

  if (GunR.AssignTo <> nil) and (GunR.AssignTo.Name <> 'FC4') and (GunR.AssignTo.TrackedTarget <> nil) then begin
    GunR.IsBlind := self.TestBlindArc(2, GunR.AssignTo.TrackedTarget);
    GunR.IsInRange := (CalcRange(xSHIP.PositionX, xSHIP.PositionY, GunR.AssignTo.TrackedTarget.PositionX,
    GunR.AssignTo.TrackedTarget.PositionY) < C_GUN2_RANGE);
  end
  else begin
    GunR.IsBlind := False;
    GunR.IsInRange := False;
  end;

//  if (Gun3.AssignTo <> nil) and (Gun3.AssignTo.Name <> 'FC4') and (Gun3.AssignTo.TrackedTarget <> nil) then begin
//    Gun3.IsBlind := self.TestBlindArc(3, Gun3.AssignTo.TrackedTarget);
//    Gun3.IsInRange := (CalcRange(xSHIP.PositionX, xSHIP.PositionY, Gun3.AssignTo.TrackedTarget.PositionX,
//      Gun3.AssignTo.TrackedTarget.PositionY) < C_GUN3_RANGE);
//  end
//  else begin
//    Gun3.IsBlind := False;
//    Gun3.IsInRange := False;
//  end;
  SetGunReady;
end;

procedure TGenericAK230Interface.ClearSIMObject;
var    sc1, sc2 : TSimulationClass;
begin
  sc1 := SimCenter.MainObjList.FindObjectByUid('VSL1000');
  if sc1 <> nil then sc1.MarkAs_NeedToBeFree;

  sc2 := SimCenter.MainObjList.FindObjectByUid('VSL1023');
  if sc2 <> nil then sc2.MarkAs_NeedToBeFree;
end;

procedure TGenericAK230Interface.ConvertViewPosition;
begin
  inherited;
  {ConvertMembersViewsPosition(TrackList);

  OBMLeft.Center  := ConvertToScreen(OBMLeft.mPos.X, OBMLeft.mPos.Y);
  OBMRight.Center := ConvertToScreen(OBMRight.mPos.X, OBMRight.mPos.Y);}
  SIM_Marker.Center := ConvertToScreen(SIM_Marker.mPos.X, SIM_Marker.mPos.Y);
  TGM_Marker.Center := ConvertToScreen(TGM_Marker.mPos.X, TGM_Marker.mPos.Y);
  ThrowOff_Marker.Center := ConvertToScreen(ThrowOff_Marker.mPos.X, ThrowOff_Marker.mPos.Y);
  OffsetPoint_Marker.Center := ConvertToScreen(OffsetPoint_Marker.mPos.X, OffsetPoint_Marker.mPos.Y);
end;

constructor TGenericAK230Interface.Create;
begin
  inherited;
  MslNumb := 0;
  DisplaySymbols[i_Gerbang_Pelacakan].Visible := TRUE;
  TGM_Marker := DisplaySymbols[i_Gerbang_Pelacakan];  // alias
  TGM_Marker.Visible := False;

  DisplaySymbols[i_Sasaran_simulasi_tes].Visible := TRUE;
  SIM_Marker := DisplaySymbols[i_Sasaran_simulasi_tes];  // alias
  SIM_Marker.Visible := True;

  EMark := TElevationMark.Create;
  EMark.Visible := True;

  Cursorss.Visible := False;
  EMarkHeading := 270;
  SetEMarkConstraint(C_EMarkMin, C_EMarkMax);

  DisplaySymbols[i_ThrowOff].Visible := TRUE;
  ThrowOff_Marker := DisplaySymbols[i_ThrowOff];  // alias
  ThrowOff_Marker.Visible := false;

  DisplaySymbols[i_Offset_BTK].Visible := TRUE;
  OffsetPoint_Marker := DisplaySymbols[i_Offset_BTK];  // alias
  OffsetPoint_Marker.Visible := false;

//  WCCAndu := TAnduWCC.Create;
//  ModulKoreksi := TFrmKoreksi.Create(nil);

  frmLog.Hide;
end;

procedure TGenericAK230Interface.CreateSIMObject(const IsCreating: boolean);
var ship, plane: TXShip;
    pX, pY, pZ: double;
    speed, course: double;
    sc1, sc2 : TSimulationClass;
begin
  sc1 := SimCenter.MainObjList.FindObjectByUid(C_SIMUID_Ship);
  if sc1 <> nil then sc1.MarkAs_NeedToBeFree;

  sc2 := SimCenter.MainObjList.FindObjectByUid(C_SIMUID_Plane);
  if sc2 <> nil then sc2.MarkAs_NeedToBeFree;

  if IsCreating then begin
//    GetRandomPosition(pX, pY, pZ);
//    GetRandomSpeedCourse(speed, course, tsShip);

//    Ship := TXShip.Create;
//    Ship.CreateDefaultView(FMap);
//    Ship.UniqueID := C_SIMUID_Ship;
//    Ship.Speed    := speed;
//    Ship.Heading  := course;
//    Ship.PositionX := pX;
//    Ship.PositionY := pY;
//    Ship.PositionZ := pZ;
//    Ship.Enabled := TRUE;
//    SimCenter.MainObjList.AddObject(ship);
//
////    GetRandomPosition(pX, pY, pZ);
////    GetRandomSpeedCourse(speed, course, tsPlane);
//
//    plane := TXShip.Create;
//    plane.CreateDefaultView(FMap);
//    plane.UniqueID := C_SIMUID_Plane;
//    plane.Speed    := speed;
//    plane.Heading  := course;
//    plane.PositionX := pX;
//    plane.PositionY := pY;
//    plane.PositionZ := pZ;
//    plane.Enabled := TRUE;
//    SimCenter.MainObjList.AddObject(plane);
//
    //------------
    SIMObject_ship1 := TXShip.Create;
    SIMObject_ship1.CreateDefaultView(FMap);
    SIMObject_ship1.UniqueID := 'VSL1000';
    SIMObject_ship1.Speed    := 0;
    SIMObject_ship1.Heading  := 180;
//    SIMObject_ship1.PositionX := 112.92660465;;
//    SIMObject_ship1.PositionY := -7.30799794;
    SIMObject_ship1.PositionX := 119.40525559;
    SIMObject_ship1.PositionY := 0.69002319;
    SIMObject_ship1.PositionZ := 0;
    SIMObject_ship1.Enabled := TRUE;
    SimCenter.MainObjList.AddObject(SIMObject_ship1);

    SIMObject_ship2 := TXShip.Create;
    SIMObject_ship2.CreateDefaultView(FMap);
    SIMObject_ship2.UniqueID := 'VSL1023';
    SIMObject_ship2.Speed    := 0;
    SIMObject_ship2.Heading  := 90;
//    SIMObject_ship2.PositionX := 112.82082005;
//    SIMObject_ship2.PositionY := -7.17766928;
    SIMObject_ship2.PositionX := 119.30525559;
    SIMObject_ship2.PositionY := 0.89002319;
    SIMObject_ship2.PositionZ := 0;
    SIMObject_ship2.Enabled := TRUE;
    SimCenter.MainObjList.AddObject(SIMObject_ship2);
  end;
end;

procedure TGenericAK230Interface.DeassignActiveGun;
begin

end;

function TGenericAK230Interface.DeAssignGun(const Gun_ID, FCID: byte;
  const send: boolean): boolean;
begin

end;

procedure TGenericAK230Interface.DeleteAllTrack;
begin

end;

destructor TGenericAK230Interface.Destroy;
begin

  inherited;

  EMark.Free;
end;

function TGenericAK230Interface.DoBlindBomb: boolean;
begin

end;

procedure TGenericAK230Interface.DoCorrectionAutoDirBomb(TheGun: TGun;
  var Corr_Training, Corr_Elev: Double);
begin

end;

procedure TGenericAK230Interface.DoCorrectionDirectBomb(TheGun: TGun;
  var Corr_Training, Corr_Elev: Double);
begin

end;

procedure TGenericAK230Interface.DoCorrectionInDirAndBlindBomb(TheGun: TGun;
  var Brg, Elv: double);
begin

end;

procedure TGenericAK230Interface.DoCorrectionManDirBomb(TheGun: TGun; var Brg,
  Elv: double);
begin

end;

function TGenericAK230Interface.DoGenFix(const tFCID: byte): boolean;
begin

end;

procedure TGenericAK230Interface.DoGunCorrection(TheGun: TGun);
begin

end;

function TGenericAK230Interface.DoIndirectBomb: boolean;
begin

end;

procedure TGenericAK230Interface.Draw(aCnv: TCanvas);
begin

end;

procedure TGenericAK230Interface.DrawAngle(aCnv: TCanvas);
begin

end;

procedure TGenericAK230Interface.DrawLine(Canvas: TCanvas; X1, Y1, X2,
  Y2: Integer; Color: TColor; Width: Integer);
begin

end;

procedure TGenericAK230Interface.Erasesplash(IdGun: Integer);
begin

end;

function TGenericAK230Interface.FindToBeDeletedTrack(var IsNew: boolean;
  var indx: Integer): boolean;
begin

end;

function TGenericAK230Interface.FindTOFandPHPpoint(Gun_numb: Word; TgtCourse,
  TgtSpeed: Single; var oX, oY, oZ: Double): Single;
var lastrange, range, movement, brg, toleran,
    tmpX, tmpY,
    iX, iY, iZ : Double;
    CurTgtPos : tDouble2DPoint;
    Tof  : Single;
    i :integer;
begin
  i  := 0;
  iX := oX;
  iY := oY;

  toleran   := 1 * C_Meter_To_NauticalMiles;
  lastrange := 0;
  range     := 0;
  repeat
    inc(i);
    lastrange := range;
    Tof       := GetTOF(Gun_numb,xSHIP.PositionX, xSHIP.PositionY, oX, oY, oZ);
    movement  := (Tof/3600) * TgtSpeed;                        // Range pergerakan kapal  target (Nm)
    RangeBearingToCoord(movement,TgtCourse,tmpX, tmpY);        // titik pergerakan kapal target
    oX := 0;
    oY := 0;
    oX := iX + tmpX * C_NauticalMile_To_Degree;               //posisi X,Y terakhir pada saat TOF
    oY := iY + tmpY * C_NauticalMile_To_Degree;
    range := CalcRange(xSHIP.PositionX, xSHIP.PositionY, oX, oY);

    Result := Tof;
  until(Lastrange > (range - toleran)) and (Lastrange < (range + toleran)) or (i=100);
end;

procedure TGenericAK230Interface.GetGunTOFfromDb(Gun_numb: integer; hpX, hpY,
  hpZ: Double);
begin

end;

function TGenericAK230Interface.GetGUN_by_ID(Gun_ID: word): TGun;
begin

end;

function TGenericAK230Interface.GetModeID_Fire(TheGun: TGUN): byte;
begin

end;

procedure TGenericAK230Interface.GetPHP(GunNumb: byte; var X, Y, Z: Double);
begin

end;

procedure TGenericAK230Interface.GetRandomPosition(var x, y, z: double);
begin

end;

procedure TGenericAK230Interface.GetRandomSpeedCourse(var s, c: double;
  const tipe: TSIMType);
begin

end;

function TGenericAK230Interface.GetTOF(Gun_numb: Word; X1, Y1, X2, Y2,
  Z2: Double): Single;
var TargetRange : Double;
begin
  if DataModule1.GetStatusconDB then begin
//    TargetRange := Sqrt(Sqr(CalcRange(X1, Y1, X2, Y2) * C_NauticalMiles_TO_Meter) + Sqr(Z2));
    TargetRange := CalcRange(X1, Y1, X2, Y2) * C_NauticalMiles_TO_Meter;
    Result := DataModule1.GetCanonTOFbyRange(Gun_numb, TargetRange);
  end
  else
    Result := 3;   // Konstanta TOF
end;

function TGenericAK230Interface.GetWeaponID(Gun_ID: word): word;
begin

end;

function TGenericAK230Interface.HDiv2: Integer;
begin

end;

procedure TGenericAK230Interface.Initialize;
begin

end;

function TGenericAK230Interface.InRangeToFire(TargetPosX, TargetPosY: Double;
  GunType: byte): Boolean;
begin

end;

procedure TGenericAK230Interface.InsertIntoPage2(const indx: integer);
begin

end;

function TGenericAK230Interface.IsFireControlInUse(const aFC: byte): boolean;
begin

end;

procedure TGenericAK230Interface.LineCorrection(var oX, oY: double;
  GunNum: word);
begin

end;

function TGenericAK230Interface.MeterHeight: Integer;
begin

end;

function TGenericAK230Interface.MeterWidth: Integer;
begin

end;

procedure TGenericAK230Interface.OffsetPoint_SetPosition(const x, y: double);
begin

end;

procedure TGenericAK230Interface.RangeCorrection(var oX, oY: double;
  GunNum: word);
begin

end;

procedure TGenericAK230Interface.RecvWCCSettingConsole(
  aRec: TRecStatus_Console);
begin

end;

procedure TGenericAK230Interface.RotateVarXY(Width, Height, Radius: Integer;
  Degrees: Double; var sx, sy: integer);
begin

end;

procedure TGenericAK230Interface.Run(aDt: double);
begin

end;

procedure TGenericAK230Interface.RunGun(const aDeltaMs: double);
begin

end;

procedure TGenericAK230Interface.SendEvenAK230(EvenId: Word; const Prm1: double;
  Prm2, Prm3: double);
begin

end;

procedure TGenericAK230Interface.SetAssign_OnThrowOff(GunID: byte);
begin

end;

procedure TGenericAK230Interface.SetEMarkConstraint(const min, max: integer);
begin

end;

procedure TGenericAK230Interface.SetEMarkFlag(const val: boolean);
begin

end;

procedure TGenericAK230Interface.SetEmarkHeading;
begin

end;

procedure TGenericAK230Interface.SetGunReady;
begin

end;

procedure TGenericAK230Interface.SetRadarOnOff(const bOke: boolean);
begin

end;

procedure TGenericAK230Interface.SetTrackShown(Isvisible: boolean);
begin

end;

procedure TGenericAK230Interface.ShowAllForm(const aShipClassID: integer);
begin

end;

procedure TGenericAK230Interface.ShowPHP(TheGun: TGun; const IsShown: boolean);
begin

end;

procedure TGenericAK230Interface.ShowSplasFrom3D(Rec: TRecSplashCannon);
begin

end;

procedure TGenericAK230Interface.ShowSplash(TheGun: TGun;
  const IsShown: boolean);
begin

end;

procedure TGenericAK230Interface.SIM_SetPosition(const x, y: double);
begin

end;

procedure TGenericAK230Interface.StartCannonFire(Gun_ID: word);
begin

end;

procedure TGenericAK230Interface.StopCannonFire(Gun_ID: word);
begin

end;

procedure TGenericAK230Interface.SystemReset;
begin

end;

function TGenericAK230Interface.TestBlindArc(const Gun: byte;
  const Tgt: TManualTrack): boolean;
begin

end;

procedure TGenericAK230Interface.TGM_Reset;
begin

end;

procedure TGenericAK230Interface.TGM_SetPosition(const x, y: integer);
begin

end;

function TGenericAK230Interface.ThrowOffMode(const pos: integer): boolean;
begin

end;

procedure TGenericAK230Interface.TOMarker_SetPosition(const r, b: double);
begin

end;

function TGenericAK230Interface.unDoBlindBomb: boolean;
begin

end;

function TGenericAK230Interface.unDoIndirectBomb: boolean;
begin

end;

function TGenericAK230Interface.WDiv2: Integer;
begin

end;

end.
