unit ufScenarioEdit;

interface

uses
  {windows / Component uses}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Math, AdvSmoothButton, Menus, AdvListV,
  AdvPageControl, AdvSmoothTabPager, AdvSmoothPanel, CurvyControls,
  AdvSmoothLabel,
  jpeg,

  {lib uses}
  ufWeaponList, ufListScenario, uClassDatabase, uDataModule, uInstrukturManager,
  uInstrukturObjects, uSimulationManager, uTCPDatatype, uBaseConstan,
  uBaseFunction,
  ufEnvi, uGlobalVar;

type
  TfrmSceEditor = class(TForm)
    pmConsole: TPopupMenu;
    pmConsole2: TPopupMenu;
    pnlMain: TAdvSmoothPanel;
    pnlMainUp: TAdvSmoothPanel;
    pnlMainBottom: TAdvSmoothPanel;
    pnlMainBody: TAdvSmoothPanel;
    pnlPicture: TAdvSmoothPanel;
    TabSelection: TAdvSmoothTabPager;
    tsShipKRI: TAdvSmoothTabPage;
    tsShipTarget: TAdvSmoothTabPage;
    tsShipGeneral: TAdvSmoothTabPage;
    tsMargin: TAdvSmoothTabPage;
    tsConsoleRun: TAdvSmoothTabPage;
    lvWarShipAll: TListView;
    btnAddWarShip: TAdvSmoothButton;
    btnRemoveWarShip: TAdvSmoothButton;
    lvWarShipSelect: TListView;
    btnWeaponList: TAdvSmoothButton;
    lvWeaponSelected: TListView;
    lvGeneralShipAll: TListView;
    btnRemoveGnrShip: TAdvSmoothButton;
    btnAddGnrShip: TAdvSmoothButton;
    lvGeneralShipSelect: TListView;
    lvConsole: TListView;
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
    btnEnableWeapon: TAdvSmoothButton;
    advsmthlbl1: TAdvSmoothLabel;
    advsmthlbl2: TAdvSmoothLabel;
    advsmthlbl3: TAdvSmoothLabel;
    lvTargetSurfaceAll: TListView;
    btnAddTargetSurface: TAdvSmoothButton;
    btnRemoveTargetSurface: TAdvSmoothButton;
    lvTargetSurfaceSelect: TListView;
    lvTargetSubsurfaceAll: TListView;
    btnAddTargetSubsurface: TAdvSmoothButton;
    btnRemoveTargetSubsurface: TAdvSmoothButton;
    lvTargetSubsurfaceSelect: TListView;
    lvTargetAirAll: TListView;
    btnAddTargetAir: TAdvSmoothButton;
    btnRemoveTargetAir: TAdvSmoothButton;
    lvTargetAirSelect: TListView;
    imgShip: TImage;
    btnWeaponListGeneral: TAdvSmoothButton;
    btnWeaponListTarget: TAdvSmoothButton;
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

    procedure ClearWeaponListScenario;
    procedure FillWeaponList(shipID: Integer);
    procedure UpdateWeaponList(shipID, SceID: Integer);
    procedure DeleteWeaponList(shipID: Integer);
    procedure ShowWeaponOnShip(shipID: Integer);

    procedure GetAllVehicle;
    procedure UpdateVisualForm;

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
  TabSelection.TabSettings.Width := (TabSelection.Width - 10) div 5;

  { Ship KRI }
  lvWarShipAll.Height := tsShipKRI.Height - 20;
  lvWarShipAll.Left := 10;
  lvWarShipAll.Top := 10;
  lvWarShipSelect.Height := tsShipKRI.Height - 20;
  lvWarShipSelect.Width := tsShipKRI.Width - 50 - lvWarShipAll.Width -
    lvWeaponSelected.Width - btnAddWarShip.Width;
  lvWarShipSelect.Left := 30 + btnAddWarShip.Width + lvWarShipAll.Width;
  lvWarShipSelect.Top := 10;
  lvWeaponSelected.Left := 40 + lvWarShipSelect.Width + lvWarShipAll.Width +
    btnAddWarShip.Width;
  lvWeaponSelected.Top := 10;
  btnEnableWeapon.Left := lvWeaponSelected.Left;
  btnAddWarShip.Top := tsShipKRI.Height div 2 - btnAddWarShip.Height;
  btnAddWarShip.Left := 20 + lvWarShipAll.Width;
  btnRemoveWarShip.Top := btnAddWarShip.Top + btnAddWarShip.Height + 5;
  btnRemoveWarShip.Left := 20 + lvWarShipAll.Width;
  btnWeaponList.Top := tsShipKRI.Height - 20 - btnWeaponList.Height;
  btnWeaponList.Left := 20 + lvWarShipAll.Width;

  btnWeaponListTarget.Top := tsShipKRI.Height - 45 - btnWeaponListTarget.Height;
  btnWeaponListTarget.Left := 20 + lvTargetSurfaceAll.Width;

  btnWeaponListGeneral.Top := tsShipKRI.Height - 20 -
    btnWeaponListGeneral.Height;
  btnWeaponListGeneral.Left := 20 + lvTargetSurfaceAll.Width;

  { Ship General }
  lvGeneralShipAll.Height := tsShipGeneral.Height - 20;
  lvGeneralShipAll.Left := 10;
  lvGeneralShipAll.Top := 10;
  lvGeneralShipSelect.Height := tsShipGeneral.Height - 20;
  lvGeneralShipSelect.Width := tsShipGeneral.Width - 40 - lvGeneralShipAll.Width
    - btnAddWarShip.Width;
  lvGeneralShipSelect.Left := 30 + btnAddGnrShip.Width + lvGeneralShipAll.Width;
  lvGeneralShipSelect.Top := 10;
  btnAddGnrShip.Top := tsShipGeneral.Height div 2 - btnAddWarShip.Height;
  btnAddGnrShip.Left := 20 + lvGeneralShipAll.Width;
  btnRemoveGnrShip.Top := btnAddGnrShip.Top + btnAddGnrShip.Height + 5;
  btnRemoveGnrShip.Left := 20 + lvGeneralShipAll.Width;

  { Target Surface }
  lvTargetSurfaceAll.Height := tsSurface.Height - 20;
  lvTargetSurfaceAll.Left := 10;
  lvTargetSurfaceAll.Top := 10;
  lvTargetSurfaceSelect.Height := tsSurface.Height - 20;
  lvTargetSurfaceSelect.Width := tsSurface.Width - 40 - lvTargetSurfaceAll.Width
    - btnAddTargetSurface.Width;
  lvTargetSurfaceSelect.Left := 30 + btnAddTargetSurface.Width +
    lvTargetSurfaceAll.Width;
  lvTargetSurfaceSelect.Top := 10;
  btnAddTargetSurface.Top := tsSurface.Height div 2 -
    btnAddTargetSurface.Height;
  btnAddTargetSurface.Left := 20 + lvTargetSurfaceAll.Width;
  btnRemoveTargetSurface.Top := btnAddTargetSurface.Top +
    btnAddTargetSurface.Height + 5;
  btnRemoveTargetSurface.Left := 20 + lvTargetSurfaceAll.Width;

  { Target Subsurface }
  lvTargetSubsurfaceAll.Height := tsSubsurface.Height - 20;
  lvTargetSubsurfaceAll.Left := 10;
  lvTargetSubsurfaceAll.Top := 10;
  lvTargetSubsurfaceSelect.Height := tsSubsurface.Height - 20;
  lvTargetSubsurfaceSelect.Width := tsSubsurface.Width - 40 -
    lvTargetSubsurfaceAll.Width - btnAddTargetSubsurface.Width;
  lvTargetSubsurfaceSelect.Left := 30 + btnAddTargetSubsurface.Width +
    lvTargetSubsurfaceAll.Width;
  lvTargetSubsurfaceSelect.Top := 10;
  btnAddTargetSubsurface.Top := tsSubsurface.Height div 2 -
    btnAddTargetSubsurface.Height;
  btnAddTargetSubsurface.Left := 20 + lvTargetSubsurfaceAll.Width;
  btnRemoveTargetSubsurface.Top := btnAddTargetSubsurface.Top +
    btnAddTargetSubsurface.Height + 5;
  btnRemoveTargetSubsurface.Left := 20 + lvTargetSubsurfaceAll.Width;

  { Target Air }
  lvTargetAirAll.Height := tsAir.Height - 20;
  lvTargetAirAll.Left := 10;
  lvTargetAirAll.Top := 10;
  lvTargetAirSelect.Height := tsAir.Height - 20;
  lvTargetAirSelect.Width := tsAir.Width - 40 - lvTargetAirAll.Width -
    btnAddTargetAir.Width;
  lvTargetAirSelect.Left := 30 + btnAddTargetAir.Width + lvTargetAirAll.Width;
  lvTargetAirSelect.Top := 10;
  btnAddTargetAir.Top := tsAir.Height div 2 - btnAddTargetAir.Height;
  btnAddTargetAir.Left := 20 + lvTargetAirAll.Width;
  btnRemoveTargetAir.Top := btnAddTargetAir.Top + btnAddTargetAir.Height + 5;
  btnRemoveTargetAir.Left := 20 + lvTargetAirAll.Width;

  lvWarShipSelect.Columns[5].Width := 80;
  lvWarShipSelect.Columns[0].Width := lvWarShipSelect.Width - 20 -
    lvWarShipSelect.Columns[1].Width - lvWarShipSelect.Columns[2].Width -
    lvWarShipSelect.Columns[3].Width - lvWarShipSelect.Columns[4].Width -
    lvWarShipSelect.Columns[5].Width;

  lvGeneralShipSelect.Columns[5].Width := 80;
  lvGeneralShipSelect.Columns[0].Width := lvGeneralShipSelect.Width - 20 -
    lvGeneralShipSelect.Columns[1].Width - lvGeneralShipSelect.Columns[2].Width
    - lvGeneralShipSelect.Columns[3].Width - lvGeneralShipSelect.Columns[4]
    .Width - lvGeneralShipSelect.Columns[5].Width;

  lvTargetSurfaceSelect.Columns[5].Width := 80;
  lvTargetSurfaceSelect.Columns[0].Width := lvTargetSurfaceSelect.Width - 20 -
    lvTargetSurfaceSelect.Columns[1].Width - lvTargetSurfaceSelect.Columns[2]
    .Width - lvTargetSurfaceSelect.Columns[3].Width -
    lvTargetSurfaceSelect.Columns[4].Width -
    lvTargetSurfaceSelect.Columns[5].Width;

  lvTargetSubsurfaceSelect.Columns[5].Width := 80;
  lvTargetSubsurfaceSelect.Columns[0].Width := lvTargetSubsurfaceSelect.Width -
    20 - lvTargetSubsurfaceSelect.Columns[1].Width -
    lvTargetSubsurfaceSelect.Columns[2].Width - lvTargetSubsurfaceSelect.Columns
    [3].Width - lvTargetSubsurfaceSelect.Columns[4].Width -
    lvTargetSubsurfaceSelect.Columns[5].Width;

  lvTargetAirSelect.Columns[5].Width := 80;
  lvTargetAirSelect.Columns[0].Width := lvTargetAirSelect.Width - 20 -
    lvTargetAirSelect.Columns[1].Width - lvTargetAirSelect.Columns[2].Width -
    lvTargetAirSelect.Columns[3].Width - lvTargetAirSelect.Columns[4].Width -
    lvTargetAirSelect.Columns[5].Width;
end;
{ -------------------------------------------------------------------------- }

{ -------------------------------------------------------------------------- }
{ Listview Event Handler }
procedure TfrmSceEditor.ListViewAdd(aListView, aListView2: TListView;
  aVehicle: TVehicle; aMode: Integer);
var
  i: Integer;
  Ship: TInsObject;
begin
  // yoga tandai berooo

  case aMode of
    1:
      begin
        with aListView.Items.Add do
        begin
          Data := aVehicle;
          Caption := aVehicle.Vehicle_Name;
          SubItems.Add('0');
          SubItems.Add('0');
          SubItems.Add('0');
          SubItems.Add('90');
          SubItems.Add('0');
        end;

        { create ship for drawing }
        SimManager.CreateShipForDatabse(aVehicle.Vehicle_ID);
        AddMenuWithShipID(aVehicle.Vehicle_ID);

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

    2:
      begin
        with aListView.Items.Add do
        begin
          Data := aVehicle;
          Caption := aVehicle.Vehicle_Name;
        end;

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

    3:
      begin
        with aListView.Items.Add do
        begin
          Data := aVehicle;
          Caption := aVehicle.Vehicle_Name;
          SubItems.Add(FloatToStr(aVehicle.Vehicle_X));
          SubItems.Add(FloatToStr(aVehicle.Vehicle_Y));
          SubItems.Add(FloatToStr(aVehicle.Vehicle_Z));
          SubItems.Add(FloatToStr(aVehicle.Vehicle_Heading));
          SubItems.Add(FloatToStr(aVehicle.Vehicle_Speed));
        end;

        { create ship for drawing }
        SimManager.CreateShipForDatabse(aVehicle.Vehicle_ID);
        AddMenuWithShipID(aVehicle.Vehicle_ID);

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
        lvTargetSurfaceAll.Selected := nil;
      8:
        lvTargetSubsurfaceAll.Selected := nil;
      10:
        lvTargetAirAll.Selected := nil;
    end;

    if FileExists(strPicture) then
    begin
      imgShip.Picture.LoadFromFile(strPicture);
      frmWeaponList.imgShip.Picture.LoadFromFile(strPicture);
    end;
  end;
end;

procedure TfrmSceEditor.ListViewDblClick(Sender: TObject);
var
  ShipDetail: TVehicle;
begin
  frmMainInstruktur.SetDefaultMapTool;
  if (TListView(Sender).Selected <> nil) and
    Assigned(TListView(Sender).Selected.Data) then
  begin
    ShipDetail := TVehicle.Create;
    ShipDetail.Vehicle_ID := TVehicle(TListView(Sender).Selected.Data)
      .Vehicle_ID;
    ShipDetail.Vehicle_Name := TVehicle(TListView(Sender).Selected.Data)
      .Vehicle_Name;
    ShipDetail.Vehicle_Ctgr := TVehicle(TListView(Sender).Selected.Data)
      .Vehicle_Ctgr;
    ShipDetail.Vehicle_No := TVehicle(TListView(Sender).Selected.Data)
      .Vehicle_No;

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
        ListViewAdd(lvTargetSurfaceSelect, lvTargetSurfaceAll, ShipDetail, 1);
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
        ListViewAdd(lvTargetSurfaceAll, lvTargetSurfaceSelect, ShipDetail, 2);
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
        cnt := lvTargetSurfaceAll.Items.Count;
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
          aListItem := lvTargetSurfaceAll.Items[ii];
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
        ShipDetail.Vehicle_ID := TVehicle(selectedListItem.Data).Vehicle_ID;
        ShipDetail.Vehicle_Name := TVehicle(selectedListItem.Data).Vehicle_Name;
        ShipDetail.Vehicle_Ctgr := TVehicle(selectedListItem.Data).Vehicle_Ctgr;
        ShipDetail.Vehicle_No := TVehicle(selectedListItem.Data).Vehicle_No;

        case TComponent(Sender).Tag of
          1:
            ListViewAdd(lvWarShipSelect, lvWarShipAll, ShipDetail, 1);
          3:
            ListViewAdd(lvGeneralShipSelect, lvGeneralShipAll, ShipDetail, 1);
          5:
            ListViewAdd(lvTargetSurfaceSelect, lvTargetSurfaceAll,
              ShipDetail, 1);
          7:
            ListViewAdd(lvTargetSubsurfaceSelect, lvTargetSubsurfaceAll,
              ShipDetail, 1);
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
        ShipDetail.Vehicle_ID := TVehicle(selectedListItem.Data).Vehicle_ID;
        ShipDetail.Vehicle_Name := TVehicle(selectedListItem.Data).Vehicle_Name;
        ShipDetail.Vehicle_Ctgr := TVehicle(selectedListItem.Data).Vehicle_Ctgr;
        ShipDetail.Vehicle_No := TVehicle(selectedListItem.Data).Vehicle_No;

        case TComponent(Sender).Tag of
          2:
            ListViewAdd(lvWarShipAll, lvWarShipSelect, ShipDetail, 2);
          4:
            ListViewAdd(lvGeneralShipAll, lvGeneralShipSelect, ShipDetail, 2);
          6:
            ListViewAdd(lvTargetSurfaceAll, lvTargetSurfaceSelect,
              ShipDetail, 2);
          8:
            ListViewAdd(lvTargetSubsurfaceAll, lvTargetSubsurfaceSelect,
              ShipDetail, 2);
          10:
            ListViewAdd(lvTargetAirAll, lvTargetAirSelect, ShipDetail, 2);
        end;
      end;

    end;

  until not isselected;
end;

{ -------------------------------------------------------------------------- }

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

  RecSceSave: TScenario;
  RecShipsave: TVehicle;
  RecConsoleSave: TSaveConsole;
  recWeaponSave: TScenarioWeapon;

  ListShip: TList;
  ListConsole: TList;

  { For Fog Height }
  lowerBound, upperBound, boundary, posPercentage, position: Double;
  Val: single;

  SceEnvi: TScenario;
begin
  frmMainInstruktur.Caption := frmMainInstruktur.cekCaption;
  frmMainInstruktur.lblCekRunning.Caption := frmMainInstruktur.cekStatusKonek;

  case TButton(Sender).Tag of
    0:
      begin
        RecSceSave := TScenario.Create;
        { save new scenario }
        if edtScenarioName.Text <> '' then
        begin
          ListScenario := TList.Create;
          DataModule1.GettAllScenario(ListScenario);

          isFound := false;
          for i := 0 to ListScenario.Count - 1 do
          begin
            Scenario := TScenarioList(ListScenario[i]);

            if LowerCase(Scenario.Scenario_Name)
              = LowerCase(edtScenarioName.Text) then
            begin
              isFound := true;
              break;
            end;
          end;

          if not isFound then
          begin

            with RecSceSave do
            begin
              Scenario_Name := edtScenarioName.Text;
              Scenario_Port := cbbPort.ItemIndex;
              Scenario_Building := frmMoreEnvi.Building;
              Scenario_StaticShip := frmMoreEnvi.StaticShip;
              Scenario_Buoy := frmMoreEnvi.Buoy;
              Scenario_Theme := frmMoreEnvi.Theme;
              Scenario_Desc := mmoKetSce.Text;

              { Environment }
              Scenario_SeaState := frmMoreEnvi.SeaState;
              Scenario_WindSpeed := frmMoreEnvi.WindSpeed;

              { Wind Calc }
              Scenario_WindDir_X := cos(DegToRad(frmMoreEnvi.WindDir));
              Scenario_WindDir_Y := sin(DegToRad(frmMoreEnvi.WindDir));
              Scenario_WindDir_Deg := frmMoreEnvi.WindDir;
              Scenario_CurrSpeed := frmMoreEnvi.CurrentSpeed;
              Scenario_CurrDir_X := cos(DegToRad(frmMoreEnvi.WindDir));
              Scenario_CurrDir_Y := sin(DegToRad(frmMoreEnvi.WindDir));
              Scenario_CurrDir_Deg := frmMoreEnvi.CurrentDir;
              Scenario_Temperature := frmMoreEnvi.Temperature;
              Scenario_BaroPressure := frmMoreEnvi.BaroPressure;
              Scenario_Humidity := frmMoreEnvi.Humidity;

              { Fog Calculation }
              lowerBound := 0.00005;
              upperBound := 0.08;
              boundary := upperBound - lowerBound;
              position :=
                ((frmMoreEnvi.tbFogH.Max) - (frmMoreEnvi.tbFogH.position)) /
                (frmMoreEnvi.tbFogH.Max);
              posPercentage := log10(frmMoreEnvi.tbFogH.Max * position) /
                log10(frmMoreEnvi.tbFogH.Max);
              Val := lowerBound + ((boundary - (posPercentage * boundary)));

              Scenario_FogHeight := Val;
              Scenario_FogHeight_Persen := frmMoreEnvi.FogHeight;
            end;

            ListShip := TList.Create;

            { save KRI Ship Configuration }
            for i := 0 to lvWarShipSelect.Items.Count - 1 do
            begin
              if Assigned(lvWarShipSelect.Items[i].Data) then
              begin
                RecShipsave := TVehicle.Create;
                RecShipsave.Vehicle_ID :=
                  TVehicle(lvWarShipSelect.Items[i].Data).Vehicle_ID;
                // RecShipsave.Vehicle_X       := StrToFloat(lvWarShipSelect.Items[i].SubItems[0]);
                // RecShipsave.Vehicle_Y       := StrToFloat(lvWarShipSelect.Items[i].SubItems[1]);
                RecShipsave.Vehicle_X := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_X;
                RecShipsave.Vehicle_Y := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_Y;
                RecShipsave.Vehicle_Z :=
                  StrToFloat(lvWarShipSelect.Items[i].SubItems[2]);
                RecShipsave.Vehicle_Heading :=
                  StrToFloat(lvWarShipSelect.Items[i].SubItems[3]);
                RecShipsave.Vehicle_Speed :=
                  StrToFloat(lvWarShipSelect.Items[i].SubItems[4]);

                ListShip.Add(RecShipsave);
              end;
            end;

            { Save General Ship Configuration }
            for i := 0 to lvGeneralShipSelect.Items.Count - 1 do
            begin
              if Assigned(lvGeneralShipSelect.Items[i].Data) then
              begin
                RecShipsave := TVehicle.Create;
                RecShipsave.Vehicle_ID :=
                  TVehicle(lvGeneralShipSelect.Items[i].Data).Vehicle_ID;
                RecShipsave.Vehicle_X := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_X;
                RecShipsave.Vehicle_Y := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_Y;
                // RecShipsave.Vehicle_X       := StrToFloat(lvGeneralShipSelect.Items[i].SubItems[0]);
                // RecShipsave.Vehicle_Y       := StrToFloat(lvGeneralShipSelect.Items[i].SubItems[1]);
                RecShipsave.Vehicle_Z :=
                  StrToFloat(lvGeneralShipSelect.Items[i].SubItems[2]);
                RecShipsave.Vehicle_Heading :=
                  StrToFloat(lvGeneralShipSelect.Items[i].SubItems[3]);
                RecShipsave.Vehicle_Speed :=
                  StrToFloat(lvGeneralShipSelect.Items[i].SubItems[4]);

                ListShip.Add(RecShipsave);
              end;
            end;

            { Save Target Surface Ship Configuration }
            for i := 0 to lvTargetSurfaceSelect.Items.Count - 1 do
            begin
              if Assigned(lvTargetSurfaceSelect.Items[i].Data) then
              begin
                RecShipsave := TVehicle.Create;
                RecShipsave.Vehicle_ID :=
                  TVehicle(lvTargetSurfaceSelect.Items[i].Data).Vehicle_ID;
                RecShipsave.Vehicle_X := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_X;
                RecShipsave.Vehicle_Y := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_Y;
                // RecShipsave.Vehicle_X       := StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[0]);
                // RecShipsave.Vehicle_Y       := StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[1]);
                RecShipsave.Vehicle_Z :=
                  StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[2]);
                RecShipsave.Vehicle_Heading :=
                  StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[3]);
                RecShipsave.Vehicle_Speed :=
                  StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[4]);

                ListShip.Add(RecShipsave);
              end;
            end;

            { Save Target Subsurface Ship Configuration }
            for i := 0 to lvTargetSubsurfaceSelect.Items.Count - 1 do
            begin
              if Assigned(lvTargetSubsurfaceSelect.Items[i].Data) then
              begin
                RecShipsave := TVehicle.Create;
                RecShipsave.Vehicle_ID :=
                  TVehicle(lvTargetSubsurfaceSelect.Items[i].Data).Vehicle_ID;
                RecShipsave.Vehicle_X := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_X;
                RecShipsave.Vehicle_Y := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_Y;
                // RecShipsave.Vehicle_X       := StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[0]);
                // RecShipsave.Vehicle_Y       := StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[1]);
                RecShipsave.Vehicle_Z :=
                  StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[2]);
                RecShipsave.Vehicle_Heading :=
                  StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[3]);
                RecShipsave.Vehicle_Speed :=
                  StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[4]);

                ListShip.Add(RecShipsave);
              end;
            end;

            { Save Target Air Ship Configuration }
            for i := 0 to lvTargetAirSelect.Items.Count - 1 do
            begin
              if Assigned(lvTargetAirSelect.Items[i].Data) then
              begin
                RecShipsave := TVehicle.Create;
                RecShipsave.Vehicle_ID :=
                  TVehicle(lvTargetAirSelect.Items[i].Data).Vehicle_ID;
                RecShipsave.Vehicle_X := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_X;
                RecShipsave.Vehicle_Y := TVehicle(lvWarShipSelect.Items[i].Data)
                  .Vehicle_Y;
                // RecShipsave.Vehicle_X       := StrToFloat(lvTargetAirSelect.Items[i].SubItems[0]);
                // RecShipsave.Vehicle_Y       := StrToFloat(lvTargetAirSelect.Items[i].SubItems[1]);
                RecShipsave.Vehicle_Z :=
                  StrToFloat(lvTargetAirSelect.Items[i].SubItems[2]);
                RecShipsave.Vehicle_Heading :=
                  StrToFloat(lvTargetAirSelect.Items[i].SubItems[3]);
                RecShipsave.Vehicle_Speed :=
                  StrToFloat(lvTargetAirSelect.Items[i].SubItems[4]);

                ListShip.Add(RecShipsave);
              end;
            end;

            { Save Setting Console }
            ListConsole := TList.Create;
            for i := 0 to lvConsole.Items.Count - 1 do
            begin
              if lvConsole.Items[i].SubItems[4] <> '' then
              begin
                RecConsoleSave := TSaveConsole.Create;
                RecConsoleSave.ConsoleID :=
                  StrToInt(lvConsole.Items[i].Caption);
                RecConsoleSave.shipID :=
                  StrToInt(lvConsole.Items[i].SubItems[5]);
                RecConsoleSave.LauncherID :=
                  StrToInt(lvConsole.Items[i].SubItems[6]);

                ListConsole.Add(RecConsoleSave);
              end;
            end;

            // { Save Scenario Weapon}
            // WeaponListScenario := TList.Create;
            // for i := 0 to lvWeaponSelected.Items.Count - 1 do begin
            // if lvWeaponSelected.Items[i].SubItems[0] <> nil then begin
            // recWeaponSave   :=
            // end;
            // end;

            if ListShip.Count > 0 then
            begin
              DataModule1.SaveScenario(RecSceSave, ListShip, ListConsole,
                WeaponListScenario);

              ClearAList(ListShip);
              SimManager.MainObjList.ClearObject;
              Close;
            end
            else
            begin
              ShowMessage('Add Ship First');
            end;
          end
          else
          begin
            ShowMessage('Scenario Name Already Exist');
          end;

        end
        else
        begin
          ShowMessage('Please Fill Scenario Name');
        end;
        SimManager.isFirstRequest := false;
        RecSceSave.Free;
      end;

    1:
      begin
        { update Scenario }
        SceEnvi := TScenario.Create;
        try
          SceEnvi.Scenario_Building := frmMoreEnvi.Building;
          SceEnvi.Scenario_StaticShip := frmMoreEnvi.StaticShip;
          SceEnvi.Scenario_Buoy := frmMoreEnvi.Buoy;
          SceEnvi.Scenario_Tree := frmMoreEnvi.Tree;
          SceEnvi.Scenario_Theme := frmMoreEnvi.Theme;
          { Environment }
          SceEnvi.Scenario_SeaState := frmMoreEnvi.SeaState;
          SceEnvi.Scenario_WindSpeed := frmMoreEnvi.WindSpeed;
          { Wind Calc }
          SceEnvi.Scenario_WindDir_X := cos(DegToRad(frmMoreEnvi.WindDir));
          SceEnvi.Scenario_WindDir_Y := sin(DegToRad(frmMoreEnvi.WindDir));
          SceEnvi.Scenario_WindDir_Deg := frmMoreEnvi.WindDir;
          SceEnvi.Scenario_CurrSpeed := frmMoreEnvi.CurrentSpeed;
          SceEnvi.Scenario_CurrDir_X := cos(DegToRad(frmMoreEnvi.CurrentDir));
          SceEnvi.Scenario_CurrDir_Y := sin(DegToRad(frmMoreEnvi.CurrentDir));
          SceEnvi.Scenario_CurrDir_Deg := frmMoreEnvi.CurrentDir;
          SceEnvi.Scenario_Temperature := frmMoreEnvi.Temperature;
          SceEnvi.Scenario_BaroPressure := frmMoreEnvi.BaroPressure;
          SceEnvi.Scenario_Humidity := frmMoreEnvi.Humidity;
          { Fog Calculation }
          lowerBound := 0.00005;
          upperBound := 0.08;
          boundary := upperBound - lowerBound;
          position := ((frmMoreEnvi.tbFogH.Max) - (frmMoreEnvi.tbFogH.position))
            / (frmMoreEnvi.tbFogH.Max);
          if position = 0 then
          begin
            position := 0.001;
          end;
          posPercentage := log10(frmMoreEnvi.tbFogH.Max * position) /
            log10(frmMoreEnvi.tbFogH.Max);
          Val := lowerBound + ((boundary - (posPercentage * boundary)));
          SceEnvi.Scenario_FogHeight := Val;
          SceEnvi.Scenario_FogHeight_Persen := frmMoreEnvi.FogHeight;

          { Update }
          DataModule1.UpdateEnvi(Scenario_ID, SceEnvi);
        finally
          SceEnvi.Free;
        end;

        ListShip := TList.Create;

        { save KRI Ship Configuration }
        for i := 0 to lvWarShipSelect.Items.Count - 1 do
        begin
          if Assigned(lvWarShipSelect.Items[i].Data) then
          begin
            RecShipsave := TVehicle.Create;
            RecShipsave.Vehicle_ID := TVehicle(lvWarShipSelect.Items[i].Data)
              .Vehicle_ID;
            RecShipsave.Vehicle_X :=
              StrToFloat(lvWarShipSelect.Items[i].SubItems[0]);
            RecShipsave.Vehicle_Y :=
              StrToFloat(lvWarShipSelect.Items[i].SubItems[1]);
            RecShipsave.Vehicle_Z :=
              StrToFloat(lvWarShipSelect.Items[i].SubItems[2]);
            RecShipsave.Vehicle_Heading :=
              StrToFloat(lvWarShipSelect.Items[i].SubItems[3]);
            RecShipsave.Vehicle_Speed :=
              StrToFloat(lvWarShipSelect.Items[i].SubItems[4]);

            ListShip.Add(RecShipsave);
          end;
        end;

        { Save General Ship Configuration }
        for i := 0 to lvGeneralShipSelect.Items.Count - 1 do
        begin
          if Assigned(lvGeneralShipSelect.Items[i].Data) then
          begin
            RecShipsave := TVehicle.Create;
            RecShipsave.Vehicle_ID :=
              TVehicle(lvGeneralShipSelect.Items[i].Data).Vehicle_ID;
            RecShipsave.Vehicle_X :=
              StrToFloat(lvGeneralShipSelect.Items[i].SubItems[0]);
            RecShipsave.Vehicle_Y :=
              StrToFloat(lvGeneralShipSelect.Items[i].SubItems[1]);
            RecShipsave.Vehicle_Z :=
              StrToFloat(lvGeneralShipSelect.Items[i].SubItems[2]);
            RecShipsave.Vehicle_Heading :=
              StrToFloat(lvGeneralShipSelect.Items[i].SubItems[3]);
            RecShipsave.Vehicle_Speed :=
              StrToFloat(lvGeneralShipSelect.Items[i].SubItems[4]);

            ListShip.Add(RecShipsave);
          end;
        end;

        { Save Target Surface Ship Configuration }
        for i := 0 to lvTargetSurfaceSelect.Items.Count - 1 do
        begin
          if Assigned(lvTargetSurfaceSelect.Items[i].Data) then
          begin
            RecShipsave := TVehicle.Create;
            RecShipsave.Vehicle_ID :=
              TVehicle(lvTargetSurfaceSelect.Items[i].Data).Vehicle_ID;
            RecShipsave.Vehicle_X :=
              StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[0]);
            RecShipsave.Vehicle_Y :=
              StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[1]);
            RecShipsave.Vehicle_Z :=
              StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[2]);
            RecShipsave.Vehicle_Heading :=
              StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[3]);
            RecShipsave.Vehicle_Speed :=
              StrToFloat(lvTargetSurfaceSelect.Items[i].SubItems[4]);

            ListShip.Add(RecShipsave);
          end;
        end;

        { Save Target Subsurface Ship Configuration }
        for i := 0 to lvTargetSubsurfaceSelect.Items.Count - 1 do
        begin
          if Assigned(lvTargetSubsurfaceSelect.Items[i].Data) then
          begin
            RecShipsave := TVehicle.Create;
            RecShipsave.Vehicle_ID :=
              TVehicle(lvTargetSubsurfaceSelect.Items[i].Data).Vehicle_ID;
            RecShipsave.Vehicle_X :=
              StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[0]);
            RecShipsave.Vehicle_Y :=
              StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[1]);
            RecShipsave.Vehicle_Z :=
              StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[2]);
            RecShipsave.Vehicle_Heading :=
              StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[3]);
            RecShipsave.Vehicle_Speed :=
              StrToFloat(lvTargetSubsurfaceSelect.Items[i].SubItems[4]);

            ListShip.Add(RecShipsave);
          end;
        end;

        { Save Target Air Ship Configuration }
        for i := 0 to lvTargetAirSelect.Items.Count - 1 do
        begin
          if Assigned(lvTargetAirSelect.Items[i].Data) then
          begin
            RecShipsave := TVehicle.Create;
            RecShipsave.Vehicle_ID := TVehicle(lvTargetAirSelect.Items[i].Data)
              .Vehicle_ID;
            RecShipsave.Vehicle_X :=
              StrToFloat(lvTargetAirSelect.Items[i].SubItems[0]);
            RecShipsave.Vehicle_Y :=
              StrToFloat(lvTargetAirSelect.Items[i].SubItems[1]);
            RecShipsave.Vehicle_Z :=
              StrToFloat(lvTargetAirSelect.Items[i].SubItems[2]);
            RecShipsave.Vehicle_Heading :=
              StrToFloat(lvTargetAirSelect.Items[i].SubItems[3]);
            RecShipsave.Vehicle_Speed :=
              StrToFloat(lvTargetAirSelect.Items[i].SubItems[4]);

            ListShip.Add(RecShipsave);
          end;
        end;

        { Save Setting Console }
        ListConsole := TList.Create;
        for i := 0 to lvConsole.Items.Count - 1 do
        begin
          if lvConsole.Items[i].SubItems[4] <> '' then
          begin
            RecConsoleSave := TSaveConsole.Create;
            RecConsoleSave.ConsoleID := StrToInt(lvConsole.Items[i].Caption);
            RecConsoleSave.shipID := StrToInt(lvConsole.Items[i].SubItems[5]);
            RecConsoleSave.LauncherID :=
              StrToInt(lvConsole.Items[i].SubItems[6]);

            ListConsole.Add(RecConsoleSave);
          end;
        end;

        if ListShip.Count > 0 then
        begin
          DataModule1.UpdateCurrentDatabase(Scenario_ID, ListShip, ListConsole,
            WeaponListScenario);

          SimManager.MainObjList.ClearObject;
          Close;
        end
        else
        begin
          ShowMessage('Add Ship First');
        end;

        SimManager.isFirstRequest := false;
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
    frmWeaponList.Ship_ID := Ship_ID;
    frmWeaponList.Ship_Name := Ship_Name;
    frmWeaponList.Show;
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
  ClearListViewData(lvTargetSurfaceAll);
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
          ListView.Items[j].SubItems[0] := Format('%2.8f', [Mx]);
          ListView.Items[j].SubItems[1] := Format('%2.8f', [My]);
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

          ListView.Items[j].SubItems[2] := FloatToStr(Depth);

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

          ListView.Items[j].SubItems[4] := FloatToStr(Speed);

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

          ListView.Items[j].SubItems[3] := FloatToStr(Heading);

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
  listShipKRI, listShipGeneral, listTargetSurface, listTargetSubsurface,
    listTargetAir: TList;

  ShipDetail, WarShip, GeneralShip, TargetSurfaceShip, TargetSubsurfaceShip,
    TargetAirShip: TVehicle;
begin
  try
    listShipKRI := TList.Create;
    listShipGeneral := TList.Create;
    listTargetSurface := TList.Create;
    listTargetSubsurface := TList.Create;
    listTargetAir := TList.Create;

    DataModule1.GetAllWarShip(listShipKRI);
    DataModule1.GetAllGeneralShip(listShipGeneral);
    DataModule1.GetAllTargetSurface(listTargetSurface);
    DataModule1.GetAllTargetSubsurface(listTargetSubsurface);
    DataModule1.GetAllTargetAir(listTargetAir);

    { Ship KRI }
    for i := 0 to listShipKRI.Count - 1 do
    begin
      WarShip := TVehicle(listShipKRI.Items[i]);
      if Assigned(WarShip) then
      begin
        with lvWarShipAll.Items.Add do
        begin
          ShipDetail := TVehicle.Create;
          ShipDetail.Vehicle_ID := WarShip.Vehicle_ID;
          ShipDetail.Vehicle_Name := WarShip.Vehicle_Name;
          ShipDetail.Vehicle_Ctgr := WarShip.Vehicle_Ctgr;
          ShipDetail.Vehicle_No := WarShip.Vehicle_No;

          Data := ShipDetail;
          Caption := WarShip.Vehicle_Name;
        end;
      end;
    end;

    { Ship General }
    for i := 0 to listShipGeneral.Count - 1 do
    begin
      GeneralShip := TVehicle(listShipGeneral.Items[i]);
      if Assigned(GeneralShip) then
      begin
        with lvGeneralShipAll.Items.Add do
        begin
          ShipDetail := TVehicle.Create;
          ShipDetail.Vehicle_ID := GeneralShip.Vehicle_ID;
          ShipDetail.Vehicle_Name := GeneralShip.Vehicle_Name;
          ShipDetail.Vehicle_Ctgr := GeneralShip.Vehicle_Ctgr;
          ShipDetail.Vehicle_No := GeneralShip.Vehicle_No;

          Data := ShipDetail;
          Caption := GeneralShip.Vehicle_Name;
        end;
      end;

    end;

    { Target Surface }
    for i := 0 to listTargetSurface.Count - 1 do
    begin
      TargetSurfaceShip := TVehicle(listTargetSurface.Items[i]);
      if Assigned(TargetSurfaceShip) then
      begin
        with lvTargetSurfaceAll.Items.Add do
        begin
          ShipDetail := TVehicle.Create;
          ShipDetail.Vehicle_ID := TargetSurfaceShip.Vehicle_ID;
          ShipDetail.Vehicle_Name := TargetSurfaceShip.Vehicle_Name;
          ShipDetail.Vehicle_Ctgr := TargetSurfaceShip.Vehicle_Ctgr;
          ShipDetail.Vehicle_No := TargetSurfaceShip.Vehicle_No;

          Data := ShipDetail;
          Caption := TargetSurfaceShip.Vehicle_Name;
        end;
      end;
    end;

    { Target Subsurface }
    for i := 0 to listTargetSubsurface.Count - 1 do
    begin
      TargetSubsurfaceShip := TVehicle(listTargetSubsurface.Items[i]);
      if Assigned(TargetSubsurfaceShip) then
      begin
        with lvTargetSubsurfaceAll.Items.Add do
        begin
          ShipDetail := TVehicle.Create;
          ShipDetail.Vehicle_ID := TargetSubsurfaceShip.Vehicle_ID;
          ShipDetail.Vehicle_Name := TargetSubsurfaceShip.Vehicle_Name;
          ShipDetail.Vehicle_Ctgr := TargetSubsurfaceShip.Vehicle_Ctgr;
          ShipDetail.Vehicle_No := TargetSubsurfaceShip.Vehicle_No;

          Data := ShipDetail;
          Caption := TargetSubsurfaceShip.Vehicle_Name;
        end;
      end;
    end;

    { Target Air }
    for i := 0 to listTargetAir.Count - 1 do
    begin
      TargetAirShip := TVehicle(listTargetAir.Items[i]);
      if Assigned(TargetAirShip) then
      begin
        with lvTargetAirAll.Items.Add do
        begin
          ShipDetail := TVehicle.Create;
          ShipDetail.Vehicle_ID := TargetAirShip.Vehicle_ID;
          ShipDetail.Vehicle_Name := TargetAirShip.Vehicle_Name;
          ShipDetail.Vehicle_Ctgr := TargetAirShip.Vehicle_Ctgr;
          ShipDetail.Vehicle_No := TargetAirShip.Vehicle_No;

          Data := ShipDetail;
          Caption := TargetAirShip.Vehicle_Name;
        end;
      end;
    end;

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

procedure TfrmSceEditor.UpdateVisualForm;
var
  listAllShip, listAllConsole: TList;

  ShipDetail, AllShip: TVehicle;

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
  SceEnvi: TScenario;

  ClientList: TClientList;
begin
  { First Initialize }
  ClearWeaponListScenario;

  edtScenarioName.Text := '';
  edtScenarioName.Text := '';
  mmoKetSce.Clear;

  ClearListViewData(lvWarShipAll);
  ClearListViewData(lvWarShipSelect);
  ClearListViewData(lvGeneralShipAll);
  ClearListViewData(lvGeneralShipSelect);
  ClearListViewData(lvTargetSurfaceAll);
  ClearListViewData(lvTargetSurfaceSelect);
  ClearListViewData(lvTargetSubsurfaceAll);
  ClearListViewData(lvTargetSubsurfaceSelect);
  ClearListViewData(lvTargetAirAll);
  ClearListViewData(lvTargetAirSelect);
  ClearListViewData(lvConsole);
  ClearListViewData(lvWeaponSelected);

//  lvWarShipAll.Items.Clear;
//  lvWarShipSelect.Items.Clear;
//  lvGeneralShipAll.Items.Clear;
//  lvGeneralShipSelect.Items.Clear;
//  lvTargetSurfaceAll.Items.Clear;
//  lvTargetSurfaceSelect.Items.Clear;
//  lvTargetSubsurfaceAll.Items.Clear;
//  lvTargetSubsurfaceSelect.Items.Clear;
//  lvTargetAirAll.Items.Clear;
//  lvTargetAirSelect.Items.Clear;
//  lvConsole.Items.Clear;
//  lvWeaponSelected.Items.Clear;

  pmConsole.Items.Clear;
  pmConsole2.Items.Clear;

  SimManager.MainObjList.ClearObject;

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

        Caption := IntToStr(AllConsole.Id);

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
              ClientList.Cli_Cubicle := 'OBSERVER';
              SubItems.Add('OBSERVER');
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

  if isNew then
  begin
    { New Scenario }

    btnSaveScenario.Caption := 'Save New Scenario';
    btnSaveScenario.Tag := 0;

    edtScenarioName.Enabled := true;
    cbbPort.Enabled := true;

    frmMoreEnvi.tbWindSpeed.position := 0;
    frmMoreEnvi.tbSeaSpeed.position := 0;
    frmMoreEnvi.tbTemp.position := 0;
    frmMoreEnvi.tbSeaState.position := 0;
    frmMoreEnvi.tbBaroPressure.position := 0;
    frmMoreEnvi.tbHumidity.position := 0;
    frmMoreEnvi.tbFogH.position := 0;
    frmMoreEnvi.vrwhlWindDirec.position := 180;
    frmMoreEnvi.vrwhlSeaDirection.position := 180;

    GetAllVehicle;
  end
  else
  begin
    { Edit Scenario }
    edtScenarioName.Enabled := false;
    edtScenarioName.Text := ScenarioName;
    cbbPort.Enabled := false;

    btnSaveScenario.Caption := 'Save Scenario';
    btnSaveScenario.Tag := 1;

    { --------------------------------------------------------------------- }
    { Environment }
    SceEnvi := TScenario.Create;
    try
      DataModule1.GetEnviBySceID(Scenario_ID, SceEnvi);

      frmMoreEnvi.eBuilding.ItemIndex := SceEnvi.Scenario_Building;
      frmMoreEnvi.eStaticShips.ItemIndex := SceEnvi.Scenario_StaticShip;
      frmMoreEnvi.eBuoy.ItemIndex := SceEnvi.Scenario_Buoy;
      frmMoreEnvi.eTree.ItemIndex := SceEnvi.Scenario_Tree;
      frmMoreEnvi.eTheme.ItemIndex := SceEnvi.Scenario_Theme;
      frmMoreEnvi.Building := SceEnvi.Scenario_Building;
      frmMoreEnvi.StaticShip := SceEnvi.Scenario_StaticShip;
      frmMoreEnvi.Buoy := SceEnvi.Scenario_Buoy;
      frmMoreEnvi.Tree := SceEnvi.Scenario_Tree;
      frmMoreEnvi.Theme := SceEnvi.Scenario_Theme;

      frmMoreEnvi.lblSeaState.Caption := FloatToStr(SceEnvi.Scenario_SeaState);
      frmMoreEnvi.lblWindSpeed.Caption :=
        FloatToStr(SceEnvi.Scenario_WindSpeed);
      frmMoreEnvi.lblCurrentSpeed.Caption :=
        FloatToStr(SceEnvi.Scenario_CurrSpeed);
      frmMoreEnvi.lblWindDirection.Caption :=
        FloatToStr(SceEnvi.Scenario_WindDir_Deg);
      frmMoreEnvi.lblCurrentDirection.Caption :=
        FloatToStr(SceEnvi.Scenario_CurrDir_Deg);
      frmMoreEnvi.lblTemperature.Caption :=
        FloatToStr(SceEnvi.Scenario_Temperature);
      frmMoreEnvi.lblBaroPressure.Caption :=
        FloatToStr(SceEnvi.Scenario_BaroPressure);
      frmMoreEnvi.lblHumidity.Caption := FloatToStr(SceEnvi.Scenario_Humidity);
      frmMoreEnvi.lblFogHeight.Caption :=
        FloatToStr(SceEnvi.Scenario_FogHeight_Persen);
      frmMoreEnvi.SeaState := Round(SceEnvi.Scenario_SeaState);
      frmMoreEnvi.WindSpeed := Round(SceEnvi.Scenario_WindSpeed);
      frmMoreEnvi.CurrentSpeed := Round(SceEnvi.Scenario_CurrSpeed);
      frmMoreEnvi.WindDir := Round(SceEnvi.Scenario_WindDir_Deg);
      frmMoreEnvi.CurrentDir := Round(SceEnvi.Scenario_CurrDir_Deg);
      frmMoreEnvi.Temperature := Round(SceEnvi.Scenario_Temperature);
      frmMoreEnvi.BaroPressure := Round(SceEnvi.Scenario_BaroPressure);
      frmMoreEnvi.Humidity := Round(SceEnvi.Scenario_Humidity);
      frmMoreEnvi.FogHeight := Round(SceEnvi.Scenario_FogHeight_Persen);

      frmMoreEnvi.tbSeaState.position := Round(SceEnvi.Scenario_SeaState);
      frmMoreEnvi.tbWindSpeed.position := Round(SceEnvi.Scenario_WindSpeed);
      frmMoreEnvi.tbSeaSpeed.position := Round(SceEnvi.Scenario_CurrSpeed);
      frmMoreEnvi.tbTemp.position := Round(SceEnvi.Scenario_Temperature);
      frmMoreEnvi.tbBaroPressure.position :=
        Round(SceEnvi.Scenario_BaroPressure);
      frmMoreEnvi.tbHumidity.position := Round(SceEnvi.Scenario_Humidity);
      frmMoreEnvi.tbFogH.position := Round(SceEnvi.Scenario_FogHeight_Persen);

      if SceEnvi.Scenario_WindDir_Deg > 180 then
        frmMoreEnvi.vrwhlWindDirec.position :=
          (Round(SceEnvi.Scenario_WindDir_Deg) - 180)
      else
        frmMoreEnvi.vrwhlWindDirec.position :=
          (Round(SceEnvi.Scenario_WindDir_Deg) + 180);

      if SceEnvi.Scenario_CurrDir_Deg > 180 then
        frmMoreEnvi.vrwhlSeaDirection.position :=
          (Round(SceEnvi.Scenario_CurrDir_Deg) - 180)
      else
        frmMoreEnvi.vrwhlSeaDirection.position :=
          (Round(SceEnvi.Scenario_CurrDir_Deg) + 180);
    finally
      SceEnvi.Free;
    end;
    { --------------------------------------------------------------------- }

    ListScenario := TList.Create;
    DataModule1.GettAllScenario(ListScenario);
    for i := 0 to ListScenario.Count - 1 do
    begin
      if Assigned(ListScenario[i]) then
      begin
        Scenario := TScenarioList(ListScenario[i]);
        if Scenario.Scenario_ID = Scenario_ID then
        begin
          cbbPort.ItemIndex := Round(Scenario.ENV_PETA);
          break;
        end;
      end;
    end;
    ClearAList(ListScenario);
    ListScenario.Free;

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
            lvConsole.Items[j].SubItems[4] :=
              DataModule1.GetShipName(Console.shipID);
            lvConsole.Items[j].SubItems[5] := IntToStr(Console.shipID);
            lvConsole.Items[j].SubItems[6] := IntToStr(Console.LauncherID);

            break;
          end;
        end;
      end;
    end;
    ClearAList(ListConsole);
    ListConsole.Free;

    mmoKetSce.Lines.Add(DataModule1.GetDesById(Scenario_ID));
    DataModule1.GetSceneOffSetFromPortID
      (DataModule1.GetMapById(Scenario_ID), Dx, Dy);

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

    GetAllVehicle;

    listAllShip := TList.Create;
    DataModule1.GetAllShipFromScen(Scenario_ID, listAllShip);
    for i := 0 to listAllShip.Count - 1 do
    begin
      if Assigned(listAllShip[i]) then
      begin
        AllShip := TVehicle(listAllShip[i]);

        ShipDetail := TVehicle.Create;
        ShipDetail.Vehicle_ID := AllShip.Vehicle_ID;
        ShipDetail.Vehicle_Name := AllShip.Vehicle_Name;
        ShipDetail.Vehicle_Ctgr := AllShip.Vehicle_Ctgr;
        ShipDetail.Vehicle_No := AllShip.Vehicle_No;
        ShipDetail.Vehicle_X := AllShip.Vehicle_X;
        ShipDetail.Vehicle_Y := AllShip.Vehicle_Y;
        ShipDetail.Vehicle_Z := AllShip.Vehicle_Z;
        ShipDetail.Vehicle_Heading := AllShip.Vehicle_Heading;
        ShipDetail.Vehicle_Speed := AllShip.Vehicle_Speed;

        { KRI SHIP }
        if (AllShip.Vehicle_Ctgr <> 0) and (AllShip.Vehicle_Type = 1) and
          (AllShip.Vehicle_Target = 0) then
        begin
          { Get KRI Ship }
          ListViewAdd(lvWarShipSelect, lvWarShipAll, ShipDetail, 3);
        end
        else
          { General SHIP }
          if (AllShip.Vehicle_Ctgr = 0) and (AllShip.Vehicle_Type = 1) and
            (AllShip.Vehicle_Target = 0) then
          begin
            { Get KRI Ship }
            ListViewAdd(lvGeneralShipSelect, lvGeneralShipAll, ShipDetail, 3);
          end
          else
            { Target Surface }
            if (AllShip.Vehicle_Type = 1) and (AllShip.Vehicle_Target = 1) then
            begin
              { Get KRI Ship }
              ListViewAdd(lvTargetSurfaceSelect, lvTargetSurfaceAll,
                ShipDetail, 3);
            end
            else
              { Target Subsurface }
              if (AllShip.Vehicle_Type = 3) and (AllShip.Vehicle_Target = 1)
              then
              begin
                { Get KRI Ship }
                ListViewAdd(lvTargetSubsurfaceSelect, lvTargetSubsurfaceAll,
                  ShipDetail, 3);
              end
              else
                { Target Subsurface }
                if (AllShip.Vehicle_Type = 2) and (AllShip.Vehicle_Target = 1)
                then
                begin
                  { Get KRI Ship }
                  ListViewAdd(lvTargetAirSelect, lvTargetAirAll, ShipDetail, 3);
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
//  ClearListViewData(lvTargetAirSelect);
//  ClearListViewData(lvTargetSubsurfaceSelect);
//  ClearListViewData(lvTargetSurfaceSelect);
//  ClearListViewData(lvGeneralShipSelect);
//  ClearListViewData(lvWarShipSelect);
//  ClearListViewData(lvConsole);

  ClearListViewData(lvWarShipAll);
  ClearListViewData(lvWarShipSelect);
  ClearListViewData(lvGeneralShipAll);
  ClearListViewData(lvGeneralShipSelect);
  ClearListViewData(lvTargetSurfaceAll);
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
  if btnEnableWeapon.Tag = 0 then
    isEnable := false
  else
    isEnable := true;

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
      btnEnableWeapon.Tag := 0;
      btnEnableWeapon.Caption := 'Disable';
    end

    else if lvWeaponSelected.Selected.SubItems[1] = 'Disable' then
    begin
      btnEnableWeapon.Tag := 1;
      btnEnableWeapon.Caption := 'Enable';
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
  lvTargetSurfaceAll.Tag := 5;
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
  lvTargetSurfaceAll.OnCompare := ListViewCompare;
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
  lvTargetSurfaceAll.OnSelectItem := ListViewSelectItem;
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
  lvTargetSurfaceAll.OnDblClick := ListViewDblClick;
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
  lvTargetSurfaceAll.OnClick := ListViewClick;
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

procedure TfrmSceEditor.pnlMainBottomClick(Sender: TObject);
begin
  // if GetAsyncKeyState(16) <> 0 then btnWeaponList.Visible := True
  // else btnWeaponList.Visible := False;
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
