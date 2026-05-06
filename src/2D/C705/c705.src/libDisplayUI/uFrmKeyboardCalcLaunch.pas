unit uFrmKeyboardCalcLaunch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, uTCPDatatype, uLibSettings, uC705SimManager;

type
  TfrmKeyboardCalcLaunch = class(TForm)
    {$REGION 'Components'}
    imgMissCont: TImage;
    imgExit: TImage;
    imgParSetting: TImage;
    imgLaunchDat: TImage;
    imgMissInfo: TImage;
    imgInsTest: TImage;
    imgFireDist: TImage;
    imgMissMon: TImage;
    imgChanSelect: TImage;
    imgSituation: TImage;
    imgSpare: TImage;
    Image12: TImage;
    imgMinus: TImage;
    img0: TImage;
    imgPlus: TImage;
    img1: TImage;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    img5: TImage;
    img6: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    img7: TImage;
    img8: TImage;
    img9: TImage;
    imgTab: TImage;
    imgBackSp: TImage;
    imgEsc: TImage;
    imgEnter: TImage;
    imgArrowUp: TImage;
    imgArrowDown: TImage;
    imgArrowLeft: TImage;
    imgArrowRight: TImage;
    Panel1: TPanel;
    imgLaunch2: TImage;
    imgLaunch1: TImage;
    imgCancel2: TImage;
    imgCancel1: TImage;
    Image40: TImage;
    Image41: TImage;
    Image42: TImage;
    Image43: TImage;
    Image44: TImage;
    Image45: TImage;
    lblCancelLaunch: TLabel;
    lblLaunch: TLabel;
    Panel2: TPanel;
    imgBtnComp: TImage;
    Label3: TLabel;
    imgBtnFan: TImage;
    Label4: TLabel;
    imgBtnVolt: TImage;
    Label5: TLabel;
    imgBtnReset: TImage;
    Label6: TLabel;
    tmrClearFiring: TTimer;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgLaunchClick(Sender: TObject);
    procedure tmrClearFiringTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
    procedure SetTopMonitor(aMoniHeight: Integer);
    procedure SetBottomMonitor;
  end;

var
  frmKeyboardCalcLaunch: TfrmKeyboardCalcLaunch;


implementation

uses
  UfrmRoutePlan, uVehicleManager;

{$R *.dfm}

procedure TfrmKeyboardCalcLaunch.FormCreate(Sender: TObject);
begin
  Width := 1024;
  Height := 768;

  //Show;
end;

procedure TfrmKeyboardCalcLaunch.FormShow(Sender: TObject);
begin
  //
end;

procedure TfrmKeyboardCalcLaunch.imgLaunchClick(Sender: TObject);
var
  recDataC705 : TRec_Data_C705;
  LauncherID, MissileSlot  : Integer;
begin

  { Kalau bukan mode Firing }
  if SimManager.RoutePlanMode <> mFiring then
    Exit;

  { Kalau tidak dapat input dari INSTRUKTUR }
  if not SimManager.isReadyToLaunchC705 then
    Exit;

  LauncherID := ((Sender as TImage).Tag);
  if (LauncherID < 1) or (LauncherID > 2) then Exit;
  missileSlot := SimManager.GetAvailableSlot(LauncherID);

                //         for now
  if not SimManager.IsLauncherLoaded(LauncherID) then
  begin
    ShowMessage('Belum Load dari Instruktur');
    Exit;
  end;

  if missileSlot = 0 then
  begin
    ShowMessage('Missile habis!');
    Exit;
  end;

  // tandai kepakai
  SimManager.MarkSlotUsed(LauncherID, missileSlot);

//  frmRoutePlan.FSelectedBearing
  recDataC705.ShipID := VOwnShip.ShipID;
  recDataC705.mWeaponID := VOwnShip.WeaponId;
  recDataC705.mLauncherID := LauncherID;
  //recDataC705.mMissileID := 1;
  //recDataC705.mMissileID := SimManager.GetMissileCount(LauncherID);
  recDataC705.mMissileID := missileSlot; // 2 lalu 1
  recDataC705.mMissileNumber := 1;
  //recDataC705.mMissileNumber := SimManager.GetMissileCount(LauncherID);
  //recDataC705.OrderID := 0; // harusnya diganti per command, misal fire, atau yang lain
  recDataC705.OrderID := __ORD_ID_Fire_C705;
  recDataC705.mTargetBearing := frmRoutePlan.FSelectedBearing;
  recDataC705.mTargetRange := frmRoutePlan.FSelectedRange;
  recDataC705.mTargetId := 0;

  SimManager.netNFS_OnSendDataC705(recDataC705);

  // RESET TARGET
  VehicleMgr.SelectedTargetID := -1;

  SimManager.RoutePlanMode := mPassive;

//  frmRoutePlan.lblStatusMap.Caption :=
//  'Launched | PORT: ' + SimManager.GetLauncherStateStr(1) +
//  ' | STBD: ' + SimManager.GetLauncherStateStr(2);
//
//  frmRoutePlan.lblStatusMap.Caption :=
//    'Launched | STBD: ' + IntToStr(SimManager.GetMissileCount(1)) +
//      ' | PORT: ' + IntToStr(SimManager.GetMissileCount(2));

  frmRoutePlan.lblStatusMap.Caption := 'Missile Launched';

  tmrClearFiring.Interval := 2000; // 2 detik
  tmrClearFiring.Enabled := True;

  if VIdentSetting.ModeDebug then
    ShowMessage('No, INS Done fire');

end;

procedure TfrmKeyboardCalcLaunch.SetBottomMonitor;
var
  m: TMonitor;
begin
  Position := poDesigned;
  WindowState := wsNormal;

  m := Screen.Monitors[0];

  if Screen.Monitors[1].Top > m.Top then m := Screen.Monitors[1];
  if Screen.Monitors[2].Top > m.Top then m := Screen.Monitors[2];

  Left := m.Left;
  Top  := m.Top;

  if VIdentSetting.ModeDebug then
    ShowMessage('Keyboard Top=' + IntToStr(frmKeyboardCalcLaunch.Top));
end;

procedure TfrmKeyboardCalcLaunch.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
  Position := poDesigned;
  WindowState := wsNormal;

  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop;

  if VIdentSetting.ModeDebug then
    ShowMessage(Format('Keyboard di Monitor %d Top=%d',[aMonitorIdx,Screen.Monitors[aMonitorIdx].Top]));
end;

procedure TfrmKeyboardCalcLaunch.SetTopMonitor(aMoniHeight: Integer);
var
  idxMainMoni: Integer;
  R: TRect;
begin
//  Position := poDesigned;
//  WindowState := wsNormal;

  idxMainMoni := 0;

  Left := Screen.Monitors[idxMainMoni].WorkareaRect.Left;
  Top := aMoniHeight;

  if VIdentSetting.ModeDebug then
    ShowMessage('Keyboard Top=' + IntToStr(frmKeyboardCalcLaunch.Top));
end;

procedure TfrmKeyboardCalcLaunch.tmrClearFiringTimer(Sender: TObject);
begin
  VehicleMgr.IsFiring := False;
  VehicleMgr.SelectedTargetID := 0; // INI YANG HILANGKAN GARIS

  frmRoutePlan.FMap.Refresh;
  frmRoutePlan.lblStatusMap.Caption := '';

  tmrClearFiring.Enabled := False;
end;

end.
