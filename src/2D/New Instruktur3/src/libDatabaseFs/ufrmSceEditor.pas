unit ufrmSceEditor;

interface

uses
  {windows / Component uses}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Math, AdvSmoothButton, Menus, AdvListV,
  AdvPageControl, AdvSmoothTabPager, AdvSmoothPanel, CurvyControls,
  AdvSmoothLabel,
  jpeg,

  {lib uses}
  ufrmShipEditor, ufListScenario, uClassDatabase, uDataModule, uInstrukturManager,
  uInstrukturObjects, uSimulationManager, uTCPDatatype, uBaseConstan,
  uBaseFunction,
  ufEnvi, uGlobalVar, VrControls, VrWheel;

type
  TfrmSceEditor = class(TForm)
    pmConsole: TPopupMenu;
    pmConsole2: TPopupMenu;
    pnlMain: TAdvSmoothPanel;
    pnlGeneral: TAdvSmoothPanel;
    pnlMainBottom: TAdvSmoothPanel;
    pnlPlatform: TAdvSmoothPanel;
    pnlPicture: TAdvSmoothPanel;
    TabSelection: TAdvSmoothTabPager;
    tsShipKRI: TAdvSmoothTabPage;
    tsShipTarget: TAdvSmoothTabPage;
    tsShipGeneral: TAdvSmoothTabPage;
    tsMargin: TAdvSmoothTabPage;
    tsConsoleRun: TAdvSmoothTabPage;
    btnAddWarShip: TAdvSmoothButton;
    btnRemoveWarShip: TAdvSmoothButton;
    btnWeaponList: TAdvSmoothButton;
    btnRemoveGnrShip: TAdvSmoothButton;
    btnAddGnrShip: TAdvSmoothButton;
    TabTargetShip: TAdvSmoothTabPager;
    tsSurface: TAdvSmoothTabPage;
    tsSubsurface: TAdvSmoothTabPage;
    tsAir: TAdvSmoothTabPage;
    btnEditDatabase: TAdvSmoothButton;
    cbbPort: TComboBox;
    btnPortMore: TAdvSmoothButton;
    edtScenarioName: TCurvyEdit;
    mmoKetSce: TMemo;
    btnSaveScenario: TAdvSmoothButton;
    btnSetPosition: TAdvSmoothButton;
    advsmthlbl1: TAdvSmoothLabel;
    advsmthlbl2: TAdvSmoothLabel;
    advsmthlbl3: TAdvSmoothLabel;
    btnAddTargetSubsurface: TAdvSmoothButton;
    btnRemoveTargetSubsurface: TAdvSmoothButton;
    btnAddTargetAir: TAdvSmoothButton;
    btnRemoveTargetAir: TAdvSmoothButton;
    imgShip: TImage;
    btnWeaponListGeneral: TAdvSmoothButton;
    pnlScenarioList: TAdvSmoothPanel;
    lvWarShipAll: TListView;
    AdvSmoothPanel1: TAdvSmoothPanel;
    lvWarShipSelect: TListView;
    lvWeaponSelected: TListView;
    AdvSmoothLabel1: TAdvSmoothLabel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvSmoothPanel5: TAdvSmoothPanel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    AdvSmoothPanel6: TAdvSmoothPanel;
    AdvSmoothPanel7: TAdvSmoothPanel;
    lvTargetSubsurfaceAll: TListView;
    Label2: TLabel;
    lvTargetSubsurfaceSelect: TListView;
    lvTargetAirAll: TListView;
    Label3: TLabel;
    lvTargetAirSelect: TListView;
    AdvSmoothPanel9: TAdvSmoothPanel;
    AdvSmoothPanel8: TAdvSmoothPanel;
    lvGeneralShipAll: TListView;
    lvGeneralShipSelect: TListView;
    AdvSmoothPanel10: TAdvSmoothPanel;
    lvConsole: TListView;
    Label5: TLabel;
    pnlEnvirontment: TAdvSmoothPanel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    AdvSmoothLabel4: TAdvSmoothLabel;
    AdvSmoothLabel5: TAdvSmoothLabel;
    advsmthlbl4: TAdvSmoothLabel;
    AdvSmoothLabel14: TAdvSmoothLabel;
    AdvSmoothLabel15: TAdvSmoothLabel;
    advsmthlbl5: TAdvSmoothLabel;
    advsmthlbl7: TAdvSmoothLabel;
    advsmthlbl6: TAdvSmoothLabel;
    advsmthlbl8: TAdvSmoothLabel;
    tbFogH: TTrackBar;
    tbHumidity: TTrackBar;
    tbBaroPressure: TTrackBar;
    tbTemp: TTrackBar;
    vrwhlSeaDirection: TVrWheel;
    vrwhlWindDirec: TVrWheel;
    tbSeaSpeed: TTrackBar;
    tbWindSpeed: TTrackBar;
    tbSeaState: TTrackBar;
    Label62: TLabel;
    AdvSmoothPanel12: TAdvSmoothPanel;
    Label6: TLabel;
    AdvSmoothPanel11: TAdvSmoothPanel;
    Label7: TLabel;
    AdvSmoothPanel13: TAdvSmoothPanel;
    Label8: TLabel;
    edtBaroPressure: TEdit;
    edtHumidity: TEdit;
    edtFogH: TEdit;
    edtTemp: TEdit;
    edtSeaSpeed: TEdit;
    edtWindSpeed: TEdit;
    edtSeaState: TEdit;
    AdvSmoothLabel6: TAdvSmoothLabel;
    AdvSmoothButton1: TAdvSmoothButton;
    AdvSmoothLabel7: TAdvSmoothLabel;
    AdvSmoothLabel8: TAdvSmoothLabel;
    AdvSmoothPanel3: TAdvSmoothPanel;
    lvTargetShipAll: TListView;
    AdvSmoothPanel4: TAdvSmoothPanel;
    lvTargetSurfaceSelect: TListView;
    btnAddTargetSurface: TAdvSmoothButton;
    btnRemoveTargetSurface: TAdvSmoothButton;
    btnWeaponListTarget: TAdvSmoothButton;
    AdvSmoothLabel10: TAdvSmoothLabel;
    AdvSmoothLabel11: TAdvSmoothLabel;
    AdvSmoothLabel9: TAdvSmoothLabel;
    edtSeaDirection: TEdit;
    edtWindDirec: TEdit;
    procedure btnWeaponListClick(Sender: TObject);
    procedure btnEditDatabaseClick(Sender: TObject);
    procedure lvGeneralShipAllClick(Sender: TObject);
    procedure lvGeneralShipSelectClick(Sender: TObject);
    procedure btnSetPositionClick(Sender: TObject);
    procedure btnSaveScenarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPortMoreClick(Sender: TObject);
    procedure cbbPortCloseUp(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlMainClick(Sender: TObject);
    procedure lvConsoleDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEnableWeaponClick(Sender: TObject);
    procedure lvWeaponSelectedClick(Sender: TObject);
    procedure lvConsoleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TabSelectionChange(Sender: TObject);
    procedure TabTargetShipChange(Sender: TObject);
    procedure pnlMainBottomClick(Sender: TObject);
    procedure AdvSmoothButton1Click(Sender: TObject);
    procedure tbSeaStateChange(Sender: TObject);
    procedure edtSeaStateKeyPress(Sender: TObject; var Key: Char);
    procedure tbWindSpeedChange(Sender: TObject);
    procedure edtWindSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure tbSeaSpeedChange(Sender: TObject);
    procedure edtSeaSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure tbTempChange(Sender: TObject);
    procedure edtTempKeyPress(Sender: TObject; var Key: Char);
    procedure tbBaroPressureChange(Sender: TObject);
    procedure edtBaroPressureKeyPress(Sender: TObject; var Key: Char);
    procedure tbHumidityChange(Sender: TObject);
    procedure edtHumidityKeyPress(Sender: TObject; var Key: Char);
    procedure tbFogHChange(Sender: TObject);
    procedure edtFogHKeyPress(Sender: TObject; var Key: Char);
    procedure vrwhlWindDirecChange(Sender: TObject);
    procedure edtWindDirecKeyPress(Sender: TObject; var Key: Char);
    procedure edtSeaDirectionKeyPress(Sender: TObject; var Key: Char);
    procedure vrwhlSeaDirectionChange(Sender: TObject);


  private
    { Private declarations }
    Ship_ID: Integer;
    Ship_Name: string;
    ship_MaxSpeed: Integer;

    ListViewFocusTag: Integer;

    procedure ClearListViewData(const aListView: TListView);

    procedure SetObjectCreate;
    procedure setPos(Sender: TObject);

    function IsMenuItemExist(const shipID: Integer): boolean;
    function IsMenuItem2Exist(const shipID: Integer): boolean;

    procedure AddMenuWithShipID(const shipID: Integer);
    procedure DeleteMenuWithShipID(const shipID: Integer);
    procedure PopupMenuClick(Sender: TObject);
    procedure PopupMenuClick2(Sender: TObject);

    procedure ListViewAdd(aListView, aListView2: TListView; aVehicle: TVehicle;
      aMode: Integer);
    procedure ListViewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: boolean);
    procedure ListViewDblClick(Sender: TObject);
    procedure ListViewClick(Sender: TObject);
    procedure ButtonAddShip(Sender: TObject);
    procedure ButtonRemoveShip(Sender: TObject);
  public
    { Public declarations }

    isNew: boolean;

    ScenarioName: string;
    Scenario_ID: Integer;
    MAP_ID: Integer;

    WeaponListScenario: TList;

    LastName: string;

    function CekInput: boolean;

    procedure ClearWeaponListScenario;
    procedure FillWeaponList(shipID: Integer);
    procedure UpdateWeaponList(shipID, SceID: Integer);
    procedure DeleteWeaponList(shipID: Integer);
    procedure ShowWeaponOnShip(shipID: Integer);

    procedure GetAllVehicle;
    procedure UpdateVisualForm;
    procedure ClearVisualForm;

    procedure setVelueVehicle(var ShipTemp : TVehicle; Vehicle: TVehicle);

    procedure UpdateListViewCoor(const Mx, My: Double; shipID: Integer);
    procedure UpdateListViewHeading(const Heading: Double; shipID: Integer);
    procedure UpdateListViewDepth(const Depth: Double; shipID: Integer);
    procedure updateListViewSpeed(const Speed: Double; shipID: Integer);

    procedure SetFormLayout;
    procedure SetFormEnvironment;
  end;

var
  frmSceEditor: TfrmSceEditor;

implementation

uses
  ufrmMainInstruktur, ufrmGameController;

{$R *.dfm}

function DeleteAmpersand(Value: string): string;
var
  i: Integer;
  found: boolean;
begin
  i := -1;
  found := false;

  for i := 0 to Length(Value) - 1 do
  begin
    if Value[i] = '&' then
    begin
      found := true;
      break;
    end;
  end;

  if found then
    Delete(Value, i, 1);
  result := Value;
end;

{ -------------------------------------------------------------------------- }
{ Form Setting }
procedure TfrmSceEditor.SetFormEnvironment;
begin
//  TabSelection.TabSettings.Width := (TabSelection.Width - 10) div 3;

  { Ship KRI }
//  lvWarShipAll.Height := tsShipKRI.Height - 20;
//  lvWarShipAll.Left := 10;
//  lvWarShipAll.Top := 10;
//  lvWarShipSelect.Height := tsShipKRI.Height - 20;
//  lvWarShipSelect.Width := tsShipKRI.Width - 50 - lvWarShipAll.Width -
//    lvWeaponSelected.Width - btnAddWarShip.Width;
//  lvWarShipSelect.Left := 30 + btnAddWarShip.Width + lvWarShipAll.Width;
//  lvWarShipSelect.Top := 10;
//  lvWeaponSelected.Left := 40 + lvWarShipSelect.Width + lvWarShipAll.Width +
//    btnAddWarShip.Width;
//  lvWeaponSelected.Top := 10;
//  btnEnableWeapon.Left := lvWeaponSelected.Left;
//  btnAddWarShip.Top := tsShipKRI.Height div 2 - btnAddWarShip.Height;
//  btnAddWarShip.Left := 20 + lvWarShipAll.Width;
//  btnRemoveWarShip.Top := btnAddWarShip.Top + btnAddWarShip.Height + 5;
//  btnRemoveWarShip.Left := 20 + lvWarShipAll.Width;
//  btnWeaponList.Top := tsShipKRI.Height - 20 - btnWeaponList.Height;
//  btnWeaponList.Left := 20 + lvWarShipAll.Width;
//
//  btnWeaponListTarget.Top := tsShipKRI.Height - 45 - btnWeaponListTarget.Height;
//  btnWeaponListTarget.Left := 20 + lvTargetSurfaceAll.Width;
//
//  btnWeaponListGeneral.Top := tsShipKRI.Height - 20 -
//    btnWeaponListGeneral.Height;
//  btnWeaponListGeneral.Left := 20 + lvTargetSurfaceAll.Width;

  { Ship General }
//  lvGeneralShipAll.Height := tsShipGeneral.Height - 20;
//  lvGeneralShipAll.Left := 10;
//  lvGeneralShipAll.Top := 10;
//  lvGeneralShipSelect.Height := tsShipGeneral.Height - 20;
//  lvGeneralShipSelect.Width := tsShipGeneral.Width - 40 - lvGeneralShipAll.Width
//    - btnAddWarShip.Width;
//  lvGeneralShipSelect.Left := 30 + btnAddGnrShip.Width + lvGeneralShipAll.Width;
//  lvGeneralShipSelect.Top := 10;
//  btnAddGnrShip.Top := tsShipGeneral.Height div 2 - btnAddWarShip.Height;
//  btnAddGnrShip.Left := 20 + lvGeneralShipAll.Width;
//  btnRemoveGnrShip.Top := btnAddGnrShip.Top + btnAddGnrShip.Height + 5;
//  btnRemoveGnrShip.Left := 20 + lvGeneralShipAll.Width;

  { Target Surface }
//  lvTargetSurfaceAll.Height := tsSurface.Height - 20;
//  lvTargetSurfaceAll.Left := 10;
//  lvTargetSurfaceAll.Top := 10;
//  lvTargetSurfaceSelect.Height := tsSurface.Height - 20;
//  lvTargetSurfaceSelect.Width := tsSurface.Width - 40 - lvTargetSurfaceAll.Width
//    - btnAddTargetSurface.Width;
//  lvTargetSurfaceSelect.Left := 30 + btnAddTargetSurface.Width +
//    lvTargetSurfaceAll.Width;
//  lvTargetSurfaceSelect.Top := 10;
//  btnAddTargetSurface.Top := tsSurface.Height div 2 -
//    btnAddTargetSurface.Height;
//  btnAddTargetSurface.Left := 20 + lvTargetSurfaceAll.Width;
//  btnRemoveTargetSurface.Top := btnAddTargetSurface.Top +
//    btnAddTargetSurface.Height + 5;
//  btnRemoveTargetSurface.Left := 20 + lvTargetSurfaceAll.Width;

  { Target Subsurface }
//  lvTargetSubsurfaceAll.Height := tsSubsurface.Height - 20;
//  lvTargetSubsurfaceAll.Left := 10;
//  lvTargetSubsurfaceAll.Top := 10;
//  lvTargetSubsurfaceSelect.Height := tsSubsurface.Height - 20;
//  lvTargetSubsurfaceSelect.Width := tsSubsurface.Width - 40 -
//    lvTargetSubsurfaceAll.Width - btnAddTargetSubsurface.Width;
//  lvTargetSubsurfaceSelect.Left := 30 + btnAddTargetSubsurface.Width +
//    lvTargetSubsurfaceAll.Width;
//  lvTargetSubsurfaceSelect.Top := 10;
//  btnAddTargetSubsurface.Top := tsSubsurface.Height div 2 -
//    btnAddTargetSubsurface.Height;
//  btnAddTargetSubsurface.Left := 20 + lvTargetSubsurfaceAll.Width;
//  btnRemoveTargetSubsurface.Top := btnAddTargetSubsurface.Top +
//    btnAddTargetSubsurface.Height + 5;
//  btnRemoveTargetSubsurface.Left := 20 + lvTargetSubsurfaceAll.Width;

  { Target Air }
//  lvTargetAirAll.Height := tsAir.Height - 20;
//  lvTargetAirAll.Left := 10;
//  lvTargetAirAll.Top := 10;
//  lvTargetAirSelect.Height := tsAir.Height - 20;
//  lvTargetAirSelect.Width := tsAir.Width - 40 - lvTargetAirAll.Width -
//    btnAddTargetAir.Width;
//  lvTargetAirSelect.Left := 30 + btnAddTargetAir.Width + lvTargetAirAll.Width;
//  lvTargetAirSelect.Top := 10;
//  btnAddTargetAir.Top := tsAir.Height div 2 - btnAddTargetAir.Height;
//  btnAddTargetAir.Left := 20 + lvTargetAirAll.Width;
//  btnRemoveTargetAir.Top := btnAddTargetAir.Top + btnAddTargetAir.Height + 5;
//  btnRemoveTargetAir.Left := 20 + lvTargetAirAll.Width;
//
//  lvWarShipSelect.Columns[5].Width := 80;
//  lvWarShipSelect.Columns[0].Width := lvWarShipSelect.Width - 20 -
//    lvWarShipSelect.Columns[1].Width - lvWarShipSelect.Columns[2].Width -
//    lvWarShipSelect.Columns[3].Width - lvWarShipSelect.Columns[4].Width -
//    lvWarShipSelect.Columns[5].Width;
//
//  lvGeneralShipSelect.Columns[5].Width := 80;
//  lvGeneralShipSelect.Columns[0].Width := lvGeneralShipSelect.Width - 20 -
//    lvGeneralShipSelect.Columns[1].Width - lvGeneralShipSelect.Columns[2].Width
//    - lvGeneralShipSelect.Columns[3].Width - lvGeneralShipSelect.Columns[4]
//    .Width - lvGeneralShipSelect.Columns[5].Width;
//
//  lvTargetSurfaceSelect.Columns[5].Width := 80;
//  lvTargetSurfaceSelect.Columns[0].Width := lvTargetSurfaceSelect.Width - 20 -
//    lvTargetSurfaceSelect.Columns[1].Width - lvTargetSurfaceSelect.Columns[2]
//    .Width - lvTargetSurfaceSelect.Columns[3].Width -
//    lvTargetSurfaceSelect.Columns[4].Width -
//    lvTargetSurfaceSelect.Columns[5].Width;
//
//  lvTargetSubsurfaceSelect.Columns[5].Width := 80;
//  lvTargetSubsurfaceSelect.Columns[0].Width := lvTargetSubsurfaceSelect.Width -
//    20 - lvTargetSubsurfaceSelect.Columns[1].Width -
//    lvTargetSubsurfaceSelect.Columns[2].Width - lvTargetSubsurfaceSelect.Columns
//    [3].Width - lvTargetSubsurfaceSelect.Columns[4].Width -
//    lvTargetSubsurfaceSelect.Columns[5].Width;
//
//  lvTargetAirSelect.Columns[5].Width := 80;
//  lvTargetAirSelect.Columns[0].Width := lvTargetAirSelect.Width - 20 -
//    lvTargetAirSelect.Columns[1].Width - lvTargetAirSelect.Columns[2].Width -
//    lvTargetAirSelect.Columns[3].Width - lvTargetAirSelect.Columns[4].Width -
//    lvTargetAirSelect.Columns[5].Width;
end;
{ -------------------------------------------------------------------------- }

{ -------------------------------------------------------------------------- }
{ Listview Event Handler }
procedure TfrmSceEditor.ListViewAdd(aListView, aListView2: TListView; aVehicle: TVehicle; aMode: Integer);
var
  i: Integer;
  Ship: TInsObject;

begin

  case aMode of
    1: {Add to list}
      begin
        {$REGION ' Add vehicle ke list vehicle on scenario '}

        with aListView.Items.Add do
        begin
          Data := aVehicle;
          Caption := aVehicle.Vehicle_Name;

          case aVehicle.Vehicle_Type of
            1: SubItems.Add('Surface');
            2: SubItems.Add('Air');
            3: SubItems.Add('Subsurface');
          end;

          SubItems.Add(ConvLL_To_Str(0, '0'));
          SubItems.Add(ConvLL_To_Str(0, '1'));
          SubItems.Add('0');
          SubItems.Add('90');
          SubItems.Add('0');
        end;

        {$ENDREGION}

        {$REGION ' Add list weapon on vehicle '}

        FillWeaponList(aVehicle.Vehicle_ID);

        {$ENDREGION}

        {$REGION ' create ship for drawing '}

        SimManager.CreateShipForDatabse(aVehicle.Vehicle_ID);
        AddMenuWithShipID(aVehicle.Vehicle_ID);

        {$ENDREGION}

        {$REGION ' Delete vehicle from list available vehicle '}

        for i := aListView2.Items.Count - 1 downto 0 do
        begin
          if Assigned(aListView2.Items[i].Data) then
          begin
            if TVehicle(aListView2.Items[i].Data).Vehicle_ID = aVehicle.Vehicle_ID
            then
            begin
              aListView2.Items[i].Delete;
              break;
            end;
          end;
        end;

        {$ENDREGION}
      end;

    2: {Remove}
      begin

        {$REGION ' Remove vehicle from list vehicle on scenario '}
        with aListView.Items.Add do
        begin
          Data := aVehicle;
          Caption := aVehicle.Vehicle_Name;

          case aVehicle.Vehicle_Type of
            1: SubItems.Add('Surface');
            2: SubItems.Add('Air');
            3: SubItems.Add('Subsurface');
          end;
        end;
        {$ENDREGION}

        for i := 0 to SimManager.MainObjList.ItemCount - 1 do
        begin
          Ship := SimManager.MainObjList.getObject(i) as TInsObject;
          if Ship.FDataBaseID = aVehicle.Vehicle_ID then
          begin
            SimManager.MainObjList.RemoveObject(Ship);
            break;
          end;
        end;

        DeleteMenuWithShipID(aVehicle.Vehicle_ID);

        { Delete Weapon }
        DeleteWeaponList(aVehicle.Vehicle_ID);
        lvWeaponSelected.Items.Clear;

        { Delete Lvconcole if assigned in deleted ship }
        for i := 0 to lvConsole.Items.Count - 1 do
        begin
          if lvConsole.Items[i].SubItems[5] = IntToStr(aVehicle.Vehicle_ID) then
          begin
            lvConsole.Items[i].SubItems[4] := '';
            lvConsole.Items[i].SubItems[5] := '';
            lvConsole.Items[i].SubItems[6] := '';

            break;
          end;
        end;

        for i := aListView2.Items.Count - 1 downto 0 do
        begin
          if Assigned(aListView2.Items[i].Data) then
          begin
            if TVehicle(aListView2.Items[i].Data).Vehicle_ID = aVehicle.Vehicle_ID
            then
            begin
              aListView2.Items[i].Delete;
              break;
            end;
          end;
        end;
      end;

    3: {Edit}
      begin
        {$REGION ' Add vehicle ke list vehicle on scenario '}

        with aListView.Items.Add do
        begin
          Data := aVehicle;
          Caption := aVehicle.Vehicle_Name;

          case aVehicle.Vehicle_Type of
            1: SubItems.Add('Surface');
            2: SubItems.Add('Air');
            3: SubItems.Add('Subsurface');
          end;

          SubItems.Add(ConvLL_To_Str(aVehicle.Vehicle_X, '0'));
          SubItems.Add(ConvLL_To_Str(aVehicle.Vehicle_Y, '1'));
          SubItems.Add(FloatToStr(aVehicle.Vehicle_Z));
          SubItems.Add(FloatToStr(aVehicle.Vehicle_Heading));
          SubItems.Add(FloatToStr(aVehicle.Vehicle_Speed));
        end;

        {$ENDREGION}

        {$REGION ' create ship for drawing '}
        SimManager.CreateShipForDatabse(aVehicle.Vehicle_ID);
        AddMenuWithShipID(aVehicle.Vehicle_ID);
        {$ENDREGION}

        { update caption }
        for i := 0 to SimManager.MainObjList.ItemCount - 1 do
        begin
          Ship := SimManager.MainObjList.getObject(i) as TInsObject;
          if Ship.FDataBaseID = aVehicle.Vehicle_ID then
          begin
            Ship.PositionX := aVehicle.Vehicle_X;
            Ship.PositionY := aVehicle.Vehicle_Y;
            Ship.PositionZ := aVehicle.Vehicle_Z;
            Ship.Course := aVehicle.Vehicle_Heading;
            Ship.Speed := aVehicle.Vehicle_Speed;
            break;
          end;
        end;

        { fill Weapon }
        FillWeaponList(aVehicle.Vehicle_ID);

        for i := aListView2.Items.Count - 1 downto 0 do
        begin
          if Assigned(aListView2.Items[i].Data) then
          begin
            if TVehicle(aListView2.Items[i].Data).Vehicle_ID = aVehicle.Vehicle_ID
            then
            begin
              aListView2.Items[i].Delete;
              break;
            end;
          end;
        end;
      end;
  end;
end;

procedure TfrmSceEditor.ListViewClick(Sender: TObject);
var
  ShipDetail: TVehicle;
begin
  { Add Button }
  btnAddWarShip.Enabled := false;
  btnAddGnrShip.Enabled := false;
  btnAddTargetSurface.Enabled := false;
  btnAddTargetSubsurface.Enabled := false;
  btnAddTargetAir.Enabled := false;
  { Remove Button }
  btnRemoveWarShip.Enabled := false;
  btnRemoveGnrShip.Enabled := false;
  btnRemoveTargetSurface.Enabled := false;
  btnRemoveTargetSubsurface.Enabled := false;
  btnRemoveTargetAir.Enabled := false;

  lvWeaponSelected.Items.Clear;
  ListViewFocusTag := TComponent(Sender).Tag;

  if TListView(Sender).Selected <> nil then
  begin
    case TComponent(Sender).Tag of
      1:
        btnAddWarShip.Enabled := true;
      3:
        btnAddGnrShip.Enabled := true;
      5:
        btnAddTargetSurface.Enabled := true;
      7:
        btnAddTargetSubsurface.Enabled := true;
      9:
        btnAddTargetAir.Enabled := true;

      2:
        begin
          btnRemoveWarShip.Enabled := true;

          if Assigned(TListView(Sender).Selected.Data) then
          begin
            ShipDetail := TVehicle(TListView(Sender).Selected.Data);
            ShowWeaponOnShip(ShipDetail.Vehicle_ID);
            setPos(Sender);
          end;
        end;

      4:
        begin
          btnRemoveGnrShip.Enabled := true;
          if Assigned(TListView(Sender).Selected.Data) then
          begin
            setPos(Sender);
          end;
        end;

      6:
        begin
          btnRemoveTargetSurface.Enabled := true;
          if Assigned(TListView(Sender).Selected.Data) then
          begin
            setPos(Sender);
          end;
        end;

      8:
        begin
          btnRemoveTargetSubsurface.Enabled := true;
          if Assigned(TListView(Sender).Selected.Data) then
          begin
            setPos(Sender);
          end;
        end;

      10:
        begin
          btnRemoveTargetAir.Enabled := true;
          if Assigned(TListView(Sender).Selected.Data) then
          begin
            setPos(Sender);
          end;

        end;

    end;
  end;
end;

procedure TfrmSceEditor.setPos(Sender: TObject);
var
  ShipDetail: TVehicle;
  Ship: TInsObject;
  i: Integer;
begin
  if Assigned(TListView(Sender).Selected) and Assigned(TListView(Sender).Selected.Data) then begin
    ShipDetail := TVehicle(TListView(Sender).Selected.Data);
    SimManager.DatabaseObject := nil;
    for i := 0 to SimManager.MainObjList.ItemCount - 1 do
    begin
      Ship := SimManager.MainObjList.getObject(i) as TInsObject;

      if ShipDetail.Vehicle_ID = Ship.FDataBaseID then
      begin
        SimManager.DatabaseObject := Ship;
        frmMainInstruktur.MainMap.CurrentTool := TOOL_DATABASE_POS;
      end;
    end;
  end;
end;

procedure TfrmSceEditor.setVelueVehicle(var ShipTemp: TVehicle; Vehicle: TVehicle);
begin
  ShipTemp.Vehicle_ID := Vehicle.Vehicle_ID;
  ShipTemp.Vehicle_Name := Vehicle.Vehicle_Name;
  ShipTemp.Vehicle_Ctgr := Vehicle.Vehicle_Ctgr;
  ShipTemp.Vehicle_No := Vehicle.Vehicle_No;
  ShipTemp.Vehicle_Type := Vehicle.Vehicle_Type;
  ShipTemp.Vehicle_X := Vehicle.Vehicle_X;
  ShipTemp.Vehicle_Y := Vehicle.Vehicle_Y;
  ShipTemp.Vehicle_Z := Vehicle.Vehicle_Z;
  ShipTemp.Vehicle_Heading := Vehicle.Vehicle_Heading;
  ShipTemp.Vehicle_Speed := Vehicle.Vehicle_Speed;
  ShipTemp.Vehicle_Maxspeed := Vehicle.Vehicle_Maxspeed;
end;

procedure TfrmSceEditor.ListViewCompare(Sender: TObject;
  Item1, Item2: TListItem; Data: Integer; var Compare: Integer);
var
  intItem1, intItem2: Integer;
begin
  if Assigned(Item1.Data) and Assigned(Item2.Data) then begin
    intItem1 := TVehicle(Item1.Data).Vehicle_ID;
    intItem2 := TVehicle(Item2.Data).Vehicle_ID;

    if intItem1 < intItem2 then
      Compare := -1
    else if intItem1 > intItem2 then
      Compare := 1
    else
      Compare := 0;
  end;
end;

procedure TfrmSceEditor.ListViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: boolean);
var
  strPicture: string;
begin
  if (TListView(Sender).Selected <> nil) and
    Assigned(TListView(Sender).Selected.Data) then
  begin
    Ship_ID := TVehicle(TListView(Sender).Selected.Data).Vehicle_ID;
    Ship_Name := TVehicle(TListView(Sender).Selected.Data).Vehicle_Name;

    strPicture := '..\Data\imageship\' +
      TVehicle(TListView(Sender).Selected.Data).Vehicle_Name + '.jpg';

    case TComponent(Sender).Tag of
      1:
        lvWarShipSelect.Selected := nil;
      3:
        lvGeneralShipSelect.Selected := nil;
      5:
        lvTargetSurfaceSelect.Selected := nil;
      7:
        lvTargetSubsurfaceSelect.Selected := nil;
      9:
        lvTargetAirSelect.Selected := nil;

      2:
        lvWarShipAll.Selected := nil;
      4:
        lvGeneralShipAll.Selected := nil;
      6:
        lvTargetShipAll.Selected := nil;
      8:
        lvTargetSubsurfaceAll.Selected := nil;
      10:
        lvTargetAirAll.Selected := nil;
    end;

    if FileExists(strPicture) then
    begin
      imgShip.Picture.LoadFromFile(strPicture);
      frmShipEditor.imgShip.Picture.LoadFromFile(strPicture);
    end;
  end;
end;

procedure TfrmSceEditor.ListViewDblClick(Sender: TObject);
var
  ShipDetail: TVehicle;
begin
  frmMainInstruktur.SetDefaultMapTool;

  if (TListView(Sender).Selected <> nil) and Assigned(TListView(Sender).Selected.Data) then
  begin
    ShipDetail := TVehicle.Create;
    ShipDetail := TVehicle(TListView(Sender).Selected.Data);
//    ShipDetail := TVehicle.Create;
//    ShipDetail.Vehicle_ID := TVehicle(TListView(Sender).Selected.Data).Vehicle_ID;
//    ShipDetail.Vehicle_Name := TVehicle(TListView(Sender).Selected.Data).Vehicle_Name;
//    ShipDetail.Vehicle_Ctgr := TVehicle(TListView(Sender).Selected.Data).Vehicle_Ctgr;
//    ShipDetail.Vehicle_No := TVehicle(TListView(Sender).Selected.Data).Vehicle_No;

    case TListView(Sender).Tag of
      { Add To Selected }
      { listView Warship all }
      1:
        ListViewAdd(lvWarShipSelect, lvWarShipAll, ShipDetail, 1);
      { listView General all }
      3:
        ListViewAdd(lvGeneralShipSelect, lvGeneralShipAll, ShipDetail, 1);
      { listView Surface all }
      5:
        ListViewAdd(lvTargetSurfaceSelect, lvTargetShipAll, ShipDetail, 1);
      { listView Subsurface all }
      7:
        ListViewAdd(lvTargetSubsurfaceSelect, lvTargetSubsurfaceAll,
          ShipDetail, 1);
      { listView Air all }
      9:
        ListViewAdd(lvTargetAirSelect, lvTargetAirAll, ShipDetail, 1);

      { Back To Available }
      { listView Warship Select }
      2:
        ListViewAdd(lvWarShipAll, lvWarShipSelect, ShipDetail, 2);
      { listView General Select }
      4:
        ListViewAdd(lvGeneralShipAll, lvGeneralShipSelect, ShipDetail, 2);
      { listView Surface Select }
      6:
        ListViewAdd(lvTargetShipAll, lvTargetSurfaceSelect, ShipDetail, 2);
      { listView Subsurface Select }
      8:
        ListViewAdd(lvTargetSubsurfaceAll, lvTargetSubsurfaceSelect,
          ShipDetail, 2);
      { listView Air Select }
      10:
        ListViewAdd(lvTargetAirAll, lvTargetAirSelect, ShipDetail, 2);
    end;
  end;
end;

procedure TfrmSceEditor.ButtonAddShip(Sender: TObject);
var
  ii, cnt: Integer;
  isselected: boolean;
  aListItem, selectedListItem: TListItem;

  ShipDetail: TVehicle;
begin
  TAdvSmoothButton(Sender).Enabled := false;

  { MULTI SELECTION }
  repeat
    isselected := false;

    case TComponent(Sender).Tag of
      1:
        cnt := lvWarShipAll.Items.Count;
      3:
        cnt := lvGeneralShipAll.Items.Count;
      5:
        cnt := lvTargetShipAll.Items.Count;
      7:
        cnt := lvTargetSubsurfaceAll.Items.Count;
      9:
        cnt := lvTargetAirAll.Items.Count;
    end;

    for ii := 0 to cnt - 1 do
    begin
      case TComponent(Sender).Tag of
        1:
          aListItem := lvWarShipAll.Items[ii];
        3:
          aListItem := lvGeneralShipAll.Items[ii];
        5:
          aListItem := lvTargetShipAll.Items[ii];
        7:
          aListItem := lvTargetSubsurfaceAll.Items[ii];
        9:
          aListItem := lvTargetAirAll.Items[ii];
      end;

      if aListItem.Selected then
      begin
        isselected := aListItem.Selected;
        selectedListItem := aListItem;
        break;
      end;
    end;
    if Assigned(selectedListItem.Data) then
    begin
      if isselected then
      begin
        ShipDetail := TVehicle.Create;
        ShipDetail := TVehicle(selectedListItem.Data);

        case TComponent(Sender).Tag of
          1:
            ListViewAdd(lvWarShipSelect, lvWarShipAll, ShipDetail, 1);
          3:
            ListViewAdd(lvGeneralShipSelect, lvGeneralShipAll, ShipDetail, 1);
          5:
            ListViewAdd(lvTargetSurfaceSelect, lvTargetShipAll, ShipDetail, 1);
          7:
            ListViewAdd(lvTargetSubsurfaceSelect, lvTargetSubsurfaceAll, ShipDetail, 1);
          9:
            ListViewAdd(lvTargetAirSelect, lvTargetAirAll, ShipDetail, 1);

        end;
      end;
    end;

  until not isselected;
end;

procedure TfrmSceEditor.ButtonRemoveShip(Sender: TObject);
var
  ii, cnt: Integer;
  isselected: boolean;
  aListItem, selectedListItem: TListItem;

  ShipDetail: TVehicle;
begin
  frmMainInstruktur.SetDefaultMapTool;
  TAdvSmoothButton(Sender).Enabled := false;

  { MULTI SELECTION }
  repeat
    isselected := false;

    case TComponent(Sender).Tag of
      2:
        cnt := lvWarShipSelect.Items.Count;
      4:
        cnt := lvGeneralShipSelect.Items.Count;
      6:
        cnt := lvTargetSurfaceSelect.Items.Count;
      8:
        cnt := lvTargetSubsurfaceSelect.Items.Count;
      10:
        cnt := lvTargetAirSelect.Items.Count;
    end;

    for ii := 0 to cnt - 1 do
    begin
      case TComponent(Sender).Tag of
        2:
          aListItem := lvWarShipSelect.Items[ii];
        4:
          aListItem := lvGeneralShipSelect.Items[ii];
        6:
          aListItem := lvTargetSurfaceSelect.Items[ii];
        8:
          aListItem := lvTargetSubsurfaceSelect.Items[ii];
        10:
          aListItem := lvTargetAirSelect.Items[ii];
      end;

      if aListItem.Selected then
      begin
        isselected := aListItem.Selected;
        selectedListItem := aListItem;
        break;
      end;
    end;

    if Assigned(selectedListItem.Data) then
    begin
      if isselected then
      begin
        ShipDetail := TVehicle.Create;
        ShipDetail := TVehicle(selectedListItem.Data);

        case TComponent(Sender).Tag of
          2:
            ListViewAdd(lvWarShipAll, lvWarShipSelect, ShipDetail, 2);
          4:
            ListViewAdd(lvGeneralShipAll, lvGeneralShipSelect, ShipDetail, 2);
          6:
            ListViewAdd(lvTargetShipAll, lvTargetSurfaceSelect, ShipDetail, 2);
          8:
            ListViewAdd(lvTargetSubsurfaceAll, lvTargetSubsurfaceSelect, ShipDetail, 2);
          10:
            ListViewAdd(lvTargetAirAll, lvTargetAirSelect, ShipDetail, 2);
        end;
      end;

    end;

  until not isselected;
end;

{ -------------------------------------------------------------------------- }

procedure TfrmSceEditor.AdvSmoothButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSceEditor.btnEditDatabaseClick(Sender: TObject);
begin
  frmListScenario.isPlay := false;
  frmListScenario.Show;

  frmListScenario.btnOk.Tag := 0;
  frmListScenario.btnOk.Enabled := true;
  frmListScenario.lblGameName.Visible := false;
  frmListScenario.edtGameName.Visible := false;
  frmListScenario.btnRemove.Visible := true;
end;

procedure TfrmSceEditor.btnPortMoreClick(Sender: TObject);
begin
  frmMoreEnvi.ShowModal;
end;

procedure TfrmSceEditor.btnSaveScenarioClick(Sender: TObject);
var
  ListScenario: TList;
  Scenario: TScenarioList;
  i, j: Integer;
  isFound: boolean;

  scenTemp: TScenario;
  shipTemp: TVehicle;
  weaponTemp: TScenarioWeapon;
  consoleTemp: TSaveConsole;

  ListShip: TList;
  ListConsole: TList;

  { For Fog Height }
  lowerBound, upperBound, boundary, posPercentage, position: Double;
  Val: single;

begin
  frmMainInstruktur.Caption := frmMainInstruktur.cekCaption;
  frmMainInstruktur.lblCekRunning.Caption := frmMainInstruktur.cekStatusKonek;

  case TButton(Sender).Tag of
    0:
      begin
        {$REGION ' Save Scenario '}

        if not CekInput then
          Exit;

        scenTemp := TScenario.Create;

        {$REGION ' Description Scenario '}

        scenTemp.Scenario_Name := edtScenarioName.Text;
        scenTemp.Scenario_Port := cbbPort.ItemIndex;
        scenTemp.Scenario_Desc := mmoKetSce.Text;

        {$ENDREGION}

        {$REGION ' Environment '}
        scenTemp.Scenario_SeaState := tbSeaState.Position;
        scenTemp.Scenario_WindSpeed := tbWindSpeed.Position;
        scenTemp.Scenario_CurrSpeed:= tbSeaSpeed.Position;
        scenTemp.Scenario_Temperature:= tbTemp.Position;
        scenTemp.Scenario_BaroPressure:= tbBaroPressure.Position;
        scenTemp.Scenario_Humidity:= tbHumidity.Position;
        scenTemp.Scenario_FogHeight:= tbFogH.Position;

        scenTemp.Scenario_WindDir_Deg:= StrToFloat(edtWindDirec.Text);
        scenTemp.Scenario_CurrDir_Deg:= StrToFloat(edtSeaDirection.Text);

        { Wind Calc }
        scenTemp.Scenario_WindDir_X := cos(DegToRad(vrwhlWindDirec.Position));
        scenTemp.Scenario_WindDir_Y := sin(DegToRad(vrwhlWindDirec.Position));
        scenTemp.Scenario_CurrDir_X := cos(DegToRad(vrwhlSeaDirection.Position));
        scenTemp.Scenario_CurrDir_Y := sin(DegToRad(vrwhlSeaDirection.Position));

        { Fog Calculation }
        lowerBound := 0.00005;
        upperBound := 0.08;
        boundary := upperBound - lowerBound;
        position := ((tbFogH.Max) - (tbFogH.position))/ (tbFogH.Max);

        if position = 0 then
        begin
          position := 0.001;
        end;

        posPercentage := log10(tbFogH.Max * position) / log10(tbFogH.Max);
        Val := lowerBound + ((boundary - (posPercentage * boundary)));

        scenTemp.Scenario_FogHeight_Persen := Val;

        {$ENDREGION}

        {$REGION ' Ship '}

        ListShip := TList.Create;

        {$REGION ' KRI Ship '}
        for i := 0 to lvWarShipSelect.Items.Count - 1 do
        begin
          if Assigned(lvWarShipSelect.Items[i].Data) then
          begin
            shipTemp := TVehicle.Create;
            shipTemp.Vehicle_ID := TVehicle(lvWarShipSelect.Items[i].Data).Vehicle_ID;
            shipTemp.Vehicle_X := TVehicle(lvWarShipSelect.Items[i].Data).Vehicle_X;
            shipTemp.Vehicle_Y := TVehicle(lvWarShipSelect.Items[i].Data).Vehicle_Y;
            shipTemp.Vehicle_Z := StrToFloat(lvWarShipSelect.Items[i].SubItems[3]);
            shipTemp.Vehicle_Heading := StrToFloat(lvWarShipSelect.Items[i].SubItems[4]);
            shipTemp.Vehicle_Speed := StrToFloat(lvWarShipSelect.Items[i].SubItems[5]);

            ListShip.Add(shipTemp);
          end;
        end;
        {$ENDREGION}

        {$REGION ' General Ship '}
        for i := 0 to lvGeneralShipSelect.Items.Count - 1 do
        begin
          if Assigned(lvGeneralShipSelect.Items[i].Data) then
          begin
            shipTemp := TVehicle.Create;
            shipTemp.Vehicle_ID := TVehicle(lvGeneralShipSelect.Items[i].Data).Vehicle_ID;
            shipTemp.Vehicle_X := TVehicle(lvGeneralShipSelect.Items[i].Data).Vehicle_X;
            shipTemp.Vehicle_Y := TVehicle(lvGeneralShipSelect.Items[i].Data).Vehicle_Y;
            shipTemp.Vehicle_Z := StrToFloat(lvGeneralShipSelect.Items[i].SubItems[3]);
            shipTemp.Vehicle_Heading := StrToFloat(lvGeneralShipSelect.Items[i].SubItems[4]);
            shipTemp.Vehicle_Speed := StrToFloat(lvGeneralShipSelect.Items[i].SubItems[5]);

            ListShip.Add(shipTemp);
          end;
        end;
        {$ENDREGION}

        {$REGION ' Target Ship '}
        { Save Target Surface Ship Configuration }
        for i := 0 to lvTargetSurfaceSelect.Items.Count - 1 do
        begin
          if Assigned(lvTargetSurfaceSelect.Items[i].Data) then
          begin
            shipTemp := TVehicle.Create;
            shipTemp.Vehicle_ID := TVehicle(lvTargetSurfaceSelect.Items[i].Data).Vehicle_ID;
            shipTemp.Vehicle_X := TVehicle(lvTargetSurfaceSelect.Items[i].Data).Vehicle_X;
            shipTemp.Vehicle_Y := TVehicle(lvTargetSurfaceSelect.Items[i].Data).Vehicle_Y;
            shipTemp.Vehicle_Z := StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[3]);
            shipTemp.Vehicle_Heading := StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[4]);
            shipTemp.Vehicle_Speed := StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[5]);

            ListShip.Add(shipTemp);
          end;
        end;
        {$ENDREGION}

        {$ENDREGION}

        {$REGION ' Console '}
        ListConsole := TList.Create;
        for i := 0 to lvConsole.Items.Count - 1 do
        begin
          if lvConsole.Items[i].SubItems[4] <> '' then
          begin
            consoleTemp := TSaveConsole.Create;
            consoleTemp.ConsoleID := StrToInt(lvConsole.Items[i].Caption);
            consoleTemp.shipID := StrToInt(lvConsole.Items[i].SubItems[5]);
            consoleTemp.LauncherID :=
              StrToInt(lvConsole.Items[i].SubItems[6]);

            ListConsole.Add(consoleTemp);
          end;
        end;
        {$ENDREGION}

        if ListShip.Count > 0 then
        begin
          DataModule1.SaveScenario(scenTemp, ListShip, ListConsole, WeaponListScenario);

          ClearAList(ListShip);

          ShowMessage('New Scenario has been saved');

          SimManager.MainObjList.ClearObject;

          frmGameController.ShowScenario;
          frmGameController.ClearScenarioData;
          Close;
        end
        else
        begin
          ShowMessage('Add Ship First');
        end;

        SimManager.isFirstRequest := false;
        scenTemp.Free;
        {$ENDREGION}
      end;
    1:
      begin

        {$Region ' Update Scenario ' }

        if not CekInput then
          Exit;

        scenTemp := TScenario.Create;

        {$REGION ' Description Scenario '}

        scenTemp.Scenario_Name := edtScenarioName.Text;
        scenTemp.Scenario_Port := cbbPort.ItemIndex;
        scenTemp.Scenario_Desc := mmoKetSce.Text;

        {$ENDREGION}

        {$REGION ' Environment '}
        try
          scenTemp.Scenario_SeaState := tbSeaState.Position;
          scenTemp.Scenario_WindSpeed := tbWindSpeed.Position;
          scenTemp.Scenario_CurrSpeed := tbSeaSpeed.Position;
          scenTemp.Scenario_Temperature:= tbTemp.Position;
          scenTemp.Scenario_BaroPressure := tbBaroPressure.Position;
          scenTemp.Scenario_Humidity := tbHumidity.Position;
          scenTemp.Scenario_FogHeight := tbFogH.Position;

          scenTemp.Scenario_WindDir_Deg:= StrToFloat(edtWindDirec.Text);
          scenTemp.Scenario_CurrDir_Deg:= StrToFloat(edtSeaDirection.Text);


          { Wind Calc }
          scenTemp.Scenario_WindDir_X := cos(DegToRad(vrwhlWindDirec.Position));
          scenTemp.Scenario_WindDir_Y := sin(DegToRad(vrwhlWindDirec.Position));
          scenTemp.Scenario_CurrDir_X := cos(DegToRad(vrwhlSeaDirection.Position));
          scenTemp.Scenario_CurrDir_Y := sin(DegToRad(vrwhlSeaDirection.Position));

          { Fog Calculation }
          lowerBound := 0.00005;
          upperBound := 0.08;
          boundary := upperBound - lowerBound;
          position := ((tbFogH.Max) - (tbFogH.position))/ (tbFogH.Max);

          if position = 0 then
          begin
            position := 0.001;
          end;

          posPercentage := log10(tbFogH.Max * position) / log10(tbFogH.Max);
          Val := lowerBound + ((boundary - (posPercentage * boundary)));

          scenTemp.Scenario_FogHeight_Persen := Val;

          { Update }
          DataModule1.UpdateScenario(Scenario_ID, scenTemp);

        finally
          scenTemp.Free;
        end;

        {$ENDREGION}

        {$REGION ' Ship '}

        ListShip := TList.Create;

        { save KRI Ship Configuration }
        for i := 0 to lvWarShipSelect.Items.Count - 1 do
        begin
          if Assigned(lvWarShipSelect.Items[i].Data) then
          begin
            shipTemp := TVehicle.Create;
            shipTemp.Vehicle_ID := TVehicle(lvWarShipSelect.Items[i].Data).Vehicle_ID;
            shipTemp.Vehicle_X := TVehicle(lvWarShipSelect.Items[i].Data).Vehicle_X;
            shipTemp.Vehicle_Y := TVehicle(lvWarShipSelect.Items[i].Data).Vehicle_Y;
            shipTemp.Vehicle_Z := StrToFloat(lvWarShipSelect.Items[i].SubItems[3]);
            shipTemp.Vehicle_Heading := StrToFloat(lvWarShipSelect.Items[i].SubItems[4]);
            shipTemp.Vehicle_Speed := StrToFloat(lvWarShipSelect.Items[i].SubItems[5]);

            ListShip.Add(shipTemp);
          end;
        end;

        { Save General Ship Configuration }
        for i := 0 to lvGeneralShipSelect.Items.Count - 1 do
        begin
          if Assigned(lvGeneralShipSelect.Items[i].Data) then
          begin
            shipTemp := TVehicle.Create;
            shipTemp.Vehicle_ID := TVehicle(lvGeneralShipSelect.Items[i].Data).Vehicle_ID;
            shipTemp.Vehicle_X := TVehicle(lvGeneralShipSelect.Items[i].Data).Vehicle_X;
            shipTemp.Vehicle_Y := TVehicle(lvGeneralShipSelect.Items[i].Data).Vehicle_Y;
            shipTemp.Vehicle_Z := StrToFloat(lvGeneralShipSelect.Items[i].SubItems[3]);
            shipTemp.Vehicle_Heading := StrToFloat(lvGeneralShipSelect.Items[i].SubItems[4]);
            shipTemp.Vehicle_Speed := StrToFloat(lvGeneralShipSelect.Items[i].SubItems[5]);

            ListShip.Add(shipTemp);
          end;
        end;

        { Save Target Surface Ship Configuration }
        for i := 0 to lvTargetSurfaceSelect.Items.Count - 1 do
        begin
          if Assigned(lvTargetSurfaceSelect.Items[i].Data) then
          begin
            shipTemp := TVehicle.Create;
            shipTemp.Vehicle_ID := TVehicle(lvTargetSurfaceSelect.Items[i].Data).Vehicle_ID;
            shipTemp.Vehicle_X := TVehicle(lvTargetSurfaceSelect.Items[i].Data).Vehicle_X;
            shipTemp.Vehicle_Y := TVehicle(lvTargetSurfaceSelect.Items[i].Data).Vehicle_Y;
            shipTemp.Vehicle_Z := StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[3]);
            shipTemp.Vehicle_Heading := StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[4]);
            shipTemp.Vehicle_Speed := StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[5]);

            ListShip.Add(shipTemp);
          end;
        end;

        {$ENDREGION}

        {$REGION ' Console '}
        ListConsole := TList.Create;
        for i := 0 to lvConsole.Items.Count - 1 do
        begin
          if lvConsole.Items[i].SubItems[4] <> '' then
          begin
            consoleTemp := TSaveConsole.Create;
            consoleTemp.ConsoleID := StrToInt(lvConsole.Items[i].Caption);
            consoleTemp.shipID := StrToInt(lvConsole.Items[i].SubItems[5]);
            consoleTemp.LauncherID :=
              StrToInt(lvConsole.Items[i].SubItems[6]);

            ListConsole.Add(consoleTemp);
          end;
        end;
        {$ENDREGION}

        if ListShip.Count > 0 then
        begin
          DataModule1.UpdateCurrentDatabase(Scenario_ID, ListShip, ListConsole, WeaponListScenario);

          ShowMessage('Update Succes');

          SimManager.MainObjList.ClearObject;

          frmGameController.ShowScenario;
          frmGameController.ClearScenarioData;
          Close;
        end
        else
        begin
          ShowMessage('Add Ship First');
        end;

        SimManager.isFirstRequest := false;

        {$ENDREGION}
      end;

  end;
end;

procedure TfrmSceEditor.btnSetPositionClick(Sender: TObject);
var
  i: Integer;
  Ship: TInsObject;
  Vehicle: TVehicle;

  ListItem: TListItem;
begin
  case ListViewFocusTag of
    2:
      ListItem := lvWarShipSelect.Selected;
    4:
      ListItem := lvGeneralShipSelect.Selected;
    6:
      ListItem := lvTargetSurfaceSelect.Selected;
    8:
      ListItem := lvTargetSubsurfaceSelect.Selected;
    10:
      ListItem := lvTargetAirSelect.Selected;
  end;

  if ListItem <> nil then
  begin
    if Assigned(ListItem.Data) then
    begin
      Vehicle := TVehicle(ListItem.Data);

      SimManager.DatabaseObject := nil;
      for i := 0 to SimManager.MainObjList.ItemCount - 1 do
      begin
        Ship := SimManager.MainObjList.getObject(i) as TInsObject;

        if Vehicle.Vehicle_ID = Ship.FDataBaseID then
        begin
          SimManager.DatabaseObject := Ship;
          frmMainInstruktur.MainMap.CurrentTool := TOOL_DATABASE_POS;
        end;
      end;
    end;
  end;
end;

procedure TfrmSceEditor.btnWeaponListClick(Sender: TObject);
begin
  if (lvWarShipAll.Selected <> nil) or (lvWarShipSelect.Selected <> nil) then
  begin
    frmShipEditor.Ship_ID := Ship_ID;
    frmShipEditor.Ship_Name := Ship_Name;
    frmShipEditor.Show;
  end
  else
  begin
    ShowMessage('Select War Ship (KRI) First ');
  end;
end;

procedure TfrmSceEditor.cbbPortCloseUp(Sender: TObject);
var
  xOff: Double;
  yOff: Double;
begin
  if cbbPort.ItemIndex > -1 then
  begin
    DataModule1.GetSceneOffSetFromPortID(cbbPort.ItemIndex, xOff, yOff);

    if ((SimManager.instMapSet.xOffset <> xOff) and
      (SimManager.instMapSet.yOffset <> yOff)) then
    begin
      SimManager.instMapSet.useOffset := true;
      SimManager.instMapSet.xOffset := xOff;
      SimManager.instMapSet.yOffset := yOff;
      SimManager.instMapSet.xCenter := xOff;
      SimManager.instMapSet.yCenter := yOff;

      frmMainInstruktur.MainMap.ZoomTo(frmMainInstruktur.MainMap.Zoom,
        xOff, yOff);
    end;
  end;
end;

procedure TfrmSceEditor.DeleteMenuWithShipID(const shipID: Integer);
var
  i: Integer;
  menuItem: TMenuItem;
begin
  for i := 0 to pmConsole.Items.Count - 1 do
  begin
    menuItem := pmConsole.Items[i];
    if menuItem.Name = 'pmShip' + IntToStr(shipID) then
    begin
      pmConsole.Items.Delete(i);
      FreeAndNil(menuItem);
      break;
    end;
  end;

  for i := 0 to pmConsole2.Items.Count - 1 do
  begin
    menuItem := pmConsole2.Items[i];
    if menuItem.Name = 'pm2Ship' + IntToStr(shipID) then
    begin
      pmConsole2.Items.Delete(i);
      FreeAndNil(menuItem);
      break;
    end;
  end;
end;

procedure TfrmSceEditor.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Dx, Dy: Double;
begin
  frmMainInstruktur.FrameControlLeft.NillAllSet;

  SimManager.TrackObject := nil;
  SimManager.DatabaseObject := nil;
  SimManager.DragObject := nil;
  SimManager.isDatabaseMode := false;

  SimManager.ClearAllObjects;

  // frmFiringCommand.SetFormLayout;
  frmGameController.SetFormLayout;

  { Set Map }
  DataModule1.GetSceneOffSetFromPortID(DataModule1.GetMapById(CurrentScenarioID), Dx, Dy);
  SimManager.instMapSet.useOffset := true;
  SimManager.instMapSet.xOffset := Dx;
  SimManager.instMapSet.yOffset := Dy;
  SimManager.instMapSet.xCenter := Dx;
  SimManager.instMapSet.yCenter := Dy;

  frmMainInstruktur.MainMap.ZoomTo(32, Dx, Dy);
  frmMainInstruktur.Caption := frmMainInstruktur.cekCaption;
  frmMainInstruktur.lblCekRunning.Caption := frmMainInstruktur.cekStatusKonek;
  SimManager.isFirstRequest := false;

  ClearListViewData(lvWarShipAll);
  ClearListViewData(lvWarShipSelect);
  ClearListViewData(lvGeneralShipAll);
  ClearListViewData(lvGeneralShipSelect);
  ClearListViewData(lvTargetShipAll);
  ClearListViewData(lvTargetSurfaceSelect);
  ClearListViewData(lvTargetSubsurfaceAll);
  ClearListViewData(lvTargetSubsurfaceSelect);
  ClearListViewData(lvTargetAirAll);
  ClearListViewData(lvTargetAirSelect);
  ClearListViewData(lvConsole);
  ClearListViewData(lvWeaponSelected);
end;

procedure TfrmSceEditor.FormShow(Sender: TObject);
begin
  DefaultMonitor := dmDesktop;

  if SimManager.instMonitorSet.ContollerDisplay > Screen.MonitorCount then
    SimManager.instMonitorSet.ContollerDisplay := 0;

  Top          := Screen.Monitors[SimManager.instMonitorSet.ContollerDisplay].Top;
  Left         := Screen.Monitors[SimManager.instMonitorSet.ContollerDisplay].Left;

  cbbPort.Text := frmGameController.lblPortEnv.Caption;
  SimManager.isDatabaseMode := true;
  UpdateVisualForm;
end;

function TfrmSceEditor.IsMenuItemExist(const shipID: Integer): boolean;
var
  i: Integer;
  menuItem: TMenuItem;
begin
  result := false;
  for i := 0 to pmConsole.Items.Count - 1 do
  begin
    menuItem := pmConsole.Items[i];
    if menuItem.Name = 'pmShip' + IntToStr(shipID) then
    begin
      result := true;
      break;
    end;
  end;
end;

function TfrmSceEditor.IsMenuItem2Exist(const shipID: Integer): boolean;
var
  i: Integer;
  menuItem: TMenuItem;
begin
  result := false;
  for i := 0 to pmConsole2.Items.Count - 1 do
  begin
    menuItem := pmConsole2.Items[i];
    if menuItem.Name = 'pm2Ship' + IntToStr(shipID) then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TfrmSceEditor.AddMenuWithShipID(const shipID: Integer);
var
  i, j: Integer;

  menuItem, subItem: TMenuItem;
begin

  if not IsMenuItemExist(shipID) then
  begin
    menuItem := TMenuItem.Create(pmConsole);
    menuItem.Name := 'pmShip' + IntToStr(shipID);
    menuItem.Caption := DataModule1.GetShipNameByID(shipID);
    menuItem.OnClick := PopupMenuClick;
    menuItem.Tag := shipID;
    pmConsole.Items.Add(menuItem);

  end;

  if not IsMenuItem2Exist(shipID) then
  begin
    menuItem := TMenuItem.Create(pmConsole2);
    menuItem.Name := 'pm2Ship' + IntToStr(shipID);
    menuItem.Caption := DataModule1.GetShipNameByID(shipID);
    menuItem.Tag := shipID;
    pmConsole2.Items.Add(menuItem);

    for i := 1 to 3 do
    begin
      subItem := TMenuItem.Create(pmConsole2);
      subItem.Caption := 'Launcher ' + IntToStr(i);
      subItem.Tag := shipID;
      subItem.Hint := IntToStr(i);
      subItem.OnClick := PopupMenuClick2;
      menuItem.Add(subItem);
    end;
  end;
end;

// dendy
procedure TfrmSceEditor.PopupMenuClick2(Sender: TObject);
begin
  if lvConsole.Selected <> nil then
  begin

    lvConsole.Selected.SubItems[4] := DataModule1.GetShipNameByID
      (TMenuItem(Sender).Tag);
    lvConsole.Selected.SubItems[5] := IntToStr(TMenuItem(Sender).Tag);
    lvConsole.Selected.SubItems[6] := TMenuItem(Sender).Hint;

  end;
end;

procedure TfrmSceEditor.PopupMenuClick(Sender: TObject);
begin

  if lvConsole.Selected <> nil then
  begin
    lvConsole.Selected.SubItems[4] :=
      DeleteAmpersand(TMenuItem(Sender).Caption);
    lvConsole.Selected.SubItems[5] := IntToStr(TMenuItem(Sender).Tag);
    lvConsole.Selected.SubItems[6] := IntToStr(0);
  end;
end;

procedure TfrmSceEditor.lvConsoleDblClick(Sender: TObject);
begin
  if lvConsole.Selected = nil then
    Exit;

  lvConsole.Selected.SubItems[4] := '';
  lvConsole.Selected.SubItems[5] := '';
  lvConsole.Selected.SubItems[6] := '';
end;

procedure TfrmSceEditor.lvGeneralShipAllClick(Sender: TObject);
begin
  lvWarShipAll.Selected := nil;
  lvWarShipSelect.Selected := nil;
  lvGeneralShipSelect.Selected := nil;
end;

procedure TfrmSceEditor.lvGeneralShipSelectClick(Sender: TObject);
begin
  lvWarShipAll.Selected := nil;
  lvWarShipSelect.Selected := nil;
  lvGeneralShipAll.Selected := nil;
end;

procedure TfrmSceEditor.pnlMainClick(Sender: TObject);
begin
  // if GetAsyncKeyState(16) <> 0 then btnWeaponList.Visible := True
  // else btnWeaponList.Visible := False;
end;

procedure TfrmSceEditor.UpdateListViewCoor(const Mx, My: Double;
  shipID: Integer);
var
  i, j: Integer;
  ListView: TListView;
  isFound: boolean;

  Vehicle: TVehicle;
begin
  for i := 1 to 5 do
  begin
    isFound := false;

    case i of
      1:
        ListView := lvWarShipSelect;
      2:
        ListView := lvGeneralShipSelect;
      3:
        ListView := lvTargetSurfaceSelect;
      4:
        ListView := lvTargetSubsurfaceSelect;
      5:
        ListView := lvTargetAirSelect;
    end;

    for j := 0 to ListView.Items.Count - 1 do
    begin
      if Assigned(ListView.Items[j].Data) then
      begin
        Vehicle := TVehicle(ListView.Items[j].Data);

        if Vehicle.Vehicle_ID = shipID then
        begin
          isFound := true;

          Vehicle.Vehicle_X := Mx;
          Vehicle.Vehicle_Y := My;
          ListView.Items[j].SubItems[1] := ConvLL_To_Str(Mx, '0');
          ListView.Items[j].SubItems[2] := ConvLL_To_Str(My, '1');

          // ListView.Items[j].SubItems[0] := FormatFloat('0',(Mx-SimManager.instMapSet.xOffset) * C_Degree_to_Meter);
          // ListView.Items[j].SubItems[1] := FormatFloat('0',(My-SimManager.instMapSet.yOffset) * C_Degree_to_Meter);

          break;
        end;
      end;
    end;

    if isFound then
      break;
  end;
end;

procedure TfrmSceEditor.UpdateListViewDepth(const Depth: Double;
  shipID: Integer);
var
  i, j: Integer;
  ListView: TListView;
  isFound: boolean;

  Vehicle: TVehicle;
begin
  for i := 1 to 5 do
  begin
    isFound := false;

    case i of
      1:
        ListView := lvWarShipSelect;
      2:
        ListView := lvGeneralShipSelect;
      3:
        ListView := lvTargetSurfaceSelect;
      4:
        ListView := lvTargetSubsurfaceSelect;
      5:
        ListView := lvTargetAirSelect;
    end;

    for j := 0 to ListView.Items.Count - 1 do
    begin
      if Assigned(ListView.Items[j].Data) then
      begin
        Vehicle := TVehicle(ListView.Items[j].Data);

        if Vehicle.Vehicle_ID = shipID then
        begin
          isFound := true;

          ListView.Items[j].SubItems[3] := FloatToStr(Depth);

          break;
        end;
      end;
    end;

    if isFound then
      break;
  end;
end;

procedure TfrmSceEditor.updateListViewSpeed(const Speed: Double;
  shipID: Integer);
var
  i, j: Integer;
  ListView: TListView;
  isFound: boolean;

  Vehicle: TVehicle;
begin
  for i := 1 to 5 do
  begin
    isFound := false;

    case i of
      1:
        ListView := lvWarShipSelect;
      2:
        ListView := lvGeneralShipSelect;
      3:
        ListView := lvTargetSurfaceSelect;
      4:
        ListView := lvTargetSubsurfaceSelect;
      5:
        ListView := lvTargetAirSelect;
    end;

    for j := 0 to ListView.Items.Count - 1 do
    begin
      if Assigned(ListView.Items[j].Data) then
      begin
        Vehicle := TVehicle(ListView.Items[j].Data);

        if Vehicle.Vehicle_ID = shipID then
        begin
          isFound := true;

          ListView.Items[j].SubItems[5] := FloatToStr(Speed);

          break;
        end;
      end;
    end;

    if isFound then
      break;
  end;
end;

procedure TfrmSceEditor.UpdateListViewHeading(const Heading: Double;
  shipID: Integer);
var
  i, j: Integer;
  ListView: TListView;
  isFound: boolean;

  Vehicle: TVehicle;
begin
  for i := 1 to 5 do
  begin
    isFound := false;

    case i of
      1:
        ListView := lvWarShipSelect;
      2:
        ListView := lvGeneralShipSelect;
      3:
        ListView := lvTargetSurfaceSelect;
      4:
        ListView := lvTargetSubsurfaceSelect;
      5:
        ListView := lvTargetAirSelect;
    end;

    for j := 0 to ListView.Items.Count - 1 do
    begin
      if Assigned(ListView.Items[j].Data) then
      begin
        Vehicle := TVehicle(ListView.Items[j].Data);

        if Vehicle.Vehicle_ID = shipID then
        begin
          isFound := true;

          ListView.Items[j].SubItems[4] := FloatToStr(Heading);

          break;
        end;
      end;
    end;

    if isFound then
      break;
  end;
end;

procedure TfrmSceEditor.GetAllVehicle;
var
  i: Integer;

  { KRI, General, Target[Surface, Subsurface, Air] }
  listShipKRI,
  listShipGeneral,
  listTargetSurface,
  listTargetSubsurface,
  listTargetAir: TList;

  ShipDetail,
  WarShip,
  GeneralShip,
  TargetSurfaceShip,
  TargetSubsurfaceShip,
  TargetAirShip: TVehicle;

begin
  try

    listTargetSubsurface := TList.Create;
    listTargetAir := TList.Create;

    DataModule1.GetAllTargetSubsurface(listTargetSubsurface);
    DataModule1.GetAllTargetAir(listTargetAir);

    {$REGION ' Load KRI '}
    listShipKRI := TList.Create;
    DataModule1.GetAllWarShip(listShipKRI);

    for i := 0 to listShipKRI.Count - 1 do
    begin
      WarShip := TVehicle(listShipKRI.Items[i]);

      if Assigned(WarShip) then
      begin
        with lvWarShipAll.Items.Add do
        begin
          ShipDetail := TVehicle.Create;

          setVelueVehicle(ShipDetail, WarShip);

          Caption := ShipDetail.Vehicle_Name;
          case ShipDetail.Vehicle_Type of
            1: SubItems.Add('Surface');
            2: SubItems.Add('Air');
            3: SubItems.Add('Subsurface');
          end;

          Data := ShipDetail;
        end;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Load General '}
    listShipGeneral := TList.Create;
    DataModule1.GetAllGeneralShip(listShipGeneral);

    for i := 0 to listShipGeneral.Count - 1 do
    begin
      GeneralShip := TVehicle(listShipGeneral.Items[i]);
      if Assigned(GeneralShip) then
      begin
        with lvGeneralShipAll.Items.Add do
        begin
          ShipDetail := TVehicle.Create;

          setVelueVehicle(ShipDetail, GeneralShip);

          Caption := ShipDetail.Vehicle_Name;
          case ShipDetail.Vehicle_Type of
            1: SubItems.Add('Surface');
            2: SubItems.Add('Air');
            3: SubItems.Add('Subsurface');
          end;

          Data := ShipDetail;
        end;
      end;
    end;
    {$ENDREGION}

    {$REGION ' Load Target Surface '}
    listTargetSurface := TList.Create;
    DataModule1.GetAllTarget(listTargetSurface);

    for i := 0 to listTargetSurface.Count - 1 do
    begin
      TargetSurfaceShip := TVehicle(listTargetSurface.Items[i]);
      if Assigned(TargetSurfaceShip) then
      begin
        with lvTargetShipAll.Items.Add do
        begin
          ShipDetail := TVehicle.Create;

          setVelueVehicle(ShipDetail, TargetSurfaceShip);

          Caption := TargetSurfaceShip.Vehicle_Name;
          case ShipDetail.Vehicle_Type of
            1: SubItems.Add('Surface');
            2: SubItems.Add('Air');
            3: SubItems.Add('Subsurface');
          end;

          Data := ShipDetail;
        end;
      end;
    end;
    {$ENDREGION}

//    {$REGION ' Load Target Surface '}
//    listTargetSurface := TList.Create;
//    DataModule1.GetAllTargetSurface(listTargetSurface);
//
//    for i := 0 to listTargetSurface.Count - 1 do
//    begin
//      TargetSurfaceShip := TVehicle(listTargetSurface.Items[i]);
//      if Assigned(TargetSurfaceShip) then
//      begin
//        with lvTargetSurfaceAll.Items.Add do
//        begin
//          ShipDetail := TVehicle.Create;
//
//          setVelueVehicle(ShipDetail, TargetSurfaceShip);
//
//          Caption := TargetSurfaceShip.Vehicle_Name;
//          case ShipDetail.Vehicle_Type of
//            1: SubItems.Add('Surface');
//            2: SubItems.Add('Air');
//            3: SubItems.Add('Subsurface');
//          end;
//
//          Data := ShipDetail;
//        end;
//      end;
//    end;
//    {$ENDREGION}
//
//    { Target Subsurface }
//    for i := 0 to listTargetSubsurface.Count - 1 do
//    begin
//      TargetSubsurfaceShip := TVehicle(listTargetSubsurface.Items[i]);
//      if Assigned(TargetSubsurfaceShip) then
//      begin
//        with lvTargetSubsurfaceAll.Items.Add do
//        begin
//          ShipDetail := TVehicle.Create;
//          ShipDetail.Vehicle_ID := TargetSubsurfaceShip.Vehicle_ID;
//          ShipDetail.Vehicle_Name := TargetSubsurfaceShip.Vehicle_Name;
//          ShipDetail.Vehicle_Ctgr := TargetSubsurfaceShip.Vehicle_Ctgr;
//          ShipDetail.Vehicle_No := TargetSubsurfaceShip.Vehicle_No;
//
//          Data := ShipDetail;
//          Caption := TargetSubsurfaceShip.Vehicle_Name;
//        end;
//      end;
//    end;
//
//    { Target Air }
//    for i := 0 to listTargetAir.Count - 1 do
//    begin
//      TargetAirShip := TVehicle(listTargetAir.Items[i]);
//      if Assigned(TargetAirShip) then
//      begin
//        with lvTargetAirAll.Items.Add do
//        begin
//          ShipDetail := TVehicle.Create;
//          ShipDetail.Vehicle_ID := TargetAirShip.Vehicle_ID;
//          ShipDetail.Vehicle_Name := TargetAirShip.Vehicle_Name;
//          ShipDetail.Vehicle_Ctgr := TargetAirShip.Vehicle_Ctgr;
//          ShipDetail.Vehicle_No := TargetAirShip.Vehicle_No;
//
//          Data := ShipDetail;
//          Caption := TargetAirShip.Vehicle_Name;
//        end;
//      end;
//    end;

  finally
    ClearAList(listShipKRI);
    listShipKRI.Free;
    ClearAList(listShipGeneral);
    listShipGeneral.Free;
    ClearAList(listTargetSurface);
    listTargetSurface.Free;
    ClearAList(listTargetSubsurface);
    listTargetSubsurface.Free;
    ClearAList(listTargetAir);
    listTargetAir.Free;
  end;
end;

procedure TfrmSceEditor.ClearVisualForm;
var
  valTemp : Integer;
  dirTemp : Integer;

begin
  ClearWeaponListScenario;

  {$REGION ' General '}
  edtScenarioName.Text := '';
  mmoKetSce.Clear;
  cbbPort.ItemIndex := 0;
  {$ENDREGION}

  {$REGION ' Environment '}
  tbSeaState.Position := 0;
  edtSeaState.Text := '0';
  tbWindSpeed.Position := 0;
  edtWindSpeed.Text := '0';
  tbSeaSpeed.Position := 0;
  edtSeaSpeed.Text := '0';
  tbTemp.Position := 0;
  edtTemp.Text := '0';
  tbBaroPressure.Position := 0;
  edtBaroPressure.Text := '0';
  tbHumidity.Position := 0;
  edtHumidity.Text := '0';
  tbFogH.Position := 0;
  edtFogH.Text := '0';

  valTemp := 0;

  if valTemp < 180 then
  begin
    dirTemp := (180 + valTemp);

    vrwhlWindDirec.Position := dirTemp;
  end;
  edtWindDirec.Text := IntToStr(valTemp);

  valTemp := 0;

  if valTemp < 180 then
  begin
    dirTemp := (180 + valTemp);

    vrwhlSeaDirection.Position :=dirTemp;
  end;
  edtSeaDirection.Text:= IntToStr(valTemp);


  {$ENDREGION}

  {$REGION ' Platform '}
  ClearListViewData(lvWarShipAll);
  ClearListViewData(lvWarShipSelect);
  ClearListViewData(lvGeneralShipAll);
  ClearListViewData(lvGeneralShipSelect);
  ClearListViewData(lvTargetShipAll);
  ClearListViewData(lvTargetSurfaceSelect);
  ClearListViewData(lvTargetSubsurfaceAll);
  ClearListViewData(lvTargetSubsurfaceSelect);
  ClearListViewData(lvTargetAirAll);
  ClearListViewData(lvTargetAirSelect);
  ClearListViewData(lvConsole);
  ClearListViewData(lvWeaponSelected);
  {$ENDREGION}

  pmConsole.Items.Clear;
  pmConsole2.Items.Clear;

  SimManager.MainObjList.ClearObject;
end;

procedure TfrmSceEditor.UpdateVisualForm;
var
  listAllShip, listAllConsole: TList;

  ShipDetail, AllShip: TVehicle;
//  RecSceSave: TScenario;

  AllConsole: TClientConsole;
  i: Integer;
  j: Integer;

  Dx, Dy: Double;
  Mx, My: Double;

  Ship: TInsObject;

  ListScenario: TList;
  Scenario: TScenarioList;

  ListConsole: TList;
  Console: TConsole;
  Console_ID: Integer;

  { Envi }
  scenTemp: TScenario;

  ClientList: TClientList;
begin

  ClearVisualForm;

  {$REGION ' Console '}

  listAllConsole := TList.Create;
  DataModule1.GetPC_Client(listAllConsole);

  for i := 0 to listAllConsole.Count - 1 do
  begin
    AllConsole := TClientConsole(listAllConsole[i]);

    if Assigned(AllConsole) then
    begin

      if AllConsole.PC_IDM = 0 then
        Continue;

      with lvConsole.Items.Add do
      begin

        ClientList := TClientList.Create;
        ClientList.Id := AllConsole.Id;

        // ClientList.Cli_MAC      := AllConsole.PC_MAC;
        ClientList.Cli_Console := AllConsole.PC_NAME;

        ClientList.Cli_IP := AllConsole.PC_IP;

        // ClientList.Cli_Status   := Client.C_Status;
        ClientList.WeaponID := AllConsole.WeaponID;

        Caption := IntToStr(lvConsole.Items.Count);

        case AllConsole.PC_IDM of
          0:
            begin
              ClientList.Cli_Cubicle := 'SERVER';
              SubItems.Add('SERVER');
            end;
          1:
            begin
              ClientList.Cli_Cubicle := 'PIT';
              SubItems.Add('PIT');
            end;
          2:
            begin
              ClientList.Cli_Cubicle := '3D SERVER';
              SubItems.Add('3D SERVER');
            end;
        end;

        SubItems.Add(AllConsole.PC_NAME);

        case AllConsole.APP_TIPE of
          0:
            begin
              ClientList.Cli_Type := '2D';
              SubItems.Add('2D');
            end;
          1:
            begin
              ClientList.Cli_Type := '3D-S';
              SubItems.Add('3D-S');
            end;
          2:
            begin
              ClientList.Cli_Type := '3D-C';
              SubItems.Add('3D-C');
            end;
          3:
            begin
              ClientList.Cli_Type := '3D-W';
              SubItems.Add('3D-W');
            end;
          4:
            begin
              ClientList.Cli_Type := '2D-Sigma';
              SubItems.Add('2D-Sigma');
            end;
        end;

        SubItems.Add(AllConsole.PC_IP);
        // SubItems.Add(AllConsole.PC_MAC);
        SubItems.Add('');
        SubItems.Add('');
        SubItems.Add('');

        Data := ClientList;

      end;
    end;
  end;

  ClearAList(listAllConsole);
  listAllConsole.Free;

  {$ENDREGION}

  if isNew then
  begin
    { New Scenario }

    btnSaveScenario.Tag := 0;

    GetAllVehicle;
  end
  else
  begin
    { Edit Scenario }
    LastName := ScenarioName;
    edtScenarioName.Text := ScenarioName;

    btnSaveScenario.Tag := 1;

    scenTemp := TScenario.Create;

    try
      {ngambil data dari database}
      DataModule1.GetScenarioDefByID(Scenario_ID, scenTemp);

      {$REGION ' Load General '}

      mmoKetSce.Lines.Add(scenTemp.Scenario_Desc);

      cbbPort.ItemIndex := Round(scenTemp.Scenario_Port);

      {Game Center}
      DataModule1.GetSceneOffSetFromPortID(scenTemp.Scenario_Port, Dx, Dy);

      if ((SimManager.instMapSet.xOffset <> Dx) and
        (SimManager.instMapSet.yOffset <> Dy)) then
      begin
        SimManager.instMapSet.useOffset := true;
        SimManager.instMapSet.xOffset := Dx;
        SimManager.instMapSet.yOffset := Dy;
        SimManager.instMapSet.xCenter := Dx;
        SimManager.instMapSet.yCenter := Dy;

        frmMainInstruktur.MainMap.ZoomTo(frmMainInstruktur.MainMap.Zoom, Dx, Dy);
      end;

      {$ENDREGION}

      {$REGION ' Load Environment '}

      tbSeaState.position := Round(scenTemp.Scenario_SeaState);
      tbWindSpeed.position := Round(scenTemp.Scenario_WindSpeed);
      tbSeaSpeed.position := Round(scenTemp.Scenario_CurrSpeed);
      tbTemp.position := Round(scenTemp.Scenario_Temperature);
      tbBaroPressure.position := Round(scenTemp.Scenario_BaroPressure);
      tbHumidity.position := Round(scenTemp.Scenario_Humidity);
      tbFogH.position := Round(scenTemp.Scenario_FogHeight);

      if scenTemp.Scenario_WindDir_Deg > 180 then
        vrwhlWindDirec.position := (Round(scenTemp.Scenario_WindDir_Deg) - 180)
      else
       vrwhlWindDirec.position := (Round(scenTemp.Scenario_WindDir_Deg) + 180);

      if scenTemp.Scenario_CurrDir_Deg > 180 then
       vrwhlSeaDirection.position := (Round(scenTemp.Scenario_CurrDir_Deg) - 180)
      else
       vrwhlSeaDirection.position := (Round(scenTemp.Scenario_CurrDir_Deg) + 180);

      {$ENDREGION}

    finally
      scenTemp.Free;
    end;

    {$REGION ' Load Console '}

    ListConsole := TList.Create;
    DataModule1.GetConsoleListBySceID(Scenario_ID, ListConsole);
    for i := 0 to ListConsole.Count - 1 do
    begin
      if Assigned(ListConsole.Items[i]) then
      begin
        Console := TConsole(ListConsole.Items[i]);

        for j := 0 to lvConsole.Items.Count - 1 do
        begin
          Console_ID := StrToInt(lvConsole.Items[j].Caption);

          if Console.ConsoleID = Console_ID then
          begin
            lvConsole.Items[j].SubItems[4] := DataModule1.GetShipName(Console.shipID);
            lvConsole.Items[j].SubItems[5] := IntToStr(Console.shipID);
            lvConsole.Items[j].SubItems[6] := IntToStr(Console.LauncherID);

            break;
          end;
        end;
      end;
    end;
    ClearAList(ListConsole);
    ListConsole.Free;

    {$ENDREGION}

    {$REGION ' Load Ship '}

    GetAllVehicle;

    listAllShip := TList.Create;
    DataModule1.GetAllShipFromScen(Scenario_ID, listAllShip);

    for i := 0 to listAllShip.Count - 1 do
    begin
      if Assigned(listAllShip[i]) then
      begin
        AllShip := TVehicle(listAllShip[i]);

        ShipDetail := TVehicle.Create;

        setVelueVehicle(ShipDetail, AllShip);

        if (AllShip.Vehicle_Ctgr <> 0) {and (AllShip.Vehicle_Type = 1)} and (AllShip.Vehicle_Target = 0) then
        begin
          {$REGION ' Load KRI'}
          ListViewAdd(lvWarShipSelect, lvWarShipAll, ShipDetail, 3);
          {$ENDREGION}
        end
        else  if (AllShip.Vehicle_Ctgr = 0) {and (AllShip.Vehicle_Type = 1)} and (AllShip.Vehicle_Target = 0) then
        begin
          {$REGION ' Load General'}
          ListViewAdd(lvGeneralShipSelect, lvGeneralShipAll, ShipDetail, 3);
          {$ENDREGION}
        end
        else if (AllShip.Vehicle_Target = 1) then
        begin
          {$REGION ' Load Target'}
          ListViewAdd(lvTargetSurfaceSelect, lvTargetShipAll, ShipDetail, 3);
          {$ENDREGION}
        end;

        { Set Environment Object }
        Mx := AllShip.Vehicle_X;
        My := AllShip.Vehicle_Y;
        // Mx := (AllShip.Vehicle_X / C_Degree_To_Meter)+ Dx;
        // My := (AllShip.Vehicle_Y / C_Degree_To_Meter)+ Dy;

        for j := 0 to SimManager.MainObjList.ItemCount - 1 do
        begin
          if Assigned(SimManager.MainObjList.getObject(j)) then
          begin
            Ship := SimManager.MainObjList.getObject(j) as TInsObject;
            if Ship.FDataBaseID = AllShip.Vehicle_ID then
            begin
              Ship.MoveTo(Mx, My);
              Ship.AllowUpdate := false;
              Ship.VSymbol.Heading := ValidateDegree(AllShip.Vehicle_Heading);
              Ship.PositionZ := AllShip.Vehicle_Z;
              Ship.Speed := AllShip.Vehicle_Speed;
              break;
            end;
          end;
        end;
      end;
    end;
    ClearAList(listAllShip);
    listAllShip.Free;

    {$ENDREGION}

  end;
end;

procedure TfrmSceEditor.FormCreate(Sender: TObject);
var
  i: Integer;
  del: TMenuItem;
begin
  WeaponListScenario := TList.Create;
  SetObjectCreate;
  TabTargetShip.ActivePage := tsSurface;
end;

procedure TfrmSceEditor.FormDestroy(Sender: TObject);
begin

  ClearListViewData(lvWarShipAll);
  ClearListViewData(lvWarShipSelect);
  ClearListViewData(lvGeneralShipAll);
  ClearListViewData(lvGeneralShipSelect);
  ClearListViewData(lvTargetShipAll);
  ClearListViewData(lvTargetSurfaceSelect);
  ClearListViewData(lvTargetSubsurfaceAll);
  ClearListViewData(lvTargetSubsurfaceSelect);
  ClearListViewData(lvTargetAirAll);
  ClearListViewData(lvTargetAirSelect);
  ClearListViewData(lvConsole);
  ClearListViewData(lvWeaponSelected);

  ClearWeaponListScenario;
  WeaponListScenario.Free;
end;

procedure TfrmSceEditor.ClearWeaponListScenario;
begin
  ClearAList(WeaponListScenario);
end;

procedure TfrmSceEditor.DeleteWeaponList(shipID: Integer);
var
  i: Integer;
  SceWeapon: TScenarioWeapon;
begin
  for i := WeaponListScenario.Count - 1 downto 0 do
  begin
    if Assigned(WeaponListScenario.Items[i]) then
    begin
      SceWeapon := TScenarioWeapon(WeaponListScenario.Items[i]);
      if Assigned(SceWeapon) and (SceWeapon.shipID = shipID) then
      begin
        WeaponListScenario.Delete(i);
        SceWeapon.Free;
      end;
    end;
  end;
end;


procedure TfrmSceEditor.edtBaroPressureKeyPress(Sender: TObject; var Key: Char);
var
  val : Integer;

begin
  if Key = #13 then
  begin
    val := StrToIntDef(edtBaroPressure.Text, 0);


    if val > 5000 then
      val := 5000
    else if val < 0 then
         val := 0 ;

    edtBaroPressure.Text := IntToStr(val);
    tbBaroPressure.Position := StrToIntDef(edtBaroPressure.Text, 0);
  end;

end;

procedure TfrmSceEditor.edtFogHKeyPress(Sender: TObject; var Key: Char);
var
  val : Integer;

begin
  if Key = #13 then
  begin
    val := StrToIntDef(edtFogH.Text, 0);


    if val > 3 then
      val := 3
    else if val < 0 then
         val := 0 ;
    edtFogH.Text := IntToStr(val);
    tbFogH.Position := StrToIntDef(edtFogH.Text, 0);
  end;
end;

procedure TfrmSceEditor.edtHumidityKeyPress(Sender: TObject; var Key: Char);
  var
   val : Integer;
begin
    if Key = #13 then
  begin
    val := StrToIntDef(edtHumidity.Text, 0);

    if val > 100 then
      val := 100
    else if val < 0 then
      val := 0;
    edtHumidity.Text := IntToStr(val);
    tbHumidity.Position := StrToIntDef(edtHumidity.Text, 0);
  end;

end;

procedure TfrmSceEditor.edtSeaDirectionKeyPress(Sender: TObject; var Key: Char);
 var
    val : Integer;

begin
  if Key = #13 then
  begin
    val := StrToIntDef(edtSeaDirection.Text, 0);

    if val < 180 then
    begin
      val := (180 + val);

      vrwhlSeaDirection.Position := val;
    end
    else
    begin
      val := (val - 180);

      vrwhlSeaDirection.Position := val;
    end;
  end;
end;

procedure TfrmSceEditor.edtSeaSpeedKeyPress(Sender: TObject; var Key: Char);
  var
  val : Integer;

begin
  if Key = #13 then
  begin
    val := StrToIntDef(edtSeaSpeed.Text, 0);

    if val > 50 then
      val := 50
    else if val < 0 then
      val := 0;
    edtSeaSpeed.Text := IntToStr(val);
    tbSeaSpeed.Position := StrToIntDef(edtSeaSpeed.Text, 0);
  end;
end;


procedure TfrmSceEditor.edtSeaStateKeyPress(Sender: TObject; var Key: Char);
var
  val : Integer;

begin
  if Key = #13 then
  begin
    val := StrToIntDef(edtSeaState.Text, 0);

    if val > 5 then
      val := 5
    else if val < 0 then
      val := 0;

    edtSeaState.Text := inttostr(val);

    tbSeaState.Position := StrToIntDef(edtSeaState.Text, 0);
  end;
end;

procedure TfrmSceEditor.edtTempKeyPress(Sender: TObject; var Key: Char);
var
    val : Integer ;

begin
  if Key = #13 then
  begin
     val := StrToIntDef(edtTemp.Text, 0);

    if val > 100 then
      val := 100
    else
    if val < 0 then
      val := 0;

    edtTemp.Text := IntToStr(val);
    tbTemp.Position := StrToIntDef(edtTemp.Text,0);
  end;
end;

procedure TfrmSceEditor.edtWindDirecKeyPress(Sender: TObject; var Key: Char);
 var
    val : Integer;

begin
   if Key = #13 then
  begin
    val := StrToIntDef(edtWindDirec.Text, 0);

    if val < 180 then
    begin
      val := (180 + val);

      vrwhlWindDirec.Position := val;
    end
    else
    begin
      val := (val - 180);

      vrwhlWindDirec.Position := val;
    end;
  end;
end;

Procedure TfrmSceEditor.edtWindSpeedKeyPress(Sender: TObject; var Key: Char);
 var
    val : Integer;

begin
  if Key = #13 then
  begin
    val := StrToIntDef(edtWindSpeed.Text, 0);
    if val > 50 then
      val := 50
    else if val < 0 then
      val := 0;
    edtWindSpeed.Text := IntToStr(val);
    tbWindSpeed.Position := StrToIntDef(edtWindSpeed.Text, 0);
  end;
end;

procedure TfrmSceEditor.FillWeaponList(shipID: Integer);
var
  ListWeapon, ListWeaponOnSce: TList;
  Weapon: TWeaponGetList;

  SceWeapon, TmpSceWeapon: TScenarioWeapon;
  isFound: boolean;

  i, j: Integer;
begin
  try
    ListWeapon := TList.Create;
    ListWeaponOnSce := TList.Create;

    DataModule1.GetListWeaponOnShip(shipID, ListWeapon);
    DataModule1.GetListWeaponOnShipBySceID(Scenario_ID, shipID,
      ListWeaponOnSce);

    for i := 0 to ListWeapon.Count - 1 do
    begin
      if Assigned(ListWeapon.Items[i]) then
      begin
        Weapon := TWeaponGetList(ListWeapon.Items[i]);

        SceWeapon := TScenarioWeapon.Create;
        SceWeapon.shipID := shipID;
        SceWeapon.WeaponID := Weapon.IDWeapon;
        SceWeapon.LauncherID := Weapon.IDDetail;
        SceWeapon.WeaponName := DataModule1.GetNameWeaponByID(Weapon.IDWeapon);
        SceWeapon.EnableWeapon := true;

        isFound := false;
        for j := 0 to ListWeaponOnSce.Count - 1 do
        begin
          if Assigned(ListWeaponOnSce.Items[j]) then
          begin
            TmpSceWeapon := TScenarioWeapon(ListWeaponOnSce.Items[j]);
            if (SceWeapon.WeaponID = TmpSceWeapon.WeaponID) and
              (SceWeapon.LauncherID = TmpSceWeapon.LauncherID) and
              (SceWeapon.shipID = TmpSceWeapon.shipID) then
            begin
              isFound := true;
              break;
            end;
          end;
        end;

        if isFound then
        begin
          SceWeapon.EnableWeapon := true;
        end
        else
        begin
          SceWeapon.EnableWeapon := false;
        end;

        WeaponListScenario.Add(SceWeapon);
      end;
    end;
  finally
    ClearAList(ListWeaponOnSce);
    ListWeaponOnSce.Free;
    ClearAList(ListWeapon);
    ListWeapon.Free;
  end;

end;

procedure TfrmSceEditor.ShowWeaponOnShip(shipID: Integer);
var
  i: Integer;
  SceWeapon: TScenarioWeapon;
begin
  lvWeaponSelected.Items.Clear;

  for i := 0 to WeaponListScenario.Count - 1 do
  begin
    if Assigned(WeaponListScenario.Items[i]) then
    begin
      SceWeapon := TScenarioWeapon(WeaponListScenario.Items[i]);
      if Assigned(SceWeapon) then begin
        if SceWeapon.shipID <> shipID then
          Continue;

        with lvWeaponSelected.Items.Add do
        begin
          Caption := SceWeapon.WeaponName;
          SubItems.Add(IntToStr(SceWeapon.LauncherID));
          if SceWeapon.EnableWeapon then
          begin
            SubItems.Add('Enable')
          end
          else
          begin
            SubItems.Add('Disable');
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmSceEditor.btnEnableWeaponClick(Sender: TObject);
var
  i, j: Integer;
  SceWeapon: TScenarioWeapon;
  isEnable: boolean;

  WeaponID, LauncherID, shipID: Integer;
  ClientConsole: TClientList;
begin
//  if btnEnableWeapon.Tag = 0 then
//    isEnable := false
//  else
//    isEnable := true;

  if lvWarShipSelect.Selected <> nil then
  begin
    shipID := DataModule1.getShipIDByName(lvWarShipSelect.Selected.Caption);
    if lvWeaponSelected.Selected <> nil then
    begin
      if lvWeaponSelected.Selected.Caption = 'Torpedo A244' then
      begin
        WeaponID := 3;
      end
      else
      begin
        WeaponID := DataModule1.getWeaponIDByName
          (lvWeaponSelected.Selected.Caption);
      end;

      LauncherID := StrToInt(lvWeaponSelected.Selected.SubItems[0]);

      for i := 0 to WeaponListScenario.Count - 1 do
      begin
        SceWeapon := TScenarioWeapon(WeaponListScenario.Items[i]);

        if Assigned(SceWeapon) and (SceWeapon.shipID = shipID) and (SceWeapon.WeaponID = WeaponID) and
          (SceWeapon.LauncherID = LauncherID) then
        begin
          SceWeapon.EnableWeapon := isEnable;

          if not isEnable then
          begin
            for j := 0 to lvConsole.Items.Count - 1 do
            begin
              if Assigned(lvConsole.Items[j].Data) then
              begin
                ClientConsole := TClientList(lvConsole.Items[j].Data);

                if (lvConsole.Items[j].SubItems[5] = IntToStr(SceWeapon.shipID))
                  and (lvConsole.Items[j].SubItems[6] = IntToStr
                  (SceWeapon.LauncherID)) and
                  (ClientConsole.WeaponID = SceWeapon.WeaponID) then
                begin
                  lvConsole.Items[j].SubItems[4] := '';
                  lvConsole.Items[j].SubItems[5] := '';
                  lvConsole.Items[j].SubItems[6] := '';
                end
                else if (ClientConsole.WeaponID = C_DBID_ASROC) or
                  (ClientConsole.WeaponID = C_DBID_RBU6000) or
                  (SceWeapon.WeaponID = C_DBID_CANNON120) then
                begin
                  if (lvConsole.Items[j].SubItems[5] = IntToStr
                    (SceWeapon.shipID)) then
                  begin
                    lvConsole.Items[j].SubItems[4] := '';
                    lvConsole.Items[j].SubItems[5] := '';
                    lvConsole.Items[j].SubItems[6] := '';
                  end

                end;
              end;
            end;
          end;
        end;
      end;
    end;

    ShowWeaponOnShip(shipID);
  end;
end;

procedure TfrmSceEditor.lvWeaponSelectedClick(Sender: TObject);
begin
  if lvWeaponSelected.Selected <> nil then
  begin
    // ShowMessage(lvWeaponSelected.Selected.SubItems[0]);
    if lvWeaponSelected.Selected.SubItems[1] = 'Enable' then
    begin
//      btnEnableWeapon.Tag := 0;
//      btnEnableWeapon.Caption := 'Disable';
    end

    else if lvWeaponSelected.Selected.SubItems[1] = 'Disable' then
    begin
//      btnEnableWeapon.Tag := 1;
//      btnEnableWeapon.Caption := 'Enable';
    end;
  end;
end;

procedure TfrmSceEditor.UpdateWeaponList(shipID, SceID: Integer);
var
  SceWeapon: TScenarioWeapon;
  TempSceWeapon: TScenarioWeapon;

  WeaponList: TList;
  i, j: Integer;
begin
  WeaponList := TList.Create;
  try
    DataModule1.GetListWeaponOnShipBySceID(SceID, shipID, WeaponList);

    for i := 0 to WeaponListScenario.Count - 1 do
    begin
      if Assigned(WeaponListScenario.Items[i]) then
      begin
        SceWeapon := TScenarioWeapon(WeaponListScenario.Items[i]);
        if SceWeapon.shipID = shipID then
        begin
          SceWeapon.EnableWeapon := false;
        end;
      end;
    end;

    for j := 0 to WeaponList.Count - 1 do
    begin
      if Assigned(WeaponList.Items[j]) then
      begin
        TempSceWeapon := TScenarioWeapon(WeaponList.Items[j]);
        for i := 0 to WeaponListScenario.Count - 1 do
        begin
          if Assigned(WeaponListScenario.Items[i]) then
          begin
            SceWeapon := TScenarioWeapon(WeaponListScenario.Items[i]);
            if (TempSceWeapon.shipID = SceWeapon.shipID) and
              (TempSceWeapon.WeaponID = SceWeapon.WeaponID) and
              (TempSceWeapon.LauncherID = SceWeapon.LauncherID) then
            begin
              SceWeapon.EnableWeapon := true;
              break;
            end;
          end;
        end;
      end;
    end;

  finally
    ClearAList(WeaponList);
    WeaponList.Free;
  end;
end;

procedure TfrmSceEditor.vrwhlSeaDirectionChange(Sender: TObject);
var
  valTemp : Integer;

begin
  if vrwhlSeaDirection.Position < 180 then
  begin
    valTemp := (180 + vrwhlSeaDirection.Position);
  end
  else
  begin
    valTemp := (vrwhlSeaDirection.Position - 180);
  end;
  edtSeaDirection.Text := IntToStr(valTemp);
end;

procedure TfrmSceEditor.vrwhlWindDirecChange(Sender: TObject);
var
  valTemp : Integer;

begin
  if vrwhlWindDirec.Position < 180 then
  begin
    valTemp := (180 + vrwhlWindDirec.Position);
  end
  else
  begin
    valTemp := (vrwhlWindDirec.Position - 180);
  end;
  edtWindDirec.Text := IntToStr(valTemp);
end;

// dendy
procedure TfrmSceEditor.lvConsoleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p: TPoint;

  i, j, K, L: Integer;

  WeaponID: Integer;

  shipID: Integer;
  ListWeapon, ListWeaponOnScenario: TList;
  WeaponList: TWeaponGetList;
  isFound: boolean;
  ShipClass: string;

  ShipID2: Integer;
  ListWeapon2: TList;
  WeaponList2: TWeaponGetList;
  isFound2, RbuLauncher1Ready, RbuLauncher2Ready: boolean;
  ShipClass2: string;

  scenarioWeapon: TScenarioWeapon;

begin
  if (Button = MbRight) then
  begin
    if Assigned(lvConsole.Selected) then
    begin
      GetCursorPos(p);

      if not Assigned(lvConsole.Selected.Data) then
        Exit;
      WeaponID := TClientList(lvConsole.Selected.Data).WeaponID;

      // WeaponID := strtoint(lvConsole.Selected.SubItems[7]);

      if (lvConsole.Selected.SubItems[2] = '3D-W') then
      begin
        for i := 0 to pmConsole2.Items.Count - 1 do
          pmConsole2.Items[i].Enabled := true;

        { Check Available Except MOC }
        try
          ListWeapon2 := TList.Create;
          for i := 0 to pmConsole2.Items.Count - 1 do
          begin
            ShipID2 := pmConsole2.Items[i].Tag;

            if ShipID2 = 0 then
              Continue;
            if WeaponID = 0 then
              Continue;

            ClearAList(ListWeapon2);
            DataModule1.GetListWeaponOnShip(ShipID2, ListWeapon2);

            isFound2 := false;
            for j := 0 to ListWeapon2.Count - 1 do
            begin
              if Assigned(ListWeapon2.Items[j]) then
              begin
                WeaponList2 := TWeaponGetList(ListWeapon2.Items[j]);
                if WeaponList2.IDWeapon = WeaponID then
                // WeaponID then     coba yakhont
                begin
                  isFound2 := true;
                  break;
                end;
              end;
            end;

            if not isFound2 then
              pmConsole2.Items[i].Enabled := false
            else
            begin
              // dendy mampir
              pmConsole2.Items[i].Enabled := true;

              if (lvConsole.Selected.SubItems[1] = 'TDS Meriam 57') then
              begin

                pmConsole2.Items[i].Items[0].Enabled := false;
                pmConsole2.Items[i].Items[1].Enabled := false;
                pmConsole2.Items[i].Items[2].Enabled := false;

                for K := 0 to WeaponListScenario.Count - 1 do
                begin
                  if Assigned(WeaponListScenario.Items[K]) then
                  begin
                    scenarioWeapon :=
                      TScenarioWeapon(WeaponListScenario.Items[K]);;
                    if (scenarioWeapon.shipID = ShipID2) and
                      (scenarioWeapon.WeaponID = WeaponID) and
                      (scenarioWeapon.LauncherID = 2) and
                      (scenarioWeapon.EnableWeapon = true) then
                    begin
                      pmConsole2.Items[i].Items[1].Enabled := true;
                    end;
                  end;
                end;

              end
              else if (lvConsole.Selected.SubItems[1] = 'TDS Meriam 40') then
              begin
                DataModule1.GetShipType(ShipID2, ShipClass2);
                pmConsole2.Items[i].Items[0].Enabled := false;
                pmConsole2.Items[i].Items[1].Enabled := false;
                pmConsole2.Items[i].Items[2].Enabled := false;

                for K := 0 to WeaponListScenario.Count - 1 do
                begin
                  if Assigned(WeaponListScenario.Items[K]) then
                  begin
                    scenarioWeapon :=
                      TScenarioWeapon(WeaponListScenario.Items[K]);
                    if ShipClass2 <> 'Fatahillah' then
                    begin
                      if (scenarioWeapon.shipID = ShipID2) and
                        (scenarioWeapon.WeaponID = WeaponID) and
                        (scenarioWeapon.LauncherID = 2) and
                        (scenarioWeapon.EnableWeapon = true) then
                      begin
                        pmConsole2.Items[i].Items[1].Enabled := true;
                      end
                      else if (scenarioWeapon.shipID = ShipID2) and
                        (scenarioWeapon.WeaponID = WeaponID) and
                        (scenarioWeapon.LauncherID = 3) and
                        (scenarioWeapon.EnableWeapon = true) then
                      begin
                        pmConsole2.Items[i].Items[2].Enabled := true;
                      end;
                    end;
                  end;
                end;
              end
              else if (lvConsole.Selected.SubItems[1] = 'Mistral') then
              begin
                pmConsole2.Items[i].Items[0].Enabled := false;
                pmConsole2.Items[i].Items[1].Enabled := false;
                pmConsole2.Items[i].Items[2].Enabled := false;

                for K := 0 to WeaponListScenario.Count - 1 do
                begin
                  if Assigned(WeaponListScenario.Items[K]) then
                  begin
                    scenarioWeapon :=
                      TScenarioWeapon(WeaponListScenario.Items[K]);;
                    if (scenarioWeapon.shipID = ShipID2) and
                      (scenarioWeapon.WeaponID = WeaponID) and
                      (scenarioWeapon.LauncherID = 1) and
                      (scenarioWeapon.EnableWeapon = true) then
                    begin
                      pmConsole2.Items[i].Items[0].Enabled := true;
                    end
                    else if (scenarioWeapon.shipID = ShipID2) and
                      (scenarioWeapon.WeaponID = WeaponID) and
                      (scenarioWeapon.LauncherID = 2) and
                      (scenarioWeapon.EnableWeapon = true) then
                    begin
                      pmConsole2.Items[i].Items[1].Enabled := true;
                    end
                    else if (scenarioWeapon.shipID = ShipID2) and
                      (scenarioWeapon.WeaponID = WeaponID) and
                      (scenarioWeapon.LauncherID = 3) and
                      (scenarioWeapon.EnableWeapon = true) then
                    begin
                      pmConsole2.Items[i].Items[2].Enabled := true;
                    end;
                  end;
                end;
              end
              else
              begin
                pmConsole2.Items[i].Items[0].Enabled := false;
                pmConsole2.Items[i].Items[1].Enabled := false;
                pmConsole2.Items[i].Items[2].Enabled := false;

                for K := 0 to WeaponListScenario.Count - 1 do
                begin
                  if Assigned(WeaponListScenario.Items[K]) then
                  begin
                    scenarioWeapon :=
                      TScenarioWeapon(WeaponListScenario.Items[K]);;
                    if (scenarioWeapon.shipID = ShipID2) and
                      (scenarioWeapon.WeaponID = WeaponID) and
                      (scenarioWeapon.LauncherID = 1) and
                      (scenarioWeapon.EnableWeapon = true) then
                    begin
                      pmConsole2.Items[i].Items[0].Enabled := true;
                    end
                    else if (scenarioWeapon.shipID = ShipID2) and
                      (scenarioWeapon.WeaponID = WeaponID) and
                      (scenarioWeapon.LauncherID = 2) and
                      (scenarioWeapon.EnableWeapon = true) then
                    begin
                      pmConsole2.Items[i].Items[1].Enabled := true;
                    end
                    else if (scenarioWeapon.shipID = ShipID2) and
                      (scenarioWeapon.WeaponID = WeaponID) and
                      (scenarioWeapon.LauncherID = 3) and
                      (scenarioWeapon.EnableWeapon = true) then
                    begin
                      pmConsole2.Items[i].Items[2].Enabled := true;
                    end;
                  end;
                end;

              end;

              if (lvConsole.Selected.SubItems.Strings[4] = DeleteAmpersand
                (pmConsole2.Items[i].Caption)) then
                pmConsole2.Items[i].Enabled := false
              else
                pmConsole2.Items[i].Enabled := true;
            end;
          end;
        finally
          ClearAList(ListWeapon2);
          ListWeapon2.Free;
        end;

        pmConsole2.Popup(p.X, p.Y);
      end
      else
      begin

        for i := 0 to pmConsole.Items.Count - 1 do
          pmConsole.Items[i].Enabled := true;

        if (lvConsole.Selected.SubItems[1] = 'MOC-1') or
          (lvConsole.Selected.SubItems[1] = 'MOC-2') then
        begin
          for i := 0 to pmConsole.Items.Count - 1 do
          begin
            isFound := false;
            shipID := pmConsole.Items[i].Tag;

            if shipID = 0 then
              Continue;
            // if weaponID = 0 then continue;

            DataModule1.GetShipType(shipID, ShipClass);
            if ShipClass = 'Diponegoro ( Sigma )' then
            begin
              isFound := true;
            end;

            if not isFound then
              pmConsole.Items[i].Enabled := false
            else
            begin
              if (lvConsole.Selected.SubItems.Strings[4] = DeleteAmpersand
                (pmConsole.Items[i].Caption)) then
                pmConsole.Items[i].Enabled := false
              else
                pmConsole.Items[i].Enabled := true;
            end;
          end;
        end

        else if (lvConsole.Selected.SubItems[1] = 'WCC') then
        begin
          for i := 0 to pmConsole.Items.Count - 1 do
          begin
            isFound := false;
            shipID := pmConsole.Items[i].Tag;

            if shipID <= 0 then
              Continue;
            // if weaponID = 0 then continue;

            DataModule1.GetShipType(shipID, ShipClass);
            if ShipClass = 'Fatahillah' then
            begin
              isFound := true;
            end;

            if not isFound then
              pmConsole.Items[i].Enabled := false
            else
            begin
              if (lvConsole.Selected.SubItems.Strings[4] = DeleteAmpersand
                (pmConsole.Items[i].Caption)) then
                pmConsole.Items[i].Enabled := false
              else
                pmConsole.Items[i].Enabled := true;

              if (lvConsole.Selected.SubItems[1] = 'WCC') then
              begin
                pmConsole.Items[i].Enabled := false;

                for K := 0 to WeaponListScenario.Count - 1 do
                begin
                  if Assigned(WeaponListScenario.Items[K]) then
                  begin
                    scenarioWeapon :=
                      TScenarioWeapon(WeaponListScenario.Items[K]);
                    if ((scenarioWeapon.WeaponID = C_DBID_CANNON120) and
                      (scenarioWeapon.shipID = shipID)) then
                    begin
                      if (scenarioWeapon.LauncherID = 1) and
                        (scenarioWeapon.EnableWeapon = true) then
                      begin
                        pmConsole.Items[i].Enabled := true;
                      end;
                    end;
                  end;
                end;

              end;
            end;
          end;
        end

        else
        begin
          { Check Available Except MOC }
          try
            ListWeapon := TList.Create;
            for i := 0 to pmConsole.Items.Count - 1 do
            begin
              shipID := pmConsole.Items[i].Tag;

              if shipID = 0 then
                Continue;
              if WeaponID = 0 then
                Continue;

              ClearAList(ListWeapon);
              DataModule1.GetListWeaponOnShip(shipID, ListWeapon);

              isFound := false;
              for j := 0 to ListWeapon.Count - 1 do
              begin
                if Assigned(ListWeapon.Items[j]) then
                begin
                  WeaponList := TWeaponGetList(ListWeapon.Items[j]);
                  if WeaponList.IDWeapon = WeaponID then
                  begin
                    isFound := true;
                    break;
                  end;
                end;

              end;

              if not isFound then
                pmConsole.Items[i].Enabled := false
              else
              begin
                if (lvConsole.Selected.SubItems.Strings[4] = DeleteAmpersand
                  (pmConsole.Items[i].Caption)) then
                  pmConsole.Items[i].Enabled := false
                else
                  pmConsole.Items[i].Enabled := true;

                if (lvConsole.Selected.SubItems[1] = 'RBU 6000') then
                begin
                  pmConsole.Items[i].Enabled := false;

                  for K := 0 to WeaponListScenario.Count - 1 do
                  begin
                    if Assigned(WeaponListScenario.Items[K]) then
                    begin
                      scenarioWeapon :=
                        TScenarioWeapon(WeaponListScenario.Items[K]);
                      if ((scenarioWeapon.WeaponID = C_DBID_RBU6000) and
                        (scenarioWeapon.shipID = shipID)) then
                      begin
                        if (scenarioWeapon.LauncherID = 1) and
                          (scenarioWeapon.EnableWeapon = true) then
                        begin
                          RbuLauncher1Ready := true;
                        end;
                        if (scenarioWeapon.LauncherID = 2) and
                          (scenarioWeapon.EnableWeapon = true) then
                        begin
                          RbuLauncher2Ready := true;
                        end;
                      end;
                    end;
                  end;

                  if (RbuLauncher1Ready = true) and (RbuLauncher2Ready = true)
                  then
                  begin
                    pmConsole.Items[i].Enabled := true;
                  end;

                  RbuLauncher1Ready := false;
                  RbuLauncher2Ready := false;

                end
                else if (lvConsole.Selected.SubItems[1] = 'Asroc') then
                begin
                  pmConsole.Items[i].Enabled := false;

                  for K := 0 to WeaponListScenario.Count - 1 do
                  begin
                    if Assigned(WeaponListScenario.Items[K]) then
                    begin
                      scenarioWeapon :=
                        TScenarioWeapon(WeaponListScenario.Items[K]);
                      if ((scenarioWeapon.WeaponID = C_DBID_ASROC) and
                        (scenarioWeapon.shipID = shipID)) then
                      begin
                        if (scenarioWeapon.LauncherID = 1) and
                          (scenarioWeapon.EnableWeapon = true) then
                        begin
                          pmConsole.Items[i].Enabled := true;
                        end;
                      end;
                    end;
                  end;

                end;
              end;
            end;
          finally
            ClearAList(ListWeapon);
            ListWeapon.Free;
          end;
        end;

        pmConsole.Popup(p.X, p.Y);
      end;
    end;
  end;
end;

procedure TfrmSceEditor.SetFormLayout;
var
  i: Integer;
begin
  { Set Game Controller }
  DefaultMonitor := dmDesktop;
  if Screen.MonitorCount > 1 then
    i := 1
  else
    i := 0;

  Height := Screen.Monitors[i].Height;
  Top := Screen.Monitors[i].Top;
  Left := Screen.Monitors[i].Left;
  Width := Screen.Monitors[i].Width;

  Show;
end;

procedure TfrmSceEditor.SetObjectCreate;
var
  i: Integer;
begin
  for i := 0 to TabSelection.AdvSmoothTabPageCount - 1 do
  begin
    TabSelection.AdvSmoothTabPages[i].TabAppearance.Appearance.
      SimpleLayout := true;
  end;
  TabSelection.ActivePage.TabAppearance.Appearance.SimpleLayout := false;

  { Set Event Handler ListView }
  lvWarShipAll.Tag := 1;
  lvWarShipSelect.Tag := 2;
  lvGeneralShipAll.Tag := 3;
  lvGeneralShipSelect.Tag := 4;
  lvTargetShipAll.Tag := 5;
  lvTargetSurfaceSelect.Tag := 6;
  lvTargetSubsurfaceAll.Tag := 7;
  lvTargetSubsurfaceSelect.Tag := 8;
  lvTargetAirAll.Tag := 9;
  lvTargetAirSelect.Tag := 10;

  { OnCompare }
  lvWarShipAll.OnCompare := ListViewCompare;
  lvWarShipSelect.OnCompare := ListViewCompare;
  lvGeneralShipAll.OnCompare := ListViewCompare;
  lvGeneralShipSelect.OnCompare := ListViewCompare;
  lvTargetShipAll.OnCompare := ListViewCompare;
  lvTargetSurfaceSelect.OnCompare := ListViewCompare;
  lvTargetSubsurfaceAll.OnCompare := ListViewCompare;
  lvTargetSubsurfaceSelect.OnCompare := ListViewCompare;
  lvTargetAirAll.OnCompare := ListViewCompare;
  lvTargetAirSelect.OnCompare := ListViewCompare;

  { OnSelectitem }
  lvWarShipAll.OnSelectItem := ListViewSelectItem;
  lvWarShipSelect.OnSelectItem := ListViewSelectItem;
  lvGeneralShipAll.OnSelectItem := ListViewSelectItem;
  lvGeneralShipSelect.OnSelectItem := ListViewSelectItem;
  lvTargetShipAll.OnSelectItem := ListViewSelectItem;
  lvTargetSurfaceSelect.OnSelectItem := ListViewSelectItem;
  lvTargetSubsurfaceAll.OnSelectItem := ListViewSelectItem;
  lvTargetSubsurfaceSelect.OnSelectItem := ListViewSelectItem;
  lvTargetAirAll.OnSelectItem := ListViewSelectItem;
  lvTargetAirSelect.OnSelectItem := ListViewSelectItem;

  { OnDblClick }
  lvWarShipAll.OnDblClick := ListViewDblClick;
  lvWarShipSelect.OnDblClick := ListViewDblClick;
  lvGeneralShipAll.OnDblClick := ListViewDblClick;
  lvGeneralShipSelect.OnDblClick := ListViewDblClick;
  lvTargetShipAll.OnDblClick := ListViewDblClick;
  lvTargetSurfaceSelect.OnDblClick := ListViewDblClick;
  lvTargetSubsurfaceAll.OnDblClick := ListViewDblClick;
  lvTargetSubsurfaceSelect.OnDblClick := ListViewDblClick;
  lvTargetAirAll.OnDblClick := ListViewDblClick;
  lvTargetAirSelect.OnDblClick := ListViewDblClick;

  { OnClick }
  lvWarShipAll.OnClick := ListViewClick;
  lvWarShipSelect.OnClick := ListViewClick;
  lvGeneralShipAll.OnClick := ListViewClick;
  lvGeneralShipSelect.OnClick := ListViewClick;
  lvTargetShipAll.OnClick := ListViewClick;
  lvTargetSurfaceSelect.OnClick := ListViewClick;
  lvTargetSubsurfaceAll.OnClick := ListViewClick;
  lvTargetSubsurfaceSelect.OnClick := ListViewClick;
  lvTargetAirAll.OnClick := ListViewClick;
  lvTargetAirSelect.OnClick := ListViewClick;

  { Set Event Handler Button Add/Remove }
  btnAddWarShip.Tag := 1;
  btnRemoveWarShip.Tag := 2;
  btnAddGnrShip.Tag := 3;
  btnRemoveGnrShip.Tag := 4;
  btnAddTargetSurface.Tag := 5;
  btnRemoveTargetSurface.Tag := 6;
  btnAddTargetSubsurface.Tag := 7;
  btnRemoveTargetSubsurface.Tag := 8;
  btnAddTargetAir.Tag := 9;
  btnRemoveTargetAir.Tag := 10;

  { Add Button }
  btnAddWarShip.Enabled := false;
  btnAddGnrShip.Enabled := false;
  btnAddTargetSurface.Enabled := false;
  btnAddTargetSubsurface.Enabled := false;
  btnAddTargetAir.Enabled := false;
  btnAddWarShip.OnClick := ButtonAddShip;
  btnAddGnrShip.OnClick := ButtonAddShip;
  btnAddTargetSurface.OnClick := ButtonAddShip;
  btnAddTargetSubsurface.OnClick := ButtonAddShip;
  btnAddTargetAir.OnClick := ButtonAddShip;

  { Remove Button }
  btnRemoveWarShip.Enabled := false;
  btnRemoveGnrShip.Enabled := false;
  btnRemoveTargetSurface.Enabled := false;
  btnRemoveTargetSubsurface.Enabled := false;
  btnRemoveTargetAir.Enabled := false;
  btnRemoveWarShip.OnClick := ButtonRemoveShip;
  btnRemoveGnrShip.OnClick := ButtonRemoveShip;
  btnRemoveTargetSurface.OnClick := ButtonRemoveShip;
  btnRemoveTargetSubsurface.OnClick := ButtonRemoveShip;
  btnRemoveTargetAir.OnClick := ButtonRemoveShip;
end;

procedure TfrmSceEditor.TabSelectionChange(Sender: TObject);
var
  i: Integer;
begin
  { Add Button }
  btnAddWarShip.Enabled := false;
  btnAddGnrShip.Enabled := false;
  btnAddTargetSurface.Enabled := false;
  btnAddTargetSubsurface.Enabled := false;
  btnAddTargetAir.Enabled := false;
  { Remove Button }
  btnRemoveWarShip.Enabled := false;
  btnRemoveGnrShip.Enabled := false;
  btnRemoveTargetSurface.Enabled := false;
  btnRemoveTargetSubsurface.Enabled := false;
  btnRemoveTargetAir.Enabled := false;

  btnSetPosition.Visible := false;

  for i := 0 to TabSelection.AdvSmoothTabPageCount - 1 do
  begin
    TabSelection.AdvSmoothTabPages[i].TabAppearance.Appearance.
      SimpleLayout := true;
  end;
  TabSelection.ActivePage.TabAppearance.Appearance.SimpleLayout := false;

  if TabSelection.ActivePage.Caption = 'Console' then
    btnSetPosition.Visible := false;
end;

procedure TfrmSceEditor.TabTargetShipChange(Sender: TObject);
begin
  { Add Button }
  btnAddWarShip.Enabled := false;
  btnAddGnrShip.Enabled := false;
  btnAddTargetSurface.Enabled := false;
  btnAddTargetSubsurface.Enabled := false;
  btnAddTargetAir.Enabled := false;
  { Remove Button }
  btnRemoveWarShip.Enabled := false;
  btnRemoveGnrShip.Enabled := false;
  btnRemoveTargetSurface.Enabled := false;
  btnRemoveTargetSubsurface.Enabled := false;
  btnRemoveTargetAir.Enabled := false;
end;

procedure TfrmSceEditor.tbBaroPressureChange(Sender: TObject);
begin
  edtBaroPressure.Text := IntToStr(tbBaroPressure.Position);
end;

procedure TfrmSceEditor.tbFogHChange(Sender: TObject);
begin
  edtFogH.Text := IntToStr(tbFogH.Position);
end;

procedure TfrmSceEditor.tbHumidityChange(Sender: TObject);
begin
   edtHumidity.Text := IntToStr(tbHumidity.Position);
end;

procedure TfrmSceEditor.tbSeaSpeedChange(Sender: TObject);
begin
   edtSeaSpeed.Text := IntToStr(tbSeaSpeed.Position);
end;

procedure TfrmSceEditor.tbSeaStateChange(Sender: TObject);
begin
  edtSeaState.Text := IntToStr(tbSeaState.Position);

end;

procedure TfrmSceEditor.tbTempChange(Sender: TObject);
begin
  edtTemp.Text := IntToStr(tbTemp.Position);
end;

procedure TfrmSceEditor.tbWindSpeedChange(Sender: TObject);
begin
   edtWindSpeed.Text := IntToStr(tbWindSpeed.Position);
end;

procedure TfrmSceEditor.pnlMainBottomClick(Sender: TObject);
begin
  // if GetAsyncKeyState(16) <> 0 then btnWeaponList.Visible := True
  // else btnWeaponList.Visible := False;
end;

function TfrmSceEditor.CekInput: boolean;
var
  i, chkSpace, numSpace: Integer;
begin
  result := false;

  { Jika inputan scenario name kosong }
  if (edtScenarioName.Text = '') then
  begin
    ShowMessage('Please insert scenario name');
    Exit;
  end;

  { Jika berisi spasi semua }
  if Copy(edtScenarioName.Text, 1, 1) = ' ' then
  begin
    chkSpace := Length(edtScenarioName.Text);
    numSpace := 0;

    for i := 1 to chkSpace do
    begin
      if edtScenarioName.Text[i] = #32 then
        numSpace := numSpace + 1;
    end;

    if chkSpace = numSpace then
    begin
      ShowMessage('Please use another scenario name');
      Exit;
    end;
  end;

  { Jika scenario name sudah ada }
  if DataModule1.GetScenarioByName(edtScenarioName.Text) then
  begin
    { Jika inputan baru }
    if isNew then
    begin
      ShowMessage('Please use another scenario name');
      Exit;
    end
    else if LastName <> edtScenarioName.Text then
    begin
      ShowMessage('Please use another scenario name');
      Exit;
    end;
  end;

  result := true;
end;

procedure TfrmSceEditor.ClearListViewData(const aListView: TListView);
var
  i: Integer;
  o: TObject;
begin
  for i := 0 to aListView.Items.Count - 1 do
  begin
    if Assigned(aListView.Items[i].Data) then
    begin
      o := TObject(aListView.Items[i].Data);
      o.Free;
      aListView.Items[i].Data:= nil;
    end;
  end;
  aListView.Clear;
end;

end.
