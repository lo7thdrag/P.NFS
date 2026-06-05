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

  public
    constructor Create; overload;
    destructor Destroy; override;
    property MSITrackNumber : Integer read FMSITrackNumber write FMSITrackNumber;
    property Source : TSource read FSource write FSource;
    property Identity : TIdentity read FIdentity write FIdentity;
    property FreeText : string read FFreeText write FFreeText;
    property Controlled_Track : Boolean read FControlled_Track write FControlled_Track;

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

end;

destructor TSimulationTrack.Destroy;
begin

  inherited;
end;

end.
