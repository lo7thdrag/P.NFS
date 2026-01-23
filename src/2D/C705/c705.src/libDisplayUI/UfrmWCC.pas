unit UfrmWCC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Menus, Vcl.Imaging.jpeg;

type
  TfrmWCC = class(TForm)
    {$REGION 'Components'}
    pnlMain: TPanel;
    pnlSide: TPanel;
    img1: TImage;
    pnlPowerForM: TPanel;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    pnlOpenCover: TPanel;
    btnOpenCover2: TSpeedButton;
    btnOpenCover1: TSpeedButton;
    Label7: TLabel;
    pnlSafeArm: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Image2: TImage;
    imgBtnSafe: TImage;
    imgBtnArm: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Image4: TImage;
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
    {$ENDREGION}
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure lblMenuClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure RoutePlan1Click(Sender: TObject);

  private
    { Private declarations }
    FActiveLabel: TLabel;

    procedure UpdateHighlight;
    function FindLabelByTag(ATag: Integer): TLabel;
    procedure ShowPanelForMenu(ALabel: TLabel);
  public
    { Public declarations }
    procedure SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
  end;

var
  frmWCC: TfrmWCC;

implementation

{$R *.dfm}

uses
  uFormMgr, UfrmFoeFriendSituationPage;


{$REGION 'Menu Navigasi'}
function TfrmWCC.FindLabelByTag(ATag: Integer): TLabel;
var
  i: Integer;
begin
  Result := nil;

  for i := 0 to pnlMainMenu.ControlCount - 1 do
    if (pnlMainMenu.Controls[i] is TLabel) and
       (pnlMainMenu.Controls[i].Tag = ATag) and (pnlMainMenu.Controls[i].Tag > 0) then
      Exit(TLabel(pnlMainMenu.Controls[i]));
end;

procedure TfrmWCC.UpdateHighlight;
var
  i: Integer;
  L: TLabel;
begin
  for i := 0 to pnlMainMenu.ControlCount - 1 do
    if (pnlMainMenu.Controls[i] is TLabel) and
        (pnlMainMenu.Controls[i].Tag > 0) then
    begin
      L := TLabel(pnlMainMenu.Controls[i]);

      if L = FActiveLabel then
      begin
        L.Font.Style := [fsBold];
        L.Font.Color := clWhite;
        L.Color := clHighlight;
        L.Transparent := False;

        ShowPanelForMenu(L);
      end
      else
      begin
        L.Font.Style := [];
        L.Font.Color := clSilver;
        L.Color := clNone;
        L.Transparent := True;
      end;
    end;
end;

procedure TfrmWCC.ShowPanelForMenu(ALabel: TLabel);
var
  i: Integer;
  P: TPanel;
begin
  if (ALabel = nil) or (ALabel.Tag <= 0) then Exit;

  for i := 0 to pnlMainMenu.ControlCount - 1 do
    if pnlMainMenu.Controls[i] is TPanel then
    begin
      P := TPanel(pnlMainMenu.Controls[i]);
      P.Visible := (P.Tag = ALabel.Tag);
    end;
end;

procedure TfrmWCC.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
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

  {$REGION ' Menu Navigation Key Arrow '}
  if FActiveLabel = nil then Exit;

  NextTag := FActiveLabel.Tag;

  case Key of
    VK_UP:   Dec(NextTag);
    VK_DOWN: Inc(NextTag);
    {
    VK_RETURN:
      begin
        lblMenuMouseEnter(FActiveLabel);
        Exit;
      end;
    }
  else
    Exit;
  end;

  // Mentok atas & bawah
  if (NextTag < 1) or (NextTag > pnlMainMenu.ControlCount) then Exit;

  NextLabel := FindLabelByTag(NextTag);
  if NextLabel <> nil then
  begin
    FActiveLabel := NextLabel;
    UpdateHighlight;
  end;
  {$ENDREGION}

end;
{$ENDREGION}

procedure TfrmWCC.FormCreate(Sender: TObject);
begin
  Self.DoubleBuffered := False;
  //EnableComposited(pnlBasemap);
  //pnlBasemap.DoubleBuffered := False;

  Show;

  KeyPreview := True;

  // Default active menu
  FActiveLabel := lblRealtimeCombat;
  UpdateHighlight;

end;

procedure TfrmWCC.FormShow(Sender: TObject);
begin
  Width := 1920;
  Height := 1080;
end;

procedure TfrmWCC.lblMenuClick(Sender: TObject);
begin

  case (Sender as TLabel).Tag of
    1: begin
      // Realtime Combat
      pnlSoftwareExit.Visible := False;
      frmWCC.KeyPreview := False;

      frmFoeFriendSituationPage.show;
    end;
    2: begin
      // Simulate Route
      pnlSoftwareExit.Visible := False;
      frmWCC.KeyPreview := False;
    end;
    3: begin
      // Simulate Training
      pnlSoftwareExit.Visible := False;
      frmWCC.KeyPreview := False;
      pnlSimulateTraining.BringToFront;
    end;
    4: begin
      // Hardware Check
      pnlSoftwareExit.Visible := False;
      frmWCC.KeyPreview := False;
    end;
    5: begin
      // Software Exit
      pnlSoftwareExit.Visible := True;
      frmWCC.KeyPreview := True;
      pnlSoftwareExit.BringToFront;
    end;
  end;

end;

procedure TfrmWCC.RoutePlan1Click(Sender: TObject);
begin
  // pindah ke form Route Plan ketika 1 monitor
  SwitchView(vmRoutePlan);
end;

procedure TfrmWCC.Close1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmWCC.SetMonitor(aMonitorIdx, aLeft, aTop: Integer);
begin
//  if Screen.MonitorCount = 0 then
//    Exit;
//
//  if Screen.MonitorCount = 1 then
//    aMonitorIdx := 0
//  else aMonitorIdx := aMonitorIdx;  // handle kalau monitor cuma 1

  Left := Screen.Monitors[aMonitorIdx].WorkareaRect.Left + aLeft;
  Top := Screen.Monitors[aMonitorIdx].WorkareaRect.Top + aTop;
end;

end.
