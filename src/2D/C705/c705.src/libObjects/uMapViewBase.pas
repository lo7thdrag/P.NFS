unit uMapViewBase;

interface

uses
  MapXLib_TLB, Vcl.Graphics;

type
  TMapViewBase = class
  protected
    FMap: TMap;

  public
    constructor Create(aMap: TMap); virtual;
    procedure Draw(aCnv: TCanvas); virtual; abstract;
  end;

implementation

{ TMapViewBase }

constructor TMapViewBase.Create(aMap: TMap);
begin
  FMap := aMap;
end;

end.
