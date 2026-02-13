unit uBaseSimObjects;

interface

type
  TBaseSimObject = class
  protected
    FObjectID: string;

  public
//    constructor Create;
//    destructor Destroy; override;

    property ObjecID: string read FObjectID write FObjectID;
  end;

implementation

{ TBaseSimObject }

//constructor TBaseSimObject.Create;
//begin
//
//end;
//
//destructor TBaseSimObject.Destroy;
//begin
//
//  inherited;
//end;

end.
