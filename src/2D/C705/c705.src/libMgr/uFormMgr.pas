unit uFormMgr;

interface

type
  TViewMode = (vmRoutePlan, vmWCC);

  procedure InitForms;
  procedure SwitchView(AMode: TViewMode);
  function IsSingleMonitor: Boolean;

implementation

uses
  System.SysUtils,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.Dialogs,
  UfrmWCC,
  UfrmRoutePlan,
  uFrmKeyboardCalcLaunch,
  uLibSettings;

{ ========================================================= }
{ Utility }
{ ========================================================= }

function IsSingleMonitor: Boolean;
begin
  Result := Screen.MonitorCount <= 1;
end;

procedure SafeShow(AForm: TForm);
begin
  if Assigned(AForm) then
  begin
    AForm.Show;
    AForm.BringToFront;
  end;
end;

procedure SafeHide(AForm: TForm);
begin
  if Assigned(AForm) then
    AForm.Hide;
end;

{ ========================================================= }
{ Public API }
{ ========================================================= }

procedure InitForms;
var
  i: Integer;
begin
  //if Application.Terminated then Exit;

  if not Assigned(frmWCC) or not Assigned(frmRoutePlan) then
    Exit;

  if VIdentSetting.ModeDebug then
  begin
    for i := 0 to Screen.MonitorCount-1 do
    begin
      ShowMessage(PChar(
        Format('Ini Monitor index %d : Left=%d, Top=%d, Width=%d, Height=%d',
        [i,
         Screen.Monitors[i].Left,
         Screen.Monitors[i].Top,
         Screen.Monitors[i].Width,
         Screen.Monitors[i].Height])));
    end;

    for i := 0 to Screen.MonitorCount-1 do
      ShowMessage(Format('Monitor index %d, Top=%d',[i,Screen.Monitors[i].Top]));
  end;

  frmRoutePlan.HandleNeeded;
  frmWCC.HandleNeeded;
  frmKeyboardCalcLaunch.HandleNeeded;

                               {
  frmRoutePlan.SetMonitor(VMonitorSetting.MoniRoutePlan,
                            VMonitorTopLeft.MonTop_Left, VMonitorTopLeft.MonTop_Top);

  frmWCC.SetMonitor(VMonitorSetting.MoniWCC,
                              VMonitorTopLeft.MonMiddle_Left, VMonitorTopLeft.MonMiddle_Top);

  frmKeyboardCalcLaunch.SetMonitor(VMonitorSetting.MoniKeyboard,
                            VMonitorTopLeft.MonMini_Left, VMonitorTopLeft.MonMini_Top);
           }
     {
  frmRoutePlan.SetTopMonitor(
    VMonitorTopLeft.MonTop_Top);
  frmWCC.SetTopMonitor(
    VMonitorTopLeft.MonMiddle_Top);
  frmKeyboardCalcLaunch.SetTopMonitor(
    VMonitorTopLeft.MonMini_Top);
    }

  //frmKeyboardCalcLaunch.SetBottomMonitor;

  {
  frmRoutePlan.Show;
  frmRoutePlan.Left := 0;
  frmRoutePlan.Top  := VMonitorTopLeft.MonTop_Top;

  if VIdentSetting.ModeDebug then
  begin
    ShowMessage(
      Format('RoutePlan Visible=%s Top=%d',
        [BoolToStr(frmRoutePlan.Visible, True),
          frmRoutePlan.Top]));
  end;

  frmWCC.Show;
  frmWCC.Left := 0;
  frmWCC.Top  := VMonitorTopLeft.MonMiddle_Top;

  frmKeyboardCalcLaunch.Show;
  frmKeyboardCalcLaunch.Left := 0;
  frmKeyboardCalcLaunch.Top  := VMonitorTopLeft.MonMini_Top;
   }

  if IsSingleMonitor then
  begin
    // Laptop atau single monitor
    frmWCC.Show;
    frmRoutePlan.Hide;
  end
  else
  begin
    // dual monitor atau di Console
    {
    frmWCC.SetMonitor(VMonitorSetting.MoniWCC,
                              VMonitorTopLeft.MonMiddle_Left, VMonitorTopLeft.MonMiddle_Top);

    frmRoutePlan.SetMonitor(VMonitorSetting.MoniRoutePlan,
                              VMonitorTopLeft.MonTop_Left, VMonitorTopLeft.MonTop_Top);

    frmKeyboardCalcLaunch.SetMonitor(VMonitorSetting.MoniKeyboard,
                              VMonitorTopLeft.MonMini_Left, VMonitorTopLeft.MonMini_Top);
                              }

    frmRoutePlan.SetTopMonitor(VMonitorTopLeft.MonTop_Top);
    frmRoutePlan.Left := Screen.Monitors[0].WorkareaRect.Left;
    frmRoutePlan.Top  := VMonitorTopLeft.MonTop_Top;

    if VIdentSetting.ModeDebug then
    begin
      ShowMessage(
        Format('RoutePlan Visible=%s Top=%d',
          [BoolToStr(frmRoutePlan.Visible, True),
            frmRoutePlan.Top]));
    end;

    frmWCC.SetTopMonitor(VMonitorTopLeft.MonMiddle_Top);
    frmWCC.Left := Screen.Monitors[0].WorkareaRect.Left;
    frmWCC.Top  := VMonitorTopLeft.MonMiddle_Top;

    frmKeyboardCalcLaunch.SetTopMonitor(VMonitorTopLeft.MonMini_Top);

    frmWCC.Show;
    frmRoutePlan.Show;

    frmKeyboardCalcLaunch.Show;
    frmKeyboardCalcLaunch.Left := Screen.Monitors[0].WorkareaRect.Left;
    frmKeyboardCalcLaunch.Top  := VMonitorTopLeft.MonMini_Top;

    frmRoutePlan.BringToFront;
  end;


end;

procedure SwitchView(AMode: TViewMode);
begin
  //if Application.Terminated then Exit;

  if not Assigned(frmWCC) or not Assigned(frmRoutePlan) then
    Exit;

  // Di dual monitor, tidak perlu switch
  if not IsSingleMonitor then
    Exit;

  case AMode of
    vmRoutePlan:
      begin
        SafeHide(frmWCC);
        SafeShow(frmRoutePlan);
      end;

    vmWCC:
      begin
        SafeHide(frmRoutePlan);
        SafeShow(frmWCC);
      end;
  end;
end;

end.
