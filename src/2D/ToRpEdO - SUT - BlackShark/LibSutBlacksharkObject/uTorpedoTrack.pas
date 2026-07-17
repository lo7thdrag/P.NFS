unit uTorpedoTrack;

interface
  uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows, uBaseObject, uSimulationTrack, uSubSurfaceTrack;

type
  TTorpedoPhase = (tpInitial, tpApproach, tpSearch, tpManualGuide, tpHomingLong, tpHomingClose);
  TTorpedoTrack = class(TSubSurfaceTrack)
  private
    FTargetTrackID : Integer;
    FTorpLaunchPhase : TTorpedoPhase;
    FWeaponID, FLauncherID, FMissileID : Word;
    FToSoRangePsv, FTosoRangeActv : Integer;
    FCourse : double;
    FMaxWireRange, FCurrentWireLeft, FRunLength, FApproachLength, FSearchLength : Double;
    FBatteryCapacity: Double;
    FTimeLaunch  : TDateTime;
    FApproachTime, FSearchTime :TTime;
    FIsExist : Boolean;
    FFuseOn: Boolean;

  public
    constructor Create; overload;
    destructor Destroy; override;
    property TargetTrackID : Integer read FTargetTrackID write FTargetTrackID;
    property TorpLaunchPhase : TTorpedoPhase read FTorpLaunchPhase write FTorpLaunchPhase;
    property WeaponID : Word read FWeaponID write FWeaponID;
    property LauncherID : Word read FLauncherID write FLauncherID;
    property MissileID : Word read FMissileID write FMissileID;
    property ToSoRangePsv : Integer read FToSoRangePsv write FToSoRangePsv;
    property TosoRangeActv : Integer read FTosoRangeActv write FTosoRangeActv;
    property Course : Double read FCourse write FCourse;
    property MaxWireRange : Double read FMaxWireRange write FMaxWireRange;
    property CurrentWireLeft : Double read FCurrentWireLeft write FCurrentWireLeft;
    property RunLength : Double read FRunLength write FRunLength;
    property ApproachLength : Double read FApproachLength write FApproachLength;
    property SearchLength : Double read FSearchLength write FSearchLength;
    property BatteryCapacity : Double read FBatteryCapacity write FBatteryCapacity;
    property TimeLaunch : TDateTime read FTimeLaunch write FTimeLaunch;
    property ApproachTime : TTime read FApproachTime write FApproachTime;
    property SearchTime : TTime read FSearchTime write FSearchTime;
    property IsExist : Boolean read FIsExist write FIsExist;
    property FuseOn : Boolean read FFuseOn write FFuseOn;

  end;

implementation

{ TTorpedoTrack }

constructor TTorpedoTrack.Create;
begin
  inherited Create;
  FIsExist := False;
end;

destructor TTorpedoTrack.Destroy;
begin

  inherited;
end;

end.
