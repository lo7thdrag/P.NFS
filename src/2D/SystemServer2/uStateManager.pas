unit uStateManager;

interface

uses
  System.Classes;

type
  TStateManager = class
  private
    FObjList: TList;
    FIdx: Integer;

    function GetObject(i: Integer): TObject;
    function GetCount: Integer;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(aObj: TObject);
    procedure Delete(i: Integer);
    procedure ClearAll;

    procedure Reset();



    function GetNextObject: TObject;

    property InternalList: TList read FObjList;

    property Items[i: Integer]: TObject read GetObject;

    property Count: Integer read GetCount;

  end;

implementation

{ TStateManager }

procedure TStateManager.ClearAll;
var
  i: Integer;
  Obj: TObject;
begin
  for i := 0 to FObjList.Count - 1 do
  begin
    Obj := FObjList[i];
    if Assigned(Obj) then
      Obj.Free;
  end;
  FObjList.Clear;
end;

constructor TStateManager.Create;
begin
  FObjList := TList.Create;
  Reset;
end;

destructor TStateManager.Destroy;
begin
  ClearAll;
  FObjList.Free;
  inherited;
end;

procedure TStateManager.Add(aObj: TObject);
begin
  FObjList.Add(aObj);
end;

procedure TStateManager.Delete(i: Integer);
var
  o: TObject;
begin
  o := GetObject(i);
  if Assigned(o) then
    o.Free;
  FObjList.Delete(i);
end;

function TStateManager.GetCount: Integer;
begin
  Result:= FObjList.Count;
end;

function TStateManager.GetNextObject: TObject;
begin
  Result := nil;
  if FObjList.Count > 0 then
  begin
    if FIdx >= FObjList.Count then
      Reset;
    Result := FObjList[FIdx];
    FIdx := FIdx + 1;
  end;
end;

function TStateManager.GetObject(i: Integer): TObject;
begin
  Result := nil;

  if (i >= 0) and (i < FObjList.Count) then
    Result := FObjList[i];
end;

procedure TStateManager.Reset;
begin
  FIdx := 0;
end;

end.
