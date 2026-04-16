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
    // PTK MR 35
    FisCombatMenu, FisLocalMenu, FisCheck, FisLockScreen : Boolean;  // boolean penanda dimana menu berada
    FisAngleError, FisSBW, FisManualFrequency, FisStaticTarget, FisLSStop, FisTVReset, FisComplex, FisBlackTarget,
    FisCenter, FisManualZoom, FisManualSearch, FisSurface, FisAir, FisShore :Boolean;


    // PTK eo tracker
    FFrequencyHZMode, FisCheckMode : Byte;
    FisIRAuto, FisIROn, FisTVBlack, FisIRBlack, FisBlack, FisIRWFOV, FisCentroid, FisAutomatic : Boolean;
    FisShutterAuto, FisEOOn, FisTVAxesAdjust, FisIRAxesAdjust, FisIndSetting, FisAngleCorrection : Boolean;

    FisServoOn, FisCoordinationControl, FisHighFR, FisMiddleFR, FisLowFR : Boolean;

    procedure GenerateCaption;
    procedure GenerateNames;

    procedure addToLog(str : string);
    procedure SendToServerPTK(str : string);

    { All Event Button in PTK }
    procedure btnPtkClick(Sender : TObject);
    procedure btnPtkMouseEnter(Sender : TObject);
    procedure btnPtkMouseLeave(Sender : TObject);
    procedure btnGreen(ButtonNo : Integer);
    procedure btnWhite(ButtonNo : Integer);
    procedure btnBlack(ButtonNo : Integer);
    procedure btnNkClick(Sender : TObject);

    procedure GenerateCaptionByMenu(aMenu : string);
    // eo tracker
    procedure GenerateEOCtrlMenu;
    procedure GenerateMainMenu;
//    procedure GenerateCheckMenu;

    // mr 35
    procedure GenerateLocalMenu;
    procedure GenerateSystemMenu;
    procedure GenerateCheckMenu;
    procedure GenerateLocalMenuColor;
    procedure GenerateSystemMenuColor;
    procedure generateCheckMenuColor;

    // ptk fcc
    procedure GenerateSysCtrlMenu;
    procedure GenerateLocalCtrlMenu;
    procedure GenerateCombatMenu;
//    procedure GenerateCheckMenu;
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

procedure TfrmPTK.btnBlack(ButtonNo: Integer);
begin
  FBtnArray[ButtonNo].Color :=clBlack;
  FBtnArray[ButtonNo].Font.Color := clWhite;
end;

procedure TfrmPTK.btnGreen(ButtonNo: Integer);
begin
  FBtnArray[ButtonNo].Color := clLime;
  FBtnArray[ButtonNo].Font.Color := clBlack;
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
//  for i := 2 to Length(FBtnArray) - 1 do
//  begin
//    FBtnArray[i].Color := clBlack;
//
//  end;

  if (TSpeedButtonImage(Sender).Name <> 'btn_Back') and
    (TSpeedButtonImage(Sender).Name <> 'btn_Check') and
    (TSpeedButtonImage(Sender).Name <> 'btn_EOControl') then
  begin
    if FisCombatMenu then
    begin


    end

    else if FisCheck then
    begin


    end

    else
    begin
      for i := 0 to Length(FBtnArray) - 1 do
      begin
        FBtnArray[i].Color := clBlack;
      end;
//      FBtnArray[0].Color := clLime;
    end;
  end;

  if TSpeedButtonImage(Sender).Name = 'btn_Local' then
  begin
    FisLocalMenu := not FisLocalMenu;
    FisCheck := False;
//    FisCombatMenu := False;

  if FisLocalMenu then
    GenerateCaptionByMenu('Local')
  else  GenerateCaptionByMenu('System');
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_Combat' then
  begin
    FisCheck := False;
    FisCombatMenu := True;

    if FisLocalMenu then
      GenerateCaptionByMenu('Local')
    else  GenerateCaptionByMenu('System');
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_Check' then
  begin
    FisCheck := True;
    FisCombatMenu := False;
    GenerateCaptionByMenu('Check');
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_SBW' then
  begin
    FisSBW := not FisSBW;
    if FisSBW then
    begin
      FBtnArray[4].Caption := 'SBW' + #13#10;
      btnGreen(4);
    end
    else
    begin
      FBtnArray[4].Caption := 'FBW' + #13#10;
      btnBlack(4);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_Surface' then
  begin
    FisSurface := True;
    if FisSurface then
    begin
      FBtnArray[6].Caption := 'Surface' + #13#10;
      FisSurface := True;
      FisAir := false;
      FisShore := False;
      btnGreen(6);
      btnBlack(11);
      btnBlack(12);
    end
    else
    begin
      FBtnArray[6].Caption := 'Surface' + #13#10;
      FisSurface := False;
      FisAir := false;
      FisShore := False;
      btnBlack(6);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_Shore' then
  begin
    FisShore := True;
    if FisShore then
    begin
      FBtnArray[11].Caption := 'Shore' + #13#10;
      FisSurface := False;
      FisAir := false;
      FisShore := True;
      btnGreen(11);
      btnBlack(6);
      btnBlack(12);
    end
    else
    begin
      FBtnArray[11].Caption := 'Shore' + #13#10;
      FisSurface := False;
      FisAir := false;
      FisShore := False;
      btnBlack(11);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_AIR' then
  begin
    FisAir := True;
    if FisAir then
    begin
      FBtnArray[12].Caption := 'AIR' + #13#10;
      FisSurface := False;
      FisAir := True;
      FisShore := false;
      btnGreen(12);
      btnBlack(6);
      btnBlack(11);
    end
    else
    begin
      FBtnArray[12].Caption := 'AIR' + #13#10;
      FisSurface := False;
      FisAir := false;
      FisShore := False;
      btnBlack(12);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_ManualFrequency' then
  begin
    FisManualFrequency := not FisManualFrequency;
    if FisManualFrequency then
    begin
      FBtnArray[7].Caption := 'Manual' + #13#10 + 'Frequency';
      btnGreen(7);
    end
    else
    begin
      FBtnArray[7].Caption := 'Auto' + #13#10 + 'Frequency';
      btnBlack(7);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_StaticTarget' then
  begin
    FisStaticTarget := False;
    FBtnArray[8].Caption := 'Moving' + #13#10 + 'Target';
    FBtnArray[8].Name := 'btn_MovingTarget';
    btnBlack(8);
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_MovingTarget' then
  begin
    FisStaticTarget := True;
    FBtnArray[8].Caption := 'Static' + #13#10 + 'Target';
    FBtnArray[8].Name := 'btn_StaticTarget';
    btnGreen(8);
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_AngleError' then
  begin
    FisAngleError := not FisAngleError;
    if FisAngleError then
    begin
      FBtnArray[9].Caption := 'Angle' + #13#10 + 'Error';
      btnGreen(9);
    end
    else
    begin
      FBtnArray[9].Caption := 'Deviation' + #13#10;
      btnBlack(9);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_ManualZoom' then
  begin
    FisManualZoom := not FisManualZoom;
    if FisManualZoom then
    begin
      FBtnArray[10].Caption := 'Manual' + #13#10 + 'Zoom';
      btnGreen(10);
    end
    else
    begin
      FBtnArray[10].Caption := 'Auto' + #13#10 + 'Zoom';
      btnBlack(10);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_Center' then
  begin
    FisCenter := not FisCenter;
    if FisCenter then
    begin
      FBtnArray[15].Caption := 'Center' + #13#10;
      btnGreen(15);
    end
    else
    begin
      FBtnArray[15].Caption := 'Correlate' + #13#10;
      btnBlack(15);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_TVReset' then
  begin
    FisTVReset := not FisTVReset;
    if FisTVReset then
    begin
      FBtnArray[21].Caption := 'TV'  + #13#10 + 'Reset';
      btnGreen(21);
    end
    else
    begin
      FBtnArray[21].Caption := 'TV'  + #13#10 + 'Run';
      btnBlack(21);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_ComplexBackground' then
  begin
    FisComplex := not FisComplex;
    if FisComplex then
    begin
      FBtnArray[22].Caption := 'Complex'  + #13#10 + 'Background';
      btnGreen(22);
    end
    else
    begin
      FBtnArray[22].Caption := 'Simple'  + #13#10 + 'Background';
      btnBlack(22);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_BlackTarget' then
  begin
    FisBlackTarget := not FisBlackTarget;
    if FisBlackTarget then
    begin
      FBtnArray[23].Caption := 'Black'  + #13#10 + 'Target';
      btnGreen(23);
    end
    else
    begin
      FBtnArray[23].Caption := 'White'  + #13#10 + 'Target';
      btnBlack(23);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_ManualSearch' then
  begin
    FisManualSearch := false;
    FBtnArray[25].Caption := 'Auto' + #13#10 + 'Search';
    FBtnArray[25].Name := 'btn_AutoSearch';
    btnBlack(25);
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_AutoSearch' then
  begin
    FisManualSearch := true;
    FBtnArray[25].Caption := 'Manual' + #13#10 + 'Search';
    FBtnArray[25].Name := 'btn_ManualSearch';
    btnGreen(25);
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_LSStop' then
  begin
    FisLSStop := not FisLSStop;
    if FisLSStop then
    begin
      FBtnArray[28].Caption := 'LS'  + #13#10 + 'Stop';
      btnBlack(28);
    end
    else
    begin
      FBtnArray[28].Caption := 'LS'  + #13#10 + 'Launch';
      btnGreen(28);
    end;
  end

  else if TSpeedButtonImage(Sender).Name = 'btn_LockScreen' then
  begin
    GenerateCaptionByMenu('LockScreen');
  end;

  SendToServerPTK(TSpeedButtonImage(Sender).Name);
end;

procedure TfrmPTK.btnPtkMouseEnter(Sender: TObject);
begin
  TSpeedButtonImage(Sender).Font.Color := clBlack;
end;

procedure TfrmPTK.btnPtkMouseLeave(Sender: TObject);
begin
  TSpeedButtonImage(Sender).Font.Color := clWhite;
end;

procedure TfrmPTK.btnWhite(ButtonNo: Integer);
begin
  FBtnArray[ButtonNo].Color :=clWhite;
  FBtnArray[ButtonNo].Font.Color := clBlack;
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

//  FisCombatMenu, FisLocalMenu, FisCheck, FisLockScreen : Boolean;  // boolean penanda dimana menu berada
//    FisAngleError, FisSBW, FisManualFrequency, FisStaticTarget, FisLSStop, FisTVReset, FisComplex, FisBlackTarget,
//    FisCenter, FisManualZoom :Boolean;

  FisCombatMenu := True;
  FisLocalMenu := True;
  FisCheck := false;
  FisLockScreen := False;
  FisAngleError := True;
  FisSBW := True;
  FisManualFrequency := True;
  Fisstatictarget :=  True;
  FisLSStop := True;
  FisTVReset := True;
  FisComplex := True;
  FisBlackTarget := True;
  FisCenter := True;
  FisManualZoom := true;
  FisManualSearch := True;
  FisSurface := True;
  FisAir := false;
  FisShore := False;

  GenerateLocalMenuColor;
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
  for i := 0 to Length(FBtnArray)-1 do
  begin
    FBtnMainCaption[i] := '  ';
  end;

  FBtnMainCaption[0] := 'Combat' + #13#10;
  FBtnMainCaption[1] := 'Check'  + #13#10;
  FBtnMainCaption[3] := 'TRAINING'  + #13#10;
  FBtnMainCaption[4] := 'SBW'  + #13#10;
  FBtnMainCaption[5] := 'Lock' + #13#10 + 'Screen';
  FBtnMainCaption[6] := 'Surface'  + #13#10;
  FBtnMainCaption[7] := 'Manual'  + #13#10 + 'Frequency';
  FBtnMainCaption[8] := 'Static'  + #13#10 + 'Target';
  FBtnMainCaption[9] := 'Angle'  + #13#10 + 'Error';
  FBtnMainCaption[10] := 'Manual'    + #13#10 + 'Zoom';
  FBtnMainCaption[11] := 'Shore' + #13#10 ;
  FBtnMainCaption[12] := 'AIR'  + #13#10;
  FBtnMainCaption[13] := 'Frequency'  + #13#10 + 'Add';
  FBtnMainCaption[14] := 'Frequency'  + #13#10 + 'Dec';
  FBtnMainCaption[15] := 'Center'  + #13#10 ;
  FBtnMainCaption[16] := 'T'  + #13#10 ;
  FBtnMainCaption[17] := 'W'  + #13#10 ;
  FBtnMainCaption[18] := 'Low'  + #13#10 + 'AIR';
  FBtnMainCaption[19] := 'Gain'  + #13#10 + 'add';
  FBtnMainCaption[20] := 'Gain'  + #13#10 + 'dec';
  FBtnMainCaption[21] := 'TV'  + #13#10 + 'Reset';
  FBtnMainCaption[22] := 'Complex'  + #13#10 + 'Background';
  FBtnMainCaption[23] := 'Black'  + #13#10 + 'Target';
  FBtnMainCaption[24] := 'Local'  + #13#10 ;
  FBtnMainCaption[25] := 'Manual'  + #13#10 + 'Search';
  FBtnMainCaption[26] := 'Radar'  + #13#10 + 'Trace';
  FBtnMainCaption[27] := 'TV'  + #13#10 + 'Trace';
  FBtnMainCaption[28] := 'LS'  + #13#10 + 'Stop';
  FBtnMainCaption[29] := 'Multiple'  + #13#10 + 'Track';

//  for i := 9 to Length(FBtnArray)-1 do
//  begin
//    if i <> 27 then
//      FBtnMainCaption[i] := '  ';
//  end;

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
  // ptk mr35
  if aMenu = 'Local' then
  begin
    GenerateLocalMenu;
  end
  else if aMenu = 'System' then
  begin
    GenerateSystemMenu;
  end
  else if aMenu = 'Check' then
  begin
    GenerateCheckMenu;
  end;

  if aMenu = 'LockScreen' then
  begin
    GenerateLockScreenMenu;
    FisScreenLocked := not FisScreenLocked;
  end;


  // ptk fcc
  if aMenu = 'EOControl' then
  begin
    GenerateEOCtrlMenu;
  end
  else if aMenu = 'MainMenu' then
  begin
    GenerateMainMenu;
  end
  else if aMenu = 'SysCtrl' then
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


end;

procedure TfrmPTK.GenerateCheckMenu;
var
  i: Integer;
begin
  for i := 0 to Length(FBtnArray) - 1 do
  begin

      FBtnArray[i].Caption := '  ';
      FBtnArray[i].Name := 'btn_' + i.ToString;
  end;
  FBtnArray[0].Caption := 'Combat'    + #13#10;
  FBtnArray[1].Caption := 'Check'  + #13#10;
  FBtnArray[4].Caption := 'SBW'  + #13#10;
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
  FBtnArray[6].Caption := 'Receive' + #13#10 + 'Check';
  FBtnArray[7].Caption := 'Transmit' + #13#10 + 'Check';
  FBtnArray[8].Caption := 'Servo' + #13#10 + 'Check';
  FBtnArray[9].Caption := 'Set' + #13#10 + 'Zero';
  FBtnArray[11].Caption := 'Change' + #13#10 + 'Password';
  FBtnArray[12].Caption := 'Frequency' + #13#10 + 'Add';
  FBtnArray[13].Caption := 'Frequency' + #13#10 + 'Dec';
  FBtnArray[14].Caption := 'Bite' + #13#10;
  FBtnArray[15].Caption := 'Laser' + #13#10 + 'Self-Check';
  FBtnArray[17].Caption := 'Sub-System' + #13#10 + 'Reset';
  FBtnArray[18].Caption := 'Record' + #13#10 + 'End';

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_Combat';
  FBtnArray[1].Name := 'btn_Check';
  FBtnArray[4].Name := 'btn_SBW';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_ReceiveCheck';
  FBtnArray[7].Name := 'btn_TransmitCheck';
  FBtnArray[8].Name := 'btn_ServoCheck';
  FBtnArray[9].Name := 'btn_SetZero';
  FBtnArray[11].Name := 'btn_ChangePassword';
  FBtnArray[12].Name := 'btn_FrequencyAdd';
  FBtnArray[13].Name := 'btn_FrequencyDec';
  FBtnArray[14].Name := 'btn_Bite';
  FBtnArray[15].Name := 'btn_LaserSelfCheck';
  FBtnArray[17].Name := 'btn_SubSystemReset';
  FBtnArray[18].Name := 'btn_RecordEnd';

  generateCheckMenuColor;
end;

procedure TfrmPTK.generateCheckMenuColor;
var
i : Integer;
begin
  btnWhite(1);
  btnBlack(0);

  for i := 2 to Length(FBtnArray) - 1 do
  begin
    btnBlack(i);
  end;

  if FisSBW then
  begin
    FBtnArray[4].Caption := 'SBW'  + #13#10;
    btnGreen(4);
  end
  else begin
    FBtnArray[4].Caption := 'FBW'  + #13#10;
    btnBlack(4);
  end;
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
  for i := 0 to Length(FBtnArray) - 1 do
  begin

      FBtnArray[i].Caption := '  ';
  end;
  FBtnArray[0].Caption := 'SYS CTRL'    + #13#10;
  FBtnArray[1].Caption := 'LOCAL'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := 'Ctrl'  + #13#10 + 'Gun';
  FBtnArray[3].Caption := 'Video'  + #13#10;
  FBtnArray[4].Caption := 'Data' + #13#10 + 'Record';
  FBtnArray[5].Caption := 'Lock'  + #13#10 + 'Screen';
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

procedure TfrmPTK.GenerateEOCtrlMenu;
var
  i: Integer;
begin
 for i := 0 to Length(FBtnArray) - 1 do
  begin

      FBtnArray[i].Caption := '  ';
      FBtnArray[i].Name := 'btn_' + i.ToString;
  end;
  FBtnArray[0].Caption := 'Shutter +'    + #13#10;
  FBtnArray[1].Caption := 'Shutter -'  + #13#10;
  FBtnArray[2].Caption := 'Shutter Auto'  + #13#10;
  FBtnArray[3].Caption := 'EO ON'  + #13#10;
  FBtnArray[4].Caption := 'Gain +' + #13#10;
  FBtnArray[5].Caption := 'Gain -'  + #13#10;
  FBtnArray[6].Caption := 'Deflection +' + #13#10;
  FBtnArray[7].Caption := 'Deflection -' + #13#10;
  FBtnArray[8].Caption := 'IR Focus +' + #13#10;
  FBtnArray[9].Caption := 'IR Focus -' + #13#10;
  FBtnArray[10].Caption := 'TV Axes Adjust' + #13#10;
  FBtnArray[11].Caption := 'IR Axes Adjust' + #13#10;
  FBtnArray[12].Caption := 'Azimuth +' + #13#10;
  FBtnArray[13].Caption := 'Azimuth -' + #13#10;
  FBtnArray[14].Caption := 'Elevation +' + #13#10;
  FBtnArray[15].Caption := 'Elevation -' + #13#10;
  FBtnArray[16].Caption := 'Calibrate' + #13#10;
  FBtnArray[17].Caption := 'Ind Setting' + #13#10;
  FBtnArray[18].Caption := 'Angle Correction' + #13#10;
  FBtnArray[29].Caption := 'Back' + #13#10;

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_ShutterPlus';
  FBtnArray[1].Name := 'btn_ShutterMinus';
  FBtnArray[2].Name := 'btn_ShutterAuto';
  FBtnArray[3].Name := 'btn_EOON';
  FBtnArray[4].Name := 'btn_GainPlus';
  FBtnArray[5].Name := 'btn_GainMinus';
  FBtnArray[6].Name := 'btn_DeflectionPlus';
  FBtnArray[7].Name := 'btn_DeflectionMinus';
  FBtnArray[8].Name := 'btn_IRFocusPlus';
  FBtnArray[9].Name := 'btn_IRFocusMinus';
  FBtnArray[10].Name := 'btn_TVAxesAdjust';
  FBtnArray[11].Name := 'btn_IRAxesAdjust';
  FBtnArray[12].Name := 'btn_AzimuthPlus';
  FBtnArray[13].Name := 'btn_AzimuthMinus';
  FBtnArray[14].Name := 'btn_ElevationPlus';
  FBtnArray[15].Name := 'btn_ElevationMinus';
  FBtnArray[16].Name := 'btn_Calibrate';
  FBtnArray[17].Name := 'btn_IndStting';
  FBtnArray[18].Name := 'btn_AngleCorrection';
  FBtnArray[29].Name := 'btn_Back';
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

procedure TfrmPTK.GenerateLocalMenu;
var
i : Integer;
begin
  for i := 0 to Length(FBtnArray) - 1 do
  begin

      FBtnArray[i].Caption := '  ';
      FBtnArray[i].Name := 'btn_' + i.ToString;
  end;

  FBtnArray[0].Caption := 'Combat' + #13#10;
  FBtnArray[1].Caption := 'Check'  + #13#10;
  FBtnArray[3].Caption := 'TRAINING'  + #13#10;
  FBtnArray[4].Caption := 'SBW'  + #13#10;
  FBtnArray[5].Caption := 'Lock' + #13#10 + 'Screen';
  FBtnArray[6].Caption := 'Surface'  + #13#10;
  FBtnArray[7].Caption := 'Manual'  + #13#10 + 'Frequency';
  FBtnArray[8].Caption := 'Static'  + #13#10 + 'Target';
  FBtnArray[9].Caption := 'Angle'  + #13#10 + 'Error';
  FBtnArray[10].Caption := 'Manual'    + #13#10 + 'Zoom';
  FBtnArray[11].Caption := 'Shore' + #13#10 ;
  FBtnArray[12].Caption := 'AIR'  + #13#10;
  FBtnArray[13].Caption := 'Frequency'  + #13#10 + 'Add';
  FBtnArray[14].Caption := 'Frequency'  + #13#10 + 'Dec';
  FBtnArray[15].Caption := 'Center'  + #13#10 ;
  FBtnArray[16].Caption := 'T'  + #13#10 ;
  FBtnArray[17].Caption := 'W'  + #13#10 ;
  FBtnArray[18].Caption := 'Low'  + #13#10 + 'AIR';
  FBtnArray[19].Caption := 'Gain'  + #13#10 + 'add';
  FBtnArray[20].Caption := 'Gain'  + #13#10 + 'dec';
  FBtnArray[21].Caption := 'TV'  + #13#10 + 'Reset';
  FBtnArray[22].Caption := 'Complex'  + #13#10 + 'Background';
  FBtnArray[23].Caption := 'Black'  + #13#10 + 'Target';
  FBtnArray[24].Caption := 'Local'  + #13#10 ;
  FBtnArray[25].Caption := 'Manual'  + #13#10 + 'Search';
  FBtnArray[26].Caption := 'Radar'  + #13#10 + 'Trace';
  FBtnArray[27].Caption := 'TV'  + #13#10 + 'Trace';
  FBtnArray[28].Caption := 'LS'  + #13#10 + 'Stop';
  FBtnArray[29].Caption := 'Multiple'  + #13#10 + 'Track';


  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_Combat';
  FBtnArray[1].Name := 'btn_Check';
  FBtnArray[3].Name := 'btn_TRAINING';
  FBtnArray[4].Name := 'btn_SBW';
  FBtnArray[5].Name := 'btn_LockScreen';
  FBtnArray[6].Name := 'btn_Surface';
  FBtnArray[7].Name := 'btn_ManualFrequency';
  FBtnArray[8].Name := 'btn_StaticTarget';
  FBtnArray[9].Name := 'btn_AngleError';
  FBtnArray[10].Name := 'btn_ManualZoom';
  FBtnArray[11].Name := 'btn_Shore';
  FBtnArray[12].Name := 'btn_AIR';
  FBtnArray[13].Name := 'btn_FrequencyAdd';
  FBtnArray[14].Name := 'btn_FrequencyDec';
  FBtnArray[15].Name := 'btn_Center';
  FBtnArray[16].Name := 'btn_T';
  FBtnArray[17].Name := 'btn_W';
  FBtnArray[18].Name := 'btn_LowAIR';
  FBtnArray[19].Name := 'btn_Gainadd';
  FBtnArray[20].Name := 'btn_Gaindec';
  FBtnArray[21].Name := 'btn_TVReset';
  FBtnArray[22].Name := 'btn_ComplexBackground';
  FBtnArray[23].Name := 'btn_BlackTarget';
  FBtnArray[24].Name := 'btn_Local';
  FBtnArray[25].Name := 'btn_ManualSearch';
  FBtnArray[26].Name := 'btn_RadarTrace';
  FBtnArray[27].Name := 'btn_TVTrace';
  FBtnArray[28].Name := 'btn_LSStop';
  FBtnArray[29].Name := 'btn_MultipleTrack';

  GenerateLocalMenuColor;
end;

procedure TfrmPTK.GenerateLocalMenuColor;
begin
  if FisLocalMenu then
  begin
    btnWhite(0);
    btnBlack(1);

    if FisSBW then
    begin
      FBtnArray[4].Caption := 'SBW'  + #13#10;
      btnGreen(4);
    end
    else begin
      FBtnArray[4].Caption := 'FBW'  + #13#10;
      btnBlack(4);
    end;

    if FisSurface then
    begin
      FBtnArray[6].Caption := 'Surface'  + #13#10;
      btnGreen(6);
    end
    else begin
      FBtnArray[6].Caption := 'Surface'  + #13#10;
      btnBlack(6);
    end;

    if FisManualFrequency then
    begin
      FBtnArray[7].Caption := 'Manual'  + #13#10 + 'Frequency';
      btnGreen(7);
    end
    else begin
      FBtnArray[7].Caption := 'Auto'  + #13#10 + 'Frequency';
      btnBlack(7);
    end;

    if FisStaticTarget then
    begin
      FBtnArray[8].Caption := 'Static'  + #13#10 + 'Target';
      FBtnArray[8].Name := 'btn_StaticTarget';
      btnGreen(8);
    end
    else begin
      FBtnArray[8].Caption := 'Moving'  + #13#10 + 'Target';
      FBtnArray[8].Name := 'btn_MovingTarget';
      btnBlack(8);
    end;

    if FisAngleError then
    begin
      FBtnArray[9].Caption := 'Angle'  + #13#10 + 'Error';
      btnGreen(9);
    end
    else begin
      FBtnArray[9].Caption := 'Deviation'  + #13#10;
      btnBlack(9);
    end;

    if FisManualZoom then
    begin
      FBtnArray[10].Caption := 'Manual'  + #13#10 + 'Zoom';
      btnGreen(10);
    end
    else begin
      FBtnArray[10].Caption := 'Auto'  + #13#10 + 'Zoom';
      btnBlack(10);
    end;

    if FisShore then
    begin
      FBtnArray[11].Caption := 'Shore'  + #13#10;
      btnGreen(11);
    end
    else begin
      FBtnArray[11].Caption := 'Shore'  + #13#10;
      btnBlack(11);
    end;

    if FisAir then
    begin
      FBtnArray[12].Caption := 'AIR'  + #13#10;
      btnGreen(12);
    end
    else begin
      FBtnArray[12].Caption := 'AIR'  + #13#10;
      btnBlack(12);
    end;

    if FisCenter then
    begin
      FBtnArray[15].Caption := 'Center'  + #13#10;
      btnGreen(15);
    end
    else begin
      FBtnArray[15].Caption := 'Correlate'  + #13#10;
      btnBlack(15);
    end;

    if FisTVReset then
    begin
      FBtnArray[21].Caption := 'TV'  + #13#10 + 'Reset';
      btnGreen(21);
    end
    else begin
      FBtnArray[21].Caption := 'TV'  + #13#10 + 'Run';
      btnBlack(21);
    end;

    if FisComplex then
    begin
      FBtnArray[22].Caption := 'Complex'  + #13#10 + 'Background';
      btnGreen(22);
    end
    else begin
      FBtnArray[22].Caption := 'Simple'  + #13#10 + 'Background';
      btnBlack(22);
    end;

    if FisBlackTarget then
    begin
      FBtnArray[23].Caption := 'Black'  + #13#10 + 'Target';
      btnGreen(23);
    end
    else begin
      FBtnArray[23].Caption := 'White'  + #13#10 + 'Target';
      btnBlack(23);
    end;

    if FisManualSearch then
    begin
      FBtnArray[25].Caption := 'Manual'  + #13#10 + 'Search';
      FBtnArray[25].Name := 'btn_ManualSearch';
      btnGreen(25);
    end
    else begin
      FBtnArray[25].Caption := 'Auto'  + #13#10 + 'Search';
      FBtnArray[25].Name := 'btn_AutoSearch';
      btnBlack(25);
    end;

    if FisLSStop then
    begin
      FBtnArray[28].Caption := 'LS'  + #13#10 + 'Stop';
      btnBlack(28);
    end
    else begin
      FBtnArray[28].Caption := 'LS'  + #13#10 + 'Launch';
      btnGreen(28);
    end;
  end;
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

procedure TfrmPTK.GenerateMainMenu;
var
 i : Integer;
begin
  for i := 0 to Length(FBtnArray) - 1 do
  begin

      FBtnArray[i].Caption := '  ';
      FBtnArray[i].Name := 'btn_' + i.ToString;
  end;

  FBtnArray[0].Caption := 'EO Control'    + #13#10;
  FBtnArray[1].Caption := 'Check'  + #13#10;
  FBtnArray[5].Caption := 'To Zero'  + #13#10;
  FBtnArray[6].Caption := 'IR Auto'  + #13#10;
  FBtnArray[7].Caption := '25 HZ' + #13#10 ;
  FBtnArray[8].Caption := 'IR On'  + #13#10;
  FBtnArray[9].Caption := 'Air'  + #13#10;
  FBtnArray[10].Caption := 'Diagnosis'    + #13#10 ;
  FBtnArray[11].Caption := 'TV Black' + #13#10 ;
  FBtnArray[12].Caption := 'IR Black'  + #13#10;
  FBtnArray[13].Caption := 'Black'  + #13#10 ;
  FBtnArray[14].Caption := 'Azimuth +'  + #13#10 ;
  FBtnArray[15].Caption := 'Azimuth -'  + #13#10 ;
  FBtnArray[16].Caption := 'Elevation +'  + #13#10 ;
  FBtnArray[17].Caption := 'Elevation -'  + #13#10 ;
  FBtnArray[18].Caption := 'TVFOV +'  + #13#10 ;
  FBtnArray[19].Caption := 'TVFOV -'  + #13#10 ;
  FBtnArray[20].Caption := 'TV NFOV'  + #13#10 ;
  FBtnArray[21].Caption := 'IR WFOV'  + #13#10 ;
  FBtnArray[22].Caption := 'Centroid'  + #13#10 ;
  FBtnArray[23].Caption := 'Automatic'  + #13#10 ;

  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_EOControl';
  FBtnArray[1].Name := 'btn_Check';
  FBtnArray[5].Name := 'btn_ToZero';
  FBtnArray[6].Name := 'btn_IRAuto';
  FBtnArray[7].Name := 'btn_HZ';
  FBtnArray[8].Name := 'btn_IROn';
  FBtnArray[9].Name := 'btn_Air';
  FBtnArray[10].Name := 'btn_Diagnosis';
  FBtnArray[11].Name := 'btn_TVBlack';
  FBtnArray[12].Name := 'btn_IRBlack';
  FBtnArray[13].Name := 'btn_Black';
  FBtnArray[14].Name := 'btn_AzimuthPlus';
  FBtnArray[15].Name := 'btn_AzimuthMinus';
  FBtnArray[16].Name := 'btn_ElevationPlus';
  FBtnArray[17].Name := 'btn_ElevationMinus';
  FBtnArray[18].Name := 'btn_TVFOVPlus';
  FBtnArray[19].Name := 'btn_TVFOVMinus';
  FBtnArray[20].Name := 'btn_TVNFOV';
  FBtnArray[21].Name := 'btn_IRWFOV';
  FBtnArray[22].Name := 'btn_Centroid';
  FBtnArray[23].Name := 'btn_Automatic';

end;

procedure TfrmPTK.GenerateNames;
var
  i : Integer;
begin
  for i := 0 to Length(FBtnMainNames)-1 do
  begin
     FBtnMainNames[i] := IntToStr(i);
  end;

  FBtnMainNames[0] := 'Combat';
  FBtnMainNames[1] := 'Check';
  FBtnMainNames[3] := 'TRAINING';
  FBtnMainNames[4] := 'SBW';
  FBtnMainNames[5] := 'LockScreen';
  FBtnMainNames[6] := 'Surface';
  FBtnMainNames[7] := 'ManualFrequency';
  FBtnMainNames[8] := 'StaticTarget';
  FBtnMainNames[9] := 'AngleError';
  FBtnMainNames[10] := 'ManualZoom';
  FBtnMainNames[11] := 'Shore';
  FBtnMainNames[12] := 'AIR';
  FBtnMainNames[13] := 'FrequencyAdd';
  FBtnMainNames[14] := 'FrequencyDec';
  FBtnMainNames[15] := 'Center';
  FBtnMainNames[16] := 'T';
  FBtnMainNames[17] := 'W';
  FBtnMainNames[18] := 'LowAIR';
  FBtnMainNames[19] := 'Gainadd';
  FBtnMainNames[20] := 'Gaindec';
  FBtnMainNames[21] := 'TVReset';
  FBtnMainNames[22] := 'ComplexBackground';
  FBtnMainNames[23] := 'BlackTarget';
  FBtnMainNames[24] := 'Local';
  FBtnMainNames[25] := 'ManualSearch';
  FBtnMainNames[26] := 'RadarTrace';
  FBtnMainNames[27] := 'TVTrace';
  FBtnMainNames[28] := 'LSStop';
  FBtnMainNames[29] := 'MultipleTrack';

//  for i := 9 to Length(FBtnMainNames)-1 do
//  begin
//    if i <> 27 then
//      FBtnMainNames[i] := IntToStr(i);
//  end;

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
//  FBtnMainCaption[0] := 'EO Control'    + #13#10;
//  FBtnMainCaption[1] := 'Check'  + #13#10;
//  FBtnMainCaption[5] := 'To Zero'  + #13#10;
//  FBtnMainCaption[6] := 'IR Auto'  + #13#10;
//  FBtnMainCaption[7] := '25 HZ' + #13#10 ;
//  FBtnMainCaption[8] := 'IR On'  + #13#10;
//  FBtnMainCaption[9] := 'Air'  + #13#10;
//  FBtnMainCaption[10] := 'Diagnosis'    + #13#10 ;
//  FBtnMainCaption[11] := 'TV Black' + #13#10 ;
//  FBtnMainCaption[12] := 'IR Black'  + #13#10;
//  FBtnMainCaption[13] := 'Black'  + #13#10 ;
//  FBtnMainCaption[14] := 'Azimuth +'  + #13#10 ;
//  FBtnMainCaption[15] := 'Azimuth -'  + #13#10 ;
//  FBtnMainCaption[16] := 'Elevation +'  + #13#10 ;
//  FBtnMainCaption[17] := 'Elevation -'  + #13#10 ;
//  FBtnMainCaption[18] := 'TVFOV +'  + #13#10 ;
//  FBtnMainCaption[19] := 'TVFOV -'  + #13#10 ;
//  FBtnMainCaption[20] := 'TV NFOV'  + #13#10 ;
//  FBtnMainCaption[21] := 'IR WFOV'  + #13#10 ;
//  FBtnMainCaption[22] := 'Centroid'  + #13#10 ;
//  FBtnMainCaption[23] := 'Automatic'  + #13#10 ;

  FBtnArray[0].Caption := 'EO Control'    + #13#10;
  FBtnArray[1].Caption := 'Check'  + #13#10 + 'CTRL';
  FBtnArray[2].Caption := '  ';
  FBtnArray[3].Caption := '  ';
  FBtnArray[4].Caption := '  ';
  FBtnArray[5].Caption := 'To Zero'  + #13#10;
  FBtnArray[6].Caption := 'IR Auto'  + #13#10 ;
  FBtnArray[7].Caption := '25 HZ'    + #13#10;
  FBtnArray[8].Caption := 'IR On' + #13#10;
  FBtnArray[9].Caption := 'Air'  + #13#10;
  FBtnArray[10].Caption := 'Diagnosis'    + #13#10;
  FBtnArray[11].Caption := 'TV Black' + #13#10;
  FBtnArray[12].Caption := 'IR Black'  + #13#10;
  FBtnArray[13].Caption := 'Black'  + #13#10;
  FBtnArray[14].Caption := 'Azimuth +'  + #13#10;
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

procedure TfrmPTK.GenerateSystemMenu;
var
i : Integer;
begin
  for i := 0 to Length(FBtnArray) - 1 do
  begin

      FBtnArray[i].Caption := '  ';
      FBtnArray[i].Name := 'btn_' + i.ToString;
  end;

  FBtnArray[0].Caption := 'Combat' + #13#10;
  FBtnArray[1].Caption := 'Check'  + #13#10;
  FBtnArray[5].Caption := 'Lock' + #13#10 + 'Screen';

  FBtnArray[6].Caption := 'Indication'  + #13#10;
  FBtnArray[7].Caption := 'Virtual'  + #13#10 + 'Fire';
  FBtnArray[8].Caption := 'Direct'  + #13#10 + 'Attack';
  FBtnArray[9].Caption := 'System'  + #13#10 + 'Check';
  FBtnArray[10].Caption := 'Training'  + #13#10;
  FBtnArray[11].Caption := 'Independent' + #13#10 ;
  FBtnArray[12].Caption := 'Wait'  + #13#10;

  FBtnArray[24].Caption := 'System'  + #13#10 ;


  EnableAllBtn;

  for i := 0 to Length(FBtnArray) - 1 do
  begin
    if AnsiContainsStr(FBtnArray[i].Caption, '  ') then begin
      FBtnArray[i].Enabled := False;
    end;
  end;

  FBtnArray[0].Name := 'btn_Combat';
  FBtnArray[1].Name := 'btn_Check';
  FBtnArray[5].Name := 'btn_LockScreen';

  FBtnArray[6].Name := 'btn_Indication';
  FBtnArray[7].Name := 'btn_VirtualFire';
  FBtnArray[8].Name := 'btn_DirectAttack';
  FBtnArray[9].Name := 'btn_SystemCheck';
  FBtnArray[10].Name := 'btn_Training';
  FBtnArray[11].Name := 'btn_Independent';
  FBtnArray[12].Name := 'btn_Wait';

  FBtnArray[24].Name := 'btn_Local';

  GenerateSystemMenuColor;

end;

procedure TfrmPTK.GenerateSystemMenuColor;
var
i : Integer;
begin
  btnWhite(0);
  btnBlack(1);

  for i := 2 to Length(FBtnArray) - 1 do
  begin
    btnBlack(i);
  end;
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
//    btn.Font.Color  := CL_TCMS_Orange;
    btn.Font.Color  := clWhite;
    btn.Font.Size   := FFont_Btn;
    btn.Name        := 'btn_' + FBtnMainNames[i];
    btn.Caption     := FBtnMainCaption[i];
    btn.OnClick     := btnPtkClick;
//    btn.OnMouseEnter:= btnPtkMouseEnter;
//    btn.OnMouseLeave:= btnPtkMouseLeave;
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
//  FBtnArray[0].Color := clLime;
//  FBtnArray[1].Color := clBlack;
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
    btn.Color       := clBlack;
    btn.Font.Color  := clWhite;
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
