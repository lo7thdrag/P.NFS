unit MSThreadTimer;


  { -= TThread Timer =-
    -------------------------------------------------------------------------
    -- unit       : MSThreadTimer                                          --
    -- description: MultiPurpose Thread Timer                              --
    -- level      : 0                                                      --
    -------------------------------------------------------------------------
    ..  First Created : 15 Maret 2005     ..
    ..  by            : andySu            ..
    ........................................
    ..  Release Version : 1.1             ..
    ..  Release Date    :                 ..
    ........................................
  }
  { Change :
       24 July 2007
         ~ Add FrequencyCounter

       28 Juni 2007
         ~ clean up unused code;
         ~ remove TSlaveThread

       16 Juni 2005
        ~ add 'Enabled' property

       30 Mei 2005
        ~ minimum akses: protected;
        ~ Interval: Word, not integer;
  }

interface

uses
  System.Classes, Winapi.Windows, Vcl.ExtCtrls;

type

//==============================================================================
  TRunningEvent = procedure (const dt: double) of object;

  TThreadedMSTimer = class(TThread)
  private
    FLastPerfCount,
    FPerfFreq   : Int64;

    function GetEnabled: boolean;
    procedure SetEnabled(const Value: boolean);

  protected
    FInterval : Word;                               // millisecond;
    FOnTimer  : TNotifyEvent;
    FOnRunning : TRunningEvent;

    procedure SetInterval(const Value: Word);

    procedure Execute; override;
    procedure DoByMySelf; virtual;

  public
    constructor Create;
    destructor Destroy; override;

  published
    property OnTimer  : TNotifyEvent read FOnTimer write FOnTimer;
    property OnRunning: TRunningEvent read FOnRunning write FOnRunning;
    property Interval: Word read FInterval write SetInterval;


    property Enabled: boolean read GetEnabled write SetEnabled;

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


uses SyncObjs;

//==============================================================================
{ TThreadedMSTimer }

constructor TThreadedMSTimer.Create;
begin
  FInterval := 10;

  QueryPerformanceFrequency(FPerfFreq);
  QueryPerformanceCounter(FLastPerfCount);

  inherited Create(TRUE);
end;

destructor TThreadedMSTimer.Destroy;
begin
  FOnTimer := nil;

  inherited;
end;


procedure TThreadedMSTimer.DoByMySelf;
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

procedure TThreadedMSTimer.Execute;
begin
  while not Terminated do begin
    Synchronize(DoByMySelf);

    Sleep(FInterval);
  end;
end;

procedure TThreadedMSTimer.SetInterval(const Value: Word);
begin
  FInterval := Value;
end;

function TThreadedMSTimer.GetEnabled: boolean;
begin
  result := not Suspended;
end;

procedure TThreadedMSTimer.SetEnabled(const Value: boolean);
begin
  Suspended  := not Value;

  if Value then
    QueryPerformanceCounter(FLastPerfCount);

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





