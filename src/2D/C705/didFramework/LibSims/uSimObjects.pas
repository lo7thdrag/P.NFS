unit uSimObjects;

interface

uses
  Classes, Graphics,
  uCoordConverter, { for Update Visual}
  uBaseSimObjects, { This Object child of TBaseSimObject }
  uCoordDataTypes; { FPosition Data Types }

type

  TSimObject = class(TBaseSimObject)
  private
    { base ident }
    FObjectIndex: Integer;
    FObjectName: string;
    { Show/Hide  in Map }
    FVisible: Boolean;
    { Position of Object }
    FPosition: T3DPoint;
    FHeading, FSpeed,
    FBearing, FRange: Double;

    function getPositionX: Double;
    function getPositionY: Double;
    function getPositionZ: Double;
    procedure setPositionX(const v:Double);
    procedure setPositionY(const v:Double);
    procedure setPositionZ(const v:Double);

  public
    constructor Create; virtual;
    destructor Destroy; override;

    { Simulation Main Method, Update Visual, Draw}
    procedure UpdateVisual(aCvt : TCoordConverter); virtual;
    procedure Draw(aCnv: tCanvas); virtual;

    { Base Ident Object }
    property ObjectIndex : integer read FObjectIndex write FObjectIndex;
    property ObjectName : string read FObjectName write FObjectName;

    { Postion Lat, Long, altitude In Degree }
    property PosX: double read getPositionX write setPositionX;
    property PosY: double read getPositionY write setPositionY;
    property PosZ: double read getPositionZ write setPositionZ;
    property Heading: Double read FHeading write FHeading;
    property Speed: Double read FSpeed write FSpeed;
    property Bearing: Double read FBearing write FBearing;
    property Range: Double read FRange write FRange;
  end;

implementation

{ TSimObject }

constructor TSimObject.Create;
begin
  inherited;
  FVisible := False;
end;

destructor TSimObject.Destroy;
begin

  inherited;
end;

function TSimObject.getPositionX: Double;
begin
  result := FPosition.X;
end;

function TSimObject.getPositionY: Double;
begin
  result := FPosition.Y;
end;

function TSimObject.getPositionZ: Double;
begin
  result := FPosition.Z;
end;

procedure TSimObject.setPositionX(const v: Double);
begin
  FPosition.X := v;
end;

procedure TSimObject.setPositionY(const v: Double);
begin
  FPosition.Y := v;
end;

procedure TSimObject.setPositionZ(const v: Double);
begin
  FPosition.Z := v;
end;

procedure TSimObject.UpdateVisual(aCvt: TCoordConverter);
begin

end;

procedure TSimObject.Draw(aCnv: tCanvas);
begin

end;

end.
