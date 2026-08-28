unit UfrmWCC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg, uLibSettings, uC705SimManager, uTCPDatatype, uBaseFunction,
  uFormMgr, uKeyboardManager, uC705Launcher, uFrmKeyboardCalcLaunch;

type
  TfrmWCC = class(TForm)
    {$REGION 'Components'}
    pnlMain: TPanel;
    pnlSide: TPanel;
    img1: TImage;
    pnlPowerForM: TPanel;
    Label6: TLabel;
    btnImgPowerMissile1: TSpeedButton;
    btnImgPowerMissile2: TSpeedButton;
    pnlOpenCover: TPanel;
    btnimgOpenCover2: TSpeedButton;
    btnImgOpenCover1: TSpeedButton;
    Label7: TLabel;
    pnlSafeArm: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    imgSafetyBooster_L: TImage;
    imgSafetyBooster_R: TImage;
    imgBtnSafe_L: TImage;
    imgBtnSafe_R: TImage;
    pnlSelfLatch: TPanel;
    imgSelfLatch2: TImage;
    imgSelfLatch1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    pnlMainMenu: TPanel;
    lblRealtimeCombat: TLabel;
    lblSimulateRoute: TLabel;
    lblSimulateTraining: TLabel;
    lblHardwareCheck: TLabel;
    lblSoftwareExit: TLabel;
    Label12: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    pnlSoftwareExit: TPanel;
    pnlHeaderSE: TPanel;
    Bevel3: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    pnlSimulateTraining: TPanel;
    Bevel5: TBevel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    pnlHeaderST: TPanel;
    Label22: TLabel;
    pnlHardwareCheck: TPanel;
    Bevel4: TBevel;
    Label3: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Panel2: TPanel;
    Label11: TLabel;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lblCheckGSWK: TLabel;
    lblCheckHbFB23b: TLabel;
    lblCheckHbFB23a: TLabel;
    lblCheck301b: TLabel;
    lblCheckP301a: TLabel;
    lblCheckP105B: TLabel;
    RoutePlan1: TMenuItem;
    pnlRealTimeCombat: TPanel;
    tmrHardwareCheck: TTimer;
    Keyboard1: TMenuItem;
    imgBtnArm_L: TImage;
    imgBtnArm_R: TImage;
    {$ENDREGION}
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure lblMenuClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RoutePlan1Click(Sender: TObject);
    procedure tmrHardwareCheckTimer(Sender: TObject);
    procedure Keyboard1Click(Sender: TObject);
    procedure btnImgPowerMissileClick(Sender: TObject);
    procedure btnImgOpenCoverClick(Sender: TObject);
    procedure imgBtnSafetyBooster_Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure imgSelfLatchClick(Sender: TObject);
  private
    { Private declarations }
    FActiveLabel: TLabel;

    { Hardware check }
    FCheckIndex: Integer;

    procedure UpdateHighlight;
    function FindLabelByTag(ATag: Integer): TLabel;
    procedure ShowPanelForMenu(ALabel: TLabel);

    procedure StartCheckHardware;

    procedure HideAllPnlContent;

    procedure UpdateStatusWeapon(aLauncher: TC705Launcher);
    procedure UpdateStatusOpenCover(aLauncher: TC705Launcher);
    procedure UpdateStatusSafetyIgnition(aLauncher: TC705Launcher);
    procedure UpdateStatusSelfLatch(aLauncher: TC705Launcher);
  public
    { Public declarations }
    procedure SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
    procedure SetTopMonitor(aMoniHeight: Integer);

    procedure InitSimulation;
    //procedure StatusWeaponBtnChanged(Sender:TObject; aStatus: TC705StatusType);
    procedure StatusWeaponBtnChanged(Sender: TObject);

    procedure HandleKeyboardDown(Key: Word);

  end;

var
  frmWCC: TfrmWCC;

implementation

{$R *.dfm}

uses
  UfrmFoeFriendSituationPage;


{$REGION 'Menu Navigasi'}
function TfrmWCC.FindLabelByTag(ATag: Integer): TLabel;
var
  i: Integer;
begin
  Result := nil;

  for i := 0 to pnlMainMenu.ControlCount - 1 do
    if (pnlMainMenu.Controls[i] is TLabel) and (pnlMainMenu.Controls[i].Tag = ATag) and (pnlMainMenu.Controls[i].Tag > 0) then
      Exit(TLabel(pnlMainMenu.Controls[i]));
end;

procedure TfrmWCC.UpdateHighlight;
var
  i: Integer;
  aLbl: TLabel;
begin
  for i := 0 to pnlMainMenu.ControlCount - 1 do
    if (pnlMainMenu.Controls[i] is TLabel) and (pnlMainMenu.Controls[i].Tag > 0) then
    begin
      aLbl := TLabel(pnlMainMenu.Controls[i]);

      if aLbl = FActiveLabel then
      begin
        aLbl.Font.Style := [fsBold];
        aLbl.Font.Color := clWhite;
        aLbl.Color := clHighlight;
        aLbl.Transparent := False;

      //ShowPanelForMenu(aLbl);
      end
      else
      begin
        aLbl.Font.Style := [];
        aLbl.Font.Color := clSilver;
        aLbl.Color := clNone;
        aLbl.Transparent := True;
      end;
    end;
end;

procedure TfrmWCC.StartCheckHardware;
begin
  lblCheckP105B.Caption := 'CHECKING';
  lblCheckP301a.Caption := 'CHECKING';
  lblCheck301b.Caption := 'CHECKING';
  lblCheckHbFB23a.Caption := 'CHECKING';
  lblCheckHbFB23b.Caption := 'CHECKING';
  lblCheckGSWK.Caption := 'CHECKING';

  FCheckIndex := 0;
  tmrHardwareCheck.Enabled := True;
end;

procedure TfrmWCC.tmrHardwareCheckTimer(Sender: TObject);
begin
  case FCheckIndex of
    0:
      lblCheckP105B.Caption := 'PASS';
    1:
      lblCheckP301a.Caption := 'PASS';
    2:
      lblCheck301b.Caption := 'PASS';
    3:
      lblCheckHbFB23a.Caption := 'PASS';
    4:
      lblCheckHbFB23b.Caption := 'PASS';
    5:
      lblCheckGSWK.Caption := 'PASS';
  end;

  Inc(FCheckIndex);

  if FCheckIndex > 5 then
    tmrHardwareCheck.Enabled := False;
end;

procedure TfrmWCC.ShowPanelForMenu(aLabel: TLabel);
var
  i: Integer;
  aPnl: TPanel;
begin
  if (aLabel = nil) or (aLabel.Tag <= 0) then
    Exit;

  for i := 0 to pnlMainMenu.ControlCount - 1 do
    if pnlMainMenu.Controls[i] is TPanel then
    begin
      aPnl := TPanel(pnlMainMenu.Controls[i]);
      aPnl.Visible := (aPnl.Tag = aLabel.Tag);

//    if aPnl.Tag = 1 then
//    begin
//      if Assigned(frmFoeFriendSituationPage) then
//        frmFoeFriendSituationPage.Show;
//    end;
    end;
end;

procedure TfrmWCC.HideAllPnlContent;
begin
  pnlHardwareCheck.Visible := False;
  pnlSimulateTraining.Visible := False;
  pnlSoftwareExit.Visible := False;
end;

procedure TfrmWCC.HandleKeyboardDown(Key: Word);
var
  NextTag: Integer;
  NextLabel: TLabel;
begin

  {$REGION 'Panel Software Exit' }
  if pnlSoftwareExit.Visible = True then
  begin
    case Key of
      VK_ESCAPE:
        begin
          pnlSoftwareExit.Visible := False;
          //frmWCC.KeyPreview := False;
        end;

      VK_RETURN:
        begin
          Application.Terminate;
        end;
    end;
  end;
  {$ENDREGION}

  {$REGION 'Panel Hardware Check'}
  if pnlHardwareCheck.Visible = True then
  begin
    case Key of
      VK_ESCAPE:
        pnlHardwareCheck.Visible := False;
    end;
  end;
  {$ENDREGION}

  {$REGION ' Menu Navigation Key Arrow '}
  if FActiveLabel = nil then
    Exit;

  NextTag := FActiveLabel.Tag;

  case Key of
    VK_UP:
      Dec(NextTag);
    VK_DOWN:
      Inc(NextTag);

    VK_RETURN:
      begin
        if NextTag = 1 then
        begin
          if not Assigned(frmFoeFriendSituationPage) then
          begin
            frmFoeFriendSituationPage := TfrmFoeFriendSituationPage.Create(Self);
            frmFoeFriendSituationPage.RegisterEvents;
          end;

          frmWCC.Hide;
          frmFoeFriendSituationPage.Show;
          frmKeyboardCalcLaunch.BringToFront;
        end;

      //Exit;
      end;

  else
    Exit;
  end;

  // Mentok atas & bawah
  if (NextTag < 1) or (NextTag > pnlMainMenu.ControlCount) then
    Exit;

  NextLabel := FindLabelByTag(NextTag);
  if NextLabel <> nil then
  begin
    FActiveLabel := NextLabel;
    UpdateHighlight;

    HideAllPnlContent;

    case Key of
      VK_RETURN:
        ShowPanelForMenu(NextLabel);
    end;

  end;
  {$ENDREGION}

end;

procedure TfrmWCC.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  HandleKeyboardDown(Key);
end;

procedure TfrmWCC.lblMenuClick(Sender: TObject);
begin

  case (Sender as TLabel).Tag of
    1:
      begin
      // Realtime Combat
        pnlSoftwareExit.Visible := False;
        frmWCC.KeyPreview := False;

        if not Assigned(frmFoeFriendSituationPage) then
        begin
          frmFoeFriendSituationPage := TfrmFoeFriendSituationPage.Create(Self);
          frmFoeFriendSituationPage.RegisterEvents;
        end;

        frmWCC.Hide;
        frmFoeFriendSituationPage.show;
      end;
    2:
      begin
      // Simulate Route
        pnlSoftwareExit.Visible := False;
        frmWCC.KeyPreview := False;
      end;
    3:
      begin
      // Simulate Training
        pnlSoftwareExit.Visible := False;
        frmWCC.KeyPreview := False;
        pnlSimulateTraining.BringToFront;
      end;
    4:
      begin
      // Hardware Check
        pnlSoftwareExit.Visible := False;
        frmWCC.KeyPreview := False;
      end;
    5:
      begin
      // Software Exit
        pnlSoftwareExit.Visible := True;
        frmWCC.KeyPreview := True;
        pnlSoftwareExit.BringToFront;
      end;
  end;

end;

{$ENDREGION}

procedure EnableComposited(WinControl: TWinControl);
var
  i: Integer;
  NewExStyle: DWORD;
begin
  NewExStyle := GetWindowLong(WinControl.Handle, GWL_EXSTYLE) or WS_EX_COMPOSITED;
  SetWindowLong(WinControl.Handle, GWL_EXSTYLE, NewExStyle);

  for i := 0 to WinControl.ControlCount - 1 do
    if WinControl.Controls[i] is TWinControl then
      EnableComposited(TWinControl(WinControl.Controls[i]));
end;

procedure TfrmWCC.FormCreate(Sender: TObject);
begin
  Width := 1920;
  Height := 1080;

  Self.DoubleBuffered := False;
  //EnableComposited(pnlBasemap);
  //pnlBasemap.DoubleBuffered := False;

  Show;

  KeyPreview := True;

  // Default active menu
  FActiveLabel := lblRealtimeCombat;
  UpdateHighlight;

  EnableComposited(pnlPowerForM);
  EnableComposited(pnlSelfLatch);
  EnableComposited(pnlOpenCover);
  EnableComposited(pnlSafeArm);
end;

procedure TfrmWCC.FormDestroy(Sender: TObject);
begin
  // Multicast Notify Event
  if Assigned(SimManager) then
    SimManager.UnregisterStatusWeaponEvent(StatusWeaponBtnChanged);
end;

procedure TfrmWCC.FormShow(Sender: TObject);
begin
  lblHardwareCheck.Tag := 2;
  lblSoftwareExit.Tag := 3;
  pnlHardwareCheck.Tag := 2;
  pnlSoftwareExit.Tag := 3;

  lblSimulateRoute.Tag := 5;
  lblSimulateTraining.Tag := 6;
  pnlSimulateTraining.Tag := 6;

  lblHardwareCheck.Top := lblSimulateRoute.Top;
  lblSoftwareExit.Top := lblSimulateTraining.Top;

  lblSimulateRoute.Visible := False;
  lblSimulateTraining.Visible := False;

  if Assigned(KeyboardMgr) then
    KeyboardMgr.SetContext(kbWCCMenu)
end;

procedure TfrmWCC.InitSimulation;
begin
  StartCheckHardware;

  // Multicast Notify Event
  SimManager.RegisterStatusWeaponEvent(StatusWeaponBtnChanged);

  // Sinkronisasi kondisi awal
//  StatusWeaponBtnChanged(SimManager.GetLauncher(1));
//  StatusWeaponBtnChanged(SimManager.GetLauncher(2));
  StatusWeaponBtnChanged(Self);
//  StatusWeaponBtnChanged(Self, SimManager.C705Status);
end;

{$REGION 'Tombol Panel Kanan'}
procedure TfrmWCC.btnImgPowerMissileClick(Sender: TObject);
var
  Launcher: TC705Launcher;
  LauncherID: Integer;
  stateEnableWeapon: Boolean;
begin
  if not SimManager.C705Available then
  begin
    ShowMessage('Weapon C705 belum Available');
    Exit;
  end;

  LauncherID := (Sender as TSpeedButton).Tag;
  Launcher := SimManager.GetLauncher(LauncherID);
  if Launcher = nil then
    Exit;

  stateEnableWeapon := Launcher.C705Status.EnableWeapon;
  Launcher.SetEnableWeapon(not stateEnableWeapon);

end;

procedure TfrmWCC.imgSelfLatchClick(Sender: TObject);
var
  Launcher: TC705Launcher;
  stateSelfLatch: Boolean;
begin
  if (Sender = ImgSelfLatch1) then
    Launcher := simmanager.GetLauncher(1)
  else
    Launcher := SimManager.GetLauncher(2);

  // Self Latch hanya bisa diubah jika Launcher sudah ON
  if not Launcher.C705Status.EnableWeapon then
    Exit;

  // Self Latch hanya bisa diubah setelah INS Alignment selesai
  if not Launcher.C705Status.INSAlignDone then
    Exit;

  stateSelfLatch := Launcher.C705Status.SelfLatch;
  Launcher.SetSelfLatch(not stateSelfLatch);
end;

procedure TfrmWCC.btnImgOpenCoverClick(Sender: TObject);
var
  Launcher: TC705Launcher;
  LauncherID: Integer;
  stateOpenCover: Boolean;
begin
  LauncherID := (Sender as TSpeedButton).Tag;
  Launcher := SimManager.GetLauncher(LauncherID);
  if Launcher = nil then
    Exit;

  if not Launcher.C705Status.EnableWeapon then
    Exit;

  if not Launcher.C705Status.SelfLatch then
    Exit;

  stateOpenCover := Launcher.C705Status.OpenCoverLauncher;
  Launcher.SetOpenCover(not stateOpenCover);

end;

procedure TfrmWCC.imgBtnSafetyBooster_Click(Sender: TObject);
var
  Launcher: TC705Launcher;
begin
  if (Sender = imgBtnArm_L) or (Sender = imgBtnSafe_L) then
    Launcher := SimManager.GetLauncher(2)
  else
    Launcher := SimManager.GetLauncher(1);

  if not Launcher.C705Status.EnableWeapon then
    Exit;

  if not Launcher.C705Status.OpenCoverLauncher then
    Exit;

  if (Sender = imgBtnSafe_L) or (Sender = imgBtnSafe_R) then
    Launcher.SetSafetyIgnition(True)     // SAFE
  else
    Launcher.SetSafetyIgnition(False);   // ARMED

end;

//procedure TfrmWCC.StatusWeaponBtnChanged(Sender: TObject; aStatus: TC705StatusType);
procedure TfrmWCC.StatusWeaponBtnChanged(Sender: TObject);
var
  Launcher: TC705Launcher;
  LauncherID : TC705LauncherID;
begin
  if not Assigned(Sender) then
    Exit;

  if Assigned(SimManager) then
  begin
    Launcher := TC705Launcher(Sender);
    if Launcher = nil then
      Exit;

    LauncherID := Launcher.LauncherID;

    if not SimManager.C705Available then
    begin
      imgSafetyBooster_L.Enabled := False;
      imgSafetyBooster_R.Enabled := False;

      imgSafetyBooster_R.Enabled := False;
      imgSafetyBooster_R.Enabled := False;

      Exit;
    end;

    UpdateStatusWeapon(Launcher);
    UpdateStatusOpenCover(Launcher);

    //OutputDebugString(PChar(Format('SafetyIgnition R = %d', [Ord(RightLauncher.C705Status.SafetyIgnition)])));
    //OutputDebugString(PChar(Format('SafetyIgnition L = %d', [Ord(LeftLauncher.C705Status.SafetyIgnition)])));

    UpdateStatusSafetyIgnition(Launcher);
    UpdateStatusSelfLatch(Launcher);
  end;
end;

procedure TfrmWCC.UpdateStatusOpenCover(aLauncher: TC705Launcher);
begin
  {$REGION 'OPEN COVER'}
  case aLauncher.LauncherID of
    lchRight: begin
      if aLauncher.C705Status.OpenCoverLauncher then
      begin
        btnImgOpenCover1.Glyph.LoadFromFile(VImgPath.imgPath + '\' + 'no1-glowing.bmp');
      end
      else
      begin
        btnImgOpenCover1.Glyph.LoadFromFile(VImgPath.imgPath + '\' + 'no1-normal.bmp');
      end;
    end;
    lchLeft: begin
      if aLauncher.C705Status.OpenCoverLauncher then
      begin
        btnimgOpenCover2.Glyph.LoadFromFile(VImgPath.imgPath + '\' + 'no2-glowing.bmp');
      end
      else
      begin
        btnimgOpenCover2.Glyph.LoadFromFile(VImgPath.imgPath + '\' + 'no2-normal.bmp');
      end;
    end;
  end;
  {$ENDREGION}
end;

procedure TfrmWCC.UpdateStatusSafetyIgnition(aLauncher: TC705Launcher);
begin
  {$REGION 'SAFETY IGNITION'}
  case aLauncher.LauncherID of
    lchRight: begin
      if aLauncher.C705Status.SafetyIgnition then
      begin              //SAFE
        imgSafetyBooster_R.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'imgSafetyBooster_R - SAFE.png');
      end
      else
      begin              //ARMED
        imgSafetyBooster_R.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'imgSafetyBooster_R - ARMED.png');
      end;
    end;
    lchLeft: begin
      if aLauncher.C705Status.SafetyIgnition then
      begin              //SAFE
        imgSafetyBooster_L.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'imgSafetyBooster_L - SAFE.png');
      end
      else
      begin              //ARMED
        imgSafetyBooster_L.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'imgSafetyBooster_L - ARMED.png');
      end;
    end;
  end;
  {$ENDREGION}
end;

procedure TfrmWCC.UpdateStatusWeapon(aLauncher: TC705Launcher);
begin
  {$REGION 'ENABLE WEAPON'}
  case aLauncher.LauncherID of
    lchRight: begin
      if aLauncher.C705Status.EnableWeapon then
      begin
        btnImgPowerMissile1.Glyph.LoadFromFile(VImgPath.imgPath + '\' + 'no1-glowing.bmp');
      end
      else
      begin
        btnImgPowerMissile1.Glyph.LoadFromFile(VImgPath.imgPath + '\' + 'no1-normal.bmp');
      end;
    end;
    lchLeft: begin
      if aLauncher.C705Status.EnableWeapon then
      begin
        btnImgPowerMissile2.Glyph.LoadFromFile(VImgPath.imgPath + '\' + 'no2-glowing.bmp');
      end
      else
      begin
        btnImgPowerMissile2.Glyph.LoadFromFile(VImgPath.imgPath + '\' + 'no2-normal.bmp');
      end;
    end;
  end;
  {$ENDREGION}
end;

procedure TfrmWCC.UpdateStatusSelfLatch(aLauncher: TC705Launcher);
begin
  {$REGION 'SELF LATCH'}
  case aLauncher.LauncherID of
    lchRight: begin
      if aLauncher.C705Status.SelfLatch then
      begin
        imgSelfLatch1.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'imgSelfLatch_1 - ON.png');
      end
      else
      begin
        imgSelfLatch1.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'imgSelfLatch_1 - OFF.png');
      end;
    end;
    lchLeft: begin
      if aLauncher.C705Status.SelfLatch then
      begin
        imgSelfLatch2.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'imgSelfLatch_2 - ON.png');
      end
      else
      begin
        imgSelfLatch2.Picture.LoadFromFile(VImgPath.imgPath + '\' + 'imgSelfLatch_2 - OFF.png');
      end;
    end;
  end;
  {$ENDREGION}
end;
{$ENDREGION}

procedure TfrmWCC.RoutePlan1Click(Sender: TObject);
begin
  // pindah ke form Route Plan ketika 1 monitor menggunakan PopupMenu
  SwitchView(vmRoutePlan);
end;

procedure TfrmWCC.Keyboard1Click(Sender: TObject);
begin
  // munculin form keyboard
  SwitchView(vmKeyboard);
end;

procedure TfrmWCC.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
  Position := poDesigned;
  WindowState := wsNormal;

  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop;

  if VIdentSetting.ModeDebug then
    ShowMessage(Format('WCC di Monitor %d Top=%d', [aMonitorIdx, Screen.Monitors[aMonitorIdx].Top]));
end;

procedure TfrmWCC.SetTopMonitor(aMoniHeight: Integer);
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
    ShowMessage('WCC form Top=' + IntToStr(frmWCC.Top));
end;

procedure TfrmWCC.Close1Click(Sender: TObject);
begin
  Application.Terminate;
  //Close;
end;

end.

