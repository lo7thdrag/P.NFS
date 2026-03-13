unit uMapViewBase;

interface

uses
  MapXLib_TLB, Vcl.Graphics, uCoordConverter;

type
  TMapViewBase = class
  protected
    FMap: TMap;

  public
    constructor Create(aMap: TMap); virtual;
    procedure Draw(aCnv: TCanvas; aCvt: TCoordConverter); virtual; abstract;
  end;

implementation

{ TMapViewBase }

constructor TMapViewBase.Create(aMap: TMap);
begin
  FMap := aMap;
end;

end.
