unit uFrmParamSetting;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  uLibConst;

type
  TUIPnlFocusMode = (pnlUIHeader, pnlUIContent);

  TfrmParamSetting = class(TForm)
    {$REGION 'Components'}
    Bevel2: TBevel;
    Label51: TLabel;
    Label53: TLabel;
    pnlCaptureMode: TPanel;
    pnlSeaState: TPanel;
    pnlSeaTgtR: TPanel;
    pnlSeaTgtRContent: TPanel;
    Label6: TLabel;
    pnlTgtChContent: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    pnlSeaState_Low: TPanel;
    pnlSeaState_High: TPanel;
    pnlHeader_SeaState: TPanel;
    Panel5: TPanel;
    pnlCaptureModeContent: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlCaptureMode_Big: TPanel;
    pnlCaptureMode_Left: TPanel;
    pnlHeader_CaptureMode: TPanel;
    Panel6: TPanel;
    pnlLandTgtA: TPanel;
    pnlSeaTgtA: TPanel;
    pnlCaptureMode_Right: TPanel;
    pnlCaptureMode_Near: TPanel;
    pnlCaptureMode_Far: TPanel;
    pnlCaptureMode_Control: TPanel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel36: TPanel;
    Label40: TLabel;
    pnlSeaTgtNo: TPanel;
    lblSeaTgtNoVal: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    pnlSeaTgtRng: TPanel;
    lblSeaTgtRngVal: TLabel;
    Panel4: TPanel;
    Label10: TLabel;
    pnSeaTgtAzimuth: TPanel;
    lbSeaTgtAzimuthVal: TLabel;
    Panel8: TPanel;
    Label12: TLabel;
    pnlSeaTgtSpd: TPanel;
    lblSeaTgtSpdVal: TLabel;
    Panel10: TPanel;
    Label14: TLabel;
    pnlSeaTgtHdg: TPanel;
    lblSeaTgtHdgVal: TLabel;
    Label5: TLabel;
    lblTgtNoSea: TLabel;
    {$ENDREGION}
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FarrHeaderPnlParam: array[0..4] of TPanel;
    FActiveHeaderIdxParam: Integer;
    FFocusModeParam: TUIPnlFocusMode;

    FarrContentSelection: array[0..5] of TPanel;
    FSelectedContentIdx, 
    FSelectionContentCount: Integer;

    FisParSettingFrmActive: Boolean;  // penanda frmParamSetting sedang yang pakai fungsi Keyboard

    procedure SetActiveHeader(idx: Integer);
    procedure ShowActiveContent;
    procedure CloseAllContent;

    procedure SetActiveSelectedContent(idx: Integer);

    procedure HeaderNavigation(Delta: Integer);
    procedure ContentNavigation(Delta: Integer);
  public
    { Public declarations }
    procedure ActivateFrmParSetting;
    procedure DeactivateFrmParSetting;

    procedure HandleKeyDownParSetting(Key: Word; Shift: TShiftState);

    property isParSettingFrmActive: Boolean read FisParSettingFrmActive;
    property focusModeParSetting: TUIPnlFocusMode read FFocusModeParam;
  end;

var
  frmParamSetting: TfrmParamSetting;

implementation

{$R *.dfm}

procedure TfrmParamSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TfrmParamSetting.FormCreate(Sender: TObject);
begin
  Align := alClient;

  KeyPreview := True; // biar bisa keyboard down

  FarrHeaderPnlParam[0] := pnlCaptureMode;
  FarrHeaderPnlParam[1] := pnlSeaState;
  FarrHeaderPnlParam[2] := pnlSeaTgtR;
  FarrHeaderPnlParam[3] := pnlSeaTgtA;
  FarrHeaderPnlParam[4] := pnlLandTgtA;

  FarrContentSelection[0] := nil;
  FarrContentSelection[1] := nil;
  FarrContentSelection[2] := nil;
  FarrContentSelection[3] := nil;
  FarrContentSelection[4] := nil;
  FarrContentSelection[5] := nil;

  FActiveHeaderIdxParam := 0; // show pertama langsung panel Plan Channel
  FFocusModeParam := pnlUIHeader;  // fokus navigasi di panel Header Kiri

  SetActiveHeader(FActiveHeaderIdxParam);
  CloseAllContent;
end;

procedure TfrmParamSetting.FormShow(Sender: TObject);
begin
  //
end;

procedure TfrmParamSetting.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  HandleKeyDownParSetting(Key, Shift);
end;

procedure TfrmParamSetting.SetActiveHeader(idx: Integer);
var
  i: Integer;
begin
  // Helper Set panel mana yang Lowered (Panel Down)

  // Set panel Not Selected
  for i := 0 to High(FarrHeaderPnlParam) do
  begin
    FarrHeaderPnlParam[i].BevelInner := bvRaised;
    FarrHeaderPnlParam[i].BevelOuter := bvRaised;
    FarrHeaderPnlParam[i].Font.Color := clWindowText;
  end;

  FarrHeaderPnlParam[idx].BevelInner := bvLowered;
  FarrHeaderPnlParam[idx].BevelOuter := bvLowered;
  FarrHeaderPnlParam[idx].Font.Color := CBlueColor;

  FActiveHeaderIdxParam := idx;
end;

procedure TfrmParamSetting.SetActiveSelectedContent(idx: Integer);
var 
  i: Integer;
begin
  for i := 0 to FSelectionContentCount - 1 do
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

  FSelectedContentIdx := idx;
end;

procedure TfrmParamSetting.ShowActiveContent;
begin
  CloseAllContent;

  case FActiveHeaderIdxParam of
    0: begin
      pnlCaptureModeContent.Visible := True;

      FarrContentSelection[0] := pnlCaptureMode_Big;
      FarrContentSelection[1] := pnlCaptureMode_Left;
      FarrContentSelection[2] := pnlCaptureMode_Right;
      FarrContentSelection[3] := pnlCaptureMode_Near;
      FarrContentSelection[4] := pnlCaptureMode_Far;
      FarrContentSelection[5] := pnlCaptureMode_Control;

      FSelectionContentCount := 6;
    end;
    1: begin
      pnlTgtChContent.Visible := True;

      FarrContentSelection[0] := pnlSeaState_Low;
      FarrContentSelection[1] := pnlSeaState_High;

      FSelectionContentCount := 2;
    end;
    2: begin
      pnlSeaTgtRContent.Visible := True;

//      FarrContentSelection[0] := pnlNavContent_GyroCom;
//      FarrContentSelection[1] := pnlNavContent_GyroNet;
    end;
  end;

  // Pindah focuse navigasi ke Panel Content
  FFocusModeParam := pnlUIContent;
end;

procedure TfrmParamSetting.CloseAllContent;
var
  i: Integer;
begin
  pnlCaptureModeContent.Visible := False;
  pnlTgtChContent.Visible := False;
  pnlSeaTgtRContent.Visible := False;

  for I := 0 to High(FarrContentSelection) do 
    FarrContentSelection[i] := nil;

  FSelectionContentCount := 0;    

end;

procedure TfrmParamSetting.HeaderNavigation(Delta: Integer);
begin
  FActiveHeaderIdxParam := FActiveHeaderIdxParam + Delta;

  if FActiveHeaderIdxParam < 0 then
    FActiveHeaderIdxParam := 0
  else if FActiveHeaderIdxParam > High(FarrHeaderPnlParam) then
    FActiveHeaderIdxParam := High(FarrHeaderPnlParam);

  SetActiveHeader(FActiveHeaderIdxParam);
end;

procedure TfrmParamSetting.ContentNavigation(Delta: Integer);
begin
  if FSelectionContentCount = 0 then Exit;

  FSelectedContentIdx := FSelectedContentIdx + Delta;

  if FSelectedContentIdx < 0 then
    FSelectedContentIdx := 0
  else if FSelectedContentIdx >= FSelectionContentCount then
    FSelectedContentIdx := FSelectionContentCount - 1;

  SetActiveSelectedContent(FSelectedContentIdx);
  
end;

procedure TfrmParamSetting.HandleKeyDownParSetting(Key: Word;
  Shift: TShiftState);
begin
  case FFocusModeParam of
    pnlUIHeader:
    case Key of
      VK_UP:   
        HeaderNavigation(-1);
        
      VK_DOWN: 
        HeaderNavigation(1);

      VK_RETURN:
        ShowActiveContent;

      VK_ESCAPE:
        DeactivateFrmParSetting;
    end;
    pnlUIContent:
    case Key of
      VK_UP:   
        ContentNavigation(-1);
        
      VK_DOWN:
        ContentNavigation(1);

      VK_ESCAPE:
      begin
        CloseAllContent;
        FFocusModeParam := pnlUIHeader;
      end;
    end;
  end;
end;

procedure TfrmParamSetting.ActivateFrmParSetting;
begin
  FisParSettingFrmActive := True;
end;

procedure TfrmParamSetting.DeactivateFrmParSetting;
begin
  FisParSettingFrmActive := False;
end;

end.
