unit uRBU_Manager;

interface
uses
   Forms,
   Graphics,
   Classes,

//------------------------------------------------------------------------------
   uLibRBU,
//   u108,
//   uBurjaAtas,
//   uBurjaBawah,
//   uPanelFire,
   uSimulationManager,
   uTCPDatatype,
   uTCPClient,
   uVehicleManager,
   uTestShip,
   uVehicle,
   uClassDatabase,
   uLibClientObject,

   ufrmNetSetting,

   uBridgeSet,
   uCodecBase64,
   uBaseFunction,
   uBaseSimulationObject,
   uBaseConstan;

type

   TRBUManager = class(TSimulationManager)
   private
    FShipID: string;
    //FxShip       : TXShip;
    Fposition  : tDouble3DPoint;
    Fheading,
    Fspeed     : Single;
//    FSelectedVehicle: TVehicle;
     procedure GetAsrocWeaponAssigned;
   protected
     constructor Create;
     destructor Destroy; override;

   public
//     frm108Kiri       : Tfrm108;
//     frm108Kanan      : Tfrm108;
//     frmTopBurja      : TfrmBurjaAtas;
//     frmBottomBurja   : TfrmBurjaBawah;
//     frmPanelFire     : TfrmPanelFire;

     frmNet           : TfrmNetSetting;
     Datcom           : TTCPClient;
     Logmemo          : TStrings;
     StandAloneMode   : Boolean;
     pCurrentScenID   : integer;

     pServer_Ip,pServer_Port,
     pDBServer, pDBProto, pDBName, pDBUser, pDBPass,
     pShipName, pClassName : string;
     pShipID, pClassID : Integer;
     OffX_Map, OffY_Map: Double;
     // Weapon Assigned

     IsSonarTracked    : Boolean;
     FLastSonarTracked : Boolean;

     procedure BeginSimulation;
     procedure EndSimulation;
     procedure Initialize;
     procedure CreateObjek;
     procedure SetLayOutForm;

     procedure FrmNetShow;
     procedure Net_Connect;
     procedure Net_DisConnect;
     procedure EventOnReceiveDataPosition(apRec: PAnsiChar; aSize: integer);
     procedure EventOnReceive3DOrder(apRec: PAnsiChar; aSize: integer);
     procedure EventOnReceiveSonarMode(apRec: PAnsiChar; aSize: integer);
     procedure Event_RcvRBUSetting(apRec: PAnsiChar; aSize: integer);
     procedure EventOnReceiveRBUOrder(apRec: PAnsiChar; aSize: integer);

     procedure EventOnReceiveMissileStatus(apRec: PAnsiChar; aSize: integer);
     procedure EventOnReceiveEnvironment(apRec: PAnsiChar; aSize: integer);

     function IsMissileReady(LauncherID, MissileID: Integer): Boolean;
     function IsLauncherFullyLoaded(LauncherID: Integer): Boolean;
     function IsLauncherReady(LauncherID: Integer): Boolean;

     procedure UpdateLauncherIndicator(LauncherID: Integer);

//     function  ReadValConsoleSetting(val : integer): Boolean;
     procedure AddToMemoLog(const str: string);
     procedure SendEvenRBU(EvenId: Word; const Prm1 :double = 0; Prm2 : double = 0; Prm3: double = 0);

     property ShipID : string read FShipID write FShipID;
     property Position : tDouble3DPoint read Fposition write Fposition;
     property Heading : Single read Fheading write Fheading;
     property Speed : Single read Fspeed write Fspeed;
//     property SelectedVehicle : TVehicle read FSelectedVehicle write FSelectedVehicle;

   end;

var
  RBU_MAnager  : TRBUManager;

implementation
uses
  uFormUtil, Windows, SysUtils, Controls, Dialogs, {uMain,} uDataModule,
  uSettingFormToMonitorWith_ini, ufrmMainDisplay;

procedure TRBUManager.BeginSimulation;
var
  str : string;
begin
   CreateObjek;
   SetLayOutForm;
   Initialize;
   GetAsrocWeaponAssigned;

   Datcom.RegisterProcedure(REC_3D_POSITION, EventOnReceiveDataPosition , SizeOf(TRecData3DPosition));
   Datcom.RegisterProcedure(REC_3D_MISSILEPOS, EventOnReceive3DOrder , SizeOf(TRec3DMissilePos));
   Datcom.RegisterProcedure(REC_SET_RBU, nil, SizeOf(TRec3DSetRBU));
   Datcom.RegisterProcedure(REC_EVENT_LOG, nil, SizeOf(TRecEventLog));
   Datcom.RegisterProcedure(RecRBU_SonarMode_ORDER, EventOnReceiveSonarMode, SizeOf(TRecRBU_SonarMode));

   Datcom.RegisterProcedure(REC_STAT_ORDER_CONSOLE, Event_RcvRBUSetting , sizeof(TRecStatus_Console));
   Datcom.RegisterProcedure(REC_3D_RBU, EventOnReceiveRBUOrder, SizeOf(TRec3DSetRBU));

   Datcom.RegisterProcedure(REC_MISSILEPOS, EventOnReceiveMissileStatus, SizeOf(TRecMissilePos));
   Datcom.RegisterProcedure(REC_ENVIRONMENT, EventOnReceiveEnvironment, SizeOf(TRecDataEnvironment));

//   Datcom.setLog(TStringList(frm_Main.mmo1.Lines));

   if not StandAloneMode then
   Net_Connect;

end;

procedure TRBUManager.EndSimulation;
begin
  RBU_MAnager.Free;
end;

{ TRBUManager }

constructor TRBUManager.Create;
begin
//  inherited;
  IsSonarTracked    := False;
  FLastSonarTracked := False;
end;

procedure TRBUManager.CreateObjek;
var i :Integer;
begin
  Datcom  := TTCPClient.Create;

  Datcom.setLog(TStringList(Logmemo));

  OwnShip     := TShipRBU.Create;
  TargetShip  := TShipRBU.Create;

  Lonch1 := TLoncher.Create;
  Lonch1.ID := 1;

  Lonch2 := TLoncher.Create;
  Lonch2.ID := 2;

  TargetID    := 0;
//   frmPanelFire    := TfrmPanelFire.Create(nil);
//
//   frmTopBurja      := TfrmBurjaAtas.Create(nil);
//   frmBottomBurja   := TfrmBurjaBawah.Create(nil);
//
//   frm108Kiri       := Tfrm108.Create(nil);
//   frm108Kiri.Caption:='Kiri';
//   frm108Kiri.Name := 'frm108Kiri';
//   frm108Kiri.unitform := '108 Kiri ';
//
//
//   frm108Kanan      := Tfrm108.Create(nil);
//   frm108Kanan.Caption:='Kanan';
//   frm108Kanan.Name := 'frm108Kanan';
//   frm108Kanan.unitform := '108 Kanan ';

  for i := 1 to  12 do begin
    ListMissileR[i]           := TRecMissile.Create;
    ListMissileR[i].Launcher  := 1;
    ListMissileR[i].Missile   := i;
    ListMissileR[i].Available := False;
    ListMissileR[i].Condition := True;

    ListMissileL[i]           := TRecMissile.Create;
    ListMissileL[i].Launcher  := 2;
    ListMissileL[i].Missile   := i;
    ListMissileL[i].Available := False;
    ListMissileL[i].Condition := True;
  end;

//   frmPanelFire.Left := frm108Kiri.Width - frmPanelFire.Width - 10;
//   frmPanelFire.Top  := 0;
//
//   if Assigned (frmTopBurja) then frmTopBurja.Show;
//   if Assigned (frmBottomBurja) then frmBottomBurja.Show;
//   if Assigned (frm108Kiri) then frm108Kiri.Hide;
//   if Assigned (frm108Kanan) then frm108Kanan.Hide;
//   if Assigned (frmPanelFire) then frmPanelFire.Hide;

end;

destructor TRBUManager.Destroy;
begin
 //inherited;
//     frm108Kiri.Free;
//     frm108Kanan.Free;
//     frmTopBurja.Free;
//     frmBottomBurja.Free;
//     frmPanelFire.Free;

     frmNet.Free;
     Datcom.Free;

     FreeAndNil(OwnShip);
     FreeAndNil(TargetShip);

end;

procedure TRBUManager.Initialize;
var
  Env_Map, ShipClassID,n : integer ;
  ShipName,ShipClassName, str  : string ;

begin
  n := ParamCount ;
  if n < max_param then
    StandAloneMode := true
  else
  begin
    StandAloneMode := false ;
    InitDefault_AllConfigFromInstruktur(pServer_Ip,pServer_Port,
    pDBServer, pDBProto, pDBName, pDBUser,pDBPass, pShipID, pCurrentScenID );

    if DataModule1.InitZDB(pDBServer, pDBProto, pDBName, pDBUser, pDBPass, '3306') then
    begin
        ShipClassID  := DataModule1.GetShipType(pShipID, ShipClassName);
        ShipName     := DataModule1.GetShipName(pShipID);

        Datcom.Log.Add(' ShipID      = ' + IntToStr(pShipID) );
        Datcom.Log.Add(' ShipClassId = ' + IntToStr(ShipClassID) );
        Datcom.Log.Add(' ShipName ' + ShipName );
        Datcom.Log.Add(' ShipClassName ' + ShipClassName );
    end;

    Env_Map := DataModule1.GetMapById(pCurrentScenID);
    DataModule1.GetOffsetMapByEnvMap(Env_Map ,OffX_Map, OffY_Map);
//     GetAsrocWeaponAssigned;
  end;

  stLEFT_UNFORMER1  := True;
  stLEFT_UNFORMER2  := True;
  stRIGHT_UNFORMER1 := True;
  stRIGHT_UNFORMER2 := True;

end;

function TRBUManager.IsLauncherFullyLoaded(LauncherID: Integer): Boolean;
var
  i : Integer;
begin
  Result := False;

  if (LauncherID < 1) or (LauncherID > 2) then
    Exit;

  for i := 1 to 12 do
  begin
    if LauncherID = 1 then
    begin
      if not ListMissileR[i].Available then
        Exit;
    end
    else
    begin
      if not ListMissileL[i].Available then
        Exit;
    end;
  end;

  Result := True;
end;

function TRBUManager.IsMissileReady(LauncherID, MissileID: Integer): Boolean;
begin
  Result := False;

  if (MissileID < 1) or (MissileID > 12) then
    Exit;

  case LauncherID of
    1: Result := ListMissileR[MissileID].Available and ListMissileR[MissileID].Condition;
    2: Result := ListMissileL[MissileID].Available and ListMissileL[MissileID].Condition;
  end;
end;

function TRBUManager.IsLauncherReady(LauncherID: Integer): Boolean;
var
  i: Integer;
begin
  Result := False;

  if (LauncherID < 1) or (LauncherID > 2) then
    Exit;

  for i := 1 to 12 do
  begin
    if IsMissileReady(LauncherID, i) then
    begin
      Result := True;
      Exit;
    end;
  end;
end;

procedure TRBUManager.UpdateLauncherIndicator(LauncherID: Integer);
var
  PicturePath      : string;
  LoadImgAvailable : string;
  LoadImgOff       : string;
begin
  PicturePath      := Copy(ExtractFilePath(Application.ExeName),1,length(ExtractFilePath(Application.ExeName))-4);
  LoadImgAvailable := PicturePath + 'bin\data\images\light\GREEN.bmp';
  LoadImgOff       := PicturePath + 'bin\data\images\light\RED.bmp';

  if LauncherID = 1 then
  begin
    if ListMissileR[1].Available then
      frmMainDisplay.imgRBU1Load1.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load1.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[2].Available then
      frmMainDisplay.imgRBU1Load2.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load2.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[3].Available then
      frmMainDisplay.imgRBU1Load3.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load3.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[4].Available then
      frmMainDisplay.imgRBU1Load4.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load4.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[5].Available then
      frmMainDisplay.imgRBU1Load5.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load5.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[6].Available then
      frmMainDisplay.imgRBU1Load6.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load6.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[7].Available then
      frmMainDisplay.imgRBU1Load7.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load7.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[8].Available then
      frmMainDisplay.imgRBU1Load8.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load8.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[9].Available then
      frmMainDisplay.imgRBU1Load9.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load9.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[10].Available then
      frmMainDisplay.imgRBU1Load10.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load10.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[11].Available then
      frmMainDisplay.imgRBU1Load11.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load11.Picture.LoadFromFile(LoadImgOff);

    if ListMissileR[12].Available then
      frmMainDisplay.imgRBU1Load12.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU1Load12.Picture.LoadFromFile(LoadImgOff);
  end
  else
  if LauncherID = 2 then
  begin
    if ListMissileL[1].Available then
      frmMainDisplay.imgRBU2Load1.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load1.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[2].Available then
      frmMainDisplay.imgRBU2Load2.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load2.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[3].Available then
      frmMainDisplay.imgRBU2Load3.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load3.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[4].Available then
      frmMainDisplay.imgRBU2Load4.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load4.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[5].Available then
      frmMainDisplay.imgRBU2Load5.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load5.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[6].Available then
      frmMainDisplay.imgRBU2Load6.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load6.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[7].Available then
      frmMainDisplay.imgRBU2Load7.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load7.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[8].Available then
      frmMainDisplay.imgRBU2Load8.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load8.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[9].Available then
      frmMainDisplay.imgRBU2Load9.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load9.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[10].Available then
      frmMainDisplay.imgRBU2Load10.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load10.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[11].Available then
      frmMainDisplay.imgRBU2Load11.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load11.Picture.LoadFromFile(LoadImgOff);

    if ListMissileL[12].Available then
      frmMainDisplay.imgRBU2Load12.Picture.LoadFromFile(LoadImgAvailable)
    else
      frmMainDisplay.imgRBU2Load12.Picture.LoadFromFile(LoadImgOff);
  end;
end;

procedure TRBUManager.GetAsrocWeaponAssigned;
var
  WeaponAssigned     : TScenarioWeapon;
  ListWeaponAssigned : TList;

  i : Integer;
begin
   ListWeaponAssigned := TList.Create;

  try
    Lonch1.Enabled := False;
    Lonch2.Enabled := False;

    if DataModule1.GetListWeaponOnShipBySceID(pCurrentScenID, pShipID, ListWeaponAssigned) > 0 then
    begin
      for I := 0 to ListWeaponAssigned.Count - 1 do
      begin
        WeaponAssigned := TScenarioWeapon(ListWeaponAssigned.Items[I]);

        if WeaponAssigned.WeaponID = C_DBID_RBU6000 then
        begin
          case WeaponAssigned.LauncherID of
            1:
              Lonch1.Enabled := True;

            2:
              Lonch2.Enabled := True;
          end;
        end;
      end;
    end;

    if Lonch1.Enabled then
      Datcom.Log.Add('Lonc1 is assigned')
    else
      Datcom.Log.Add('Lonc1 is not assigned');

    if Lonch2.Enabled then
      Datcom.Log.Add('Lonc2 is assigned')
    else
      Datcom.Log.Add('Lonc2 is not assigned');

  finally
    ListWeaponAssigned.Free;
  end;
end;

procedure TRBUManager.FrmNetShow;
var mr: integer;
begin
  frmNetSetting := TfrmNetSetting.Create(nil);
  frmNetSetting.Edit1.Text := pServer_Ip;
  frmNetSetting.Edit2.Text := pServer_Port;
  //  frmNetSetting.Show;
  frmNetSetting.Left := 50 ;
  frmNetSetting.top := 50 ;
  //  frmNetSetting.Close;

  mr := frmNetSetting.ShowModal;

  if mr = mrOk then begin
    pServer_Ip   := frmNetSetting.Edit1.Text;
    pServer_Port := frmNetSetting.Edit2.Text;
  end;
  frmNetSetting.Free;
end;

procedure TRBUManager.Net_Connect;
begin
  Datcom.Connect(pServer_Ip,  pServer_Port);
end;

procedure TRBUManager.Net_DisConnect;
begin
  DatCom.Disconnect;
end;

procedure TRBUManager.SendEvenRBU(EvenId: Word; const Prm1 :double = 0; Prm2 : double = 0; Prm3: double = 0);
begin
  SendLogEvenConsole(Datcom, pShipID, C_DBID_RBU6000, EvenId, Prm1, Prm2, Prm3);  // Test send Log konsol
end;

procedure TRBUManager.SetLayOutForm;
var path :string;
  idxBurjaAtas, alBurjaAtas, xBurjaAtas, yBurjaAtas,
  idxBurjaBawah, alBurjaBawah, xBurjaBawah, yBurjaBawah,
  idx108Kanan, al108Kanan, x108Kanan, y108Kanan,
  idx108Kiri, al108Kiri, x108Kiri, y108Kiri,
  idxAnjungan, alAnjungan, xAnjungan, yAnjungan,
  bdrBurjaAtas, bdrBurjaBawah, bdr108, bdrAnjungan: Integer;

begin
 path := ExtractFilePath(Application.ExeName) + 'SetFormRBU6000ToMonitor.ini';

  Getsettingform(path, 'BURJAATAS',  idxBurjaAtas,  alBurjaAtas,    xBurjaAtas,  yBurjaAtas );
  Getsettingform(path, 'BURJABAWAH', idxBurjaBawah, alBurjaBawah,   xBurjaBawah, yBurjaBawah);
  Getsettingform(path, '108KANAN',   idx108Kanan,   al108Kanan,     x108Kanan,   y108Kanan  );
  Getsettingform(path, '108KIRI',    idx108Kiri,    al108Kiri,      x108Kiri,    y108Kiri   );
  Getsettingform(path, 'ANJUNGAN',   idxAnjungan,   alAnjungan,     xAnjungan,   yAnjungan  );
  Getsettingform(path, 'BORDER',     bdrBurjaAtas,  bdrBurjaBawah,  bdr108,      bdrAnjungan  );

   case Screen.MonitorCount of
     1: begin
//        AlignFormToMonitor(0, apLeftTop , 0 ,0, TForm(frmTopBurja));
//        AlignFormToMonitor(0, apLeftTop , 0 ,0, TForm(frmBottomBurja));
//        AlignFormToMonitor(0, apLeftTop , 0 ,0, TForm(frm108Kiri));
//        AlignFormToMonitor(0, apLeftTop , 0 ,0, TForm( frm108Kanan));
//
//       frmPanelFire.FormStyle     := fsStayOnTop;
//       frm108Kiri.BorderStyle     := TFormBorderStyle(bdr108);
//       frm108Kanan.BorderStyle    := TFormBorderStyle(bdr108);
//       frmTopBurja.BorderStyle    := TFormBorderStyle(bdrBurjaAtas);
//       frmBottomBurja.BorderStyle := TFormBorderStyle(bdrBurjaBawah);
//       frmPanelFire.BorderStyle   := TFormBorderStyle(bdrAnjungan);

     end;
     2,3: begin
//       frmTopBurja.Height := 1080;
//       frmTopBurja.Width := 1920;
//
//       frmBottomBurja.Height := frmTopBurja.Height;
//       frmBottomBurja.Width := frmTopBurja.Width;
//
//       frm108Kiri.Height := frmTopBurja.Height;
//       frm108Kiri.Width  := frmTopBurja.Width;
//
//       frm108Kanan.Height := frmTopBurja.Height;
//       frm108Kanan.Width := frmTopBurja.Width;
//
//
//       frmBottomBurja.Height := frmTopBurja.Height;
//       frmBottomBurja.Width := frmTopBurja.Width;
//
//       frmPanelFire.Height := frmTopBurja.Height;
//       frmPanelFire.Width := frmTopBurja.Width;
//
//
//       frm108Kiri.BorderStyle     := TFormBorderStyle(bdr108);
//       frm108Kanan.BorderStyle    := TFormBorderStyle(bdr108);
//       frmTopBurja.BorderStyle    := TFormBorderStyle(bdrBurjaAtas);
//       frmBottomBurja.BorderStyle := TFormBorderStyle(bdrBurjaBawah);
//       frmPanelFire.BorderStyle   := TFormBorderStyle(bdrAnjungan);
//
//       AlignFormToMonitor(idxBurjaAtas,  TAlignPos(alBurjaAtas),  xBurjaAtas,  yBurjaAtas, TForm(frmTopBurja));
//       AlignFormToMonitor(idxBurjaBawah, TAlignPos(alBurjaBawah), xBurjaBawah, yBurjaBawah, TForm(frmBottomBurja));
//       AlignFormToMonitor(idx108Kanan,   TAlignPos(al108Kanan),   x108Kanan,   y108Kanan, TForm(frm108Kanan));
//       AlignFormToMonitor(idx108Kiri,    TAlignPos(al108Kiri),    x108Kiri,    y108Kiri, TForm(frm108Kiri));
//       AlignFormToMonitor(idxAnjungan,   TAlignPos(alAnjungan),   xAnjungan,   yAnjungan, TForm(frmPanelFire));

//       AlignFormToMonitor(1, apLeftTop , 0 ,0, TForm(frmTopBurja));
//       AlignFormToMonitor(0, apLeftTop , 0 ,0, TForm(frmBottomBurja));
//       AlignFormToMonitor(0, apLeftTop , 0 ,0, TForm(frm108Kiri));
//       AlignFormToMonitor(0, apLeftTop , 0 ,0, TForm(frm108Kanan));
//       AlignFormToMonitor(1, apRightTop, 0 ,0, TForm(frmPanelFire));


//       frm108Kiri.btn2.Left := 1200;
//       frm108Kiri.btn108R.Left := 1200;
//       frm108Kanan.btn2.Left := 1200;
//       frm108Kanan.btn108R.Left := 1200;
//
//       frm108Kanan.btnUNFORMER1_On.Left := 1000;
//       frm108Kiri.btnUNFORMER1_On.Left := 1000;
//       frmBottomBurja.btn108R.Left := 1200;

     end;
   end;

end;

procedure TRBUManager.AddToMemoLog(const str: string);
begin
  if Assigned(LogMemo) then begin
    LogMemo.Add('  ' + str);
  end;
end;

procedure TRBUManager.EventOnReceive3DOrder(apRec: PAnsiChar; aSize: integer);
var
  aRec: ^TRec3DMissilePos;
  lRec : TRec3DSetRBU;
  windRec : TRecData3DOrder;

  i: Integer;
  isValid: Boolean;
  LauncherMissile: TRecMissile;
  Launcher: TLoncher;
begin
  aRec := @apRec^;

  if aRec^.shipID <> pShipID then
    Exit;

  if aRec^.WeaponID <> C_DBID_RBU6000 then
    Exit;

  case aRec^.status of
    ST_MISSILE_RUN, ST_MISSILE_DEL:
    begin
      case aRec^.launcherID of
        1: Launcher := Lonch1;
        2: Launcher := Lonch2;
      else
        Exit;
      end;

      if not Assigned(Launcher) then
        Exit;

      if Launcher.OrderFire.Count = 0 then
        Exit;

      isValid := True;

      if Launcher.OrderFire.Count > 1 then
      begin
        for i := 0 to Launcher.OrderFire.Count - 1 do
        begin
          LauncherMissile := TRecMissile(Launcher.OrderFire.Items[i]);

          if i + 1 = aRec^.missileID then
          begin
            LauncherMissile.isLaunch := True;
            Break;
          end;
        end;
      end
      else
      begin
        LauncherMissile := TRecMissile(Launcher.OrderFire.Items[0]);

        if LauncherMissile.Missile = aRec^.missileID then
          LauncherMissile.isLaunch := True;
      end;

      for i := 0 to Launcher.OrderFire.Count - 1 do
      begin
        LauncherMissile := TRecMissile(Launcher.OrderFire.Items[i]);

        if not LauncherMissile.isLaunch then
        begin
          isValid := False;
          Break;
        end;
      end;

      if isValid then
      begin
        if Launcher.isReadyFire then
        begin
          FillChar(lRec, SizeOf(lRec), 0);

          lRec.ShipID         := pShipID;
          lRec.mWeaponID      := C_DBID_RBU6000;
          lRec.mLauncherID    := aRec^.launcherID;
          lRec.mMissileID     := 0;
          lRec.mMissileNumber := 0;
          lRec.mCount         := 0;
          lRec.mMissileType   := 0;
          lRec.mTargetID      := 0;
          lRec.mLncrBearing   := 0;
          lRec.mLncRange      := 0;
          lRec.mTargetDepth   := 0;
          lRec.mCorrBearing   := 0;
          lRec.mCorrElev      := 0;
          lRec.OrderID        := __ORD_RBU_DEASSIGNED;

          if Assigned(Datcom) then
            Datcom.sendDataEx(REC_3D_RBU, @lRec);

          Launcher.isReadyFire := False;
          Launcher.Ready       := False;

          Launcher.IsLoading := True;
          Launcher.OrderFire.Clear;
        end;
      end;
    end;
  end;

//  case windRec.sOrder of
//    ORD_WINDSPEED :
//    begin
//      frmMainDisplay.edtWindSpeedValue.Text := IntToStr(Round(windRec.mValue));
//    end;
//    ORD_WINDDIRECTION :
//    begin
//      frmMainDisplay.edtWindDirectValue.Text := IntToStr(Round(windRec.mValue));
//    end;
//  end;
end;

procedure  TRBUManager.EventOnReceiveDataPosition(apRec: PAnsiChar; aSize: integer);
var
  aRec: ^TRecData3DPosition;
  sc  : TSimulationClass;
  V : uVehicle.TVehicle;
  obj : uLibClientObject.TClientObject;
  vdomain : Integer;
begin
   aRec := @apRec^;
   aRec.X :=  aRec.X + OffX_Map;
   aRec.Y :=  aRec.Y + OffY_Map;

   AddToMemoLog(' : ' + dbID_to_UniqueID(aRec.ShipID) + Format(' %2.6f, %2.6f',[aRec.X, aRec.Y]));

   if aRec.ShipID  = pShipID then begin
    OwnShip.ShipId  := dbID_to_UniqueID(aRec.ShipID);
    OwnShip.heading := aRec.heading;
    OwnShip.speed   := aRec.speed;

    OwnShip.position.X := aRec.X;
    OwnShip.position.Y := aRec.Y;
    OwnShip.position.Z := aRec.Z;

    ShipID := OwnShip.ShipId;
    Position := OwnShip.position;
    Heading := OwnShip.heading;
    Speed := OwnShip.speed;

    V := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));

    if not Assigned(v) then
    begin
      V := VehicleMgr.AddVehicle(Position.X, Position.Y, '');//(FxShip.PositionX, FxShip.PositionY, '');
    //  V.Symbol.SetFontSymbol('Segoe UI Symbol', '▲', clLime, clYellow, 10);
      V.UniqueID := dbID_to_UniqueID(aRec.ShipID);
      v.Domain := DataModule1.GetShipDomain(aRec.ShipID);
      V.SetSpeedKts(Speed);//(FxShip.Speed);
      V.HeadingDeg := Heading;//FxShip.Heading; // NE
    end

    // tambahan rojek biar ownship ngikut tengah terus
    else
    begin
      v.PosX := Position.X;
      v.PosY := Position.Y;
      v.PosZ := Position.Z;
    end;

   end
   else
   begin
     sc := MainObjList.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));
     V := VehicleMgr.FindObjectByUid(dbID_to_UniqueID(aRec.ShipID));

     if sc = nil then begin
     obj := TClientObject.Create;
     obj.UniqueID := dbID_to_UniqueID(aRec.ShipID);
     obj.Enabled := TRUE;

     MainObjList.AddObject(obj);
    end
    else
     obj := sc as TClientObject;

     obj.PositionX := aRec.X;
     obj.PositionY := aRec.Y;
     obj.PositionZ := aRec.Z;
     obj.Speed     := aRec.speed;

     obj.Heading  := ConvCompass_To_Cartesian(aRec.heading);
     if Assigned(V) then
    begin
      v.PosX := aRec.X;
      v.PosY := aRec.Y;
      v.PosZ := aRec.Z;
      v.SetSpeedKts(aRec.speed);

      v.HeadingDeg  := aRec.heading;
    end
    else
    begin
      vdomain := DataModule1.GetShipDomain(aRec.ShipID);

//      if (vdomain = 1) or (vdomain = 2) or (vdomain = 3)then
      if (vdomain = 3)then // rojek ganti hanya spawn domain kapal selam
      begin

        V := VehicleMgr.AddVehicle(aRec.X, aRec.Y, obj.UniqueID);
        V.UniqueID := dbID_to_UniqueID(aRec.ShipID);
        v.Domain := vdomain;
        // pakai bitmap tint: hitam -> kuning
        case v.Domain of
//          1://surface     // dihilangkan karena sonar hanya menangkan kapal selam
//          begin
//            V.Symbol.LoadBitmapFromFile('.\data\Bitmap\SurfaceUnknown.bmp');
//          end;
//          2://air
//          begin
//            V.Symbol.LoadBitmapFromFile('.\data\Bitmap\AirUnknown.bmp');
//          end;
          3://subsurface
          begin
            V.Symbol.LoadBitmapFromFile('.\data\Bitmap\SubsurfaceUnknown.bmp');
          end;
        end;

        V.Symbol.BitmapTintColor := RGB(255,255,0); // kuning
      end;
    end;
   end;

   if IsSonarTracked  and StatusAliranBurja then begin
      if aRec.ShipID = UniqueID_To_dbID (TargetShip.ShipId) then begin
        TargetShip.heading := aRec.heading;
        TargetShip.speed   := aRec.speed;

        TargetShip.position.X := aRec.X;
        TargetShip.position.Y := aRec.Y;
        TargetShip.position.Z := aRec.Z;
      end;

//      with frmTopBurja do begin
//        edt_HaluSasaran.Text  := FloatToStr(TargetShip.heading);
//        edt_haluKapal.Text    := FloatToStr(OwnShip.heading);
//        edt_BarelSas.Text     := FloatToStr(Validate180Degree(
//            CalcBearing(OwnShip.position.X, OwnShip.position.Y, TargetShip.position.X, TargetShip.position.Y) - OwnShip.heading));
//        edtKecSasaran.Text    := FloatToStr(TargetShip.speed);
//        edt_KecKapal.Text     := FloatToStr(OwnShip.speed);
//        edtJarak.Text         := FloatToStr(
//            C_NauticalMile_To_Cable * CalcRange(OwnShip.position.X, OwnShip.position.Y, TargetShip.position.X, TargetShip.position.Y));
//        edt_Kedalaman.Text    := FloatToStr(Abs(TargetShip.position.Z));
//      end;

//     frmPanelFire.edtJarak.Text := FloatToStr(
//            C_NauticalMile_To_Cable * CalcRange(OwnShip.position.X, OwnShip.position.Y, TargetShip.position.X, TargetShip.position.Y));

     TargetID := UniqueID_To_dbID(TargetShip.ShipId);
   end
   else begin
     TargetID := 0;
   end;

end;

procedure TRBUManager.EventOnReceiveEnvironment(apRec: PAnsiChar; aSize: integer);
var
  Rec: ^TRecDataEnvironment;
begin
  ShowMessage('EventOnReceiveEnvironment MASUK. Size = ' + IntToStr(aSize) + ' / Expected = ' + IntToStr(SizeOf(TRecDataEnvironment)));

  if aSize <> SizeOf(TRecDataEnvironment) then
    Exit;

  Rec := @apRec^;

  frmMainDisplay.edtWindSpeedValue.Text  := FloatToStr(Rec^.windVelocity);
  frmMainDisplay.edtWindDirectValue.Text := FloatToStr(Rec^.windHeading);
end;

procedure TRBUManager.EventOnReceiveMissileStatus(apRec: PAnsiChar; aSize: Integer);
var
  aRec: ^TRecMissilePos;
  MissileID: Integer;
begin
  aRec := @apRec^;

  if aRec^.shipID <> pShipID then
    Exit;

  if aRec^.WeaponID <> C_DBID_RBU6000 then
    Exit;

  MissileID := aRec^.missileID;

  if (MissileID < 1) or (MissileID > 12) then
    Exit;

  if aRec^.LauncherID = 1 then
  begin
    case aRec^.Status of

      ST_MISSILE_LOADED:
      begin
        ListMissileR[MissileID].Available := True;
        ListMissileR[MissileID].Condition := True;

        Lonch1.Ready := IsLauncherReady(1);

        if IsLauncherFullyLoaded(1) then
          Lonch1.IsLoading := False
        else
          Lonch1.IsLoading := True;

        UpdateLauncherIndicator(1);
      end;

      ST_MISSILE_RUN, ST_MISSILE_DEL:
      begin
        ListMissileR[MissileID].Available := False;

        Lonch1.Ready := IsLauncherReady(1);
        Lonch1.IsLoading := True;

        UpdateLauncherIndicator(1);
      end;

      _CM_CLIENT_CHECKSCENARIOID :
      begin

      end;

    end;
  end
  else
  if aRec^.LauncherID = 2 then
  begin
    case aRec^.Status of

      ST_MISSILE_LOADED:
      begin
        ListMissileL[MissileID].Available := True;
        ListMissileL[MissileID].Condition := True;

        Lonch2.Ready := IsLauncherReady(2);

        if IsLauncherFullyLoaded(2) then
          Lonch2.IsLoading := False
        else
          Lonch2.IsLoading := True;

        UpdateLauncherIndicator(2);
      end;

      ST_MISSILE_RUN, ST_MISSILE_DEL:
      begin
        ListMissileL[MissileID].Available := False;

        Lonch2.Ready := IsLauncherReady(2);
        Lonch2.IsLoading := True;

        UpdateLauncherIndicator(2);
      end;
    end;
  end;
end;

procedure TRBUManager.EventOnReceiveRBUOrder(apRec: PAnsiChar;  aSize: Integer);
var
  aRec: ^TRec3DSetRBU;
begin
  aRec := @apRec^;

  ShowMessage(Format('RECEIVE RBU: OrderID=%d, Launcher=%d, ShipID=%d',[aRec^.OrderID,aRec^.mLauncherID,aRec^.ShipID]));

  if aRec^.ShipID <> pShipID then
    Exit;

  case aRec^.OrderID of
    __ORD_RBU_LOADING:
    begin
      if aRec^.mLauncherID = 1 then
      begin
        Lonch1.IsLoading := True;
        Lonch1.Ready     := False;
      end
      else
      if aRec^.mLauncherID = 2 then
      begin
        Lonch2.IsLoading := True;
        Lonch2.Ready     := False;
      end;
    end;
  end;
end;

procedure TRBUManager.EventOnReceiveSonarMode(apRec: PAnsiChar; aSize: integer);
var
  aRec: ^TRecRBU_SonarMode;
  lRec : TRec3DSetRBU;
  I: Integer;
  cekKondisilaucher : array [1..2] of Boolean;
begin
  aRec := @apRec^;

  if aRec^.OWN_SHIP_UID <> OwnShip.ShipId then
    Exit;

  TargetShip.ShipId := aRec^.TARGET_SHIP_UID;
  IsSonarTracked    := aRec^.Mode;

  if IsSonarTracked then
  begin
    SendEvenRBU(6);
  end
  else
  begin
    SendEvenRBU(7);
    TargetShip.ShipId := '';
  end;
end;

procedure TRBUManager.Event_RcvRBUSetting(apRec: PAnsiChar; aSize: integer);
var
  aRec: ^TRecStatus_Console;
  Id :Integer;
  MissileID: Integer;
  Picture_Path : string;
begin
  aRec := @apRec^;

  if aRec.OWN_SHIP_UID  = OwnShip.ShipId then begin
   case aRec^.ErrorID of
    __STAT_RBU_BALISTIK12 :
      begin
  //      if aRec^.ParamError = __PARAM_RBU_ON then
  //        frmTopBurja.img_Balistik17.Picture.LoadFromFile(path_image_panelFire + 'Blue_Indikator_on.bmp')
  //      else
  //        frmTopBurja.img_Balistik17.Picture.LoadFromFile(path_image_panelFire + 'Blue_Indikator_off.bmp'); //__PARAM_BALISTIK17_OFF  = 301;
      end;
    __STAT_RBU_PERUBAHAN_HALU :
    begin
  //    if aRec^.ParamError = __PARAM_RBU_ON then
  //      frmTopBurja.img_Perubahan_Halu.Picture.LoadFromFile(path_image_panelFire + 'Red_Indikator_on.bmp')
  //    else
  //      frmTopBurja.img_Perubahan_Halu.Picture.LoadFromFile(path_image_panelFire + 'Red_Indikator_off.bmp'); //__PARAM_PERUBAHAN_HALU_OFF = 302;
    end;
    __STAT_RBU_BAHAYA_TPO :
    begin
  //    if aRec^.ParamError = __PARAM_RBU_ON then
  //      frmTopBurja.img_Bahaya_Tpo.Picture.LoadFromFile(path_image_panelFire + 'Red_Indikator_on.bmp')
  //    else
  //      frmTopBurja.img_Bahaya_Tpo.Picture.LoadFromFile(path_image_panelFire + 'Red_Indikator_off.bmp'); //__PARAM_BAHAYA_TPO_OFF = 303;
    end;
    __STAT_RBU_KONTAK_HILANG :
    begin
  //    if aRec^.ParamError = __PARAM_RBU_ON then begin
  //      frmTopBurja.img_KontakHilang.Picture.LoadFromFile(path_image_panelFire + 'Red_Indikator_on.bmp');
  //      frmPanelFire.img_KontakHilang.Picture.LoadFromFile(path_image_panelFire + 'Red_Indikator_on.bmp');
  //      frmPanelFire.img_AdaKontak.Picture.LoadFromFile(path_image_panelFire + 'Blue_Indikator_off.bmp');
  //    end
  //    else begin
  //      frmTopBurja.img_KontakHilang.Picture.LoadFromFile(path_image_panelFire + 'Red_Indikator_off.bmp'); //__PARAM_KONTAK_HILANG_OFF = 304;
  //      frmPanelFire.img_KontakHilang.Picture.LoadFromFile(path_image_panelFire + 'Red_Indikator_off.bmp');
  //      frmPanelFire.img_AdaKontak.Picture.LoadFromFile(path_image_panelFire + 'Blue_Indikator_on.bmp');
  //    end;
    end;
    __STAT_RBU_ALIRAN_KAPAL :
    begin
  //    if aRec^.ParamError = __PARAM_RBU_ON then begin
  //      frm108Kiri.img_Aliran_Kapal.Picture.LoadFromFile(path_image_108 + 'lampu indikator on.bmp');  //__STAT_ALIRAN_KAPAL = 305;
  //      frm108Kanan.img_Aliran_Kapal.Picture.LoadFromFile(path_image_108 + 'lampu indikator on.bmp');
  //
  //      frm108Kiri.ShipLink_is_On := True;
  //      frm108Kanan.ShipLink_is_On := True;
  //      {LOG}
  //      SendEvenRBU(8);
  //    end
  //    else begin
  //      frm108Kiri.img_Aliran_Kapal.Picture.LoadFromFile(path_image_108  + 'lampu indikator off.bmp');
  //      frm108Kanan.img_Aliran_Kapal.Picture.LoadFromFile(path_image_108 + 'lampu indikator off.bmp');
  //
  //      frm108Kiri.ShipLink_is_On := false;
  //      frm108Kanan.ShipLink_is_On := false;
  //      {LOG}
  //      SendEvenRBU(9);
  //    end;
    end;

    __STAT_RBU_UNFORMER_I_LEFT :
    begin
      stLEFT_UNFORMER1:= ReadValConsoleSetting( aRec^.ParamError);
    end;
    __STAT_RBU_UNFORMER_II_LEFT :
    begin
      stLEFT_UNFORMER2:= ReadValConsoleSetting( aRec^.ParamError);
    end;
    __STAT_RBU_UNFORMER_I_RIGHT :
    begin
      stRIGHT_UNFORMER1:= ReadValConsoleSetting( aRec^.ParamError);
    end;
    __STAT_RBU_UNFORMER_II_RIGHT :
    begin
      stRIGHT_UNFORMER2:= ReadValConsoleSetting( aRec^.ParamError);
    end;

    311..322 :
    begin
      Id :=  aRec^.ErrorID - 310;
      ListMissileR[Id].Available := ReadValConsoleSetting( aRec^.ParamError);
    end;

    331..342 :
    begin
      Id :=  aRec^.ErrorID - 330;
      ListMissileL[Id].Available := ReadValConsoleSetting( aRec^.ParamError);
    end;
   end;
  end;

end;

//function TRBUManager.ReadValConsoleSetting(val: integer): Boolean;
//begin
//  Result := False;
//  if val = 1 then
//    Result := True;
//end;

end.

