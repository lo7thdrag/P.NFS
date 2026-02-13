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
begin
  if Application.Terminated then Exit;

  if not Assigned(frmWCC) or not Assigned(frmRoutePlan) then
    Exit;

  if IsSingleMonitor then
  begin
    // Laptop atau single monitor
    frmWCC.Show;
    frmRoutePlan.Hide;
  end
  else
  begin
    // dual monitor atau di Console
    frmWCC.SetMonitor(VMonitorSetting.MonitorKanan,
                              VMonitorTopLeft.MonBot_Left, VMonitorTopLeft.MonBot_Top);
    frmRoutePlan.SetMonitor(VMonitorSetting.MonitorKiri,
                              VMonitorTopLeft.MonTop_Left, VMonitorTopLeft.MonTop_Top);
    frmKeyboardCalcLaunch.SetMonitor(VMonitorSetting.MonitorMini,
                              VMonitorTopLeft.MonMini_Left, VMonitorTopLeft.MonMini_Top);

    frmWCC.Show;
    frmRoutePlan.Show;
    frmKeyboardCalcLaunch.Show;
  end;
end;

procedure SwitchView(AMode: TViewMode);
begin
  if Application.Terminated then Exit;

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
