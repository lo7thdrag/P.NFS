unit uTorpedoLauncher;

interface

uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows; // <-- TRadarTargetSymbol di sini

type
  TWaterPressure = (wpDrained, wpPresNotEqualized, wpPresEqualized);
  TTorpedoStatus = (tsOff, tsTesting, tsOnAndOk, tsOnWithRestrict, tsNotOK);
  TBowCap        = (bcClosed, bcOpenLeverNotSet, bcOpenLeverSet);
  TCableStatus   = (csOff, csTesting, csTorpOnOK, csError);
  TStatusText    = (stNone, stTesting, stTorpReady, stFired, stMisfired, stInitialRun, stMsiApprLos,
                    stMsiApprCc, stMsiApprSa, stTorpAppr, stMsiSrcLos, stMsiSrcCc, stMsiSrcSa,
                    stTorpSrc, stTorpSrcAuto, stTorpSrcSa, stTorpSrcCsp, stWakeSelfguid, stManHoriz,
                    stLongRangeAtt, stCloseInAtt, stTgtLost, stCommBreak, stTerminated, stImmedFired);
  TTorpedoLauncher = class
  private
    FLoaded             : Boolean;
    FTorpedoType        : Byte;
    FWaterPressure      : TWaterPressure;  // Drained:0(red); Flooded pressure notequalized:1(yellow), Flooded pressure equalized : 2(green)
    FTorpedoStatus      : TTorpedoStatus; // off:0 (yellow); testing:1(blink yellow); on and OK:2(fill green); on with restrict:3(open green); not ok after test:4(red)
    FFireRelease        : Boolean;
    FSalvoNumber        : Word;
    FTargetTrackNumber  : Integer;
    FError              : Boolean;
    FLaunchPhases       : Byte;
    FFuseStatus         : Boolean; // On : 1; Off : 0
    FBowCap             : TBowCap; // Cap Closed : 0 (red); Cap open, ready lever not set:1 (yellow), Cap open, lever set:2 (Green)
    FWTRSC              : Boolean; // wtrsc on off
    FCableStatus        : TCableStatus; // off:0 (yellow); testing:1 (blink yellow); torp on and OK:2(green); error:3 (red
    FAllocated          : Boolean;
    FStatusText         : TStatusText;
    FTorpedoOnOff       : Boolean;

  public
    constructor Create; overload;
    destructor Destroy; override;

    // properti state
    property Loaded   : Boolean read FLoaded write FLoaded;
    property TorpedoType : Byte read FTorpedoType write FTorpedoType;
    property WaterPressure    : TWaterPressure read FWaterPressure write FWaterPressure;
    property TorpedoStatus: TTorpedoStatus read FTorpedoStatus write FTorpedoStatus;
    property FireRelease : Boolean read FFireRelease write FFireRelease;
    property SalvoNumber : Word read FSalvoNumber write FSalvoNumber;
    property TargetTrackNumber : Integer read FTargetTrackNumber write FTargetTrackNumber;
    property Error : Boolean read FError write FError;
    property LaunchPhases : Byte read FLaunchPhases write FLaunchPhases;
    property FuseStatus : Boolean read FFuseStatus write FFuseStatus;
    property BowCap : TBowCap read FBowCap write FBowCap;
    property WTRSC : Boolean read FWTRSC write FWTRSC;
    property CableStatus : TCableStatus read FCableStatus write FCableStatus;
    property Allocated : Boolean read FAllocated write FAllocated;
    property TextStatus : TStatusText read FStatusText write FStatusText;
    property TorpedoOnOff : Boolean read FTorpedoOnOff write FTorpedoOnOff;

//    procedure SetSpeedKts(AKnots: Double);
//    procedure SetSpeedKmh(AKmh: Double);
//    procedure UpdateKinematics(const dtSeconds: Double);
//    procedure PrepareForDraw;
  end;
implementation

{ TTorpedoLauncher }

constructor TTorpedoLauncher.Create;
begin
  FLoaded            := false;
  FTorpedoType       := 0;
  FWaterPressure     := wpDrained;
  FTorpedoStatus     := tsOff;
  FFireRelease       := false;
  FSalvoNumber       := 0;
  FTargetTrackNumber := 0;
  FError             := False;
  FLaunchPhases      := 0;
  FFuseStatus        := false;
  FBowCap            := bcClosed;
  FWTRSC             := false;
  FCableStatus       := csOff;
  FAllocated         := False;
  FStatusText        := stTesting;
end;

destructor TTorpedoLauncher.Destroy;
begin


end;

end.
