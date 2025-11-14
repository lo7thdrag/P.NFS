unit uVehicleManager;

interface
uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, windows, uVehicle;
type
  TVehicleManager = class
  private
    FList: TList;               // of TVehicle
    FConv: TCoordConverter;
  public
    constructor Create;
    destructor Destroy; override;

    property CoordConverter: TCoordConverter read FConv write FConv;

    function  AddVehicle: TVehicle; overload;
    function  AddVehicle(const x, y: Double; const trackLabel: string = ''): TVehicle; overload;
    function FindObjectByUid(const aUid: string): TVehicle;

    procedure RemoveVehicle(V: TVehicle);
    procedure Clear;

    function  Count: Integer;
    function  Items(Index: Integer): TVehicle;

    // loop simulasi
    procedure UpdateAll(const dtSeconds: Double);

    // gambar semua simbol
    procedure DrawAll(ACanvas: TCanvas);

    // seleksi via klik (X,Y layar). Mengubah Selected pada symbol vehicle
    function  SelectAt(X, Y: Integer): TVehicle;

    // util
    procedure DeselectAll;
  end;

var
  VehicleMgr: TVehicleManager;

implementation
{ TVehicleManager }

constructor TVehicleManager.Create;
begin
  inherited Create;
  FList := TList.Create;
  FConv := nil;
end;

destructor TVehicleManager.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

function TVehicleManager.AddVehicle: TVehicle;
begin
  Result := TVehicle.Create;
  // suntik converter ke symbol
  Result.Symbol.CoordConverter := FConv;
  FList.Add(Result);
end;

function TVehicleManager.AddVehicle(const x, y: Double; const trackLabel: string): TVehicle;
begin
  Result := AddVehicle;
  Result.PosX := x;
  Result.PosY := y;
  if trackLabel <> '' then
    Result.Symbol.TrackLabel := trackLabel;
end;

procedure TVehicleManager.RemoveVehicle(V: TVehicle);
begin
  if Assigned(V) and (FList.Remove(V) <> -1) then
    V.Free;
end;

procedure TVehicleManager.Clear;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    TObject(FList[i]).Free;
  FList.Clear;
end;

function TVehicleManager.Count: Integer;
begin
  Result := FList.Count;
end;

function TVehicleManager.Items(Index: Integer): TVehicle;
begin
  Result := TVehicle(FList[Index]);
end;

procedure TVehicleManager.UpdateAll(const dtSeconds: Double);
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    TVehicle(FList[i]).UpdateKinematics(dtSeconds);
end;

procedure TVehicleManager.DrawAll(ACanvas: TCanvas);
var
  i: Integer;
  V: TVehicle;
begin
  for i := 0 to FList.Count - 1 do
  begin
    V := TVehicle(FList[i]);

    // pastikan symbol pakai converter yang sama
    V.Symbol.CoordConverter := FConv;

    // sinkronkan posisi symbol
    V.PrepareForDraw;

    // gambar
    V.Symbol.Draw(ACanvas);
  end;
end;

function TVehicleManager.FindObjectByUid(const aUid: string): TVehicle;
  var i   : integer;
      obj : TVehicle;
      found : boolean;
  begin
    result := nil;
    obj := nil;
//    with FList.LockList do
//      try
        i := 0;
        found  := false;
        while not found and (i<Count) do begin
          obj := TVehicle(FList[i]);
          found :=  aUid = obj.UniqueID;

          inc(i);
        end;
//      finally
//        FList.UnlockList;
//      end;
    if found then result := obj;

  end;

procedure TVehicleManager.DeselectAll;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    TVehicle(FList[i]).Symbol.Selected := False;
end;

function TVehicleManager.SelectAt(X, Y: Integer): TVehicle;
var
  i: Integer;
  V, Hit: TVehicle;
  R: TRect;
begin
  Hit := nil;

  // prioritas objek paling "atas"
  for i := FList.Count - 1 downto 0 do
  begin
    V := TVehicle(FList[i]);
    if V.Symbol.Visible then
    begin
      V.Symbol.ConvertCoord;      // update screen pos
      R := V.Symbol.GetBounds(nil); // pakai cache/estimasi aman
      if PtInRect(R, Point(X, Y)) then
      begin
        Hit := V;
        Break;
      end;
    end;
  end;

  // update selected flags
  for i := 0 to FList.Count - 1 do
  begin
    V := TVehicle(FList[i]);
    V.Symbol.Selected := (V = Hit);
  end;

  Result := Hit;
end;
end.
