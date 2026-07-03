unit uSimulationTrack;

interface

uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows, uBaseObject; // <-- TRadarTargetSymbol di sini

type
  TSource = (scCAS, scFAS, scMAN);
  TIdentity = (tidUnknown, tidAssdFriend, tidFriend, tidNeutral, tidSuspect, tidHostile, tidPending);
  TSimulationTrack = class(TBaseObject)
  private
    FMSITrackNumber: Integer;
    FSource: TSource;
    FIdentity: TIdentity;
    FFreeText: string;
    FControlled_Track: Boolean;
    FDomain: Integer;
    FBearing: Double;
    FAzimuth: Double;
    FRange: Double;

  public
    constructor Create; overload;
    destructor Destroy; override;
    property MSITrackNumber : Integer read FMSITrackNumber write FMSITrackNumber;
    property Source : TSource read FSource write FSource;
    property Identity : TIdentity read FIdentity write FIdentity;
    property FreeText : string read FFreeText write FFreeText;
    property Controlled_Track : Boolean read FControlled_Track write FControlled_Track;
    property Domain : Integer read FDomain write FDomain;
    property Bearing: Double read FBearing write FBearing;
    property Azimuth: Double read FAzimuth write FAzimuth;
    property Range: Double read FRange write FRange;

  end;

implementation

{ TSimulationTrack }

constructor TSimulationTrack.Create;
begin
  inherited Create;
  FMSITrackNumber := 0;
  FSource := scCAS;
  FIdentity := tidUnknown;
  FFreeText := '';
  FControlled_Track := False;
  FBearing := 0;
  FAzimuth := 0;

end;

destructor TSimulationTrack.Destroy;
begin

  inherited;
end;

end.
