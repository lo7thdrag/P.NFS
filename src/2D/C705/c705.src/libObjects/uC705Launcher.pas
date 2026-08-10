unit uC705Launcher;

interface

uses
  System.SysUtils, Vcl.ExtCtrls, System.Contnrs, Winapi.Windows;

type
  TC705LauncherID = (lchRight, lchLeft);

  { Ini adalah kondisi / state simulasi saat ini }
  TC705LauncherStatus = record
    {
      Launcher Status
      ----------------
      Status ini hanya berlaku untuk SATU launcher
    }
    EnableWeapon,                     // Power for M pada launcher
    OpenCoverLauncher,
    SafetyIgnition,
    SelfLatch,
    EnableMissile : Boolean;          // Missile Status; Power On dari Missile Control

    {
      Internal Simulation Status
      ---------------------------
      Status berikut bukan berasal dari network,
      melainkan dihitung oleh Simulation Manager.
    }
    // TRUE apabila proses Warm-up selesai.
    WarmUpDone,

    //INS Alignment
    INSAlignRunning,
    INSAlignDone: Boolean;

    // TRUE apabila STATE telah siap digunakan
    INITStateRdy,
    BusSupplyRdy,
    SeekerRdy,
    INSGNSSRdy,
    EngineRdy,

    //to Launch Ready
    MNormalRdy,
    CalFinishRdy,
    InsideSectorRdy,
    FullOpenRdy,
    LaunchRdy,

    // After Launch missile
    NavigationRdy,
    ParaSettingRdy,
    ParaLockRdy,
    BatteryActRdy,
    PwrSwitchRdy,
    IgnitionRdy,
    TakeOffRdy,

    // Target Sequence
    SeaTargetRdy,
    PLCChkRdy,
    INITChkRdy: Boolean;
  end;

  //TLauncherStatusChanged = procedure (Sender: TObject) of object;
  TC705LauncherChanged = procedure(Sender: TObject) of object;

  // Event ketika Missile Launch dan setelah seluruh proses Launch selesai
  TOnMissileLaunch = procedure(Sender: TObject) of object;

  TC705Launcher = class
  private
    FTargetBearing: Double;
    FTargetRange: Double;
    FTargetID: Integer; // lock target

    { Status simulasi launcher }
    FC705Status: TC705LauncherStatus;
    { Identitas launcher }
    FLauncherID: TC705LauncherID;

    //FOnStatusChanged: TLauncherStatusChanged;
    FOnStatusChanged: TC705LauncherChanged;

    FHeadingLauncherOffset: Double;

    // WarmUp Missile
    // Timer simulasi Power On Missile
    // Digunakan untuk mensimulasikan proses Phase Missile Power-ON dan Self-check
    //FWarmUpTimer: TTimer;
    FPowerSequenceTimer: TTimer;
    FPowerStep: Integer;

    // Timer buat Sequence setelah klik Target
    FTargetSequenceTimer: TTimer;
    FIdxTargetStep: Integer;

    // Timer INS Align
    FInsAlignTimer: TTimer;
    FINSAlignElapsed: Integer;    // detik yang sudah berjalan

    // Timer buat otw Launch Ready
    FToLaunchRdyTimer: TTimer;
    FIdxToLaunchRdy: Integer;

    // Timer buat After Launch missile
    FAfterLaunchTimer: TTimer;
    FIdxAfterLaunch: Integer;
    FOnMissileLaunch: TOnMissileLaunch;

    // TRUE  = EMPTY SLOT     // FALSE = MISSILE READY
     { TRUE apabila missile masih ada di launcher }
    FisHaveMissile: Boolean;

    procedure tmrPowerSeqTimer(Sender: TObject);
    procedure tmrTargetSequenceTimer(Sender: TObject);
    procedure tmrINSAlignTimer(Sender: TObject);
    procedure tmrToLaunchTimer(Sender: TObject);
    procedure tmrAfterLaunchTimer(Sender: TObject);

  public
    constructor Create(aLauncherID: TC705LauncherID);
    destructor Destroy; override;

    function GetStateStr: string;
    function IsReadyToLaunch:Boolean;

    procedure StartPowerSequence;

    // Memulai proses Target Acquisition
    // Ganti panel SeaTgt, InsideSector, ParamSetting.
    procedure StartTargetSequence;

    // Memulai proses otw Launch Ready
    procedure StartLaunchRdySequence;

    // Memulai proses setelah LAUNCH
    procedure StartAfterLaunch;
    procedure DoLaunchMissile;

    procedure StartINSAlign;
    procedure FinishINSAlignInstant;

    procedure LaunchMissileC705;
    procedure ResetLauncher;
    procedure ResetMissile;
    procedure SetHaveMissile(aVal: Boolean);

    // Menyimpan Fire Data hasil Route Planning.
    procedure SetTargetData(aTargetID: Integer; aBrn, aRng: Double);

    // Changing C705 Status
    procedure SetEnableWeapon(aVal: Boolean);
    procedure SetOpenCover(aVal: Boolean);
    procedure SetSafetyIgnition(aVal: Boolean);
    procedure SetSelfLatch(aVal: Boolean);
    procedure SetEnableMissile(aVal: Boolean);

    procedure DoStatusLauncherChanged;

    property LauncherStatus: TC705LauncherStatus read FC705Status;
    property LauncherID: TC705LauncherID read FLauncherID write FLauncherID;
    property isHaveMissile: Boolean read FisHaveMissile;
    //property OnStatusLauncherChanged: TLauncherStatusChanged read FOnStatusChanged write FOnStatusChanged;
    property OnStatusLauncherChanged: TC705LauncherChanged read FOnStatusChanged write FOnStatusChanged;
    property OnMissileLaunch: TOnMissileLaunch read FOnMissileLaunch write FOnMissileLaunch;
    property C705Status: TC705LauncherStatus read FC705Status write FC705Status;
    property INSAlignElapsed : Integer read FINSAlignElapsed write FINSAlignElapsed;
    property TargetBearing : Double read FTargetBearing write FTargetBearing;
    property TargetRange   : Double read FTargetRange write FTargetRange;
    property TargetID      : Integer read FTargetID write FTargetID;
  end;

implementation

{ TC705Launcher }

constructor TC705Launcher.Create(aLauncherID: TC705LauncherID);
begin
  FC705Status.EnableWeapon := False;        //NOT ENABLED
  FC705Status.OpenCoverLauncher := False;   //CLOSED
  FC705Status.SafetyIgnition := True;       //SAFE
  FC705Status.SelfLatch := False;           //OFF

  FLauncherID := aLauncherID;

  case FLauncherID of
    lchRight :
      FHeadingLauncherOffset := 0;

    lchLeft :
      FHeadingLauncherOffset := 180;
  end;

  // Timer Set Panel Area3A & Area3B
  FPowerSequenceTimer := TTimer.Create(nil);
  FPowerSequenceTimer.Enabled := False;
  FPowerSequenceTimer.Interval := 700;
  FPowerSequenceTimer.OnTimer := tmrPowerSeqTimer;

  // Timer Sequence setelah klik Target
  FTargetSequenceTimer := TTimer.Create(nil);
  FTargetSequenceTimer.Enabled := False;
  FTargetSequenceTimer.Interval := 2000;
  FTargetSequenceTimer.OnTimer := tmrTargetSequenceTimer;

  // Timer untuk INS Align
  FINSAlignTimer := TTimer.Create(nil);
  FINSAlignTimer.Enabled := False;
  //FINSAlignTimer.Interval := 5 * 60 * 1000; // 5 menit
  FINSAlignTimer.OnTimer := tmrINSAlignTimer;

  // Timer untuk After Launch missile
  FAfterLaunchTimer := TTimer.Create(nil);
  FAfterLaunchTimer.Interval := 500;
  FAfterLaunchTimer.Enabled := False;
  FAfterLaunchTimer.OnTimer := tmrAfterLaunchTimer;

  FToLaunchRdyTimer := TTimer.Create(nil);
  FToLaunchRdyTimer.Interval := 500;
  FToLaunchRdyTimer.Enabled := False;
  FToLaunchRdyTimer.OnTimer := tmrToLaunchTimer;

end;

destructor TC705Launcher.Destroy;
begin
  if Assigned(FPowerSequenceTimer) then
  begin
    FPowerSequenceTimer.Enabled := False;
    FPowerSequenceTimer.OnTimer := nil;
    FreeAndNil(FPowerSequenceTimer);
  end;

  if Assigned(FTargetSequenceTimer) then
  begin
    FTargetSequenceTimer.Enabled := False;
    FTargetSequenceTimer.OnTimer := nil;
    FreeAndNil(FTargetSequenceTimer);
  end;

  if Assigned(FINSAlignTimer) then
  begin
    FINSAlignTimer.Enabled := False;
    FINSAlignTimer.OnTimer := nil;
    FreeAndNil(FINSAlignTimer);
  end;

  if Assigned(FAfterLaunchTimer) then
  begin
    FAfterLaunchTimer.Enabled := False;
    FAfterLaunchTimer.OnTimer := nil;
    FreeAndNil(FAfterLaunchTimer);
  end;

  if Assigned(FToLaunchRdyTimer) then
  begin
    FToLaunchRdyTimer.Enabled := False;
    FToLaunchRdyTimer.OnTimer := nil;
    FreeAndNil(FToLaunchRdyTimer);
  end;

  inherited;
end;

procedure TC705Launcher.DoStatusLauncherChanged;
begin
  if Assigned(FOnStatusChanged) then
    FOnStatusChanged(Self);
end;

procedure TC705Launcher.FinishINSAlignInstant;
begin
  FInsAlignTimer.Enabled := False;

  FC705Status.INSAlignRunning := False;
  FC705Status.INSAlignDone := True;

  DoStatusLauncherChanged;
end;

function TC705Launcher.GetStateStr: string;
begin
  // TRUE = EMPTY
  if FisHaveMissile then
    Result := 'READY'
  else
    Result := 'EMPTY';
end;

function TC705Launcher.IsReadyToLaunch: Boolean;
begin
  Result :=
    FC705Status.EnableWeapon and FC705Status.OpenCoverLauncher
      and (not FC705Status.SafetyIgnition);
end;

procedure TC705Launcher.LaunchMissileC705;
begin
  if not IsReadyToLaunch then
    Exit;

  if not FisHaveMissile then
    Exit;

  FisHaveMissile := False;

  ResetLauncher;
  DoStatusLauncherChanged;

end;

procedure TC705Launcher.ResetLauncher;
begin
  FPowerSequenceTimer.Enabled := False;
  FTargetSequenceTimer.Enabled := False;

  // Set semua FC705Status jadi FALSE
  FillChar(FC705Status, SizeOf(FC705Status), 0);

  // Default state launcher
  FC705Status.SafetyIgnition := True;
  FC705Status.EnableWeapon := False;
  FC705Status.OpenCoverLauncher := False;
  FC705Status.SelfLatch := False;

  FTargetID := -1;
  FIdxTargetStep := 0;
  FIsHaveMissile := True;

  FPowerStep:= 0;

  DoStatusLauncherChanged;

  {
  FC705Status.WarmUpDone := False;
  FC705Status.SeekerRdy := False;

  FC705Status.SeaTargetRdy := False;
  FC705Status.InsideSectorRdy := False;
  FC705Status.ParaSettingRdy := False;

  FC705Status.PLCChkRdy := False;
  FC705Status.INITChkRdy := False;
  FC705Status.INITStateRdy := False;
  FC705Status.INSGNSSRdy := False;
  FC705Status.MNormalRdy := False;
  FC705Status.CalFinishRdy := False;
  FC705Status.ParaLockRdy := False;
  FC705Status.FullOpenRdy := False;
  }
end;

procedure TC705Launcher.ResetMissile;
begin
  //FPowerSequenceTimer.Enabled := False;
  FInsAlignTimer.Enabled := False;

  FC705Status.EnableMissile := False;

  FC705Status.INSAlignRunning := False;
  FC705Status.INSAlignDone := False;
end;

procedure TC705Launcher.SetHaveMissile(aVal: Boolean);
begin
  FIsHaveMissile := aVal;
end;

procedure TC705Launcher.StartINSAlign;
begin
  if FInsAlignTimer.Enabled then
    Exit;

  if FC705Status.INSAlignRunning then
    Exit;

  if FC705Status.INSAlignDone then
    Exit;

  FC705Status.INSAlignRunning := True;

  FINSAlignElapsed := 0;
  FINSAlignTimer.Interval := 1000;  // 1 detik
  FInsAlignTimer.Enabled := True;

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.StartLaunchRdySequence;
begin
  FIdxToLaunchRdy := 0;
  FToLaunchRdyTimer.Enabled := True;
end;

procedure TC705Launcher.tmrToLaunchTimer(Sender: TObject);
begin
  case FIdxToLaunchRdy of
    0: FC705Status.CalFinishRdy := True;
    1: FC705Status.InsideSectorRdy := True;
    2: FC705Status.MNormalRdy := True;
    3: begin
      FC705Status.LaunchRdy := True;
      FToLaunchRdyTimer.Enabled := False;
    end;
  end;

  Inc(FIdxToLaunchRdy);

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.tmrINSAlignTimer(Sender: TObject);
begin
  Inc(FINSAlignElapsed);

  DoStatusLauncherChanged;

  if FINSAlignElapsed >= 300 then
  begin
    FInsAlignTimer.Enabled := False;
    FC705Status.INSAlignRunning := False;
    FC705Status.INSAlignDone := True;

    DoStatusLauncherChanged;
  end;

end;

procedure TC705Launcher.StartPowerSequence;
begin
  FPowerSequenceTimer.Enabled := False;

  FC705Status.INITStateRdy := False;
  FC705Status.BusSupplyRdy := False;
  FC705Status.SeekerRdy := False;
  FC705Status.INSGNSSRdy := False;
  FC705Status.EngineRdy := False;

  FPowerStep:= 0;
  FPowerSequenceTimer.Enabled := True;

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.tmrPowerSeqTimer(Sender: TObject);
begin
  case FPowerStep of
    0: FC705Status.INITStateRdy := True;
    1: FC705Status.BusSupplyRdy := True;
    2: FC705Status.SeekerRdy := True;
    3: FC705Status.INSGNSSRdy := True;
    4: begin
      FC705Status.EngineRdy := True;
      FPowerSequenceTimer.Enabled := False;
    end;

  end;

  Inc(FPowerStep);

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.StartTargetSequence;
begin
  FC705Status.SeaTargetRdy := False;
  FC705Status.InsideSectorRdy := False;
  FC705Status.ParaSettingRdy := False;

  //NotifyStatusWeaponChanged(stEnableWeapon);
  DoStatusLauncherChanged;

  FIdxTargetStep := 0;
  FTargetSequenceTimer.Interval := 2000;
  FTargetSequenceTimer.Enabled := True;
end;

procedure TC705Launcher.tmrTargetSequenceTimer(Sender: TObject);
begin
  case FIdxTargetStep of

    // STEP-1
    // Sea Target
    0:  begin
      FC705Status.SeaTargetRdy := True;
    end;

    // STEP-2
    // Inside Sector
    1:  begin
      FC705Status.InsideSectorRdy := True;

      //NotifyStatusWeaponChanged(stEnableWeapon);
      DoStatusLauncherChanged;
    end;

    2:  begin
      FC705Status.PlcChkRdy := True;

      // balik lagi ke 2 detik
      FTargetSequenceTimer.Interval := 2000;
    end;

    4: begin
      FC705Status.InitChkRdy := True;
      FTargetSequenceTimer.Enabled := False;
    end;

  end;

  Inc(FIdxTargetStep);
  //NotifyStatusWeaponChanged(stEnableWeapon);
  DoStatusLauncherChanged;
end;

procedure TC705Launcher.StartAfterLaunch;
begin
  FIdxAfterLaunch := 0;
  FAfterLaunchTimer.Enabled := True;
end;

procedure TC705Launcher.tmrAfterLaunchTimer(Sender: TObject);
begin
  case FIdxAfterLaunch of
    0: FC705Status.NavigationRdy:= True;
    1: FC705Status.ParaSettingRdy := True;
    2: FC705Status.ParaLockRdy := True;
    3: FC705Status.BatteryActRdy := True;
    4: FC705Status.PwrSwitchRdy := True;
    5: FC705Status.IgnitionRdy := True;
    6: begin
      FC705Status.TakeOffRdy := True;
      FAfterLaunchTimer.Enabled := False;

      DoLaunchMissile;
    end;
  end;

  Inc(FIdxAfterLaunch);
  DoStatusLauncherChanged;
end;

procedure TC705Launcher.DoLaunchMissile;
begin
  FIsHaveMissile := False;

  FC705Status.LaunchRdy := False;

  //FC705Status.EnableMissile := False;

  DoStatusLauncherChanged;

  if Assigned(FOnMissileLaunch) then
    FOnMissileLaunch(Self);
end;

procedure TC705Launcher.SetEnableMissile(aVal: Boolean);
begin
  if FC705Status.EnableMissile = aVal then
    Exit;

  FC705Status.EnableMissile := aVal;

  if aVal then
    StartPowerSequence
  else
    ResetMissile;

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.SetEnableWeapon(aVal: Boolean);
begin
  if FC705Status.EnableWeapon = aVal then
   Exit;

  FC705Status.EnableWeapon := aVal;

  if aVal then
  begin
    // Default setelah Power ON adalah SAFE
    FC705Status.SafetyIgnition := True;

    // mulai Sequence LED simulasi Power On
    //StartPowerSequence; //old concept
  end
  else
  begin
    // reset seluruh status launcher
    ResetLauncher;
  end;

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.SetOpenCover(aVal: Boolean);
begin
  if FC705Status.OpenCoverLauncher = aVal then
   Exit;

  FC705Status.OpenCoverLauncher := aVal;

  // for now SEMENTARA
  if aVal then
  begin
    //StartLaunchRdySequence;
  end
  else begin
//    FC705Status.MNormalRdy := False;
//    FC705Status.CalFinishRdy := False;
//    FC705Status.InsideSectorRdy := False;
//    FC705Status.FullOpenRdy := False;
//    FC705Status.LaunchRdy := False;
  end;

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.SetSafetyIgnition(aVal: Boolean);
begin
  if FC705Status.SafetyIgnition = aVal then
    Exit;

  FC705Status.SafetyIgnition := aVal;

  // for now SEMENTARA
  if not aVal then
  begin
    StartLaunchRdySequence;
          {
    if FC705Status.MNormalRdy and
      FC705Status.CalFinishRdy and
        FC705Status.InsideSectorRdy
        and FC705Status.FullOpenRdy then
    begin
      FC705Status.LaunchRdy := True;
    end
    else begin
      FC705Status.LaunchRdy := False;
    end;
         }
  end
  else begin
    FC705Status.MNormalRdy := False;
    FC705Status.CalFinishRdy := False;
    FC705Status.InsideSectorRdy := False;
    //FC705Status.FullOpenRdy := False;
    FC705Status.LaunchRdy := False;
  end;

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.SetSelfLatch(aVal: Boolean);
begin
  if FC705Status.SelfLatch = aVal then
    Exit;

  FC705Status.SelfLatch := aVal;

  DoStatusLauncherChanged;
end;

procedure TC705Launcher.SetTargetData(aTargetID: Integer; aBrn, aRng: Double);
begin
  FTargetID       := aTargetID;
  FTargetBearing  := aBrn;
  FTargetRange    := aRng;
end;

end.

