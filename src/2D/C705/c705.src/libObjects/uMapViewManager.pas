unit uMapViewManager;

interface

uses
  System.Generics.Collections, System.Contnrs, uMapViewBase, Vcl.Graphics;

type
  TMapViewManager = class
  private
    FViews: TObjectList<TMapViewBase>;

  public
    constructor Create;
    destructor Destroy; override;

    procedure AddView(aView: TMapViewBase);
    procedure DrawAll(aCnv: TCanvas);
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

procedure TMapViewManager.DrawAll(aCnv: TCanvas);
var
  v: TMapViewBase;
begin
  for v in FViews do
    v.Draw(aCnv);
end;

end.
