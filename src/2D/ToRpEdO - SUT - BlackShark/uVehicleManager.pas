unit uVehicleManager;

interface
uses
  SysUtils, Classes, Math, Graphics,
  uCoordConverter, windows, uVehicle,
  System.Contnrs, uSimulationTrack, uSubSurfaceTrack, uSurfaceTrack;
type
  TVehicleManager = class
  private
//    FList: TList;               // of TVehicle
    FList: TObjectList;               // of TVehicle
    FConv: TCoordConverter;
    FTrackNumberInc: Integer;
    FTrackControlled: TSimulationTrack;
  public

    constructor Create;
    destructor Destroy; override;

    property CoordConverter: TCoordConverter read FConv write FConv;
    property TrackControlled: TSimulationTrack read FTrackControlled;

//    function  AddVehicle: TVehicle; overload;
//    function  AddVehicle(const x, y: Double; const trackLabel: string = ''; const isSurface: Boolean = false): TVehicle; overload;
//    function  AddOwnShip: TVehicle; overload;
//    function  AddOwnShip(const x, y: Double; const trackLabel: string = ''): TOwnShip; overload;

//    function AddVehicle: TSimulationTrack;
    function AddVehicleSubSurf(const x, y: Double): TSubSurfaceTrack;
    function AddVehicleSurface(const x, y: Double): TSurfaceTrack;
    function AddOwnShip(const x, y: Double): TSubSurfaceTrack;

    function FindObjectByUid(const aUid: string): TSimulationTrack;

    function FindTrackByTrackNumber(const TrackNum: Integer): TSimulationTrack;
    function ControlTrackByTrackNumber(const TrackNum: Integer): Boolean;

    procedure RemoveVehicle(V: TVehicle);
    procedure Clear;

    function  Count: Integer;
//    function  Items(Index: Integer): TVehicle;
    function  Items(Index: Integer): TSimulationTrack;

    // loop simulasi
    procedure UpdateAll(const dtSeconds: Double);

    // gambar semua simbol
    procedure DrawAll(ACanvas: TCanvas);

    // seleksi via klik (X,Y layar). Mengubah Selected pada symbol vehicle
    function  SelectAt(X, Y: Integer): TVehicle;

    // util
    procedure DeselectAll;

    property ObjectList: TObjectList read FList;
//    property ObjectList: TList read FList;
  end;

var
  VehicleMgr: TVehicleManager;

implementation
{ TVehicleManager }

constructor TVehicleManager.Create;
begin
  inherited Create;
  FList := TObjectList.Create;
  FConv := nil;
  FTrackNumberInc := 110000;
end;

destructor TVehicleManager.Destroy;
begin
  Clear;
  FList.Free;
  inherited;
end;

//function TVehicleManager.AddVehicle: TVehicle;
//begin
//  Result := TVehicle.Create;
//  // suntik converter ke symbol
//  Result.Symbol.CoordConverter := FConv;
//  FList.Add(Result);
//end;

//function TVehicleManager.AddOwnShip(const x, y: Double; const trackLabel: string): TOwnShip;
//begin
//  Result := AddOwnShip;
//  Result.PosX := x;
//  Result.PosY := y;
//  if trackLabel <> '' then
//    Result.Symbol.TrackLabel := trackLabel;
//end;
//
//function TVehicleManager.AddOwnShip: TVehicle;
//begin
//  Result := TOwnShip.Create;
//  // suntik converter ke symbol
//  Result.Symbol.CoordConverter := FConv;
//  FOwnShip := Result;
//end;

//function TVehicleManager.AddVehicle(const x, y: Double; const trackLabel: string; const isSurface: Boolean): TVehicle;
//begin
//  Result := AddVehicle;
//  Result.PosX := x;
//  Result.PosY := y;
//  if trackLabel <> '' then
//    Result.Symbol.TrackLabel := trackLabel;
//end;

procedure TVehicleManager.RemoveVehicle(V: TVehicle);
begin
  if Assigned(V) and (FList.Remove(V) <> -1) then
    V.Free;
end;

function TVehicleManager.AddOwnShip(const x, y: Double): TSubSurfaceTrack;
begin
  Result := TSubSurfaceTrack.Create;
  Result.PosX := x;
  Result.PosY := y;
  Result.MSITrackNumber := 1;
  FList.Add(Result);
end;

function TVehicleManager.AddVehicleSubSurf(const x, y: Double): TSubSurfaceTrack;
begin
  Result := TSubSurfaceTrack.Create;
  Result.PosX := x;
  Result.PosY := y;
  Inc(FTrackNumberInc);
  Result.MSITrackNumber := FTrackNumberInc;
  FList.Add(Result);
end;

function TVehicleManager.AddVehicleSurface(const x, y: Double): TSurfaceTrack;
begin
  Result := TSurfaceTrack.Create;
  Result.PosX := x;
  Result.PosY := y;
  Inc(FTrackNumberInc);
  Result.MSITrackNumber := FTrackNumberInc;
  FList.Add(Result);
end;

procedure TVehicleManager.Clear;
var
  i: Integer;
begin
  for i := 0 to FList.Count - 1 do
    TSimulationTrack(FList[i]).Free;

//    TObject(FList[i]).Free;
  FList.Clear;
end;

function TVehicleManager.ControlTrackByTrackNumber(const TrackNum: Integer): Boolean;
var
  i : Integer;
  Found : Boolean;
begin
  Result := false;
  i := 0;
//  FTrackControlled := nil;
  for i := 0 to FList.Count - 1 do
  begin
    if TSimulationTrack(FList[i]).MSITrackNumber = TrackNum then
    begin
      TSimulationTrack(FList[i]).Controlled_Track := True;
      Found := True;
      FTrackControlled := TSimulationTrack(FList[i]);
//      sutblacksharkmanager.
    end
    else TSimulationTrack(FList[i]).Controlled_Track := False;
  end;

  result:= Found;
end;

function TVehicleManager.Count: Integer;
begin
  Result := FList.Count;
end;

function TVehicleManager.Items(Index: Integer): TSimulationTrack;
begin
//  Result := TVehicle(FList[Index]);
  Result := TSimulationTrack(FList[Index]);
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

function TVehicleManager.FindObjectByUid(const aUid: string): TSimulationTrack;
  var i   : integer;
      obj : TSimulationTrack;
      found : boolean;
  begin
    result := nil;
    obj := nil;
//    with FList.LockList do
//      try
        i := 0;
        found  := false;
        while not found and (i<Count) do begin
          obj := TSimulationTrack(FList[i]);
          found :=  aUid = obj.UniqueID;

          inc(i);
        end;
//      finally
//        FList.UnlockList;
//      end;
    if found then result := obj;

  end;

function TVehicleManager.FindTrackByTrackNumber(
  const TrackNum: Integer): TSimulationTrack;
var
  i : Integer;
  Track : TSimulationTrack;
  Found : Boolean;
begin
  Result := nil;
  Track := nil;
  i := 0;
  while not Found and (i<Count) do
  begin
    Track := TSimulationTrack(FList[i]);
    Found := TrackNum = Track.MSITrackNumber;

    inc(i);
  end;
  if Found then Result := Track;
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
