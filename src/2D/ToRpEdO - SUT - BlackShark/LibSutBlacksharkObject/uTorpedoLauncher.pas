unit uTorpedoLauncher;

interface

uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows; // <-- TRadarTargetSymbol di sini

type
  TTorpedoLauncher = class
  private
    FLoaded             : Boolean;
    FTorpedoType        : Byte;
    FWaterPressure      : Byte;  // Drained:0(red); Flooded pressure notequalized:1(yellow), Flooded pressure equalized : 2(green)
    FTorpedoStatus      : Boolean; // off:0 (yellow); testing:1(blink yellow); on and OK:2(fill green); on with restrict:3(open green); not ok after test:4(red)
    FFireRelease        : Boolean;
    FSalvoNumber        : Word;
    FTargetTrackNumber  : Word;
    FError              : Boolean;
    FLaunchPhases       : Byte;
    FFuseStatus         : Boolean; // On : 1; Off : 0
    FBowCap             : Byte; // Cap Closed : 0 (red); Cap open, ready lever not set:1 (yellow), Cap open, lever set:2 (Green)
    FFWTRSC             : Boolean; // wtrsc on off
    FCableStatus        : Byte; // off:0 (yellow); testing:1 (blink yellow); torp on and OK:2(green); error:3 (red

  public
    constructor Create; overload;
    destructor Destroy; override;

    // properti state
    property Loaded   : Boolean read FLoaded write FLoaded;
    property TorpedoType : Byte read FTorpedoType write FTorpedoType;
    property WaterPressure    : Byte read FWaterPressure write FWaterPressure;
    property TorpedoStatus: Boolean read FTorpedoStatus write FTorpedoStatus;
    property FireRelease : Boolean read FFireRelease write FFireRelease;
    property SalvoNumber : Word read FSalvoNumber write FSalvoNumber;
    property TargetTrackNumber : Word read FTargetTrackNumber write FTargetTrackNumber;
    property Error : Boolean read FError write FError;
    property LaunchPhases : Byte read FLaunchPhases write FLaunchPhases;
    property FuseStatus : Boolean read FFuseStatus write FFuseStatus;
    property BowCap : Byte read FBowCap write FBowCap;
    property FWTRSC : Boolean read FFWTRSC write FFWTRSC;
    property CableStatus : Byte read FCableStatus write FCableStatus;

//    procedure SetSpeedKts(AKnots: Double);
//    procedure SetSpeedKmh(AKmh: Double);
//    procedure UpdateKinematics(const dtSeconds: Double);
//    procedure PrepareForDraw;
  end;
implementation

{ TTorpedoLauncher }

constructor TTorpedoLauncher.Create;
begin
  inherited Create;
end;

destructor TTorpedoLauncher.Destroy;
begin

  inherited;
end;

end.
