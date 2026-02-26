unit uFrmPTK;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SpeedButtonImage, StrUtils, IniFiles, ExtCtrls,
  OverbyteIcsWSocket, uFrmLogNewPDK, uThreadTimer, UfrmBaseTCMS, uLibPTKSetting,
  uPTKEnum;

type
  TfrmPTK = class(TfrmBaseTCMS)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Network Connecttion }
    FipConnect : string;
    FPortConnect : string;
    FTimerConnect : TMSTimer;
    FSocketTCPClient : TWSocket;
    FBuffer : array [0..1023] of AnsiChar;

    { Setting GUI }
    FFormWidth : Integer;
    FFormHeight : Integer;
    FisFullScreen : Boolean;
    FMode : Integer; // 0 = fcc1, 1 = fcc2
//    FServiceMonitor : integer;

    Btn_Separator : integer;
    Btn_Width : integer;
    Btn_Height : integer;
    FFont_Btn : Integer;

    { Private declarations }
    btn : TSpeedButtonImage;
    pnlPTK, pnlNumKey : TPanel;
    FBtnArray         : array [0..29] of TSpeedButtonImage;
    FBtnArrayNumKey  : array [0..29] of TSpeedButtonImage;
    FBtnMainCaption   : array [0..29] of string;
    FBtnMainNames     : array [0..29] of string;
    FBtnNumCaption   : array [0..29] of string;
    FBtnNumNames     : array [0..29] of string;

    FLocalCtrlState : TLocalCtrlState;
    FOperationMode : TOperationMode;
    FDrumSelection : TDrumSelection;
    FRateOfFire : TRateOfFire;
    FisEO : Boolean;
    FisZeroFlyOn : Boolean;
    FisCooEnableed : Boolean;
    FisScreenLocked : Boolean;
    FisLocalCtrl : Boolean;
    FisCheckStart : Boolean;
    FisCtrlGun : Boolean;
    FisRightDrum : Boolean; // jika false, berarti pake left drum, jika true berarti pakai kanan, defaultnya false
    FisVideo, FisDataRecord, FisLockScreen : Boolean;
    FisServoOn, FisCoordinationControl, FisHighFR, FisMiddleFR, FisLowFR : Boolean;

    procedure GenerateCaption;
    procedure GenerateNames;

    procedure addToLog(str : string);
    procedure SendToServerPTK(str : string);

    { All Event Button in PTK }
    procedure btnPtkClick(Sender : TObject);
    procedure btnNkClick(Sender : TObject);

    procedure GenerateCaptionByMenu(aMenu : string);
    procedure GenerateSysCtrlMenu;
    procedure GenerateLocalCtrlMenu;
    procedure GenerateCombatMenu;
    procedure GenerateCheckMenu;
    procedure GenerateIndSettingMenu;
    procedure GenerateCtrlGunMenu;
    procedure GenerateVideoMenu;
    procedure GenerateDataRecordMenu;

    procedure EnableAllBtn;
    procedure DisableAllBtn;
    procedure GenerateLockScreenMenu;
    procedure SetOperationModeDisplay;

    { Network Handler}
    procedure OnTimerConnectOnTime(const dt : Double);
    procedure SocketClientSessionConnected(Sender: TObject; ErrCode: Word);
    procedure SocketClientSessionClosed(Sender: TObject; ErrCode: Word);
    procedure SocketClientDataAvailable(Sender: TObject; ErrCode: Word);
    procedure SetRole(Msg : String);
    procedure FalseRole;
    procedure ProcessCommand(Cmd : String);

  public
    { Public declarations }
    PwoMode : Boolean;
    PcMode  : Boolean;
    AwwMode : Boolean;

    fSelected     : Integer;
    fSelectedSub  : Integer;

    fColorWindow, fColorWindowBg : Integer;

    procedure InitButtons;

    property LocalCtrlState : TLocalCtrlState read FLocalCtrlState write FLocalCtrlState;
    property OperationMode : TOperationMode read FOperationMode write FOperationMode;
    property DrumSelection : TDrumSelection read FDrumSelection write FDrumSelection;
    property RateOfFire : TRateOfFire read FRateOfFire write FRateOfFire;
  end;

var
  frmPTK: TfrmPTK;

implementation

uses
  uTCMSColors;

{$R *.dfm}

procedure TfrmPTK.addToLog(str: string);
begin

end;

procedure TfrmPTK.btnNkClick(Sender: TObject);
begin
  if TSpeedButtonImage(Sender).Name = 'btn_NCancel' then
  begin
    pnlPTK.BringToFront;
    SendToServerPTK(TSpeedButtonImage(Sender).Name);
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_NConfirm' then
  begin
    pnlPTK.BringToFront;
    SendToServerPTK(TSpeedButtonImage(Sender).Name);
  end
  else
  begin
    SendToServerPTK(TSpeedButtonImage(Sender).Name);
  end;
end;

procedure TfrmPTK.btnPtkClick(Sender: TObject);
var
  i: Integer;
  fSelected, fselectedsub : Integer;
begin
//  ShowMessage(TSpeedButtonImage(Sender).Name);
  //set other button color to black except pressed button
  for i := 2 to Length(FBtnArray) - 1 do
  begin
    FBtnArray[i].Color := clBlack;

  end;

  if (TSpeedButtonImage(Sender).Name <> 'btn_SysCtrl') and
    (TSpeedButtonImage(Sender).Name <> 'btn_LocalCtrl') and
    (TSpeedButtonImage(Sender).Name <> 'btn_Combat') and
    (TSpeedButtonImage(Sender).Name <> 'btn_Check') and
    (TSpeedButtonImage(Sender).Name <> 'btn_CtrlGun') and
    (TSpeedButtonImage(Sender).Name <> 'btn_Video') and
    (TSpeedButtonImage(Sender).Name <> 'btn_DataRecord') then
  begin
    if FisLocalCtrl then
    begin
      for i := 0 to Length(FBtnArray) - 1 do
      begin
        FBtnArray[i].Color := clBlack;
      end;
      FBtnArray[1].Color := clLime;
      if FisCtrlGun then
      begin
        if FisServoOn then
        FBtnArray[7].Color := clLime;

        if FisRightDrum then
        begin
          FBtnArray[11].Color := clLime;
        end
        else FBtnArray[10].Color := clLime;
        if FisHighFR then
        begin
          FBtnArray[15].Color := clLime;
        end
        else if FisMiddleFR then
        begin
          FBtnArray[16].Color := clLime;
        end
        else if FisLowFR then
        begin
          FBtnArray[17].Color := clLime;
        end;
      end

      else if FisVideo then
      begin

      end

      else if FisDataRecord then
      begin

      end

      else
      begin
        if FLocalCtrlState = lcCombat then
        begin
          FBtnArray[7].Color := clLime;
          SetOperationModeDisplay;
        end
        else if FLocalCtrlState = lcCheck then
        begin
          FBtnArray[8].Color := clLime;
          if FisCheckStart then
          begin
            FBtnArray[7].Enabled := False;
            FBtnArray[28].Color := clLime;
            FBtnArray[29].Color := clBlack;
          end
          else
          begin
            FBtnArray[7].Enabled := True;
            FBtnArray[28].Color := clBlack;
            FBtnArray[29].Color := clLime;
          end;

        end;
      end;
    end
    else
    begin
      for i := 0 to Length(FBtnArray) - 1 do
      begin
        FBtnArray[i].Color := clBlack;
      end;
      FBtnArray[0].Color := clLime;
    end;
  end;


  if TSpeedButtonImage(Sender).Name = 'btn_SysCtrl' then
  begin
//    FBtnArray[0].Down := True;
    FBtnArray[0].Color := clLime;
    FBtnArray[1].Color := clBlack;
    FisLocalCtrl := False;
    FisCtrlGun := False;
    GenerateCaptionByMenu('SysCtrl');
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_LocalCtrl' then
  begin
//    FBtnArray[1].Down := True;
    FBtnArray[1].Color := clLime;
    FBtnArray[0].Color := clBlack;
    FisLocalCtrl := True;
    FisCtrlGun := False;
    GenerateCaptionByMenu('LocalCtrl');
    if FLocalCtrlState = lcCombat then
    begin
      FBtnArray[7].Color := clLime;
      FBtnArray[8].Color := clBlack;
      GenerateCombatMenu;
      SetOperationModeDisplay;
    end
    else if FLocalCtrlState = lcCheck then
    begin
      FBtnArray[8].Color := clLime;
      FBtnArray[7].Color := clBlack;
      GenerateCheckMenu;
      FBtnArray[29].Color := clLime;
    end;

  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Combat' then
  begin
//    FBtnArray[7].Down := True;
    FBtnArray[7].Color := clLime;
    FBtnArray[8].Color := clBlack;
    FLocalCtrlState := lcCombat;
    GenerateCaptionByMenu('Combat');
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Check' then
  begin
//    FBtnArray[8].Down := True;
    FBtnArray[8].Color := clLime;
    FBtnArray[7].Color := clBlack;
    FLocalCtrlState := lcCheck;
    GenerateCaptionByMenu('Check');
    FBtnArray[29].Color := clLime;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_NavSetting' then
  begin
    pnlNumKey.BringToFront;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_WeatherSetting' then
  begin
    pnlNumKey.BringToFront;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_CalSetting' then
  begin
    pnlNumKey.BringToFront;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_RrSetting' then
  begin
    pnlNumKey.BringToFront;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_TimeSetting' then
  begin
    pnlNumKey.BringToFront;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Wait' then
  begin
    FOperationMode := omWait;
    SetOperationModeDisplay;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Ind' then
  begin
    FOperationMode := omInd;
    SetOperationModeDisplay;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Autonomous' then
  begin
    FOperationMode := omAutonomous;
    SetOperationModeDisplay;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_DAttack' then
  begin
    FOperationMode := omDAttack;
    SetOperationModeDisplay;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_VFire' then
  begin
    FOperationMode := omVFire;
    SetOperationModeDisplay;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_IndSetting' then
  begin
    FBtnArray[0].Color := clBlack;
    FBtnArray[1].Color := clBlack;
    for i := 2 to Length(FBtnArray) - 1 do
    begin
      FBtnArray[i].Color := clBlack;
    end;
    GenerateCaptionByMenu('IndSetting');
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Back' then
  begin
    if FisLocalCtrl then
    begin
      FBtnArray[1].Color := clLime;
      FBtnArray[0].Color := clBlack;
      GenerateLocalCtrlMenu;

      if FLocalCtrlState = lcCombat then
      begin
        FBtnArray[7].Color := clLime;
        FBtnArray[8].Color := clBlack;
        GenerateCombatMenu;
      end
      else if FLocalCtrlState = lcCheck then
      begin
        FBtnArray[8].Color := clLime;
        FBtnArray[7].Color := clBlack;
        GenerateCheckMenu;
      end;
    end
    else
    begin
      FBtnArray[0].Color := clLime;
      FBtnArray[1].Color := clBlack;
      GenerateSysCtrlMenu;
    end;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_CtrlGun' then
  begin
    FisCtrlGun := True;
    FisVideo := false;
    FisDataRecord := False;
    FisLockScreen := false;
    if FisRightDrum then
    begin
      FBtnArray[11].Color := clLime;
    end
    else FBtnArray[10].Color := clLime;

    if FisServoOn then
    begin
      FBtnArray[7].Color := clLime;
    end
    else FBtnArray[7].Color := clBlack;

    if FisHighFR then
    begin
      FBtnArray[15].Color := clLime;
      FBtnArray[16].Color := clBlack;
      FBtnArray[17].Color := clBlack;
    end
    else if FisMiddleFR then
    begin
      FBtnArray[15].Color := clblack;
      FBtnArray[16].Color := clLime;
      FBtnArray[17].Color := clBlack;
    end
    else if FisLowFR then
    begin
      FBtnArray[15].Color := clblack;
      FBtnArray[16].Color := clBlack;
      FBtnArray[17].Color := clLime;
    end;

    GenerateCaptionByMenu('CtrlGun');
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_LDrum' then
  begin
    FisRightDrum := False;
    FBtnArray[11].Color := clBlack;
    FBtnArray[10].Color := clLime;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_RDrum' then
  begin
    FisRightDrum := True;
    FBtnArray[10].Color := clBlack;
    FBtnArray[11].Color := clLime;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_High' then
  begin
    FisHighFR := True;
    FisMiddleFR := False;
    FisLowFR := False;
    FBtnArray[15].Color := clLime;
    FBtnArray[16].Color := clBlack;
    FBtnArray[17].Color := clBlack;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Middle' then
  begin
    FisHighFR := False;
    FisMiddleFR := True;
    FisLowFR := False;
    FBtnArray[15].Color := clblack;
    FBtnArray[16].Color := clLime;
    FBtnArray[17].Color := clBlack;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Low' then
  begin
    FisHighFR := False;
    FisMiddleFR := False;
    FisLowFR := True;
    FBtnArray[15].Color := clBlack;
    FBtnArray[16].Color := clBlack;
    FBtnArray[17].Color := clLime;
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_ServoOn' then
  begin
    if FisServoOn then
    begin
      FisServoOn := False;
      FBtnArray[7].Color := clBlack;
    end
    else
    begin
      FisServoOn := True;
      FBtnArray[7].Color := clLime;
    end;

  end
  else if TSpeedButtonImage(Sender).Name = 'btn_Video' then
  begin
    FisCtrlGun := False;
    FisVideo := True;
    FisDataRecord := False;
    FisLockScreen := False;
    GenerateCaptionByMenu('Video');
  end
  else if TSpeedButtonImage(Sender).Name = 'btn_DataRecord' then
  begin
    FisCtrlGun := False;
    FisVideo := false;
    FisDataRecord := True;
    FisLockScreen := False;
    GenerateCaptionByMenu('DataRecord');
  end;

  if TSpeedButtonImage(Sender).Name = 'btn_LockScreen' then
  begin
    FisCtrlGun := False;
    FisVideo := false;
    FisDataRecord := False;
    FisLockScreen := True;
    GenerateCaptionByMenu('LockScreen');
  end;


  SendToServerPTK(TSpeedButtonImage(Sender).Name);
end;

procedure TfrmPTK.DisableAllBtn;
var
  i: Integer;
begin
  for i := 0 to Length(FBtnArray) - 1 do
  begin
    FBtnArray[i].Enabled := False;
  end;
end;

procedure TfrmPTK.EnableAllBtn;
var
  i: Integer;
begin
  for i := 0 to Length(FBtnArray) - 1 do
  begin
    FBtnArray[i].Enabled := True;
  end;
end;

procedure TfrmPTK.FalseRole;
begin

end;

procedure TfrmPTK.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FTimerConnect.Enabled := False;
  FSocketTCPClient.Close;
end;

procedure TfrmPTK.FormCreate(Sender: TObject);
var
  iniF : TIniFile;
  iniPath : string;
begin
  inherited;
  SetServiceIndex(0);

//  case VThemeSetting.ColorNum of
//    1 : begin
//      fColorWindow := CL_TCMS_Window;
//      fColorWindowBg := CL_TCMS_WindowBackGround;
//    end;
//    2 :
//    begin
//      fColorWindow := CL_CMS_Window;
//      fColorWindowBg := CL_CMS_WindowBackGround;
//    end;
//  end;
  fColorWindow := CL_TCMS_WindowBackGround;
  Color := fColorWindow;

  { Initialize PTK }
  FisFullScreen := true;
  BorderStyle := bsDialog;
  Height := 400;
  Width := 600;
//  FServiceMonitor := 0;
  FipConnect := '0.0.0.0';
  FPortConnect := '2345';
  FFont_Btn := 10;

  { Create Network Handler }
  FSocketTCPClient := TWSocket.Create(Self);

  FTimerConnect := TMSTimer.Create;
  FTimerConnect.OnRunning := OnTimerConnectOnTime;
  FTimerConnect.Interval := 5000;
  FTimerConnect.Enabled := True;

  { Get Setting from ptk.ini }
//  iniPath := ExtractFilePath(Application.ExeName) + 'ptk.ini';
  iniPath := getFileSetting;
//  iniF := TIniFile.Create(iniPath);

  if FileExists(iniPath) then
  begin
    LoadNetworkSetting;
    LoadPTKSetting;

    FipConnect := NetworkSetting.ipConnect;
    FPortConnect := NetworkSetting.portConnect;

    FisFullScreen := PtkSetting.isFullScreen;
    FServiceIndex := PtkSetting.MonitorPos;
    FMode := PtkSetting.FccMode;
  end
  else
  begin
    SaveNetworkSetting;
    LoadNetworkSetting;

    SavePTKSetting;
    LoadPTKSetting;

    FipConnect := NetworkSetting.ipConnect;
    FPortConnect := NetworkSetting.portConnect;

    FisFullScreen := PtkSetting.isFullScreen;
    FServiceIndex := PtkSetting.MonitorPos;
    FMode := PtkSetting.FccMode;
  end;

//  try
////    iniF := TIniFile.Create(iniPath);
//
//
////    FFormHeight := iniF.ReadInteger('PTKSetting', 'FormHeight', Height);
////    FFormWidth := iniF.ReadInteger('PTKSetting', 'FormWidth', Width);
////    FServiceMonitor := iniF.ReadInteger('PTKSetting', 'ServiceMonitor', 0);
////    FFont_Btn := iniF.ReadInteger('PTKSetting', 'FontSize', 6);
////    if FFont_Btn < 0 then
////      FFont_Btn := 8;
//  finally
//    iniF.Free;
//  end;

//  FMode := 1;

  if FisFullScreen then
  begin
    Left := Screen.Monitors[FServiceIndex].Left;
    Top := Screen.Monitors[FServiceIndex].Top;
    Width := Screen.Monitors[FServiceIndex].Width;
    Height := Screen.Monitors[FServiceIndex].Height;

    BorderStyle := bsNone;

    Btn_Separator := 6;
    Btn_Width := ((Width - (Btn_Separator * 7)) div 6);
    Btn_Height := ((Height - (Btn_Separator * 6)) div 5);
    FFont_Btn := Btn_Height div 10 ;
    if FFont_Btn <= 10 then
      FFont_Btn := 10;
  end
  else
  begin
     Left := Screen.Monitors[FServiceIndex].Left;
      Top := Screen.Monitors[FServiceIndex].Top;
//      Width := FFormWidth;
//      Height := FFormWidth;

    BorderStyle := bsSingle;

    Btn_Separator := 6;
    Btn_Width := ((Width - (Btn_Separator * 7)) div 6) - 1;
    Btn_Height := ((Height - (Btn_Separator * 6)) div 5) - 5;
    FFont_Btn := Btn_Height div 10 ;
    if FFont_Btn <= 10 then
      FFont_Btn := 10;
  end;
  InitButtons;

//  FLocalCtrlState := lcCombat;
//  FOperationMode := omWait;
//  FDrumSelection := dsLDrum;
//  FRateOfFire := frHigh;
  FisEO := True;
  FisZeroFlyOn := False;
  FisCooEnableed := False;
  FisLocalCtrl := False;
  FisCheckStart := False;
  FisHighFR := True;
end;

procedure TfrmPTK.FormDestroy(Sender: TObject);
begin
//
  if Assigned(FTimerConnect) then
    FreeAndNil(FTimerConnect);

  if Assigned(FSocketTCPClient) then
    FreeAndNil(FSocketTCPClient);
end;

procedure TfrmPTK.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
end;

procedure TfrmPTK.GenerateCaption;
var
  i : Integer;
begin
  FBtnMainCaption[0] := 'SYS CTRL'    + #13#10;
  FBtnMainCaption[1] := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnMainCaption[2] := 'Ctrl'  + #13#10 + 'Gun';
  FBtnMainCaption[3] := 'Video'  + #13#10;
  FBtnMainCaption[4] := 'Data' + #13#10 + 'Record';
  FBtnMainCaption[5] := 'Lock'  + #13#10 + 'Screen';
  FBtnMainCaption[6] := 'NAV'  + #13#10 + 'Setting';
  FBtnMainCaption[7] := 'Weather'    + #13#10 + 'Setting';
  FBtnMainCaption[8] := 'CAL' + #13#10 + 'Setting';
  FBtnMainCaption[27] := 'Zero Fly'  + #13#10 + 'Off';

  for i := 9 to Length(FBtnArray)-1 do
  begin
    if i <> 27 then
      FBtnMainCaption[i] := '  ';
  end;

  FBtnNumCaption[0] := 'E';
  FBtnNumCaption[1] := 'W';
  FBtnNumCaption[2] := 'S';
  FBtnNumCaption[3] := 'N';
  FBtnNumCaption[4] := '  ';
  FBtnNumCaption[5] := '  ';
  FBtnNumCaption[6] := '1';
  FBtnNumCaption[7] := '2';
  FBtnNumCaption[8] := '3';
  FBtnNumCaption[9] := '.';
  FBtnNumCaption[10] := 'Up';
  FBtnNumCaption[11] := 'Backspace';
  FBtnNumCaption[12] := '4';
  FBtnNumCaption[13] := '5';
  FBtnNumCaption[14] := '6';
  FBtnNumCaption[15] := '+';
  FBtnNumCaption[16] := 'Down';
  FBtnNumCaption[17] := 'Del';
  FBtnNumCaption[18] := '7';
  FBtnNumCaption[19] := '8';
  FBtnNumCaption[20] := '9';
  FBtnNumCaption[21] := '-';
  FBtnNumCaption[22] := 'Enter';
  FBtnNumCaption[23] := '  ';
  FBtnNumCaption[24] := 'Left';
  FBtnNumCaption[25] := '0';
  FBtnNumCaption[26] := 'Right';
  FBtnNumCaption[27] := '  ';
  FBtnNumCaption[28] := 'Cancel';
  FBtnNumCaption[29] := 'Confirm';
end;

procedure TfrmPTK.GenerateCaptionByMenu(aMenu: string);
begin
  if aMenu = 'SysCtrl' then
  begin
    GenerateSysCtrlMenu;
  end
  else if aMenu = 'LocalCtrl' then
  begin
    GenerateLocalCtrlMenu;
  end
  else if aMenu = 'Combat' then
  begin
    GenerateCombatMenu;
  end
  else if aMenu = 'Check' then
  begin
    GenerateCheckMenu;
  end
  else if aMenu = 'IndSetting' then
  begin
    GenerateIndSettingMenu;
  end
  else if aMenu = 'CtrlGun' then
  begin
    GenerateCtrlGunMenu;
  end
  else if aMenu = 'Video' then
  begin
    GenerateVideoMenu;
  end
  else if aMenu = 'DataRecord' then
  begin
    GenerateDataRecordMenu;
  end;

  if aMenu = 'LockScreen' then
  begin
    GenerateLockScreenMenu;
    FisScreenLocked := not FisScreenLocked;
  end;
end;

procedure TfrmPTK.GenerateCheckMenu;
var
  i: Integer;
begin
  FBtnArray[0].Caption := 'SYS CTRL'    + #13#10;
  FBtnArray[1].Caption := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := 'Ctrl'  + #13#10 + 'Gun';
  FBtnArray[3].Caption := 'Video'  + #13#10;
  FBtnArray[4].Caption := 'Data' + #13#10 + 'Record';
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
  FBtnArray[6].Caption := '  ';
  FBtnArray[7].Caption := 'Combat' + #13#10;
  FBtnArray[8].Caption := 'Check' + #13#10;
  FBtnArray[9].Caption := '  ';
  FBtnArray[10].Caption := '  ';
  FBtnArray[11].Caption := '  ';
  FBtnArray[12].Caption := 'EO FCS' + #13#10 + 'Static';
  FBtnArray[13].Caption := 'EO FCS' + #13#10 + 'Dynamic';
  FBtnArray[14].Caption := 'EO Semi' + #13#10 + 'Static';
  FBtnArray[15].Caption := 'EO Semi' + #13#10 + 'Dynamic';
  FBtnArray[16].Caption := '  ';
  FBtnArray[17].Caption := '  ';
  if FMode = 0 then
  begin
    FBtnArray[18].Caption := 'FCC1&Gun' + #13#10;
  end
  else if FMode = 1 then
  begin
    FBtnArray[18].Caption := 'FCC2&Gun' + #13#10;
  end;
  FBtnArray[19].Caption := 'Gun' + #13#10 + 'Static';
  FBtnArray[20].Caption := 'Gun' + #13#10 + 'Speed';
  FBtnArray[21].Caption := 'Gun' + #13#10 + 'Sin';
  FBtnArray[22].Caption := '  ';
  FBtnArray[23].Caption := '  ';
  if FMode = 0 then
  begin
    FBtnArray[24].Caption := 'FCC1' + #13#10 + 'Static';
  end
  else if FMode = 1 then
  begin
    FBtnArray[24].Caption := 'FCC2' + #13#10 + 'Static';
  end;
  if FMode = 0 then
  begin
    FBtnArray[25].Caption := 'FCC1' + #13#10 + 'Dynamic';
  end
  else if FMode = 1 then
  begin
    FBtnArray[25].Caption := 'FCC2' + #13#10 + 'Dynamic';
  end;
  FBtnArray[26].Caption := '  ';
  FBtnArray[27].Caption := '  ';
  FBtnArray[28].Caption := 'Check' + #13#10 +'Start';
  FBtnArray[29].Caption := 'Check' + #13#10 +'Stop';

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_SysCtrl';
  FBtnArray[1].Name := 'btn_LocalCtrl';
  FBtnArray[2].Name := 'btn_CtrlGun';
  FBtnArray[3].Name := 'btn_Video';
  FBtnArray[4].Name := 'btn_DataRecord';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_6';
  FBtnArray[7].Name := 'btn_Combat';
  FBtnArray[8].Name := 'btn_Check';
  FBtnArray[9].Name := 'btn_9';
  FBtnArray[10].Name := 'btn_10';
  FBtnArray[11].Name := 'btn_11';
  FBtnArray[12].Name := 'btn_EoFcsStatic';
  FBtnArray[13].Name := 'btn_EoFcsDynamic';
  FBtnArray[14].Name := 'btn_EoSemiStatic';
  FBtnArray[15].Name := 'btn_EoSemiDynamic';
  FBtnArray[16].Name := 'btn_16';
  FBtnArray[17].Name := 'btn_17';
  FBtnArray[18].Name := 'btn_FccAndGun';
  FBtnArray[19].Name := 'btn_GunStatic';
  FBtnArray[20].Name := 'btn_GunSpeed';
  FBtnArray[21].Name := 'btn_GunSin';
  FBtnArray[22].Name := 'btn_22';
  FBtnArray[23].Name := 'btn_23';
  FBtnArray[24].Name := 'btn_FccStatic';
  FBtnArray[25].Name := 'btn_FccDynamic';
  FBtnArray[26].Name := 'btn_26';
  FBtnArray[27].Name := 'btn_27';
  FBtnArray[28].Name := 'btn_CheckStart';
  FBtnArray[29].Name := 'btn_CheckStop';
end;

procedure TfrmPTK.GenerateCombatMenu;
var
  i: Integer;
begin
  FBtnArray[0].Caption := 'SYS CTRL'    + #13#10;
  FBtnArray[1].Caption := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := 'Ctrl'  + #13#10 + 'Gun';
  FBtnArray[3].Caption := 'Video'  + #13#10;
  FBtnArray[4].Caption := 'Data' + #13#10 + 'Record';
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
  FBtnArray[6].Caption := '  ';
  FBtnArray[7].Caption := 'Combat' + #13#10;
  FBtnArray[8].Caption := 'Check' + #13#10;
  FBtnArray[9].Caption := '  ';
  FBtnArray[10].Caption := '  ';
  FBtnArray[11].Caption := '  ';
  FBtnArray[12].Caption := 'IND' + #13#10 + 'Setting';
  FBtnArray[13].Caption := 'D. Attack' + #13#10 + 'Setting';
  FBtnArray[14].Caption := 'V. Fire' + #13#10 + 'Setting';
  FBtnArray[15].Caption := 'Wait' + #13#10;
  FBtnArray[16].Caption := 'IND' + #13#10;
  FBtnArray[17].Caption := 'Autono-' + #13#10 + 'mous';
  FBtnArray[18].Caption := 'CAL' + #13#10 + 'Setting';
  FBtnArray[19].Caption := 'NAV' + #13#10 + 'Setting';
  FBtnArray[20].Caption := 'Weather' + #13#10 + 'Setting';
  FBtnArray[21].Caption := 'D. Attack';
  FBtnArray[22].Caption := 'V. Fire';
  FBtnArray[23].Caption := '  ';
  FBtnArray[24].Caption := '  ';
  if FisEO then
  begin
    FBtnArray[25].Caption := 'EO' + #13#10;
  end
  else
  begin
    FBtnArray[25].Caption := 'TR' + #13#10;
  end;
  FBtnArray[26].Caption := '  ';
  if FisZeroFlyOn then
  begin
    FBtnArray[27].Caption := 'Zero Fly'  + #13#10 + 'On';
  end
  else
  begin
    FBtnArray[27].Caption := 'Zero Fly'  + #13#10 + 'Off';
  end;
  FBtnArray[28].Caption := '  ';
  FBtnArray[29].Caption := 'Confirm' + #13#10;

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_SysCtrl';
  FBtnArray[1].Name := 'btn_LocalCtrl';
  FBtnArray[2].Name := 'btn_CtrlGun';
  FBtnArray[3].Name := 'btn_Video';
  FBtnArray[4].Name := 'btn_DataRecord';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_6';
  FBtnArray[7].Name := 'btn_Combat';
  FBtnArray[8].Name := 'btn_Check';
  FBtnArray[9].Name := 'btn_9';
  FBtnArray[10].Name := 'btn_10';
  FBtnArray[11].Name := 'btn_11';
  FBtnArray[12].Name := 'btn_IndSetting';
  FBtnArray[13].Name := 'btn_DAttackSetting';
  FBtnArray[14].Name := 'btn_VFireSetting';
  FBtnArray[15].Name := 'btn_Wait';
  FBtnArray[16].Name := 'btn_Ind';
  FBtnArray[17].Name := 'btn_Autonomous';
  FBtnArray[18].Name := 'btn_CalSetting';
  FBtnArray[19].Name := 'btn_NavSetting';
  FBtnArray[20].Name := 'btn_WeatherSetting';
  FBtnArray[21].Name := 'btn_DAttack';
  FBtnArray[22].Name := 'btn_VFire';
  FBtnArray[23].Name := 'btn_23';
  FBtnArray[24].Name := 'btn_24';
  FBtnArray[25].Name := 'btn_Eo';
  FBtnArray[26].Name := 'btn_26';
  FBtnArray[27].Name := 'btn_ZeroFlyOff';
  FBtnArray[28].Name := 'btn_28';
  FBtnArray[29].Name := 'btn_Confirm';

  SetOperationModeDisplay;
end;

procedure TfrmPTK.GenerateCtrlGunMenu;
var
  i: Integer;
begin
  FBtnArray[0].Caption := 'SYS CTRL'    + #13#10;
  FBtnArray[1].Caption := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := 'Ctrl'  + #13#10 + 'Gun';
  FBtnArray[3].Caption := 'Video'  + #13#10;
  FBtnArray[4].Caption := 'Data' + #13#10 + 'Record';
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
  FBtnArray[6].Caption := '  ';
  FBtnArray[7].Caption := 'Servo On'    + #13#10;
  FBtnArray[8].Caption := '  ';
  FBtnArray[9].Caption := '  ';
  FBtnArray[10].Caption := 'L Drum' + #13#10;
  FBtnArray[11].Caption := 'R Drum' + #13#10;
  FBtnArray[12].Caption := '  ';
  FBtnArray[13].Caption := 'COO' + #13#10 + 'Disabled';
  FBtnArray[14].Caption := '  ';
  FBtnArray[15].Caption := 'High' + #13#10;
  FBtnArray[16].Caption := 'Middle' + #13#10;
  FBtnArray[17].Caption := 'Low' + #13#10;
  FBtnArray[18].Caption := '  ';
  FBtnArray[19].Caption := 'Return' + #13#10 + 'Zero';
  FBtnArray[20].Caption := 'Turn Off';
  FBtnArray[21].Caption := 'RR' + #13#10 + 'Setting';
  FBtnArray[22].Caption := '  ';
  FBtnArray[23].Caption := 'Time' + #13#10 + 'Setting';
  FBtnArray[24].Caption := '  ';
  FBtnArray[25].Caption := '  ';
  FBtnArray[26].Caption := '  ';
  FBtnArray[27].Caption := '  ';
  FBtnArray[28].Caption := '  ';
  FBtnArray[29].Caption := '  ';

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_SysCtrl';
  FBtnArray[1].Name := 'btn_LocalCtrl';
  FBtnArray[2].Name := 'btn_CtrlGun';
  FBtnArray[3].Name := 'btn_Video';
  FBtnArray[4].Name := 'btn_DataRecord';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_6';
  FBtnArray[7].Name := 'btn_ServoOn';
  FBtnArray[8].Name := 'btn_8';
  FBtnArray[9].Name := 'btn_9';
  FBtnArray[10].Name := 'btn_LDrum';
  FBtnArray[11].Name := 'btn_RDrum';
  FBtnArray[12].Name := 'btn_12';
  FBtnArray[13].Name := 'btn_CooDisabled';
  FBtnArray[14].Name := 'btn_14';
  FBtnArray[15].Name := 'btn_High';
  FBtnArray[16].Name := 'btn_Middle';
  FBtnArray[17].Name := 'btn_Low';
  FBtnArray[18].Name := 'btn_18';
  FBtnArray[19].Name := 'btn_ReturnZero';
  FBtnArray[20].Name := 'btn_20';
  FBtnArray[21].Name := 'btn_RrSetting';
  FBtnArray[22].Name := 'btn_22';
  FBtnArray[23].Name := 'btn_TimeSetting';
  FBtnArray[24].Name := 'btn_24';
  FBtnArray[25].Name := 'btn_25';
  FBtnArray[26].Name := 'btn_26';
  FBtnArray[27].Name := 'btn_27';
  FBtnArray[28].Name := 'btn_28';
  FBtnArray[29].Name := 'btn_29';
end;

procedure TfrmPTK.GenerateDataRecordMenu;
var
  i: Integer;
begin
  FBtnArray[0].Caption := 'SYS CTRL'    + #13#10;
  FBtnArray[1].Caption := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := 'Ctrl'  + #13#10 + 'Gun';
  FBtnArray[3].Caption := 'Video'  + #13#10;
  FBtnArray[4].Caption := 'Data' + #13#10 + 'Record';
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
  FBtnArray[6].Caption := '  ';
  FBtnArray[7].Caption := '  ';
  FBtnArray[8].Caption := '  ';
  FBtnArray[9].Caption := 'Record' + #13#10 + 'Start';
  FBtnArray[10].Caption := 'Record' + #13#10 + 'Stop';
  FBtnArray[11].Caption := '  ';
  FBtnArray[12].Caption := '  ';
  FBtnArray[13].Caption := '  ';
  FBtnArray[14].Caption := '  ';
  FBtnArray[15].Caption := '  ';
  FBtnArray[16].Caption := '  ';
  FBtnArray[17].Caption := '  ';
  FBtnArray[18].Caption := '  ';
  FBtnArray[19].Caption := '  ';
  FBtnArray[20].Caption := '  ';
  FBtnArray[21].Caption := '  ';
  FBtnArray[22].Caption := '  ';
  FBtnArray[23].Caption := '  ';
  FBtnArray[24].Caption := '  ';
  FBtnArray[25].Caption := '  ';
  FBtnArray[26].Caption := '  ';
  FBtnArray[27].Caption := '  ';
  FBtnArray[28].Caption := '  ';
  FBtnArray[29].Caption := '  ';

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_SysCtrl';
  FBtnArray[1].Name := 'btn_LocalCtrl';
  FBtnArray[2].Name := 'btn_CtrlGun';
  FBtnArray[3].Name := 'btn_Video';
  FBtnArray[4].Name := 'btn_DataRecord';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_6';
  FBtnArray[7].Name := 'btn_7';
  FBtnArray[8].Name := 'btn_8';
  FBtnArray[9].Name := 'btn_RecordStart';
  FBtnArray[10].Name := 'btn_RecordStop';
  FBtnArray[11].Name := 'btn_11';
  FBtnArray[12].Name := 'btn_12';
  FBtnArray[13].Name := 'btn_13';
  FBtnArray[14].Name := 'btn_14';
  FBtnArray[15].Name := 'btn_15';
  FBtnArray[16].Name := 'btn_16';
  FBtnArray[17].Name := 'btn_17';
  FBtnArray[18].Name := 'btn_18';
  FBtnArray[19].Name := 'btn_19';
  FBtnArray[20].Name := 'btn_20';
  FBtnArray[21].Name := 'btn_21';
  FBtnArray[22].Name := 'btn_22';
  FBtnArray[23].Name := 'btn_23';
  FBtnArray[24].Name := 'btn_24';
  FBtnArray[25].Name := 'btn_25';
  FBtnArray[26].Name := 'btn_26';
  FBtnArray[27].Name := 'btn_27';
  FBtnArray[28].Name := 'btn_28';
  FBtnArray[29].Name := 'btn_29';
end;

procedure TfrmPTK.GenerateIndSettingMenu;
var
  i: Integer;
begin
  if FMode = 0 then
  begin
    FBtnArray[0].Caption := 'FCC1' + #13#10;
  end
  else if FMode = 1 then
  begin
    FBtnArray[0].Caption := 'FCC2' + #13#10;
  end;
  FBtnArray[1].Caption := 'TCC' + #13#10;
  FBtnArray[2].Caption := 'SR' + #13#10;
  FBtnArray[3].Caption := 'TR' + #13#10;
  FBtnArray[29].Caption := 'BACK' + #13#10;

  EnableAllBtn;
  for i := 4 to Length(FBtnArray) - 2 do
  begin
    FBtnArray[i].Caption := '  ';
    FBtnArray[i].Enabled := False;
    FBtnArray[i].Name := 'btn_' + IntToStr(i);
  end;

  FBtnArray[0].Name := 'btn_Fcc';
  FBtnArray[1].Name := 'btn_Tcc';
  FBtnArray[2].Name := 'btn_Sr';
  FBtnArray[3].Name := 'btn_Tr';
  FBtnArray[29].Name := 'btn_Back';
end;

procedure TfrmPTK.GenerateLocalCtrlMenu;
var
  i: Integer;
begin
  FBtnArray[0].Caption := 'SYS CTRL'    + #13#10;
  FBtnArray[1].Caption := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := 'Ctrl'  + #13#10 + 'Gun';
  FBtnArray[3].Caption := 'Video'  + #13#10;
  FBtnArray[4].Caption := 'Data' + #13#10 + 'Record';
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
  FBtnArray[6].Caption := '  ';
  FBtnArray[7].Caption := 'Combat' + #13#10;
  FBtnArray[8].Caption := 'Check' + #13#10;
  FBtnArray[9].Caption := '  ';
  FBtnArray[10].Caption := '  ';
  FBtnArray[11].Caption := '  ';
  FBtnArray[12].Caption := '  ';
  FBtnArray[13].Caption := '  ';
  FBtnArray[14].Caption := '  ';
  FBtnArray[15].Caption := '  ';
  FBtnArray[16].Caption := '  ';
  FBtnArray[17].Caption := '  ';
  FBtnArray[18].Caption := '  ';
  FBtnArray[19].Caption := '  ';
  FBtnArray[20].Caption := '  ';
  FBtnArray[21].Caption := '  ';
  FBtnArray[22].Caption := '  ';
  FBtnArray[23].Caption := '  ';
  FBtnArray[24].Caption := '  ';
  FBtnArray[25].Caption := '  ';
  FBtnArray[26].Caption := '  ';
  FBtnArray[27].Caption := 'Zero Fly'  + #13#10 + 'Off';
  FBtnArray[28].Caption := '  ';
  FBtnArray[29].Caption := '  ';

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_SysCtrl';
  FBtnArray[1].Name := 'btn_LocalCtrl';
  FBtnArray[2].Name := 'btn_CtrlGun';
  FBtnArray[3].Name := 'btn_Video';
  FBtnArray[4].Name := 'btn_DataRecord';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_6';
  FBtnArray[7].Name := 'btn_Combat';
  FBtnArray[8].Name := 'btn_Check';
  FBtnArray[9].Name := 'btn_9';
  FBtnArray[10].Name := 'btn_10';
  FBtnArray[11].Name := 'btn_11';
  FBtnArray[12].Name := 'btn_12';
  FBtnArray[13].Name := 'btn_13';
  FBtnArray[14].Name := 'btn_14';
  FBtnArray[15].Name := 'btn_15';
  FBtnArray[16].Name := 'btn_16';
  FBtnArray[17].Name := 'btn_17';
  FBtnArray[18].Name := 'btn_18';
  FBtnArray[19].Name := 'btn_19';
  FBtnArray[20].Name := 'btn_20';
  FBtnArray[21].Name := 'btn_21';
  FBtnArray[22].Name := 'btn_22';
  FBtnArray[23].Name := 'btn_23';
  FBtnArray[24].Name := 'btn_24';
  FBtnArray[25].Name := 'btn_25';
  FBtnArray[26].Name := 'btn_26';
  FBtnArray[27].Name := 'btn_ZeroFlyOff';
  FBtnArray[28].Name := 'btn_28';
  FBtnArray[29].Name := 'btn_29';

//  FBtnArray[7].GroupIndex := 2;
//  FBtnArray[8].GroupIndex := 2;
end;

procedure TfrmPTK.GenerateLockScreenMenu;
var i: Integer;
begin
  if FisScreenLocked then
  begin
    EnableAllBtn;
    FBtnArray[5].Caption := 'Lock' + #13#10 + 'Screen';
    for i := 0 to 29 do
    begin
      if FBtnArray[i].Caption = '  ' then
        FBtnArray[i].Enabled := False;
    end;
  end
  else
  begin
    DisableAllBtn;
    FBtnArray[5].Enabled := True;
    FBtnArray[5].Caption := 'Unlock' + #13#10 + 'Screen';
  end;
end;

procedure TfrmPTK.GenerateNames;
var
  i : Integer;
begin
  FBtnMainNames[0] := 'SysCtrl';
  FBtnMainNames[1] := 'LocalCtrl';
  FBtnMainNames[2] := 'CtrlGun';
  FBtnMainNames[3] := 'Video';
  FBtnMainNames[4] := 'DataRecord';
  FBtnMainNames[5] := 'LockScreen';
  FBtnMainNames[6] := 'NavSetting';
  FBtnMainNames[7] := 'WeatherSetting';
  FBtnMainNames[8] := 'CalSetting';
  FBtnMainNames[27] := 'ZeroFlyOff';

  for i := 9 to Length(FBtnMainNames)-1 do
  begin
    if i <> 27 then
      FBtnMainNames[i] := IntToStr(i);
  end;

  FBtnNumNames[0] := 'NE';
  FBtnNumNames[1] := 'NW';
  FBtnNumNames[2] := 'NS';
  FBtnNumNames[3] := 'NN';
  FBtnNumNames[4] := '4';
  FBtnNumNames[5] := '5';
  FBtnNumNames[6] := 'N1';
  FBtnNumNames[7] := 'N2';
  FBtnNumNames[8] := 'N3';
  FBtnNumNames[9] := 'NDot';
  FBtnNumNames[10] := 'NUp';
  FBtnNumNames[11] := 'NBackspace';
  FBtnNumNames[12] := 'N4';
  FBtnNumNames[13] := 'N5';
  FBtnNumNames[14] := 'N6';
  FBtnNumNames[15] := 'NPlus';
  FBtnNumNames[16] := 'NDown';
  FBtnNumNames[17] := 'NDel';
  FBtnNumNames[18] := 'N7';
  FBtnNumNames[19] := 'N8';
  FBtnNumNames[20] := 'N9';
  FBtnNumNames[21] := 'NMinus';
  FBtnNumNames[22] := 'NEnter';
  FBtnNumNames[23] := '23';
  FBtnNumNames[24] := 'NLeft';
  FBtnNumNames[25] := 'N0';
  FBtnNumNames[26] := 'NRight';
  FBtnNumNames[27] := '27';
  FBtnNumNames[28] := 'NCancel';
  FBtnNumNames[29] := 'NConfirm';
end;

procedure TfrmPTK.GenerateSysCtrlMenu;
var
  i: Integer;
begin
  FBtnArray[0].Caption := 'SYS CTRL'    + #13#10;
  FBtnArray[1].Caption := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := 'Ctrl'  + #13#10 + 'Gun';
  FBtnArray[3].Caption := 'Video'  + #13#10;
  FBtnArray[4].Caption := 'Data' + #13#10 + 'Record';
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
  FBtnArray[6].Caption := 'NAV'  + #13#10 + 'Setting';
  FBtnArray[7].Caption := 'Weather'    + #13#10 + 'Setting';
  FBtnArray[8].Caption := 'CAL' + #13#10 + 'Setting';
  FBtnArray[9].Caption := '  ';
  FBtnArray[10].Caption := '  ';
  FBtnArray[11].Caption := '  ';
  FBtnArray[12].Caption := '  ';
  FBtnArray[13].Caption := '  ';
  FBtnArray[14].Caption := '  ';
  FBtnArray[15].Caption := '  ';
  FBtnArray[16].Caption := '  ';
  FBtnArray[17].Caption := '  ';
  FBtnArray[18].Caption := '  ';
  FBtnArray[19].Caption := '  ';
  FBtnArray[20].Caption := '  ';
  FBtnArray[21].Caption := '  ';
  FBtnArray[22].Caption := '  ';
  FBtnArray[23].Caption := '  ';
  FBtnArray[24].Caption := '  ';
  FBtnArray[25].Caption := '  ';
  FBtnArray[26].Caption := '  ';
  FBtnArray[27].Caption := 'Zero Fly'  + #13#10 + 'Off';
  FBtnArray[28].Caption := '  ';
  FBtnArray[29].Caption := '  ';

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_SysCtrl';
  FBtnArray[1].Name := 'btn_LocalCtrl';
  FBtnArray[2].Name := 'btn_CtrlGun';
  FBtnArray[3].Name := 'btn_Video';
  FBtnArray[4].Name := 'btn_DataRecord';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_NavSetting';
  FBtnArray[7].Name := 'btn_WeatherSetting';
  FBtnArray[8].Name := 'btn_CalSetting';
  FBtnArray[9].Name := 'btn_9';
  FBtnArray[10].Name := 'btn_10';
  FBtnArray[11].Name := 'btn_11';
  FBtnArray[12].Name := 'btn_12';
  FBtnArray[13].Name := 'btn_13';
  FBtnArray[14].Name := 'btn_14';
  FBtnArray[15].Name := 'btn_15';
  FBtnArray[16].Name := 'btn_16';
  FBtnArray[17].Name := 'btn_17';
  FBtnArray[18].Name := 'btn_18';
  FBtnArray[19].Name := 'btn_19';
  FBtnArray[20].Name := 'btn_20';
  FBtnArray[21].Name := 'btn_21';
  FBtnArray[22].Name := 'btn_22';
  FBtnArray[23].Name := 'btn_23';
  FBtnArray[24].Name := 'btn_24';
  FBtnArray[25].Name := 'btn_25';
  FBtnArray[26].Name := 'btn_26';
  FBtnArray[27].Name := 'btn_ZeroFlyOff';
  FBtnArray[28].Name := 'btn_28';
  FBtnArray[29].Name := 'btn_29';
end;

procedure TfrmPTK.GenerateVideoMenu;
var
  i: Integer;
begin
  FBtnArray[0].Caption := 'SYS CTRL'    + #13#10;
  FBtnArray[1].Caption := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := 'Ctrl'  + #13#10 + 'Gun';
  FBtnArray[3].Caption := 'Video'  + #13#10;
  FBtnArray[4].Caption := 'Data' + #13#10 + 'Record';
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
  FBtnArray[6].Caption := '  ';
  FBtnArray[7].Caption := '  ';
  FBtnArray[8].Caption := '  ';
  FBtnArray[9].Caption := 'TV' + #13#10;
  FBtnArray[10].Caption := 'IR' + #13#10;
  FBtnArray[11].Caption := '  ';
  FBtnArray[12].Caption := 'Bright' + #13#10 + '+';
  FBtnArray[13].Caption := 'Bright' + #13#10 + '-';
  FBtnArray[14].Caption := 'Contrast' + #13#10 + '+';
  FBtnArray[15].Caption := 'Contrast' + #13#10 + '-';
  FBtnArray[16].Caption := 'Gain' + #13#10 + '+';
  FBtnArray[17].Caption := 'Gain' + #13#10 + '-';
  FBtnArray[18].Caption := '  ';
  FBtnArray[19].Caption := '  ';
  FBtnArray[20].Caption := '  ';
  FBtnArray[21].Caption := '  ';
  FBtnArray[22].Caption := '  ';
  FBtnArray[23].Caption := '  ';
  FBtnArray[24].Caption := '  ';
  FBtnArray[25].Caption := '  ';
  FBtnArray[26].Caption := '  ';
  FBtnArray[27].Caption := '  ';
  FBtnArray[28].Caption := '  ';
  FBtnArray[29].Caption := '  ';

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_SysCtrl';
  FBtnArray[1].Name := 'btn_LocalCtrl';
  FBtnArray[2].Name := 'btn_CtrlGun';
  FBtnArray[3].Name := 'btn_Video';
  FBtnArray[4].Name := 'btn_DataRecord';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_6';
  FBtnArray[7].Name := 'btn_7';
  FBtnArray[8].Name := 'btn_8';
  FBtnArray[9].Name := 'btn_Tv';
  FBtnArray[10].Name := 'btn_Ir';
  FBtnArray[11].Name := 'btn_11';
  FBtnArray[12].Name := 'btn_BrightPlus';
  FBtnArray[13].Name := 'btn_BrightMin';
  FBtnArray[14].Name := 'btn_ContrastPlus';
  FBtnArray[15].Name := 'btn_ContrastMin';
  FBtnArray[16].Name := 'btn_GainPlus';
  FBtnArray[17].Name := 'btn_GainMin';
  FBtnArray[18].Name := 'btn_18';
  FBtnArray[19].Name := 'btn_19';
  FBtnArray[20].Name := 'btn_20';
  FBtnArray[21].Name := 'btn_21';
  FBtnArray[22].Name := 'btn_22';
  FBtnArray[23].Name := 'btn_23';
  FBtnArray[24].Name := 'btn_24';
  FBtnArray[25].Name := 'btn_25';
  FBtnArray[26].Name := 'btn_26';
  FBtnArray[27].Name := 'btn_27';
  FBtnArray[28].Name := 'btn_28';
  FBtnArray[29].Name := 'btn_29';
end;

procedure TfrmPTK.InitButtons;
var
  i, j,k : Integer;
  aTopInc : Integer;
begin
  GenerateCaption;
  GenerateNames;
  aTopInc := 0;
  j := 0;
  k := 0;

  pnlPTK := TPanel.Create(nil);
  pnlPTK.Parent := Self;
  pnlPTK.Align := alClient;
  for i := 0 to Length(FBtnArray) - 1 do
  begin
    btn             := TSpeedButtonImage.Create(nil);
    btn.Parent      := pnlPTK;
    btn.Width       := Btn_Width;
    btn.Height      := Btn_Height;
    btn.Color       := clBlack;
    btn.Font.Color  := CL_TCMS_Orange;
    btn.Font.Size   := FFont_Btn;
    btn.Name        := 'btn_' + FBtnMainNames[i];
    btn.Caption     := FBtnMainCaption[i];
    btn.OnClick     := btnPtkClick;
    btn.Tag         := i;
    btn.Left        := Btn_Separator + k * (Btn_Width + Btn_Separator);
    btn.Top         := Btn_Separator + aTopInc;
    FBtnArray[i]    := btn;
    k := k + 1;

    if ((i + 1)mod 6) = 0 then begin
      j := j + 1;
      aTopInc := j * (Btn_Height + Btn_Separator);
      k := 0;
    end;
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;
//  FBtnArray[0].GroupIndex := 1;
//  FBtnArray[1].GroupIndex := 1;
//  FBtnArray[0].Down := True;
  FBtnArray[0].Color := clLime;
  FBtnArray[1].Color := clBlack;
  aTopInc := 0;
  j := 0;
  k := 0;
  pnlNumKey := TPanel.Create(nil);
  pnlNumKey.Parent := Self;
  pnlNumKey.ParentBackground := False;
  pnlNumKey.Align := alClient;
  pnlNumKey.Color := clMedGray;
   for i := 0 to Length(FBtnArrayNumKey) - 1 do
  begin
    btn             := TSpeedButtonImage.Create(nil);
    btn.Parent      := pnlNumKey;
    btn.Width       := Btn_Width;
    btn.Height      := Btn_Height;
    btn.Color       := clSkyBlue;
    btn.Font.Color  := clTeal;
    btn.Font.Size   := FFont_Btn;
    btn.Font.Style := [fsBold];
    btn.Name        := 'btn_' + FBtnNumNames[i];
    btn.Caption     := FBtnNumCaption[i];
    btn.OnClick     := btnNkClick;
    btn.Tag         := i;
    btn.Left        := Btn_Separator + k * (Btn_Width + Btn_Separator);
    btn.Top         := Btn_Separator + aTopInc;
    FBtnArrayNumKey[i]    := btn;
    k := k + 1;

    if ((i + 1)mod 6) = 0 then begin
      j := j + 1;
      aTopInc := j * (Btn_Height + Btn_Separator);
      k := 0;
    end;
    if AnsiContainsStr(FBtnArrayNumKey[i].Caption, '  ') then begin
      FBtnArrayNumKey[i].Enabled := False;
    end;
  end;

  pnlPTK.BringToFront;
end;

procedure TfrmPTK.OnTimerConnectOnTime(const dt: Double);
begin
  if Assigned(FSocketTCPClient) then
  begin
    if not (FSocketTCPClient.State in [wsConnecting, wsConnected]) then
    begin
      FSocketTCPClient.Port := FPortConnect;
      FSocketTCPClient.Addr := FipConnect;
      FSocketTCPClient.LineMode := True;
//      FSocketTCPClient.LineEdit := True;
      FSocketTCPClient.LineEnd := #10#13;
      FSocketTCPClient.OnSessionConnected:= SocketClientSessionConnected;
      FSocketTCPClient.OnSessionClosed := SocketClientSessionClosed;
      FSocketTCPClient.OnDataAvailable := SocketClientDataAvailable;
      FSocketTCPClient.Connect;
      FTimerConnect.Enabled := False;
    end;

//    if FSocketTCPClient.State = wsConnected then
//    begin
//      ShowMessage('Socket Connected');
//      FTimerConnect.Enabled := False;
//    end;
  end;
end;

procedure TfrmPTK.ProcessCommand(Cmd: String);
begin

end;

procedure TfrmPTK.SendToServerPTK(str: string);
begin
  if Assigned(FSocketTCPClient) then
  begin
    if FSocketTCPClient.State = wsConnected then
    begin
      FSocketTCPClient.SendLine(str + #13#10);
    end;
  end;
end;

procedure TfrmPTK.SetOperationModeDisplay;
begin
  case FOperationMode of
    omWait:
    begin
      FBtnArray[15].Color := clLime;
      FBtnArray[16].Color := clBlack;
      FBtnArray[17].Color := clBlack;
      FBtnArray[21].Color := clBlack;
      FBtnArray[22].Color := clBlack;
    end;
    omInd:
    begin
      FBtnArray[15].Color := clBlack;
      FBtnArray[16].Color := clLime;
      FBtnArray[17].Color := clBlack;
      FBtnArray[21].Color := clBlack;
      FBtnArray[22].Color := clBlack;
    end;
    omAutonomous:
    begin
      FBtnArray[15].Color := clBlack;
      FBtnArray[16].Color := clBlack;
      FBtnArray[17].Color := clLime;
      FBtnArray[21].Color := clBlack;
      FBtnArray[22].Color := clBlack;
    end;
    omDAttack:
    begin
      FBtnArray[15].Color := clBlack;
      FBtnArray[16].Color := clBlack;
      FBtnArray[17].Color := clBlack;
      FBtnArray[21].Color := clLime;
      FBtnArray[22].Color := clBlack;
    end;
    omVFire:
    begin
      FBtnArray[15].Color := clBlack;
      FBtnArray[16].Color := clBlack;
      FBtnArray[17].Color := clBlack;
      FBtnArray[21].Color := clBlack;
      FBtnArray[22].Color := clLime;
    end;
  end;
end;

procedure TfrmPTK.SetRole(Msg: String);
begin

end;

procedure TfrmPTK.SocketClientDataAvailable(Sender: TObject; ErrCode: Word);
var
  s: string;
begin
  s:= FSocketTCPClient.ReceiveStr;
end;

procedure TfrmPTK.SocketClientSessionConnected(Sender: TObject; ErrCode: Word);
begin
  FTimerConnect.Enabled := False;
//  ShowMessage('Socket Connected');
end;

procedure TfrmPTK.SocketClientSessionClosed(Sender: TObject; ErrCode: Word);
begin
  FTimerConnect.Enabled := True;
//  ShowMessage('Socket Disconnected');
end;

end.
