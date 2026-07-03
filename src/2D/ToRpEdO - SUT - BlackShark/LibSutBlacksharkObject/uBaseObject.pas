unit uBaseObject;

interface

  type
    TBaseObject = class
      protected
        FObjectId: Word;
        FPosX, FPosY, FPosZ : Double;   // Map coords (Lon/Lat deg atau meter)
        FSpeed_knot          : Double;   // m/s
        FHeadingDeg         : Double;   // 0=N, cw
        FUniqueID: string;
        FDomain: Integer;
        FShipID: Word;

      public
        constructor Create;
        destructor Destroy; override;

        property ObjectID  : Word read FObjectId write FObjectId;
        property PosX      : Double read FPosX write FPosX;
        property PosY      : Double read FPosY write FPosY;
        property PosZ      : Double read FPosZ write FPosZ;
        property Speed_knot : Double read FSpeed_knot write FSpeed_knot;
        property HeadingDeg: Double read FHeadingDeg write FHeadingDeg;
        property UniqueID: string read FUniqueID write FUniqueID;
        property Domain : Integer read FDomain write FDomain;
        property ShipID : Word read FShipID write FShipID;

    end;

implementation

{ TBaseObject }

constructor TBaseObject.Create;
begin
  FObjectId := 0;
  FPosX := 0;
  FPosY := 0;
  FPosZ := 0;
  FSpeed_knot := 0;
  FUniqueID := '';
  FDomain := 0;
  FShipID := 0;
end;

destructor TBaseObject.Destroy;
begin

  inherited;
end;

end.
