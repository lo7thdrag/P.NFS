unit uFrmChannelSelect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TUIPnlFocusMode = (pnlUIHeader, pnlUIContent);

  TfrmChannelSelect = class(TForm)
    {$REGION 'Components'}
    pnlPlanCh: TPanel;
    pnlTgtCh: TPanel;
    pnlNavCh: TPanel;
    pnlPlanChContent: TPanel;
    pnlPlanContent_RPSPlan: TPanel;
    Bevel2: TBevel;
    Label51: TLabel;
    Label53: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    pnlPlanContent_WCCPlan: TPanel;
    pnlHeader_PlanChannel: TPanel;
    Panel6: TPanel;
    pnlTgtChContent: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    pnlTgtContent_CCS: TPanel;
    pnlTgtContent_SearchRadar: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlNavChContent: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    pnlNavContent_GyroCom: TPanel;
    pnlNavContent_GyroNet: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    {$ENDREGION}
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FarrHeaderPanels: array[0..2] of TPanel;
    FActiveIndex: Integer;
    FFocusMode: TUIPnlFocusMode;

    FarrContentSelection: array[0..1] of TPanel;
    FSelectedContentIndex: Integer;

    FisChSelectFrmActive: Boolean;  // penanda frmChannelSelect sedang yang pakai fungsi Keyboard

    procedure SetActiveHeader(idx: Integer);
    procedure ShowActiveContent;
    procedure CloseAllContent;

    procedure SetActiveSelectedContent(idx: Integer);

  public
    { Public declarations }
    procedure ActivateFrmChSelect;
    procedure DeactivateFrmChSelect;

    procedure HandleKeyDown(Key: Word; Shift: TShiftState);

    property isChSelectFrmActive:Boolean read FisChSelectFrmActive;
    property focusMode: TUIPnlFocusMode read FFocusMode;
  end;

var
  frmChannelSelect: TfrmChannelSelect;

implementation

{$R *.dfm}

uses
  uLibConst, uKeyboardManager;

procedure TfrmChannelSelect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  HandleKeyDown(Key,Shift);
end;

procedure TfrmChannelSelect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmChannelSelect.FormCreate(Sender: TObject);
begin
  Align := alClient;

  KeyPreview := True; // biar bisa keyboard down

  FarrHeaderPanels[0] := pnlPlanCh;
  FarrHeaderPanels[1] := pnlTgtCh;
  FarrHeaderPanels[2] := pnlNavCh;

  FarrContentSelection[0] := nil;
  FarrContentSelection[1] := nil;

  FActiveIndex := 0; // show pertama langsung panel Plan Channel
  FFocusMode := pnlUIHeader;  // fokus navigasi di panel Header Kiri

  SetActiveHeader(FActiveIndex);
  CloseAllContent;
end;

procedure TfrmChannelSelect.FormShow(Sender: TObject);
begin
//  if Assigned(KeyboardMgr) then
//    KeyboardMgr.SetContext(kbAreaFormFFS);
end;

procedure TfrmChannelSelect.SetActiveHeader(idx: Integer);
var
  i: Integer;
begin
  // Helper Set panel mana yang Lowered (Panel Down)

  // Set panel Not Selected
  for i := 0 to High(FarrHeaderPanels) do
  begin
    FarrHeaderPanels[i].BevelInner := bvRaised;
    FarrHeaderPanels[i].BevelOuter := bvRaised;
    FarrHeaderPanels[i].Font.Color := clWindowText;
  end;

  FarrHeaderPanels[idx].BevelInner := bvLowered;
  FarrHeaderPanels[idx].BevelOuter := bvLowered;
  FarrHeaderPanels[idx].Font.Color := CBlueColor;

  FActiveIndex := idx;
end;

procedure TfrmChannelSelect.SetActiveSelectedContent;
var
  i: Integer;
begin
  // Helper Set panel mana yang Selected (Panel Selected)

  // Set panel Not Selected
  for i := 0 to High(FarrContentSelection) do
  begin
    FarrContentSelection[i].BevelInner := bvNone;
    FarrContentSelection[i].BevelOuter := bvNone;
    FarrContentSelection[i].Color := CGrayBackground;
    FarrContentSelection[i].Font.Color := clWindowText;
  end;

  FarrContentSelection[idx].BevelInner := bvNone;
  FarrContentSelection[idx].BevelOuter := bvNone;
  FarrContentSelection[idx].Color := clBlue;
  FarrContentSelection[idx].Font.Color := clWhite;

  FSelectedContentIndex := idx;
end;

procedure TfrmChannelSelect.ShowActiveContent;
begin
  CloseAllContent;

  case FActiveIndex of
    0: begin
      pnlPlanChContent.Visible := True;

      FarrContentSelection[0] := pnlPlanContent_RPSPlan;
      FarrContentSelection[1] := pnlPlanContent_WCCPlan;
    end;
    1: begin
      pnlTgtChContent.Visible := True;

      FarrContentSelection[0] := pnlTgtContent_CCS;
      FarrContentSelection[1] := pnlTgtContent_SearchRadar;
    end;
    2: begin
      pnlNavChContent.Visible := True;

      FarrContentSelection[0] := pnlNavContent_GyroCom;
      FarrContentSelection[1] := pnlNavContent_GyroNet;
    end;
  end;

  // Pindah focuse navigasi ke Panel Content
  FFocusMode := pnlUIContent;
end;

procedure TfrmChannelSelect.CloseAllContent;
begin
  pnlPlanChContent.Visible := False;
  pnlTgtChContent.Visible := False;
  pnlNavChContent.Visible := False;

  FarrContentSelection[0] := nil;
  FarrContentSelection[1] := nil;
end;

procedure TfrmChannelSelect.ActivateFrmChSelect;
begin
  FisChSelectFrmActive := True;
end;

procedure TfrmChannelSelect.DeactivateFrmChSelect;
begin
  FisChSelectFrmActive := False;
end;

procedure TfrmChannelSelect.HandleKeyDown(Key: Word; Shift: TShiftState);
begin
  case FFocusMode of
    // =========================
    // PANEL HEADER NAVIGATION
    // =========================
    pnlUIHeader: begin
      case Key of
        VK_UP:
          if FActiveIndex > 0 then
            SetActiveHeader(FActiveIndex - 1);

        VK_DOWN:
          if FActiveIndex < High(FarrHeaderPanels) then
            SetActiveHeader(FActiveIndex + 1);

        VK_RETURN:
          ShowActiveContent;

        VK_ESCAPE:
          DeactivateFrmChSelect;
      end;
    end;


    pnlUIContent: begin
      case Key of
        VK_ESCAPE: begin
          CloseAllContent;
          FFocusMode := pnlUIHeader;
        end;

        VK_UP:
          if FSelectedContentIndex > 0 then
            SetActiveSelectedContent(FSelectedContentIndex - 1);

        VK_DOWN:
          if FSelectedContentIndex < High(FarrContentSelection) then
            SetActiveSelectedContent(FSelectedContentIndex + 1);

        VK_RETURN : begin
          // eksekusi item
        end;
      end;
    end;
  end;
end;

end.
