unit uThreadTimer;

interface

uses
  Classes, Windows, Vcl.ExtCtrls;

type

//==============================================================================
  TRunningEvent = procedure(const dt: double) of object;

  TThreadedMSTimer = class(TThread)
  private
    FLastPerfCount,
      FPerfFreq: Int64;

    function GetEnabled: boolean;
    procedure SetEnabled(const Value: boolean); virtual;

  protected
    FInterval: LongWord; // millisecond;
    FOnTimer: TNotifyEvent;
    FOnRunning: TRunningEvent;

    procedure SetInterval(const Value: LongWord); virtual;

    procedure Execute; override;
    procedure DoByMySelf; virtual;

  public
    constructor Create;
    destructor Destroy; override;


    property OnRunning: TRunningEvent read FOnRunning write FOnRunning;
    property Interval: LongWord read FInterval write SetInterval;

    property Enabled: boolean read GetEnabled write SetEnabled;

  end;

//==============================================================================
  TZTimer = class(TThreadedMSTimer)
  protected
    procedure Execute; override;
  end;

//==============================================================================
  TPrecisseTimer = class (TThreadedMSTimer)
  protected
    FMilliCounter: double;
    FLastDelta : double;

    procedure SetInterval(const Value: LongWord); override;
    procedure Execute; override;
    procedure DoByMySelf; override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure SetEnabled(const Value: boolean); override;
    property Ontimer: TNotifyEvent read FOnTimer write FOnTimer;
  end;


  TMSTimer = class
  private
    FMainTimer: TTimer;
    FLastPerfCount,
    FPerfFreq   : Int64;

    procedure TimerHandler(Sender: TObject);

    function GetEnabled: boolean;
    procedure SetEnabled(const Value: boolean);
    function GetSuspended: Boolean;

  protected
    FInterval : Word;                               // millisecond;
    FOnTimer  : TNotifyEvent;
    FOnRunning : TRunningEvent;

    procedure SetInterval(const Value: Word);

//    procedure Execute; override;
    procedure DoByMySelf;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Suspend;
    procedure Resume;

  published
    property OnTimer  : TNotifyEvent read FOnTimer write FOnTimer;
    property OnRunning: TRunningEvent read FOnRunning write FOnRunning;
    property Interval: Word read FInterval write SetInterval;
    property Suspended: Boolean read GetSuspended;


    property Enabled: boolean read GetEnabled write SetEnabled;

  end;


implementation

uses
  MMSystem;

//==============================================================================
{ TThreadedMSTimer }

constructor TThreadedMSTimer.Create;
begin
  FOnTimer := nil;
  FOnRunning := nil;

  //timeBeginPeriod(10);
  FInterval := 21;

  QueryPerformanceFrequency(FPerfFreq);
  QueryPerformanceCounter(FLastPerfCount);

  inherited Create(TRUE);
end;

destructor TThreadedMSTimer.Destroy;
begin
  FOnTimer := nil;
  FOnRunning := nil;

  //timeEndPeriod(10);
  inherited;
end;

procedure TThreadedMSTimer.DoByMySelf;
var
  Count: Int64;
  Sec: double;
begin
  QueryPerformanceCounter(Count);
  Sec := (Count - FLastPerfCount) / FPerfFreq;
  FLastPerfCount := Count;
  if Assigned(FOnRunning) then begin
    FOnRunning(Sec);
  end;
end;

procedure TThreadedMSTimer.Execute;
begin
  while not Terminated do begin
    Synchronize(DoByMySelf);

    Sleep(FInterval);
  end;
end;

procedure TThreadedMSTimer.SetInterval(const Value: LongWord);
begin
  FInterval := Value;
end;

function TThreadedMSTimer.GetEnabled: boolean;
begin
  result := not Suspended;
end;

procedure TThreadedMSTimer.SetEnabled(const Value: boolean);
begin
  if Value <> Suspended then Exit;
  Suspended := not Value;

  if Value then
    QueryPerformanceCounter(FLastPerfCount);
end;

{ TZTimer }

procedure TZTimer.Execute;
begin
  while not Terminated do begin
    DoByMySelf;

    Sleep(FInterval);
  end;

end;

{ TPrecisseTimer }


procedure TPrecisseTimer.SetEnabled(const Value: boolean);
begin
  inherited;
  if Value then
    FMilliCounter := 0;

end;

procedure TPrecisseTimer.SetInterval(const Value: LongWord);
begin
  inherited;
  FMilliCounter := 0;
end;

constructor TPrecisseTimer.Create;
begin
  inherited;
end;

destructor TPrecisseTimer.Destroy;
begin
  FMilliCounter := 0;
  inherited;
end;

procedure TPrecisseTimer.DoByMySelf;
begin
//  inherited;

  if Assigned(FOnRunning) then
    FOnRunning(FLastDelta);

  if Assigned(FOnTimer) then
    FOnTimer(self);
end;

procedure TPrecisseTimer.Execute;
var
  Count: Int64;
begin
  while not Terminated do begin
    QueryPerformanceCounter(Count);
    FLastDelta := 1000.0 * (Count - FLastPerfCount) / FPerfFreq;
    FLastPerfCount := Count;

    FMilliCounter := FMilliCounter + FLastDelta;

    if FMilliCounter > FInterval then begin
      Synchronize(DoByMySelf);

      while FMilliCounter > FInterval  do
        FMilliCounter := FMilliCounter - FInterval;
    end;

    Sleep(1);
//    Sleep(1);
  end;
end;

{ TMSTimer }

constructor TMSTimer.Create;
begin
  FInterval := 16;

  FMainTimer:= TTimer.Create(nil);
  FMainTimer.Interval:= FInterval;
  FMainTimer.OnTimer:= TimerHandler;

  QueryPerformanceFrequency(FPerfFreq);
  QueryPerformanceCounter(FLastPerfCount);

  inherited;
end;

destructor TMSTimer.Destroy;
begin
  FOnTimer := nil;
  FMainTimer.Enabled:= False;
  FMainTImer.Free;

  inherited;
end;


procedure TMSTimer.DoByMySelf;
var Count     : Int64;
    MilliSec  : double;
begin

  if Assigned(FOnTimer) then FOnTimer(self);

  if Assigned(FOnRunning) then begin
    QueryPerformanceCounter(Count);
    MilliSec := 1000.0 * (Count - FLastPerfCount) / FPerfFreq;
    FLastPerfCount := Count;
    FOnRunning(MilliSec);
  end;

end;

//procedure TMSTimer.Execute;
//begin
//  while not Terminated do begin
//    Synchronize(DoByMySelf);
//
//    Sleep(FInterval);
//  end;
//end;

procedure TMSTimer.SetInterval(const Value: Word);
begin
  FInterval := Value;
  FMainTimer.Interval:= FInterval;
end;

procedure TMSTimer.Suspend;
begin
  FMainTimer.Enabled:= False;
end;

procedure TMSTimer.TimerHandler(Sender: TObject);
begin
  DoByMySelf;
end;

function TMSTimer.GetEnabled: boolean;
begin
  result := FMainTimer.Enabled;
end;

function TMSTimer.GetSuspended: Boolean;
begin
  Result:= not FMainTimer.Enabled;
end;

procedure TMSTimer.Resume;
begin
  FMainTimer.Enabled:= True;
end;

procedure TMSTimer.SetEnabled(const Value: boolean);
begin
//  Suspended  := not Value;
  FMainTimer.Enabled:= Value;

  if Value then
    QueryPerformanceCounter(FLastPerfCount);

end;

end.
