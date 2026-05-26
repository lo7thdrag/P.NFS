unit uBaseObject;

interface

  type
    TBaseObject = class
      protected
        FObjectId: Word;
        FPosX, FPosY, FPosZ : Double;   // Map coords (Lon/Lat deg atau meter)
        FSpeed_mps          : Double;   // m/s
        FHeadingDeg         : Double;   // 0=N, cw

      public
        constructor Create;
        destructor Destroy; override;

        property ObjectID  : Word read FObjectId write FObjectId;
        property PosX      : Double read FPosX write FPosX;
        property PosY      : Double read FPosY write FPosY;
        property PosZ      : Double read FPosZ write FPosZ;
        property Speed_mps : Double read FSpeed_mps write FSpeed_mps;
        property HeadingDeg: Double read FHeadingDeg write FHeadingDeg;
    end;

implementation

{ TBaseObject }

constructor TBaseObject.Create;
begin

end;

destructor TBaseObject.Destroy;
begin

  inherited;
end;

end.
