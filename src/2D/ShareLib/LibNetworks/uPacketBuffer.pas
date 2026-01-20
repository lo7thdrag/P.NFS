unit uPacketBuffer;

interface

uses
  Classes, SysUtils, Windows, System.Generics.Collections, uTCPDatatype;

type

  // Edited By Nando For NFS
//  TLocBuff = Class
//    aSize: Word;
//    pLocBuff: PAnsiChar;
//  End;
  TLocBuff = Class
  public
    aSize: Word;
    pLocBuff: PAnsiChar;
    constructor Create;
    destructor Destroy; override;
    procedure FillItem(const p: PAnsiChar; const Size: Word);
  End;

  TSafePacketBuffer = class
  private
    function GetCount: integer;
  protected
    FBuff: TThreadList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;

    procedure PutPacket(p: PAnsiChar; const aSize: Word);
    function PeekPacket(const i: integer; var p: PAnsiChar;
      var aSize: Word): boolean;
    property BuffCount: integer read GetCount;
  end;

  TPacketBuffer = class
  private
    function GetCount: integer;
  protected
    FBuff: TObjectList<TLocBuff>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;

    procedure PutPacket(p: PAnsiChar; const aSize: Word);
    function PeekPacket(const i: integer; var p: PAnsiChar;
      var aSize: Word): boolean;
    property BuffCount: integer read GetCount;
  end;

implementation

{ TLocBuff }

constructor TLocBuff.Create;
begin
  inherited;
  aSize:= 0;
  pLocBuff:= nil;
end;

destructor TLocBuff.Destroy;
begin
  if Assigned(pLocBuff) then
    FreeMem(pLocBuff);
  inherited;
end;

procedure TLocBuff.FillItem(const p: PAnsiChar; const Size: Word);
begin
  aSize := Size;
  GetMem(pLocBuff, aSize);
  CopyMemory(pLocBuff, p, aSize);
end;

{ TSafePacketBuffer }
constructor TSafePacketBuffer.Create;
begin
  inherited;
  FBuff := TThreadList.Create;
end;

destructor TSafePacketBuffer.Destroy;
begin
  Clear;

  FBuff.Free;
  inherited;
end;

procedure TSafePacketBuffer.Clear;
var
  i: integer;
begin
  with FBuff.LockList do
    for i := Count - 1 downto 0 do
    begin
      FreeMem(Items[i]);
      Delete(i);
    end;
  FBuff.UnlockList;
end;

function TSafePacketBuffer.GetCount: integer;
begin
  Result := FBuff.LockList.Count;
  FBuff.UnlockList;
end;

procedure TSafePacketBuffer.PutPacket(p: PAnsiChar; const aSize: Word);
var
  pid: ^TPacketCheck;
  l: TList;
  LocBuff: TLocBuff;
begin // cause we want to make 'put' faster, we put new quee at the end of list.
  if aSize < SizeOf(TPacketCheck) then
    Exit;

  l := FBuff.LockList;
  try
    LocBuff := TLocBuff.Create;

    GetMem(LocBuff.pLocBuff, aSize);
    CopyMemory(LocBuff.pLocBuff, p, aSize);
    LocBuff.aSize := aSize;

    l.Add(LocBuff);
  finally
    FBuff.UnlockList;
  end;
end;

function TSafePacketBuffer.PeekPacket(const i: integer; var p: PAnsiChar;
  var aSize: Word): boolean;
var
  pid: ^TPacketCheck;
begin
  with FBuff.LockList do
  begin
    Result := (i >= 0) and (i < Count);

    if Result then
    begin
      p := TLocBuff(Items[i]).pLocBuff;
      aSize := TLocBuff(Items[i]).aSize;
    end;
  end;
  FBuff.UnlockList;
end;

{ TPacketBuffer }
constructor TPacketBuffer.Create;
begin
  inherited;
  FBuff := TObjectList<TLocBuff>.Create;
end;

destructor TPacketBuffer.Destroy;
begin
//  Clear;
  FBuff.Free;
  inherited;
end;

procedure TPacketBuffer.Clear;
var
  i: integer;
  LocBuff: TLocBuff;
begin
  // with FBuff.LockList do
  // for i := Count - 1 downto 0 do
  // begin
  // FreeMem(Items[i]);
  // Delete(i);
  // end;
  // FBuff.UnlockList;

  for i := FBuff.Count - 1 downto 0 do
  begin
//    LocBuff := FBuff[i];
//    if Assigned(LocBuff) then
//    begin
//      if Assigned(LocBuff.pLocBuff) then
//        FreeMem(LocBuff.pLocBuff);
//      LocBuff.Free;
//    end;
    FBuff.Delete(i);
  end;
end;

function TPacketBuffer.GetCount: integer;
begin
  Result := FBuff.Count;
end;

procedure TPacketBuffer.PutPacket(p: PAnsiChar; const aSize: Word);
var
  LocBuff: TLocBuff;
begin // cause we want to make 'put' faster, we put new quee at the end of list.
  if aSize < SizeOf(TPacketCheck) then
    Exit;

  LocBuff := TLocBuff.Create;
  LocBuff.FillItem(p, aSize);

  FBuff.Add(LocBuff);
end;

function TPacketBuffer.PeekPacket(const i: integer; var p: PAnsiChar;
  var aSize: Word): boolean;
var
  LocBuff: TLocBuff;
begin
  Result := (i >= 0) and (i < FBuff.Count);

  if Result then
  begin
    LocBuff := FBuff[i];
    if Assigned(LocBuff.pLocBuff) then begin
      p := LocBuff.pLocBuff;
      aSize := LocBuff.aSize;
    end
    else
      Result:= False;
  end;
end;

end.
