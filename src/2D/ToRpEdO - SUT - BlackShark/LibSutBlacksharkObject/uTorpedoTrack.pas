unit uTorpedoTrack;

interface
  uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows, uBaseObject, uSimulationTrack, uSubSurfaceTrack;

type
  TGuidanceMode = (gmMSIGuide, gmInterGuide, gmHoming, gmManual);
  TTorpedoPhase = (tpInitial, tpApproach, tpSearch, tpManualGuide, tpHomingLong, tpHomingClose);
  TTorpedoTrack = class(TSubSurfaceTrack)
  private
    FTargetTrackID : Integer;
    FTorpGuidanceMode : TGuidanceMode;
    FTorpLaunchPhase : TTorpedoPhase;
    FWeaponID, FLauncherID, FMissileID : Word;
    FToSoRangePsv, FTosoRangeActv : Integer;
    FCourse : double;
    FMaxWireRange, FCurrentWireLeft, FRunLength, FApproachLength, FSearchLength : Double;
    FBatteryCapacity: Double;
    FTimeLaunch  : TDateTime;
    FLastUpdated : UInt64;
    FApproachTime, FSearchTime :Double;
    FIsExist : Boolean;
    FFuseOn: Boolean;
    FSpeedMS : Double;
    FOSToSSP : Double;

  public
    constructor Create; overload;
    destructor Destroy; override;
    property TargetTrackID : Integer read FTargetTrackID write FTargetTrackID;
    property TorpLaunchPhase : TTorpedoPhase read FTorpLaunchPhase write FTorpLaunchPhase;
    property TorpGuidanceMode : TGuidanceMode read FTorpGuidanceMode write FTorpGuidanceMode;
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
    property LastUpdated : UInt64 read FLastUpdated write FLastUpdated;
    property ApproachTime : Double read FApproachTime write FApproachTime;
    property SearchTime : Double read FSearchTime write FSearchTime;
    property IsExist : Boolean read FIsExist write FIsExist;
    property FuseOn : Boolean read FFuseOn write FFuseOn;
    property SpeedMS : Double read FSpeedMS write FSpeedMS;
    property OSToSSP : Double read FOSToSSP write FOSToSSP;


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
