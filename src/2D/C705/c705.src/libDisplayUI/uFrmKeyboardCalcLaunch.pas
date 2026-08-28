unit uFrmKeyboardCalcLaunch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, uTCPDatatype, uLibSettings, uC705SimManager, uC705Launcher;

type
  {
    Event yang dipanggil ketika tombol ENTER pada keyboard ditekan.

    Keyboard hanya mengirim notifikasi bahwa input telah selesai.
    Form pemanggil yang menentukan apa yang akan dilakukan terhadap
    isi Edit yang sedang aktif.
  }
  TKeyboardEnterEvent = procedure (Sender: TObject) of object;

  TKeyboardMode = (
    mdNavigation,
    mdInput
  );

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
    procedure imgNumpadClick(Sender: TObject);
    procedure imgArrowClick(Sender: TObject);
    procedure imgEnterClick(Sender: TObject);
    procedure imgEscClick(Sender: TObject);
    procedure imgBackSpClick(Sender: TObject);
    procedure imgLaunch1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgLaunch1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgLaunch2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgLaunch2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCancel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCancel1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCancel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCancel2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }

    {
    Menyimpan komponen Edit yang sedang menggunakan
    Virtual Keyboard.

    Nilai ini diisi oleh Form pemanggil ketika user
    mengklik sebuah TEdit.
    }
    FActiveEdit: TEdit;

    { Mode Keyboard saat ini }
    FKeyboardMode: TKeyboardMode;
  public
    { Public declarations }
    procedure SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
    procedure SetTopMonitor(aMoniHeight: Integer);
    procedure SetBottomMonitor;

    property ActiveEdit: TEdit read FActiveEdit write FActiveEdit;
    property KeyboardMode: TKeyboardMode read FKeyboardMode write FKeyboardMode;
  end;

var
  frmKeyboardCalcLaunch: TfrmKeyboardCalcLaunch;


implementation

uses
  UfrmRoutePlan, uVehicleManager, UfrmFoeFriendSituationPage,
    uKeyboardManager;

{$R *.dfm}

procedure TfrmKeyboardCalcLaunch.FormCreate(Sender: TObject);
begin
  Width := 1024;
  Height := 768;

  FKeyboardMode := mdInput;
  //Show;
end;

procedure TfrmKeyboardCalcLaunch.FormShow(Sender: TObject);
begin
  //
end;

{$REGION 'Set Form Properties'}

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
begin
//  Position := poDesigned;
//  WindowState := wsNormal;

  idxMainMoni := 0;

  Left := Screen.Monitors[idxMainMoni].WorkareaRect.Left;
  Top := aMoniHeight;

  if VIdentSetting.ModeDebug then
    ShowMessage('Keyboard Top=' + IntToStr(frmKeyboardCalcLaunch.Top));
end;

{$ENDREGION}

procedure TfrmKeyboardCalcLaunch.tmrClearFiringTimer(Sender: TObject);
begin
  VehicleMgr.StopFiring;
//  VehicleMgr.IsFiring := False;
//  VehicleMgr.SelectedTargetID := -1; // INI YANG HILANGKAN GARIS

  frmRoutePlan.FMap.Refresh;
  frmRoutePlan.lblStatusMap.Caption := '';

  tmrClearFiring.Enabled := False;
end;

procedure TfrmKeyboardCalcLaunch.imgLaunch1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgLaunch1.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'FireDistribution' + '\' + '1Launch_Down.png');
end;

procedure TfrmKeyboardCalcLaunch.imgLaunch1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgLaunch1.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'FireDistribution' + '\' + '1Launch_Up.png');
end;

procedure TfrmKeyboardCalcLaunch.imgLaunch2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgLaunch2.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'FireDistribution' + '\' + '2Launch_Down.png');
end;

procedure TfrmKeyboardCalcLaunch.imgLaunch2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgLaunch2.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'FireDistribution' + '\' + '2Launch_Up.png');
end;

procedure TfrmKeyboardCalcLaunch.imgCancel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgCancel1.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'FireDistribution' + '\' + '1Cancel_Down.png');
end;

procedure TfrmKeyboardCalcLaunch.imgCancel1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgCancel1.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'FireDistribution' + '\' + '1Cancel_Up.png');
end;

procedure TfrmKeyboardCalcLaunch.imgCancel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgCancel2.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'FireDistribution' + '\' + '2Cancel_Down.png');
end;

procedure TfrmKeyboardCalcLaunch.imgCancel2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  imgCancel2.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'FireDistribution' + '\' + '2Cancel_Up.png');
end;

procedure TfrmKeyboardCalcLaunch.imgLaunchClick(Sender: TObject);
var
  recDataC705 : TRec_Data_C705;
  LauncherID: Integer;
  Launcher: TC705Launcher;
begin

  { Kalau bukan mode Firing }
  if SimManager.RoutePlanMode <> mFiring then
    Exit;

  { Tag 1 = Starboard (Kanan),
    Tag 2 = Port (Kiri) }
  LauncherID := ((Sender as TImage).Tag);
  if (LauncherID < 1) or (LauncherID > 2) then Exit;

  { cek status Launch Ready }
  Launcher := SimManager.GetLauncher(LauncherID);

  if Launcher = nil then
    Exit;

  { Kalau tidak dapat input dari INSTRUKTUR }
  if not SimManager.GetLauncher(LauncherID).IsReadyToLaunch then
    Exit;

  if not Launcher.C705Status.LaunchRdy then begin
    ShowMessage('Launcher belum Launch Ready.');
    Exit;
  end;

  //         for now SEMENTARA (memastikan missile mempunyai isi)
  if not SimManager.GetLauncher(LauncherID).isHaveMissile then
  begin
    ShowMessage('Launcher tidak memiliki missile!');
    Exit;
  end;

//  { Simpan target ke launcher yang DIPILIH saja. }
//  Launcher.SetTargetData(
//    VehicleMgr.SelectedTargetID,
//    frmRoutePlan.SelectedBearing,
//    frmRoutePlan.SelectedRange
//  );

//  { Jalankan sequence target hanya untuk launcher yang dipilih
//  SeaTargetRdy
//  InsideSectorRdy
//  PlcChkRdy
//  InitChkRdy }
//  Launcher.StartTargetSequence;

  // di sini kah? SEMENTARA
  Launcher.StartAfterLaunch;

  tmrClearFiring.Interval := 2000; // 2 detik
  tmrClearFiring.Enabled := True;

  frmRoutePlan.lblStatusMap.Caption := 'Missile Launched';

  if VIdentSetting.ModeDebug then
    ShowMessage('No, INS Done fire');
end;

procedure TfrmKeyboardCalcLaunch.imgArrowClick(Sender: TObject);
begin
  case (Sender as TImage).Tag of
    0: KeyboardMgr.SendKey(VK_UP);
    1: KeyboardMgr.SendKey(VK_DOWN);
    2: KeyboardMgr.SendKey(VK_LEFT);
    3: KeyboardMgr.SendKey(VK_RIGHT);
  end;
end;

procedure TfrmKeyboardCalcLaunch.imgBackSpClick(Sender: TObject);
begin
  KeyboardMgr.SendKey(VK_BACK);
end;

procedure TfrmKeyboardCalcLaunch.imgNumpadClick(Sender: TObject);
begin
  KeyboardMgr.SendKey((Sender as TImage).Tag);
end;

procedure TfrmKeyboardCalcLaunch.imgEnterClick(Sender: TObject);
begin
  KeyboardMgr.SendKey(VK_RETURN);

  { Mode keyboard dikembalikan lagi ke mode Navigation }
  FKeyboardMode := mdNavigation;
  //FActiveEdit := nil;
end;

procedure TfrmKeyboardCalcLaunch.imgEscClick(Sender: TObject);
begin
  KeyboardMgr.SendKey(VK_ESCAPE);
end;

end.
