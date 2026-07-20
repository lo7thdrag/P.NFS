unit uSimulationTrack;

interface

uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, uRadarTargets, windows, uBaseObject; // <-- TRadarTargetSymbol di sini

type
  TSource = (scCAS, scFAS, scMAN);
  TIdentity = (tidUnknown, tidAssdFriend, tidFriend, tidNeutral, tidSuspect, tidHostile, tidPending);

  TTrackPoint = class
    PosX : Double;
    PosY : Double;
  end;

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
    FTrackHistory: TList;
    FHistorySaveCounter : Byte;
    FHistoryCountToSave : Byte;
    FMaxTrackHistory : Byte;

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
    property TrackHistory: TList read FTrackHistory write FTrackHistory;
    property HistorySaveCounter: Byte read FHistorySaveCounter write FHistorySaveCounter;
    property HistoryCountToSave: Byte read FHistoryCountToSave;
    property MaxTrackHistory: Byte read FMaxTrackHistory;

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
  FHistorySaveCounter := 0;
  FHistoryCountToSave := 25; // save every 5 detik
  FMaxTrackHistory := 10;
  FTrackHistory := TList.Create;

end;

destructor TSimulationTrack.Destroy;
begin
  FTrackHistory.Clear;

  while FTrackHistory.Count > 0 do
  begin
    TObject(FTrackHistory[0]).Free;
    FTrackHistory.Delete(0);
  end;
  FTrackHistory.Free;
  inherited;
end;

end.
