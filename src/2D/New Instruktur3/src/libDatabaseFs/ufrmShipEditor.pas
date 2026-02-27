unit ufrmShipEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, AdvSmoothButton

  , uDataModule, uClassDatabase, AdvSmoothLabel, CurvyControls,
  AdvSmoothPanel, AdvSmoothTabPager, jpeg, Vcl.Imaging.pngimage;

type
  TfrmShipEditor = class(TForm)
    pnlMain: TAdvSmoothPanel;
    pnlGeneral: TAdvSmoothPanel;
    pnlPicture: TAdvSmoothPanel;
    img1: TImage;
    edtShipName: TCurvyEdit;
    AdvSmoothPanel13: TAdvSmoothPanel;
    lbl1: TLabel;
    pnlPhysical: TAdvSmoothPanel;
    pnlMainBottom: TAdvSmoothPanel;
    pnlPlatform: TAdvSmoothPanel;
    lbl3: TLabel;
    AdvSmoothPanel15: TAdvSmoothPanel;
    lbl7: TLabel;
    cbbClass: TComboBox;
    AdvSmoothLabel13: TAdvSmoothLabel;
    AdvSmoothLabel15: TAdvSmoothLabel;
    AdvSmoothPanel2: TAdvSmoothPanel;
    lbl2: TLabel;
    AdvSmoothLabel16: TAdvSmoothLabel;
    AdvSmoothLabel18: TAdvSmoothLabel;
    AdvSmoothLabel20: TAdvSmoothLabel;
    edtShipLength: TEdit;
    edtShipwidth: TEdit;
    edtShipHeight: TEdit;
    AdvSmoothLabel23: TAdvSmoothLabel;
    AdvSmoothLabel24: TAdvSmoothLabel;
    AdvSmoothLabel26: TAdvSmoothLabel;
    AdvSmoothLabel25: TAdvSmoothLabel;
    AdvSmoothLabel27: TAdvSmoothLabel;
    edtShipMaxSpeed: TEdit;
    edtShipMaxSpeedAstern: TEdit;
    AdvSmoothLabel28: TAdvSmoothLabel;
    AdvSmoothLabel29: TAdvSmoothLabel;
    AdvSmoothLabel34: TAdvSmoothLabel;
    edtShipShaftUp: TEdit;
    AdvSmoothLabel22: TAdvSmoothLabel;
    edtShipRudderSwingRate: TEdit;
    AdvSmoothLabel30: TAdvSmoothLabel;
    edtShipThrottleRate: TEdit;
    AdvSmoothLabel31: TAdvSmoothLabel;
    edtShipDisplacement: TEdit;
    AdvSmoothLabel35: TAdvSmoothLabel;
    edtShipHeelFactor: TEdit;
    AdvSmoothLabel33: TAdvSmoothLabel;
    edtShipTacDiameter: TEdit;
    AdvSmoothLabel32: TAdvSmoothLabel;
    edtShipTrimFactor: TEdit;
    AdvSmoothLabel19: TAdvSmoothLabel;
    edtDamageSustainability: TEdit;
    AdvSmoothPanel16: TAdvSmoothPanel;
    AdvSmoothPanel17: TAdvSmoothPanel;
    img2: TImage;
    AdvSmoothPanel18: TAdvSmoothPanel;
    lbl8: TLabel;
    imgShip: TImage;
    btnLoadImage: TAdvSmoothButton;
    btn1: TAdvSmoothButton;
    btnSaveShip: TAdvSmoothButton;
    pnlMainUp: TAdvSmoothPanel;
    advsmthlbl1: TAdvSmoothLabel;
    advsmthlbl2: TAdvSmoothLabel;
    lvWeaponSelect: TListView;
    btnAddMissile: TAdvSmoothButton;
    pnl3DRelated: TAdvSmoothPanel;
    pnlEdit: TAdvSmoothPanel;
    AdvSmoothLabel2: TAdvSmoothLabel;
    AdvSmoothLabel3: TAdvSmoothLabel;
    AdvSmoothLabel4: TAdvSmoothLabel;
    AdvSmoothLabel5: TAdvSmoothLabel;
    AdvSmoothLabel6: TAdvSmoothLabel;
    AdvSmoothLabel7: TAdvSmoothLabel;
    AdvSmoothLabel8: TAdvSmoothLabel;
    AdvSmoothLabel9: TAdvSmoothLabel;
    AdvSmoothLabel10: TAdvSmoothLabel;
    edtUpdatePitch: TEdit;
    edtUpdateHeading: TEdit;
    edtLauncher: TEdit;
    cbbSwitch: TComboBox;
    cbbModelSpout: TComboBox;
    cbbModelBody: TComboBox;
    cbbDOF_II: TComboBox;
    cbbDOF_I: TComboBox;
    chkcb3DActor: TCheckBox;
    pnlDetail: TAdvSmoothPanel;
    AdvSmoothLabel1: TAdvSmoothLabel;
    advsmthlbl3: TAdvSmoothLabel;
    advsmthlbl4: TAdvSmoothLabel;
    advsmthlbl5: TAdvSmoothLabel;
    advsmthlbl6: TAdvSmoothLabel;
    advsmthlbl7: TAdvSmoothLabel;
    advsmthlbl8: TAdvSmoothLabel;
    advsmthlbl9: TAdvSmoothLabel;
    AdvSmoothLabel14: TAdvSmoothLabel;
    edtSwitch: TEdit;
    edt3DActor: TEdit;
    edtPosHeading: TEdit;
    edtPosPitch: TEdit;
    edtDOF1: TEdit;
    edtDOF2: TEdit;
    edtModelBody: TEdit;
    edtModelSpout: TEdit;
    edtLethality: TEdit;
    btnEditWeapon: TAdvSmoothButton;
    pnl2DRelated: TAdvSmoothPanel;
    advsmthlbl10: TAdvSmoothLabel;
    advsmthlbl11: TAdvSmoothLabel;
    advsmthlbl12: TAdvSmoothLabel;
    AdvSmoothLabel11: TAdvSmoothLabel;
    AdvSmoothLabel12: TAdvSmoothLabel;
    btnAddDetail: TAdvSmoothButton;
    edtDetailName: TEdit;
    edtStartDegree: TEdit;
    edtEndDegree: TEdit;
    edtMinRange: TEdit;
    edtMaxRange: TEdit;
    btnRemoveDetail: TAdvSmoothButton;
    btnUpdate: TAdvSmoothButton;
    imgAddWeapon: TImage;
    imgRemove: TImage;
    lvDetail: TListView;
    AdvSmoothPanel1: TAdvSmoothPanel;
    procedure imgAddWeaponClick(Sender: TObject);
    procedure imgRemoveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvWeaponSelectClick(Sender: TObject);
    procedure btnAddMissileClick(Sender: TObject);
    procedure btnEditWeaponClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure cb3DActorClick(Sender: TObject);
    procedure btnRemoveDetailClick(Sender: TObject);
    procedure btnAddDetailClick(Sender: TObject);
    procedure tbSeaSpeedChange(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancel(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrackBar1Change(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure UpdateVisualForm;
    procedure ClearVisualForm;
    procedure btnSaveShipClick(Sender: TObject);
    procedure ToClose;

    procedure ClearListShipData (const aListView: TListView);
    procedure cbbClassClick(Sender: TObject);
  private
    { Private declarations }
  public
    isNew: boolean;

    Ship_Name : string;
    Ship_ID : Integer;

    procedure ShowWeapon;
    procedure ClearAllDetail;
    procedure GetALL_Dof_Model_Switch;

    procedure SetFormWeapon;
    function CekLauncherAvailable(cListView: TListView; idLauncher: integer): boolean;

    { Public declarations }
  end;

var
  frmShipEditor: TfrmShipEditor;

implementation

uses uBaseFunction, ufassignweapon, ufassignmissile, Math, ufrmGameController;

{$R *.dfm}

procedure TfrmShipEditor.imgAddWeaponClick(Sender: TObject);
begin
  frmAssignWeapon.shipID        := Ship_ID;
  frmAssignWeapon.aListView     := lvWeaponSelect;
  frmAssignWeapon.Show;
end;

function TfrmShipEditor.CekLauncherAvailable(cListView: TListView;
  idLauncher: integer): boolean;
var
  i: Integer;
  isFound : Boolean;
  launcher : Integer;
begin
  Result := False;

  isFound := False;
  for i := 0 to cListView.Items.Count - 1 do
  begin
    launcher := StrToInt(cListView.Items[i].SubItems[1]);

    if (launcher = idLauncher) and (cListView.Items[i].Caption = lvWeaponSelect.Selected.Caption) then
    begin
      isFound := True;
      Break;
    end;

  end;

  if not isFound then
    Result := True;
end;

procedure TfrmShipEditor.btnEditWeaponClick(Sender: TObject);
var
  IDweapon,
  IDDetail : Integer;

  i : integer;
  WeaponOnShip : TWeaponGetList;

  ListWeaponOnShip : TList;
begin
  if lvWeaponSelect.Selected <> nil then
  begin
     pnlEdit.BringToFront;
     btnUpdate.Visible := True;

     IDweapon := StrToInt(lvWeaponSelect.Selected.Caption);
     IDDetail := StrToInt(lvWeaponSelect.Selected.SubItems[1]);

     ListWeaponOnShip := TList.Create;
     try
       DataModule1.GetListWeaponOnShip(Ship_ID, ListWeaponOnShip);

       for i:= 0 to ListWeaponOnShip.Count-1 do
       begin
         if Assigned(ListWeaponOnShip.Items[i]) then begin

           WeaponOnShip := TWeaponGetList(ListWeaponOnShip.Items[i]);

           if (WeaponOnShip.IDShip = Ship_ID) and
           (WeaponOnShip.IDWeapon = IDweapon) and
           (WeaponOnShip.IDDetail = IDDetail) then
           begin
             if cbbModelBody.Items.IndexOf(
                             DataModule1.GetModelNameByID(
                             WeaponOnShip.IDModel1)) <> -1 then
             begin
               cbbModelBody.ItemIndex := cbbModelBody.Items.IndexOf(
                                         DataModule1.GetModelNameByID(
                                         WeaponOnShip.IDModel1))
             end;

             if cbbModelSpout.Items.IndexOf(
                             DataModule1.GetModelNameByID(
                             WeaponOnShip.IDModel2)) <> -1 then
             begin
               cbbModelSpout.ItemIndex := cbbModelBody.Items.IndexOf(
                                          DataModule1.GetModelNameByID(
                                          WeaponOnShip.IDModel2))
             end;

             if cbbDOF_I.Items.IndexOf(
                             DataModule1.GetDOFNameByID(
                             WeaponOnShip.IDDof1)) <> -1 then
             begin
               cbbDOF_I.ItemIndex := cbbDOF_I.Items.IndexOf(
                                     DataModule1.GetDOFNameByID(
                                     WeaponOnShip.IDDof1))
             end;

             if cbbDOF_II.Items.IndexOf(
                             DataModule1.GetDOFNameByID(
                             WeaponOnShip.IDDof2)) <> -1 then
             begin
               cbbDOF_II.ItemIndex := cbbDOF_II.Items.IndexOf(
                                      DataModule1.GetDOFNameByID(
                                      WeaponOnShip.IDDof2))
             end;

             if cbbSwitch.Items.IndexOf(
                             DataModule1.GetswitchNameByID(
                             WeaponOnShip.IDSwitch)) <> -1 then
             begin
               cbbSwitch.ItemIndex := cbbSwitch.Items.IndexOf(
                                      DataModule1.GetswitchNameByID(
                                      WeaponOnShip.IDSwitch))
             end;

             edtUpdateHeading.Text := IntToStr(WeaponOnShip.Pos_H);
             edtUpdatePitch.Text   := IntToStr(WeaponOnShip.Pos_P);
             edtLauncher.Text      := IntToStr(WeaponOnShip.IDDetail);

             case WeaponOnShip.Is3DActor of
                0 : chkcb3DActor.Checked := False;
                1 : chkcb3DActor.Checked := true;
             end;

             Break;
           end;
         end;

       end;
     finally
       ClearAList(ListWeaponOnShip);
       ListWeaponOnShip.Free;
     end;
  end;
end;

procedure TfrmShipEditor.imgRemoveClick(Sender: TObject);
begin
  if lvWeaponSelect.Selected <> nil then
  begin
    DataModule1.DeleteWeaponShip(Ship_ID,
                                 StrToInt(lvWeaponSelect.Selected.caption),
                                 StrToInt(lvWeaponSelect.Selected.SubItems[1]),
                                 StrToInt(lvWeaponSelect.Selected.SubItems[2]));

    ShowWeapon;
    ClearAllDetail;
  end
  else
  begin
    ShowMessage('Select Weapon First');
  end;
end;

procedure TfrmShipEditor.ClearAllDetail;
begin
  edtPosPitch.Text    := '';
  edtPosHeading.Text  := '';
  edtModelBody.Text   := '';
  edtModelSpout.Text  := '';
  edtDOF1.Text        := '';
  edtDOF2.Text        := '';
  edtSwitch.Text      := '';
  edt3DActor.Text     := '';

  cbbModelBody.ItemIndex  := 0;
  cbbModelSpout.ItemIndex := 0;
  cbbDOF_I.ItemIndex      := 0;
  cbbDOF_II.ItemIndex     := 0;
  cbbSwitch.ItemIndex     := 0;

  edtLauncher.Text        := '0';
  edtUpdateHeading.Text   := '0';
  edtUpdatePitch.Text     := '0';

  btnUpdate.Visible       := false;

  edtDetailName.Text  := '';
  edtStartDegree.Text := '';
  edtEndDegree.Text   := '';
  edtMinRange.Text    := '';
  edtMaxRange.Text    := '';

  lvDetail.Items.Clear;
  pnlDetail.BringToFront;
end;

procedure TfrmShipEditor.ClearListShipData(const aListView: TListView);
var
  i: Integer;
begin
  for i := 0 to aListView.Items.Count - 1 do
  begin
    if Assigned(aListView.Items[i].Data) then
    begin
      TObject(aListView.Items[i].Data).Free;
      aListView.Items[i].Data:= nil;
    end;
  end;
  aListView.Clear;
end;

procedure TfrmShipEditor.ClearVisualForm;

begin
  edtShipName.Text  := '';
//  edtClassName.Text := '';

  edtShipLength.Text  := '0';
  edtShipwidth.Text   := '0';
  edtShipHeight.Text  := '0';

  edtShipMaxSpeed.Text         := '0';
  edtShipMaxSpeedAstern.Text   := '0';
  edtDamageSustainability.Text := '0';
  edtShipRudderSwingRate.Text  := '1';
  edtShipThrottleRate.Text     := '1';
  edtShipDisplacement.Text     := '1';
  edtShipHeelFactor.Text       := '1';
  edtShipShaftUp.Text          := '1';
  edtShipTacDiameter.Text      := '1';
  edtShipTrimFactor.Text       := '1';

  edtModelBody.Text   := '';
  edtDOF1.Text        := '';
  edtPosPitch.Text    := '';
  edtSwitch.Text      := '';
  edtLethality.Text   := '';
  edtModelSpout.Text  := '';
  edtDOF2.Text        := '';
  edtPosHeading.Text  := '';
  edt3DActor.Text     := '';

  ClearListShipData (lvWeaponSelect);
  ClearListShipData (lvDetail);
end;

procedure TfrmShipEditor.FormShow(Sender: TObject);
begin
  ShowWeapon;
  GetALL_Dof_Model_Switch;
  UpdateVisualForm;
end;

procedure TfrmShipEditor.SetFormWeapon;
var
  i: Integer;
begin
  if Screen.MonitorCount > 1 then
    i := 1
  else
    i := 0;

//  frmShipEditor.Top     := 2;
//  frmShipEditor.Left    := 2;
//  AdvSmoothPanel1.Top   := 2;
//  AdvSmoothPanel1.Left  := 2;
//  AdvSmoothPanel1.Height:= 734;
//  AdvSmoothPanel1.Width := 928;

  Show;
end;

procedure TfrmShipEditor.ShowWeapon;
var
  ListWeaponOnShip : TList;
  WeaponOnShip : TWeaponGetList;
  i: Integer;
  strPicture : string;
begin
//  edtShipName1.Text := Ship_Name;
  lvWeaponSelect.Items.Clear;
  ListWeaponOnShip := TList.Create;
  try
    ClearAllDetail;
    DataModule1.GetListWeaponOnShip(Ship_ID, ListWeaponOnShip);
    for i := 0 to ListWeaponOnShip.Count - 1 do
    begin
      if Assigned(ListWeaponOnShip[i]) then begin
        WeaponOnShip := TWeaponGetList(ListWeaponOnShip[i]);
        with lvWeaponSelect.Items.Add do
        begin
          Caption := IntToStr(WeaponOnShip.IDWeapon);
          SubItems.Add(DataModule1.GetNameWeaponByID(WeaponOnShip.IDWeapon));
          SubItems.Add(IntToStr(WeaponOnShip.IDDetail));
          SubItems.Add(IntToStr(WeaponOnShip.ID));
        end;
      end;
    end;
  finally
    ClearAList(ListWeaponOnShip);
    ListWeaponOnShip.Free
  end;
end;

procedure TfrmShipEditor.lvWeaponSelectClick(Sender: TObject);
var
 ListWeaponOnShip : TList;
 WeaponOnShip     : TWeaponGetList;

 ListWeaponDetail : Tlist;
 WeaponDetail     : TWeaponDetail;

 IDweapon,
 IDDetail : Integer;

 i : Integer;
 o: TObject;
begin

  if lvWeaponSelect.Selected = nil then
  begin
    ClearAllDetail;
    Exit;
  end;

  ClearAllDetail;

  IDweapon := StrToInt(lvWeaponSelect.Selected.Caption);
  IDDetail := StrToInt(lvWeaponSelect.Selected.SubItems[1]);

  ListWeaponOnShip := TList.Create;
  ListWeaponDetail := TList.Create;

  try

    DataModule1.GetListWeaponOnShip(Ship_ID, ListWeaponOnShip);
    DataModule1.GetListWeaponRangeDetail(Ship_ID, IDweapon, IDDetail,  ListWeaponDetail);

    for i:= 0 to ListWeaponOnShip.Count-1 do
    begin
      if Assigned(ListWeaponOnShip.Items[i]) then begin
        WeaponOnShip := TWeaponGetList(ListWeaponOnShip.Items[i]);
        if (WeaponOnShip.IDShip = Ship_ID) and
           (WeaponOnShip.IDWeapon = IDweapon) and
           (WeaponOnShip.IDDetail = IDDetail)
        then
        begin
          edtModelBody.Text   := DataModule1.GetModelNameByID(WeaponOnShip.IDModel1);
          edtModelSpout.Text  := DataModule1.GetModelNameByID(WeaponOnShip.IDModel2);
          edtDOF1.Text        := DataModule1.GetDOFNameByID(WeaponOnShip.IDDof1);
          edtDOF2.Text        := DataModule1.GetDOFNameByID(WeaponOnShip.IDDof2);
          edtSwitch.Text      := DataModule1.GetSwitchNameByID(WeaponOnShip.IDSwitch);
          edtPosPitch.Text    := IntToStr(WeaponOnShip.Pos_P);
          edtPosHeading.Text  := IntToStr(WeaponOnShip.Pos_H);
          edtLethality.Text := FloatToStr(DataModule1.GetLethalityByID(IDweapon));
          case WeaponOnShip.Is3DActor of
            0 : edt3DActor.Text := 'NO';
            1 : edt3DActor.Text := 'YES';
          end;
          Break;
        end;
      end;
    end;

    for i := 0 to ListWeaponDetail.Count - 1 do
    begin
      if Assigned(ListWeaponDetail.Items[i]) then begin
        WeaponDetail := TWeaponDetail(ListWeaponDetail.Items[i]);
        with lvDetail.Items.Add do
        begin
          Caption := IntToStr(WeaponDetail.IDType);
          SubItems.Add(WeaponDetail.DetName);
          SubItems.Add(FloatToStr(WeaponDetail.StartAngle));
          SubItems.Add(FloatToStr(WeaponDetail.EndAngle));
          SubItems.Add(FloatToStr(WeaponDetail.LowRange));
          SubItems.Add(FloatToStr(WeaponDetail.HighRange));
        end;
      end;
    end;

  finally
    ClearAList(ListWeaponOnShip);
    ListWeaponOnShip.Free;
    ClearAList(ListWeaponDetail);
    ListWeaponDetail.Free;
  end;
end;

procedure TfrmShipEditor.btnAddMissileClick(Sender: TObject);
begin
  if lvWeaponSelect.Selected <> nil then
  begin
    frmAssignMisille.ShipID := Ship_ID;
    frmAssignMisille.WeaponID       := StrToInt(lvWeaponSelect.Selected.Caption);
    frmAssignMisille.LauncherID     := StrToInt(lvWeaponSelect.Selected.SubItems[1]);
    frmAssignMisille.WeaponIDNumber := StrToInt(lvWeaponSelect.Selected.SubItems[2]);

    frmAssignMisille.Show;
  end
  else
  begin
    ShowMessage('Select Weapon First');
  end;

end;

procedure TfrmShipEditor.GetALL_Dof_Model_Switch;
var
  listModel,
  listDOF,
  ListSwitch : TList;

  mModel : TModel;
  mDOF : TDof;
  mSwitch : TSwitch;

  i : integer;
begin
  listModel   := TList.Create;
  listDOF     := TList.Create;
  ListSwitch  := TList.Create;
  try
    cbbModelBody.Items.Clear;
    cbbModelSpout.Items.Clear;
    cbbDOF_I.Items.Clear;
    cbbDOF_II.Items.Clear;
    cbbSwitch.Items.Clear;

    DataModule1.GetAllModel3D(listModel);
    DataModule1.GetAllDOF3D(listDOF);
    DataModule1.GetAllSwitch(ListSwitch);

    cbbModelBody.Items.Add('Empty');
    cbbModelSpout.Items.Add('Empty');
    for i:= 0 to listModel.Count-1 do
    begin
      if Assigned(listModel.Items[i]) then begin
        mModel := TModel(listModel.Items[i]);
        if mModel.TIPE = 1 then
          Continue;

        cbbModelBody.Items.Add(mModel.Nama);
        cbbModelSpout.Items.Add(mModel.Nama);
      end;
    end;

    cbbDOF_I.Items.Add('Empty');
    cbbDOF_II.Items.Add('Empty');
    for i:= 0 to listDOF.Count-1 do
    begin
      if Assigned(listDOF.Items[i]) then begin
        mDOF := TDof(listDOF.Items[i]);
        cbbDOF_I.Items.Add(mDOF.Nama);
        cbbDOF_II.Items.Add(mDOF.Nama);
      end;
    end;

    cbbSwitch.Items.Add('Empty');
    for i:= 0 to ListSwitch.Count-1 do
    begin
      if Assigned(ListSwitch.Items[i]) then begin
        mSwitch := TSwitch(ListSwitch.Items[i]);
        cbbSwitch.Items.Add(mSwitch.Nama);
      end;
    end;
  finally
    ClearAList(listModel);
    listModel.Free;
    ClearAList(listDOF);
    listDOF.Free;
    ClearAList(ListSwitch);
    ListSwitch.Free;
  end;

end;

procedure TfrmShipEditor.btnUpdateClick(Sender: TObject);
var
  isvalid,
  isError,
  isAvailableLauncher : Boolean;

  WeaponOnShip : TWeaponGetList;

  launcherID : Integer;

  PosH,PosP : Integer;

  mModel1ID,
  mModel2ID,
  mDof1ID,
  mDof2ID,
  mSwitchID : integer;
begin
  if lvWeaponSelect.Selected <> nil then
  begin
    isvalid := True;
    isError := false;
    isAvailableLauncher := True;

    if (TryStrToInt(edtLauncher.Text, launcherID)) then
    begin
      if launcherID = 0 then
      begin
        ShowMessage('Can Not Assign To Launcher 0');
        isError := True;
      end;

      if launcherID <> StrToInt(lvWeaponSelect.Selected.SubItems[1]) then
        isAvailableLauncher := CekLauncherAvailable(lvWeaponSelect , launcherID);

      if isAvailableLauncher then
      begin
        if chkcb3DActor.Checked then
        begin
          if cbbModelBody.ItemIndex = 0 then isError := True;
          if cbbModelSpout.ItemIndex = 0 then isError := True;
          if cbbDOF_I.ItemIndex = 0 then isError := True;
          if cbbDOF_II.ItemIndex = 0 then isError := True;
          if cbbSwitch.ItemIndex = 0 then isError := True;

          if not TryStrToInt(edtUpdatePitch.Text, PosP) then isError := True;
          if not TryStrToInt(edtUpdateHeading.Text, PosH) then isError := True;
        end
        else
        begin
          if not TryStrToInt(edtUpdatePitch.Text, PosP) then isError := True;
          if not TryStrToInt(edtUpdateHeading.Text, PosH) then isError := True;
        end;

        if not isError then
        begin
          WeaponOnShip := TWeaponGetList.Create;
          try
            WeaponOnShip.ID := 0;
            WeaponOnShip.IDShip := Ship_ID;
            WeaponOnShip.IDWeapon := StrToInt(lvWeaponSelect.Selected.Caption);
            WeaponOnShip.IDDetail := launcherID;

            if chkcb3DActor.Checked then
            begin
              mModel1ID     := DataModule1.GetModelIDByName(cbbModelBody.Text);
              mModel2ID     := DataModule1.GetModelIDByName(cbbModelSpout.Text);
              mDof1ID       := DataModule1.GetDofIDByName(cbbDOF_I.Text);
              mDof2ID       := DataModule1.GetDofIDByName(cbbDOF_II.Text);
              mSwitchID     := DataModule1.GetSwitchIDByName(cbbSwitch.Text);

              WeaponOnShip.Is3DActor := 1;
            end
            else
            begin
              mModel1ID     := 0;
              mModel2ID     := 0;
              mDof1ID       := 0;
              mDof2ID       := 0;
              mSwitchID     := 0;

              WeaponOnShip.Is3DActor := 0;
            end;

            WeaponOnShip.IDModel1 := mModel1ID;
            WeaponOnShip.IDModel2 := mModel2ID;
            WeaponOnShip.IDDof1   := mDof1ID;
            WeaponOnShip.IDDof2   := mDof2ID;
            WeaponOnShip.IDSwitch := mSwitchID;
            WeaponOnShip.Pos_H    := PosH;
            WeaponOnShip.Pos_P    := PosP;

            DataModule1.UpdateWeaponShip(WeaponOnShip,
                                         StrToInt(lvWeaponSelect.Selected.SubItems[2]));

            ShowWeapon;
            ClearAllDetail;
          finally
            WeaponOnShip.Free;
          end;
        end
        else
        begin
          ShowMessage('Weapon List Not Correct');
        end;
      end
      else
      begin
        ShowMessage('Weapon Have Set In Selected Launcer');
      end;
    end
    else
    begin
      ShowMessage('Input Wrong');
    end;
  end;
end;

procedure TfrmShipEditor.cb3DActorClick(Sender: TObject);
begin
  if not chkcb3DActor.Checked then
  begin
    cbbModelBody.ItemIndex  := 0;
    cbbModelSpout.ItemIndex := 0;
    cbbDOF_I.ItemIndex := 0;
    cbbDOF_II.ItemIndex := 0;
    cbbSwitch.ItemIndex := 0;
  end;
end;

procedure TfrmShipEditor.cbbClassClick(Sender: TObject);
begin
//  cbbClass.Items.Clear;
//
//  with DataModule1.GetShipClassName do
//  begin
//    cbbClass.Items.Add(FieldByName('SHIP_CLASS_NAME').AsString)
//  end;
end;

procedure TfrmShipEditor.btnRemoveDetailClick(Sender: TObject);
var
  WeaponDetail : TWeaponDetail;
begin
  if (lvDetail.Selected <> nil) and
     (lvWeaponSelect.Selected <> nil)
  then
  begin
    try
      WeaponDetail := TWeaponDetail.Create;
      WeaponDetail.IDShip       := Ship_ID;
      WeaponDetail.IDWeapon     := StrToInt(lvWeaponSelect.Selected.caption);
      WeaponDetail.IDType       := StrToInt(lvDetail.Selected.Caption);
      WeaponDetail.IDLauncher   := StrToInt(lvWeaponSelect.Selected.SubItems[1]);

      DataModule1.DeleteDetailWeapon(WeaponDetail);

      ClearAllDetail;
      ShowWeapon;
    finally
      WeaponDetail.Free;
    end;
  end;
end;

procedure TfrmShipEditor.btnAddDetailClick(Sender: TObject);
var
  WeaponDetail : TWeaponDetail;

  StartDregree,
  EndDegree,
  MinRange,
  MaxRange : Double;

  isValid : Boolean;
begin
  if lvWeaponSelect.Selected <> nil then
  begin
    isValid := True;

    try
      WeaponDetail := TWeaponDetail.Create;

      if not TryStrToFloat(edtStartDegree.Text, StartDregree) then isValid := false;
      if not TryStrToFloat(edtEndDegree.Text,   EndDegree)    then isValid := false;
      if not TryStrToFloat(edtMinRange.Text,    MinRange)     then isValid := false;
      if not TryStrToFloat(edtMaxRange.Text,    MaxRange)     then isValid := false;

      if isValid then
      begin
        WeaponDetail.DetName    := edtDetailName.Text;
        WeaponDetail.IDShip     := Ship_ID;
        WeaponDetail.IDWeapon   := StrToInt(lvWeaponSelect.Selected.Caption);
        WeaponDetail.IDLauncher := StrToInt(lvWeaponSelect.Selected.SubItems[1]);

        if lvDetail.Items.Count > 0 then WeaponDetail.IDType := StrToInt(lvDetail.Items[lvDetail.Items.Count -1].Caption) + 1
        else WeaponDetail.IDType   := 1;

        WeaponDetail.StartAngle := StartDregree;
        WeaponDetail.EndAngle   := EndDegree;
        WeaponDetail.LowRange   := MinRange;
        WeaponDetail.HighRange  := MaxRange;


        DataModule1.AddDetailWeapon(WeaponDetail);

        ClearAllDetail;
        ShowWeapon;
      end;
    finally
      WeaponDetail.Free;
    end
  end;
end;

procedure TfrmShipEditor.tbSeaSpeedChange(Sender: TObject);
begin
  edtDamageSustainability.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfrmShipEditor.Edit1Change(Sender: TObject);
begin
  if (edtDamageSustainability.Text <> '') then
  begin
    try
    except
      on E : Exception do Exit;
    end;
  end;
end;

procedure TfrmShipEditor.Edit1KeyPress(Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtDamageSustainability.Text := FormatFloat('0.00', StrToFloat(edtDamageSustainability.Text));
end;

procedure TfrmShipEditor.Edit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtDamageSustainability.Text = '' then
    Exit;

   if (StrToFloat(edtDamageSustainability.Text) > 200)  then
    begin
      ShowMessage('Incorrect value');
      edtDamageSustainability.Text := '200';
    end;
end;

procedure TfrmShipEditor.btnCancel(Sender: TObject);
begin
 // ToClose;
  Close;
end;

procedure TfrmShipEditor.Edit2Change(Sender: TObject);
begin
  if (edtLethality.Text <> '') then
  begin
    try
      // TrackBar1.Position := StrToInt(Edit2.Text);
    except
      on E : Exception do Exit;
    end;
  end;
end;

procedure TfrmShipEditor.Edit2KeyPress(Sender: TObject; var Key: Char);
var
  tmpFloat : Double;
begin

  if not (Key in[#48 .. #57, #8, #13, #46]) then
    Key := #0;

  if key = #13 then
    edtLethality.Text := FormatFloat('0.00', StrToFloat(edtLethality.Text));
end;

procedure TfrmShipEditor.Edit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if edtLethality.Text = '' then
    Exit;

   if (StrToFloat(edtLethality.Text) > 100)  then
    begin
      ShowMessage('Incorrect value');
      edtLethality.Text := '100';
    end;
end;
procedure TfrmShipEditor.TrackBar1Change(Sender: TObject);
begin
  edtLethality.Text := IntToStr((sender as TTrackBar).Position);
end;

procedure TfrmShipEditor.btn2Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmShipEditor.UpdateVisualForm;
var
  i : Integer;
  ShipTemp : TVehicle;

  {Var lvWeapon}
  ListWeaponOnShip : TList;
  WeaponOnShip : TWeaponGetList;
  strPicture : string;

begin
  {Membersihkan form}
  ClearVisualForm;

  {Membuat objek penampung}
  ShipTemp := TVehicle.Create;

  {Mengambil data dari database}
  ShipTemp := DataModule1.GetShipByID(Ship_ID);

  if Assigned(ShipTemp) then
  begin
    {$REGION ' General Ship Editor '}
    edtShipName.Text     :=  ShipTemp.Vehicle_Name;
//    edtClassName.Text    :=  DataModule1.IDclassbyName(ShipTemp.Vehicle_ID);

    edtShipLength.Text   := FloatToStr(ShipTemp.Vehicle_LENGTH);
    edtShipwidth.Text    := FloatToStr(ShipTemp.Vehicle_WIDTH);
    edtShipHeight.Text   := FloatToStr(ShipTemp.Vehicle_HEIGHT);

    edtShipMaxSpeed.Text         := FloatToStr(ShipTemp.Vehicle_Maxspeed);
    edtShipMaxSpeedAstern.Text   := FloatToStr(ShipTemp.Vehicle_MaxspeedAstern);
    edtDamageSustainability.Text := FloatToStr(ShipTemp.Vehicle_SUSTAINABILITY);

    edtShipRudderSwingRate.Text  := FloatToStr(ShipTemp.Vehicle_RudderSwingRate);
    edtShipThrottleRate.Text     := FloatToStr(ShipTemp.Vehicle_ThrottleRate);
    edtShipDisplacement.Text     := FloatToStr(ShipTemp.Vehicle_Displacement);
    edtShipHeelFactor.Text       := FloatToStr(ShipTemp.Vehicle_HeelFactor);
    edtShipShaftUp.Text          := FloatToStr(ShipTemp.Vehicle_ShaftUp);
    edtShipTacDiameter.Text      := FloatToStr(ShipTemp.Vehicle_TacDiameter);
    edtShipTrimFactor.Text       := FloatToStr(ShipTemp.Vehicle_TrimFactor);
    {$ENDREGION}

    {$REGION ' Load Image '}
    strPicture := '..\Data\imageship\' + ShipTemp.Vehicle_Name + '.png';

    if FileExists(strPicture) then
    begin
      imgShip.Picture.LoadFromFile(strPicture);
    end;
    {$ENDREGION}

    {$REGION ' Weapon Editor '}
    lvWeaponSelect.Items.Clear;

    ListWeaponOnShip := TList.Create;

    DataModule1.GetListWeaponOnShip(Ship_ID, ListWeaponOnShip);

    if Assigned(ListWeaponOnShip) then
    begin
      for i := 0 to ListWeaponOnShip.Count-1 do
      begin
        WeaponOnShip := TWeaponGetList.Create;
        WeaponOnShip := TWeaponGetList(ListWeaponOnShip[i]);

        if Assigned(WeaponOnShip) then
        begin
          with lvWeaponSelect.Items.Add do
          begin
            Caption := IntToStr(WeaponOnShip.IDWeapon);
            SubItems.Add(DataModule1.GetNameWeaponByID(WeaponOnShip.IDWeapon));
            SubItems.Add(IntToStr(WeaponOnShip.IDDetail));
            SubItems.Add(IntToStr(WeaponOnShip.ID));
            Data := WeaponOnShip;
          end;
        end;
      end;
    end;
    {$ENDREGION}
  end;


end;

procedure TfrmShipEditor.btnSaveShipClick(Sender: TObject);
var
  vehicle     : TVehicle;

begin
  if cbbClass.ItemIndex = -1 then
  begin
    ShowMessage('Please Select Ship Class First!');
    Exit;
  end;
  vehicle := TVehicle.Create;

  try
    {Memasukkan data dari form ke penampung}
    with vehicle do
    begin
      Vehicle_Name            := edtShipName.Text;
      Vehicle_Ship_Type       := cbbClass.ItemIndex + 1;
      Vehicle_LENGTH          := StrToFloat(edtShipLength.Text);
      Vehicle_WIDTH           := StrToFloat(edtShipwidth.Text);
      Vehicle_HEIGHT          := StrToFloat(edtShipHeight.Text);
      Vehicle_SUSTAINABILITY  := StrToFloat(edtDamageSustainability.Text);
      Vehicle_Maxspeed        := StrToFloat(edtShipMaxSpeed.Text);
      Vehicle_Minspeed        := StrToFloat(edtShipMaxSpeedAstern.Text);

      Vehicle_RudderSwingRate := StrToFloat(edtShipRudderSwingRate.Text);
      Vehicle_ThrottleRate    := StrToFloat(edtShipThrottleRate.Text);
      Vehicle_Displacement    := StrToFloat(edtShipDisplacement.Text);
      Vehicle_HeelFactor      := StrToFloat(edtShipHeelFactor.Text);
      Vehicle_ShaftUp         := StrToFloat(edtShipShaftUp.Text);
      Vehicle_TacDiameter     := StrToFloat(edtShipTacDiameter.Text);
      Vehicle_TrimFactor      := StrToFloat(edtShipTrimFactor.Text);
    end;

    if isNew = True then
    begin
      {Isi sintak insert baru}
      DataModule1.SaveShip(vehicle);
    end
    else
    begin
      {isi sintak update data}
      DataModule1.UpdateShipEditor(Ship_ID,vehicle);
    end;
  finally
    vehicle.Free;
  end;

  frmGameController.ShowShip;
  close;
end;

procedure TfrmShipEditor.ToClose;
begin
  edtShipLength.Enabled := False;
  edtShipHeight.Enabled := False;
  edtShipwidth.Enabled := False;
  edtDamageSustainability.Enabled := False;
  edtShipMaxSpeedAstern.Enabled := False;
  edtShipMaxSpeed.Enabled := False;
end;

end.
