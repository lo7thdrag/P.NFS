unit uMapViewManager;

interface

uses
  System.Generics.Collections, System.Contnrs, uMapViewBase, Vcl.Graphics,
    uCoordConverter;

type
  TMapViewManager = class
  private
    FViews: TObjectList<TMapViewBase>;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AddView(aView: TMapViewBase);
    procedure DrawAll(aCnv: TCanvas; aCvt: TCoordConverter);
  end;

implementation

{ TMapViewManager }

constructor TMapViewManager.Create;
begin
  FViews := TObjectList<TMapViewBase>.Create(True);
end;

destructor TMapViewManager.Destroy;
begin
  FViews.Free;
  inherited;
end;

procedure TMapViewManager.AddView(aView: TMapViewBase);
begin
  FViews.Add(aView);
end;

procedure TMapViewManager.DrawAll(aCnv: TCanvas; aCvt: TCoordConverter);
var
  aView: TMapViewBase;
begin
  for aView in FViews do
    aView.Draw(aCnv, aCvt);
end;

end.
