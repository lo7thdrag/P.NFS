unit uPtkReceiver;

interface

uses
  Classes,
  math, Vcl.Controls, windows, Sysutils;


type
  TPtkReceiver = class(TObject)
    private
//      Range : Double;
//      Bearing : Double;
//      MissileID: Integer;
//      DelayCount : Byte;
//      LauncherCount, MissileLaunch : Byte;
      FOnRequestData: TNotifyEvent;
      FOnRequestDataObj: TNotifyEvent;
    FOnLaunchWeapon: TNotifyEvent;
    FOnPtkCommand: TGetStrProc;
    public
      constructor Create;
      destructor Destroy;override;
      procedure NetPdkReceive(word :string);
      procedure DelayMisille(sender : Tobject);


      procedure UpdateHandler;
      procedure FireExocet;
      procedure Fire76(aBallisTicID, aOrdID : Integer; aModeId : Integer; aElev, aBearing : Double);

      property OnRequestData : TNotifyEvent read FOnRequestData write FOnRequestData;
      property OnRequestDataObj : TNotifyEvent read FOnRequestDataObj write FOnRequestDataObj;

      property OnLaunchWeapon : TNotifyEvent read FOnLaunchWeapon write FOnLaunchWeapon;
      property OnPtkCommand : TGetStrProc read FOnPtkCommand write FOnPtkCommand;
  end;

implementation
uses
  uFccManager;

function CleanIncoming(const S: string): string;
begin
  Result := S.Replace(#13, '').Replace(#10, '');
end;

{ TPdkHandler }


constructor TPtkReceiver.Create;
begin
  inherited;
//  MissileID := 4000;
//  LauncherCount := 0;
//  MissileLaunch := 0;
//  DelayCount := 0;
  {Throw Off}
//  frmThrowOffCtrl := TfrmThrowOffCtrl.Create(nil);

  //  i := 0;
end;

(*
  prosedur untuk melakukan penembakan exocet menggunakan delay dari timer.
  missile exocet akan ditembakkan setelah 5 detik, ini untuk memberikan delaya ketika
  disambungkan dengan 3d.
  *)
procedure TPtkReceiver.DelayMisille(sender : Tobject);

begin
//  inherited;
//  DelayCount := DelayCount + 1;
//
//  if not SimManager.IsConnected then
//  begin
//     (*
//        jika tidak terhubung dengan nfs, maka prosedur ini yang dijalankan oleh tcms
//      *)
//    if DelayCount = 5 then
//    begin
////          LaunchMissileExocet(SimManager.Sigma, simManager.HookedPlat);
//      for I := 0 to SimManager.Sigma.MM40.ListLauncher.Count - 1 do
//      begin
//        MM40Launcher := SimManager.Sigma.MM40.ListLauncher.Items[i];
//
//        {*
//          disini sebelum melakukan peluncuran exocet, dilakukan pengecekan terlebih
//          dahulu launcher mana yang sedang digunakan dan status dari trajectory nya
//          dtampilkan.
//        *}
////        if MM40Launcher.UsedLauncher and
////                MM40Launcher.Visible then
////        begin
////          rec.OBjectID := SimManager.Sigma.ObjectID;
////          rec.TargetID := MM40Launcher.TargetObject.ObjectID;
////
////          MessageHandle.Send_Fire_Exocet(rec);
////           (*
////             untuk melakukan counter sebanyak launcher yang sedang digunakan.
////             misal: launcher yang sedang digunakan ada 3, maka akan dilakukan counter sampai 3
////             baru kemudian penembakan dihentikan.
////            *)
////          MissileLaunch := MissileLaunch + 1;
////          Break;
////        end;
//      end;
//
//      if MissileLaunch = LauncherCount then
//      begin
//        MissileLaunch := 0;
//        LauncherCount := 0;
//        DelayMis.Enabled := False;
//      end;
//
//      DelayCount := 0;
//    end
//  end
//  else
//  begin
//    (*
//      jika terhubung dengan nfs, maka prosedur ini yang dijalankan.
//    *)
//    if DelayCount = 5 then
//    begin
//      with TSigma(TSimObject(SimManager.Sigma)) do
//      begin
//        for I := 0 to MM40.ListLauncher.Count - 1 do
//        begin
//          MM40Launcher := MM40.ListLauncher.Items[i];
//
////          if TExocet_MM40Launcher(MM40Launcher).UsedLauncher and TExocet_MM40Launcher(MM40Launcher).Visible then
////          begin
////            with SimManager.Sigma do
////            begin
////              Range := CalcRangeDM(PosX, PosY,
////                                TBaseTrack(TExocet_MM40Launcher(MM40Launcher).TargetObject).PosX,
////                                TBaseTrack(TExocet_MM40Launcher(MM40Launcher).TargetObject).PosY);
////
////              Bearing := CalcBearing(PosX, PosY,
////                                TBaseTrack(TExocet_MM40Launcher(MM40Launcher).TargetObject).PosX,
////                                TBaseTrack(TExocet_MM40Launcher(MM40Launcher).TargetObject).PosY);
////            end;
////
////            {*
////              untuk pengisian record yang akan dikirimkan ke 3d nfs
////            *}
////            apRec.shipID := SimManager.Sigma.ObjectIndex;
////            apRec.mWeaponID := TExocet_MM40Launcher(MM40Launcher).ObjectIndex;
////            apRec.mLauncherID := TExocet_MM40Launcher(MM40Launcher).LauncherID;
////            apRec.mMissileID := TExocet_MM40Launcher(MM40Launcher).MissileID;
////            apRec.mMissileNumber := 1;
////            apRec.sOrder := 1;
////            apRec.mTRange :=  Range * C_DataMile_To_Metre;
////            apRec.mTBearing := Bearing;
////            apRec.mAngular_Mode := TExocet_MM40Launcher(MM40Launcher).MissileAngularapproach;
////            apRec.mAgility_Mode := 0;
////            apRec.mInitialStep_Mode := TExocet_MM40Launcher(MM40Launcher).MissileInitialstepMode;
////            apRec.mObstacle_Alt := TExocet_MM40Launcher(MM40Launcher).MissileInitialstepaltitude;         // max 300 m
////            apRec.mObstacle_Range := TExocet_MM40Launcher(MM40Launcher).MissileObstaclelength * C_DataMile_To_Metre  ; // <38 km
////            apRec.mApproach_Range := ((2 * C_DataMile_To_NauticalMile) * C_NauticalMile_To_Metre);
////            apRec.mTerminal_Range := 2000;
////
////            SimManager.netSendLaunchExocet(apRec);
////            MissileLaunch := MissileLaunch + 1;
////            Break;
////          end;
//        end;
//      end;
//
//      if MissileLaunch = LauncherCount then
//      begin
//        DelayMis.Enabled := False;
//        MissileLaunch := 0;
//        LauncherCount := 0;
//      end;
//
//      DelayCount := 0;
//    end;
//  end;
end;

destructor TPtkReceiver.Destroy;
begin
  inherited;
end;

procedure TPtkReceiver.Fire76(aBallisTicID, aOrdID : Integer; aModeId : Integer; aElev, aBearing : Double);

begin

end;

(*
  prosedur untuk mengaktifkan timer yang berfungsi untuk melakukan delay penembakan exocet
  *)
procedure TPtkReceiver.FireExocet;
begin

end;


{$REGION 'Old NetPdkReceiver'}

//procedure TPdkReceiver.NetPdkReceive(word: string);
//var
////  auxPnt : TAuxPoint;
//
//  aTN: string;
//
//  aObj, tempObj : TsimulationUnit;
//  PosX, PosY : Double;
//  rec : TRecSetTetral;
//  i,j : Integer;
//  ramRng, ramBrn, ramSpd, ramCrs : double;
//  track, parentTrack, joinedTrack : TSimObject;
//  assocParent, assocChild : TSimObject;
//  bObj: TBaseSimObject;
//  indexParent, indexDaughter : Integer;
//  disMin : Double;
//  IdxRolRcv, IdxRoleSend: Integer;
//  svc: TTCMS_Service;
//  cpaData : TCPAData;
//  recHF : TRec_Change_Identity_HF;
//  rec76 : TRec_Gun76;
//  recTetral : TRec_Data_Tetral;
//  recFireTetral : TRec_Data_Fire_Tetral;
//  recDataA244 : TRec_Data_A244;
//  recECMEngagement : TRec_ECMEngagement;
//  recTrack : TRec_Track_Movement;
//  actRam : Integer;
//  isFind : Boolean;
//  assocMaxRng, assocMaxAzimuth : Double;
//  assocPointTrkBrg, assocDeltaHeading : Double;
//  recTrackPosition : TRec_Track_Position;
//  aExocetMM40_OnVehicle : TExocet_MM40_OnVehicle;
//  aDesigData: TRec_Decoy_Desig_Ops;
//  range, bearing : Double;
//  recTrackMonit : TRec_Track_Monitor;
//  recIFFMonitor : TRec_Data_IFF_Monit;
//  dataMonit : TTrackMonitData;
////  aGunBarrelData : TGunBarrelData;
//  coll : TCollisionAvoidance;
//  aTargetFullName : string;
//  aDetectName : string;
//  aTemptName : string;
//
//  recLIROD : TRec_LIROD_MK2;
//  iTetralID : Integer;
//
//  recEvalTracklist: TRec_Eval_Tracklist;
//  FMocName  : string;
//  rng, brn: DOuble;
//  datum : TDatum;
//begin
//
////  coll := SimManager.Sigma.CollisionAvoidance.Create; //icha
//  // Throw Off Control
//  // ADDED BY NAOKI 20-06-2013
//  isFind := False;
//
//  if word= '1_27' then begin
//    frmThrowOffCtrl.Show;
//  end
//
//  // Advice Surface
//  else if word = '1_14' then begin
//    if SimManager.HookedPlat <> nil then
//      SimManager.Sigma.Pdk_Advice_Surf(SimManager.HookedPlat.ObjectID, SimManager.SimDetectTrack);
//  end
//
//  // Advice Air
//  else if word = '1_15' then begin
//    if SimManager.HookedPlat <> nil then
//      SimManager.Sigma.Pdk_Advice_Air(SimManager.HookedPlat.ObjectID, SimManager.SimDetectTrack);
//  end
//
//  // Air Track Selection //
//  // Include AAW
//  else if word = '1_20' then begin
//
//    if Assigned(SimManager.HookedPlat) then begin
//
//      aTN := (SimManager.HookedPlat as TBaseTrack).DetectedName;
//
//      recEvalTracklist := InitializeTRec_EvalTracklist;
//      recEvalTracklist.TrkObjID := SimManager.HookedPlat.ObjectID;
//      recEvalTracklist.TrkTN := aTN;
//      recEvalTracklist.TracklistOps := Byte(etoInclude);
//
//      MessageHandle.Send_Data_Eval_Tracklist(recEvalTracklist);
//
//      {
//      aTN := (SimManager.HookedPlat as TBaseTrack).DetectedName;
////      aTN := TBaseTrack(SimManager.HookedPlat).TrackSource + ' ' +
////             FormatFloat('000', TBaseTrack(SimManager.HookedPlat).TrackNumber);
//
//      if TBaseTrack(SimManager.HookedPlat).Domain <> tdAir then begin
//        EventManager.OnMsg('Environment of track must be',
//                                  '- air-point or',
//                                  '- kill indication has to be set.');
//      end
//      else begin
//        // Do nothing if already in the list
//        if not SimManager.Sigma.IsTrackInIncludedThreatList(aTN)
//        then begin
//
//          // Delete reference to this object if avail on the other list
////          SimManager.Sigma.DelThreatEvalExcludedTrack(TBaseTrack(SimManager.HookedPlat).DetectedName);
//          SimManager.Sigma.DelThreatEvalExcludedTrack(aTN);
//
//          SetLength(SimManager.Sigma.ThreatEvalIncludedTracks,
//                    Length(SimManager.Sigma.ThreatEvalIncludedTracks) +1);
//          SimManager.Sigma.ThreatEvalIncludedTracks[High(SimManager.Sigma.ThreatEvalIncludedTracks)]:=
//            aTN;
//
//          if Assigned(SimManager.Sigma.OnUpdateInclTrackList) then
//            SimManager.Sigma.OnUpdateInclTrackList;
//
//        end;
//      end;
//      }
//
//    end
//    else begin
//      EventManager.OnMsg(0,'Environment of track must be',
//                                  '- air-point or',
//                                  '- kill indication has to be set.');
//    end;
//
//  end
//  // Exclude AAW
//  else if word = '1_25' then begin
//
//    if Assigned(SimManager.HookedPlat) then begin
//
//      aTN := (SimManager.HookedPlat as TBaseTrack).DetectedName;
//
//      recEvalTracklist := InitializeTRec_EvalTracklist;
//      recEvalTracklist.TrkObjID := SimManager.HookedPlat.ObjectID;
//      recEvalTracklist.TrkTN := aTN;
//      recEvalTracklist.TracklistOps := Byte(etoExclude);
//
//      MessageHandle.Send_Data_Eval_Tracklist(recEvalTracklist);
//
//
//      {
//      aTN := (SimManager.HookedPlat as TBaseTrack).DetectedName;
////      aTN := TBaseTrack(SimManager.HookedPlat).TrackSource + ' ' +
////             FormatFloat('000', TBaseTrack(SimManager.HookedPlat).TrackNumber);
//
//      if TBaseTrack(SimManager.HookedPlat).Domain <> tdAir then begin
//        EventManager.OnMsg('Environment of track must be',
//                                  '- air-point or',
//                                  '- kill indication has to be set.');
//      end
//      else begin
//        // Do nothing if already in the list
//        if not SimManager.Sigma.IsTrackInExcludedThreatList(aTN)
//        then begin
//
//          // Delete reference to this object if avail on the other list
//          SimManager.Sigma.DelThreatEvalIncludedTrack(aTN);
//
//          SetLength(SimManager.Sigma.ThreatEvalExcludedTracks,
//                    Length(SimManager.Sigma.ThreatEvalExcludedTracks) +1);
//          SimManager.Sigma.ThreatEvalExcludedTracks[High(SimManager.Sigma.ThreatEvalExcludedTracks)]:=
//            aTN;
//
//          if Assigned(SimManager.Sigma.OnUpdateExclTrackList) then
//            SimManager.Sigma.OnUpdateExclTrackList;
//
//        end;
//      end;
//      }
//
//    end
//    else begin
//      EventManager.OnMsg(0,'Environment of track must be',
//                                'air-point or',
//                                'kill indication has to be set.');
//    end;
//
//  end
//  //IFF Plot Visual
//  else if word = '2_15' then begin
//    recIFFMonitor := SimManager.Sigma.IFF.GetDataIFFPlotMonit;
//    recIFFMonitor.Visible := True;
//    MessageHandle.Send_IFF_Plot_Monit(recIFFMonitor);
//
//  end
//  // DESIG DECOY
//  else if word = '9_11' then begin
//
//    if SimManager.HookedPlat = nil then begin // if no track selected
//      EventManager.OnMsg(0,'', 'No track selected!', '');
//      Exit;
//    end
//    else begin
//
//      if TBaseTrack(SimManager.HookedPlat).Domain <> tdAir then begin // if sel track is not air track
//        EventManager.OnMsg(0,'', 'No air point or own air/unknown bearing track under RBM!', '');
//        Exit;
//      end;
//
//    end;
//
//    aDesigData := InitializeTRec_DecoyDesigOps;
//    aDesigData.OrderID := 0; // add to desig list
//
//    if SimManager.HookedPlat is TBaseTrack then
//      aDesigData.TgtTN := (SimManager.HookedPlat as TBaseTrack).TrackSource + ' ' +
//                          FormatFloat('000', (SimManager.HookedPlat as TBaseTrack).TrackNumber)
//    else
//      aDesigData.TgtTN := '';
//
//    aDesigData.DecoyType := Byte(mtSED); // determine SED or DIS later
//    aDesigData.Brg := CalcBearing(SimManager.Sigma.PosX, SimManager.Sigma.PosY,
//                                  SimManager.HookedPlat.PosX, SimManager.HookedPlat.PosY);
//    aDesigData.ETR := CalcRange  (SimManager.Sigma.PosX, SimManager.Sigma.PosY,
//                                  SimManager.HookedPlat.PosX, SimManager.HookedPlat.PosY);
//
//    MessageHandle.Send_DecoyDesigOps(aDesigData);
//
//  end
//
//  // BREAK DECOY
//  else if word = '9_16' then begin
//
//    if SimManager.HookedPlat = nil then begin // if no track selected
//      EventManager.OnMsg(0,'', 'No track selected!', '');
//      Exit;
//    end
//    else begin
//
//      if TBaseTrack(SimManager.HookedPlat).Domain <> tdAir then begin // if sel track is not air track
//        EventManager.OnMsg(0,'', 'No air point or own air/unknown bearing track under RBM!', '');
//        Exit;
//      end
//      else begin // if sel air track is not previously engaged
//        if not SimManager.Sigma.DecoyConfig.IsTrackEngagedBySKWS(TBaseTrack(SimManager.HookedPlat).DetectedName) then begin
//          EventManager.OnMsg(0,'', 'Target not engaged by SKWS Decoy subsystem!', '');
//          Exit;
//        end;
//      end;
//
//    end;
//
//    aDesigData := InitializeTRec_DecoyDesigOps;
//    aDesigData.OrderID := 1;
//
//    if (SimManager.HookedPlat is TBaseTrack) then
//    begin
//      aDesigData.TgtTN := (SimManager.HookedPlat as TBaseTrack).DetectedName;
//    end
//    else
//    begin
//      aDesigData.TgtTN := '';
//    end;
//
//    MessageHandle.Send_DecoyDesigOps(aDesigData);
//
//  end
//
//  // Desig 76mm
//  else if word = '9_14' then begin
//    if Assigned(SimManager.HookedPlat) then begin
//      if SimManager.HookedPlat is TBaseTrack then begin
//
//        if Assigned(SimManager.Sigma.Gun76mm.OnDesig) then
//          SimManager.Sigma.Gun76mm.OnDesig(SimManager.HookedPlat);
//      end;
//    end;
//  end
//
//  // Break 76mm
//  else if word = '9_19' then begin
//    if Assigned(SimManager.Sigma.Gun76mm.OnBreak) then
//        SimManager.Sigma.Gun76mm.OnBreak(nil);
////    if Assigned(SimManager.HookedPlat) then begin
////      if Assigned(SimManager.Sigma.Gun76mm.OnBreak) then
////        SimManager.Sigma.Gun76mm.OnBreak(nil);
////    end;
//  end
//
//  { Desig Exocet }
//  else if word = '9_21' then
//  begin
//    aExocetMM40_OnVehicle := SimManager.Sigma.MM40;
//
//    if Assigned(SimManager.HookedPlat) then
//    begin
//      if SimManager.HookedPlat is TBaseTrack then
//      begin
//        if (SimManager.HookedPlat as TBaseTrack).Domain = tdSurface then
//        begin
//          case aExocetMM40_OnVehicle.OperationalStatus of
//            sopOn :
//            begin
//              case aExocetMM40_OnVehicle.SimExocetMM40Online of
//                simexonOnline :
//                begin
//                  case aExocetMM40_OnVehicle.SimExocetMM40Availability of
//                    simexaAvailable :
//                    begin
//                      case aExocetMM40_OnVehicle.SimExocetMM40Engagement of
//                        simexesAvailable, simexesDegraded :
//                        begin
//                          case aExocetMM40_OnVehicle.SimExocetMM40EngSuport of
//                            simexesAvailable, simexesDegraded  :
//                            begin
//                              case aExocetMM40_OnVehicle.SimExocetMM40EngMonitor of
//                                simexesAvailable, simexesDegraded :
//                                begin
//                                  case aExocetMM40_OnVehicle.SimExocetMM40Failure of
//                                    simexfNormal :
//                                    begin
//                                      case aExocetMM40_OnVehicle.ExocetMM40Activity of
//                                        exacFiring, exacTraining :
//                                        begin
//                                          if not aExocetMM40_OnVehicle.ExocetMM40Validated then
//                                          begin
//                                            if aExocetMM40_OnVehicle.ListTargetData.Count < 4 then
//                                            begin
//                                              if (SimManager.HookedPlat is TBearingTrack) then
//                                              begin
//                                                MessageHandle.Send_Desigt_Exocet(StrToInt(SimManager.Sigma.ObjectID),
//                                                                                     StrToInt(SimManager.HookedPlat.ObjectID));
//                                              end
//                                              else
//                                              begin
//                                                if aExocetMM40_OnVehicle.IsInsideHighRange((SimManager.HookedPlat as TBaseTrack).PosX,
//                                                                                           (SimManager.HookedPlat as TBaseTrack).PosY) then
//                                                begin
//                                                  if not aExocetMM40_OnVehicle.IsTargetDesig((SimManager.HookedPlat as TBaseTrack).ObjectID) then
//                                                  begin
//                                                    MessageHandle.Send_Desigt_Exocet(StrToInt(SimManager.Sigma.ObjectID),
//                                                                                     StrToInt(SimManager.HookedPlat.ObjectID));
//                                                  end
//                                                  else
//                                                  begin
//                                                    if Assigned(EventManager.OnMsg) then
//                                                      EventManager.OnMsg(0,'','Target already engaged by EXOCET','');
//                                                  end;
//                                                end
//                                                else
//                                                begin
//                                                  if Assigned(EventManager.OnMsg) then
//                                                    EventManager.OnMsg(0,'Surface track','outside maximum engagement envelop', '');
//                                                end;
//                                              end;
//                                            end
//                                            else
//                                            begin
//                                              if Assigned(EventManager.OnMsg) then
//                                                EventManager.OnMsg(0,'','MAX number of Target in EP Reached', '');
//                                            end;
//                                          end
//                                          else
//                                          begin
//                                            if Assigned(EventManager.OnMsg) then
//                                              EventManager.OnMsg(0,'Cannot designate target while the EXOCET',
//                                                    'engagement Plan is validated', '');
//                                          end;
//                                        end
//                                      else
//                                        begin
//                                           if Assigned(EventManager.OnMsg) then
//                                              EventManager.OnMsg(0,'','EXOCET activity must be FIRING or TRAINING', '');
//                                        end;
//                                      end;
//                                    end;
//
//                                    simexfFailure :
//                                    begin
//                                      if Assigned(EventManager.OnMsg) then
//                                        EventManager.OnMsg(0,'Target engagement track','is not available for', 'EXOCET');
//                                    end;
//                                  end;
//                                end;
//
//                                simexesNotAvailable :
//                                begin
//                                  if Assigned(EventManager.OnMsg) then
//                                    EventManager.OnMsg(0,'', 'No missile available', '');
//                                end;
//                              end;
//                            end;
//
//                            simexesNotAvailable :
//                            begin
//                              if Assigned(EventManager.OnMsg) then
//                                EventManager.OnMsg(0,'Target engagement track','is not available for', 'EXOCET');
//                            end;
//                          end;
//                        end;
//
//                        simexesNotAvailable :
//                        begin
//                          if Assigned(EventManager.OnMsg) then
//                            EventManager.OnMsg(0,'Target engagement track','is not available for', 'EXOCET');
//                        end;
//                      end;
//                    end;
//
//                    simexaNotAvailable :
//                    begin
//                      if Assigned(EventManager.OnMsg) then
//                        EventManager.OnMsg(0,'Target engagement track','is not available for', 'EXOCET');
//                    end;
//                  end;
//                end;
//
//                simexonOffline, simexonReadyToOnline :
//                begin
//                  if Assigned(EventManager.OnMsg) then
//                    EventManager.OnMsg(0,'','PDK not selectable', '');
//                end;
//              end;
//            end;
//
//            sopOff :
//            begin
//              if Assigned(EventManager.OnMsg) then
//                EventManager.OnMsg(0,'','PDK not selectable', '');
//
//            end;
//          end;
//        end
//        else
//        begin
//          if Assigned(EventManager.OnMsg) then
//            EventManager.OnMsg(0,'','No surface track selected or under RBM', '');
//        end;
//      end
//      else
//      begin
//        if Assigned(EventManager.OnMsg) then
//          EventManager.OnMsg(0,'','No surface track selected or under RBM', '');
//      end;
//    end
//    else
//    begin
//      if Assigned(EventManager.OnMsg) then
//        EventManager.OnMsg(0,'','No surface track selected or under RBM', '');
//    end;
//  end
//  { Break Exocet }
//  else if word = '9_26' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//      MessageHandle.Send_Break_Exocet(StrToInt(SimManager.Sigma.ObjectID),
//        StrToInt(SimManager.HookedPlat.ObjectID));
//    end
//    else
//    begin
//      if Assigned(EventManager.OnMsg) then
//          EventManager.OnMsg(0,'','No surface track selected or under RBM', '');
//    end;
//  end
//
//  // Mark Splash
//  else if word = '9_28' then begin
//    if SimManager.Sigma.Gun76mm.TargetObject <> Nil then
//    begin
//      aObj := TSplashMarker.Create;
//      (aObj as TSplashMarker).OffsetObject := SimManager.Sigma.Gun76mm.TargetObject;
//
//      aObj.PosX := SimManager.CrossVisual.MidX;
//      aObj.PosY := SimManager.CrossVisual.MidY;
//      rng := CalcRange(
//        TSplashMarker(aObj).OffsetObject.PosX,
//        TSplashMarker(aObj).OffsetObject.PosY,
//        aObj.PosX, aObj.PosY
//        );
//
//      brn := CalcBearing(
//        TSplashMarker(aObj).OffsetObject.PosX,
//        TSplashMarker(aObj).OffsetObject.PosY,
//        aObj.PosX, aObj.PosY
//        );
//      (aObj as TSplashMarker).Parent := SimManager.Sigma;
//      (aObj as TSplashMarker).Range := rng;
//      (aObj as TSplashMarker).Bearing := brn;
//
//      brn := CalcBearing(
//        SimManager.Sigma.PosX,
//        SimManager.Sigma.PosY,
//        aObj.PosX, aObj.PosY
//        );
//      (aObj as TSplashMarker).BearingToMarker := brn;
//
//      brn := CalcBearing(
//        SimManager.Sigma.PosX,
//        SimManager.Sigma.PosY,
//        SimManager.Sigma.Gun76mm.TargetObject.PosX,
//        SimManager.Sigma.Gun76mm.TargetObject.PosY
//        );
//      (aObj as TSplashMarker).BearingToTarget := brn;
//
//      rng := CalcRange(
//        SimManager.Sigma.PosX,
//        SimManager.Sigma.PosY,
//        aObj.PosX, aObj.PosY
//        );
//      (aObj as TSplashMarker).RangeToMarker := rng;
//
//      rng := CalcRange(
//        SimManager.Sigma.PosX,
//        SimManager.Sigma.PosY,
//        SimManager.Sigma.Gun76mm.TargetObject.PosX,
//        SimManager.Sigma.Gun76mm.TargetObject.PosY
//        );
//      (aObj as TSplashMarker).RangeToTarget := rng;
//
//      (aObj as TSplashMarker).Visible := True;
//      SimManager.SplashMarkers.AddObject(aObj);
//    end;
//  end
//
//  // Delete Splash
//  else if word = '9_29' then begin
//    for I := 0 to SimManager.SplashMarkers.ItemCount - 1 do begin
//      aObj := SimManager.SplashMarkers.getObject(i) as TsimulationUnit;
//      if aObj <> nil then begin
//        if (aObj as TSplashMarker).Controlled then begin
//          aObj.FreeMe := True;
//        end;
//      end;
//    end;
//  end
//
//  // DISJOIN
//  else if word = '1_13' then begin
////    for I := 0 to SimManager.SimDetectTrack.ItemCount - 1 do
////    begin
////      aObj := SimManager.SimDetectTrack.getObject(i) as TsimulationUnit;
////      if (aObj <> nil) and (aObj.ObjectID <> SimManager.HookedPlat.ObjectID) and
////      (aObj is TRAMTrack) and (TRAMTrack(aObj).JoinParentID =
////      TBaseTrack(SimManager.HookedPlat).ObjectID) then
////      begin
////        indexDaughter := i;
////        joinedTrack := aObj;
////      end;
////    end;
//
//    if Assigned(SimManager.HookedPlat) and (SimManager.HookedPlat is TBaseTrack)then
//    begin
//
//      recTrackPosition.TrackID := StrToInt(SimManager.HookedPlat.ObjectID);
//      recTrackPosition.OrderID := CORD_DISJOIN;
//      recTrackPosition.ReposX := 0.0;
//      recTrackPosition.ReposY := 0.0;
//      recTrackPosition.Speed := 0.0;
//      recTrackPosition.Heading := 0.0;
//
//      MessageHandle.Send_Track_Positioning(recTrackPosition);
////      indexParent := SimManager.SimDetectTrack.getIndexOf(SimManager.HookedPlat);
////      if Assigned(joinedTrack) then
////      begin
////        //disjoin procces
////        if (indexParent < indexDaughter) and
////           (TBaseTrack(SimManager.HookedPlat).Identity <> tiHostile) then
////        begin
////          tempObj := SimManager.SimDetectTrack.getObject(indexParent) as TsimulationUnit;
////
////          SimManager.SimDetectTrack.setObject(indexParent, joinedTrack);
////          SimManager.SimDetectTrack.setObject(indexDaughter, tempObj);
////        end;
////
////        TRAMTrack(joinedTrack).Identity := tiPending;
////        TRAMTrack(joinedTrack).Domain := tdSurface;
////        //TBasePlatform(joinedTrack).DomainObject := 1;
////
////        TRAMTrack(joinedTrack).JoinParentID := '';
////        TBaseTrack(SimManager.HookedPlat).IsJoining := False;
////
////      end;
//    end
//    else
//      EventManager.OnMsg(      0,
//        '',
//        'No Track Selected',
//        ''
//      );
//  end
//
//  // START CPA
//  else if word = '1_17' then begin
//
//    for I := 0 to 2 do begin // Find an empty CPA calc slot
//      if not SimManager.Sigma.FCPA[I].Active then begin // if found..
//
//        // Calc CPA Start event. Will also check action validity
//        SimManager.Sigma.FCPA[I].OnCPAStart(Self);
//
//        case I of  // check CPA object
//
//          // if action is valid..
//          0: if SimManager.Sigma.FCPA[0].RefMode <> crInvalid then
//
//            begin
//              svc := VServiceMgr.RunService(C_SVC_CPA_Prediction_1) as TTCMS_Service;
//              with cpaData do begin // init CPA data
//                ref := SimManager.Sigma.FCPA[0].Obj1.DetectedName;
//                if ref = '' then ref := 'Ownship';
//                subj := SimManager.Sigma.FCPA[0].Obj2.DetectedName;
//                duration := '0:0:0';
//                status := 'No CPA';
//                Brn := 0.0;
//                Rng := 0.0;
//              end;
//              // copy data above to the CPA object
//              (svc as TSvc_CPA_Prediction).SetDataCPA(cpaData);
//              // Show the form
//              (svc as TSvc_CPA_Prediction).Show;
//            end;
//
//          1:  if SimManager.Sigma.FCPA[1].RefMode <> crInvalid then
//
//            begin
//              svc := VServiceMgr.RunService(C_SVC_CPA_Prediction_2) as TTCMS_Service;
//              with cpaData do begin
//                ref := SimManager.Sigma.FCPA[1].Obj1.DetectedName;
//                if ref = '' then ref := 'Ownship';
//                subj := SimManager.Sigma.FCPA[1].Obj2.DetectedName;
//                duration := '0:0:0';
//                status := 'No CPA';
//                Brn := 0.0;
//                Rng := 0.0;
//              end;
//              (svc as TSvc_CPA_Prediction_2).SetDataCPA(cpaData);
//              (svc as TSvc_CPA_Prediction_2).Show;
//            end;
//
//          2:  if SimManager.Sigma.FCPA[2].RefMode <> crInvalid then
//
//            begin
//              svc := VServiceMgr.RunService(C_SVC_CPA_Prediction_3) as TTCMS_Service;
//              with cpaData do begin
//                ref := SimManager.Sigma.FCPA[2].Obj1.DetectedName;
//                if ref = '' then ref := 'Ownship';
//                subj := SimManager.Sigma.FCPA[2].Obj2.DetectedName;
//                duration := '0:0:0';
//                status := 'No CPA';
//                Brn := 0.0;
//                Rng := 0.0;
//              end;
//              (svc as TSvc_CPA_Prediction_3).SetDataCPA(cpaData);
//              (svc as TSvc_CPA_Prediction_3).Show;
//            end;
//
//        end;
//
//        Break; // no need to find another one, quit the loop now
//
//      end;
//    end;
//
//  end
//
//  // JOIN
//  else if word = '1_18' then begin
//    for I := 0 to SimManager.SimDetectTrack.ItemCount - 1 do
//    begin
//      aObj := SimManager.SimDetectTrack.getObject(i) as TsimulationUnit;
//      if (aObj <> nil) and (aObj.CloseCtrl = True) then
//      begin
//          parentTrack := aObj;
//      end;
//    end;
//
//    if (Assigned(parentTrack)) and (Assigned(SimManager.HookedPlat)) then begin
//      indexParent := SimManager.SimDetectTrack.getIndexOf(parentTrack);
//      indexDaughter := SimManager.SimDetectTrack.getIndexOf(SimManager.HookedPlat);
//
//      if (parentTrack.ClassType = SimManager.HookedPlat.ClassType) and
//         (parentTrack.ObjectID <> SimManager.HookedPlat.ObjectID) then
//      begin
//        if TBaseTrack(parentTrack).Domain = TBaseTrack(SimManager.HookedPlat).Domain then
//        begin
//          //join procces
//          if (parentTrack is TBaseTrack) and (SimManager.HookedPlat is TBaseTrack) then
//            TBaseTrack(SimManager.HookedPlat).Identity := TBaseTrack(parentTrack).Identity
//          else if (parentTrack is TRAMTrack) and (SimManager.HookedPlat is TRAMTrack) then
//            TRAMTrack(SimManager.HookedPlat).Identity := TRAMTrack(parentTrack).Identity;
//        end
//        else
//          EventManager.OnMsg( 0,
//            '',
//            'Track Environment Is Not Same',
//            ''
//          )
//      end
//
//      else if (parentTrack.ClassType <> SimManager.HookedPlat.ClassType) and
//           (SimManager.HookedPlat is TRAMTrack) and (parentTrack is TBaseTrack) and
//           (parentTrack.ObjectID <> SimManager.HookedPlat.ObjectID) then
//      begin
//        if (TBaseTrack(parentTrack).Domain = TRAMTrack(SimManager.HookedPlat).Domain) and
//           (isConflicting(parentTrack, SimManager.HookedPlat) = False) and
//           (CalcRangeDM(parentTrack.PosX, parentTrack.PosY, SimManager.HookedPlat.PosX, SimManager.HookedPlat.PosY) <= 1) then
//        begin
//          if indexParent > indexDaughter then
//          begin
//            tempObj := SimManager.SimDetectTrack.getObject(indexParent) as TsimulationUnit;
//
//            SimManager.SimDetectTrack.setObject(indexParent, SimManager.HookedPlat);
//            SimManager.SimDetectTrack.setObject(indexDaughter, tempObj);
//
//            parentTrack := tempObj;
//          end;
//
//          //join procces
//          TRAMTrack(SimManager.HookedPlat).Identity := TBaseTrack(parentTrack).Identity;
//          TRAMTrack(SimManager.HookedPlat).Range := TBaseTrack(parentTrack).Range;
//          TRAMTrack(SimManager.HookedPlat).Bearing := TBaseTrack(parentTrack).Bearing;
////          TRAMTrack(SimManager.HookedPlat).Speed := TBaseTrack(parentTrack).Speed;
////          TRAMTrack(SimManager.HookedPlat).Course := TBaseTrack(parentTrack).Course;
//          TRAMTrack(SimManager.HookedPlat).Speed := TBaseTrack (parentTrack).Speed;
//          TRAMTrack(SimManager.HookedPlat).Heading := TBaseTrack(parentTrack).Heading;
//          TRAMTrack(SimManager.HookedPlat).PosX := TBaseTrack(parentTrack).PosX;
//          TRAMTrack(SimManager.HookedPlat).PosY := TBaseTrack(parentTrack).PosY;
//
//          {tempID := TBaseTrack(parentTrack).ObjectID;
//          TBaseTrack(parentTrack).ObjectID := TRAMTrack(SimManager.HookedPlat).ObjectID;
//          TRAMTrack(SimManager.HookedPlat).ObjectID := tempID;}
//          TRAMTrack(SimManager.HookedPlat).JoinParentID := TBaseTrack(parentTrack).ObjectID;
//
////          if TBaseTrack(parentTrack).IsJoining = False then
////          begin
////            TBaseTrack(parentTrack).IsJoining := True;
////          end
////          else
//          begin
//            SimManager.SimDetectTrack.DeleteObject(SimManager.HookedPlat);
//          end;
//
//          TBaseTrack(parentTrack).CloseCtrl := False;
//
//        end
//
//        else if TBaseTrack(parentTrack).Domain <> TRAMTrack(SimManager.HookedPlat).Domain then
//          EventManager.OnMsg(   0,
//            '',
//            'Track Environment Is Not Same',
//            ''
//          )
//
//        else if isConflicting(parentTrack, SimManager.HookedPlat) = True then
//          // track identity is conflicting
//
//        else if CalcRangeDM(parentTrack.PosX, parentTrack.PosY, SimManager.HookedPlat.PosX, SimManager.HookedPlat.PosY) > 1 then
//        begin
//          //join procces
//          // not in basetrack radius -> join identity'
//          TRAMTrack(SimManager.HookedPlat).Identity := TBaseTrack(parentTrack).Identity;
//        end;
//
//      end;
//
//    end
//    else
//      EventManager.OnMsg(    0,
//        '',
//        'No Track Selected',
//        ''
//      );
//  end
//
//  //ASSOC MANIPULATION
//  //added by uswah 24/10/2013
//  else if word = '1_19' then begin
//    for I := 0 to SimManager.SimDetectTrack.ItemCount - 1 do begin
//      aObj := SimManager.SimDetectTrack.getObject(i) as TSimulationUnit;
//      if (aObj <> nil)  then
//      begin
//        if aObj is TPointTrack then
//        begin
//          if aObj.CloseCtrl = True then
//          begin
//            if SimManager.HookedPlat <> nil then
//            begin
//              if SimManager.HookedPlat is TBearingTrack then
//              begin
//                (*Maximum Association Range between PointTrack and Ownship is 15 DM*)
//                assocMaxRng:= CalcRangeDM((aObj as TPointTrack).PosX,(aObj as TPointTrack).PosY,
//                  Simmanager.Sigma.PosX, Simmanager.Sigma.PosY);
//
//                (*Bearing of PointTrack*)
//                assocPointTrkBrg := CalcBearing((Simmanager.Sigma.PosX),
//                  (Simmanager.Sigma.PosY),((aObj as TPointTrack).PosX),((aObj as TPointTrack).PosY));
//
//                (*Delta Heading between PointTrack and Reference Point of BearingTrack*)
//                assocDeltaHeading := Abs(getDeltaH((assocPointTrkBrg),(SimManager.HookedPlat as TBearingTrack).Bearing));
//
//                (*Maximum Association Azimuth between PointTrack and ESMBearingTrack is 1,25 DM*)
//                assocMaxAzimuth := C_NauticalMile_To_DataMile *(assocMaxRng * (Sin(degtorad(assocDeltaHeading))));
//
//                if ((aObj as TPointTrack).Domain = (SimManager.HookedPlat as TBearingTrack).Domain) and
//                  (assocMaxRng <= 15) and (assocMaxAzimuth <= 1.25) and
//                  (isAssocConflicting((aObj as TPointTrack), SimManager.HookedPlat) = False) then
//                begin
//
//                  TBearingTrack(SimManager.HookedPlat).AssocTrack := aObj as TBaseTrack;
//
//                  frmAssoc.Show;
//
//                  if frmAssoc.pwrBtnAuto.Active = True then
//                  begin
//                    if (aObj as TPointTrack).Domain = tdAir then
//                    begin
//                      frmAssoc.lblAir.Caption := FloatToStr(assocMaxRng);
//                      frmAssoc.lblAir.Caption := FormatFloat('0.00', assocMaxRng);
//                    end
//                    else
//                    if (aObj as TPointTrack).Domain = tdSurface then
//                    begin
//                      frmAssoc.lblSurf.Caption := FloatToStr(assocMaxRng);
//                      frmAssoc.lblSurf.Caption := FormatFloat('0.00', assocMaxRng);
//                    end;
//                  end
//                  else
//                  if frmAssoc.pwrBtnAuto.Active = False then
//                  begin
//                    if (aObj as TPointTrack).Domain = tdAir then
//                    begin
//                      frmAssoc.lblAir.Caption := '0.00';
//                    end
//                    else
//                    if (aObj as TPointTrack).Domain = tdSurface then
//                    begin
//                      frmAssoc.lblSurf.Caption := '0.00';
//                    end;
//                  end;
//
//                end
//                else if (aObj as TPointTrack).Domain <> (SimManager.HookedPlat as TBearingTrack).Domain then
//                begin
//                  EventManager.OnMsg(  0,
//                    '',
//                    'Track Environment Is Not Same',
//                    ''
//                  )
//                end
//                else if isAssocConflicting((aObj as TPointTrack), (SimManager.HookedPlat) as TBearingTrack) = True then
//                begin
//                  EventManager.OnMsg(  0,
//                    '',
//                    'Track Identity Is Conflicting',
//                    ''
//                  )
//
//                end
//                else if (assocMaxRng >= 15) and (assocMaxAzimuth >= 1.25) then
//                begin
//                  // not in association range
//                  EventManager.OnMsg(   0,
//                    '',
//                    'Track is in not association range',
//                    ''
//                  )
//                end;
//              end;
//            end
//            else
//              EventManager.OnMsg(     0,
//                '',
//                'No Track Selected',
//                ''
//              );
//          end;
//        end;
//      end;
//    end;
//  end
//
//  // STOP CPA
//  else if word = '1_22' then begin
//
//    for I := 0 to 2 do begin
//
//      // If one of this CPA track is the selected track..
//      if (SimManager.Sigma.FCPA[I].Obj1 = SimManager.HookedPlat) or
//         (SimManager.Sigma.FCPA[I].Obj2 = SimManager.HookedPlat) then begin
//
//        SimManager.Sigma.FCPA[I].OnCPAStop(Self); // ..trigger CPA Stop event..
//
//        case I of  // ..  and close that CPA's form
//           0:
//             begin
//               svc := VServiceMgr.RunService(C_SVC_CPA_Prediction_1) as TTCMS_Service;
//               (svc as TSvc_CPA_Prediction).SetDataCPA(cpaData);
//               (svc as TSvc_CPA_Prediction).Hide;
//             end;
//           1:
//             begin
//               svc := VServiceMgr.RunService(C_SVC_CPA_Prediction_2) as TTCMS_Service;
//               (svc as TSvc_CPA_Prediction_2).SetDataCPA(cpaData);
//               (svc as TSvc_CPA_Prediction_2).Hide;
//             end;
//           2:
//             begin
//               svc := VServiceMgr.RunService(C_SVC_CPA_Prediction_3) as TTCMS_Service;
//               (svc as TSvc_CPA_Prediction_3).SetDataCPA(cpaData);
//               (svc as TSvc_CPA_Prediction_3).Hide;
//             end;
//        end;
//
//      end;
//
//    end;
//
//
//  end
//
//  //DISSOC MANIPULATION
//  //Added by Uswah 20 Oct 2013
//  else if word = '1_24' then begin
//
//    for I := 0 to SimManager.SimDetectTrack.ItemCount - 1 do begin
//      aObj := SimManager.SimDetectTrack.getObject(i) as TSimulationUnit;
//      if (aObj <> nil)  then
//      begin
//        if aObj is TBearingTrack then
//        begin
//          if SimManager.HookedPlat <> nil then
//          begin
//            if SimManager.HookedPlat is TPointTrack then
//            begin
//              if ((aObj as TBearingTrack).Domain = (SimManager.HookedPlat as TPointTrack).Domain) and
//                (isAssocConflicting((aObj as TBearingTrack), SimManager.HookedPlat) = False) then
//              begin
//                (aObj as TBearingTrack).AssocTrack := nil;
////                TBearingTrack(SimManager.HookedPlat).AssocTrack := nil;
//
//                frmAssocWarning.Show;
//
////                if (aObj as TBearingTrack).Domain = tdAir then
////                begin
////                  frmAssocWarning.lblAssocVal.Caption := (aObj as TBearingTrack).DetectedName;
////                end
////                else
////                if (aObj as TBearingTrack).Domain = tdSurface then
////                begin
////                  frmAssocWarning.lblAssocVal.Caption := (aObj as TBearingTrack).DetectedName;
////                end;
//
//              end
//              else if (aObj as TBearingTrack).Domain <> (SimManager.HookedPlat as TPointTrack).Domain then
//                EventManager.OnMsg(    0,
//                  '',
//                  'Track Environment Is Not Same',
//                  ''
//                )
//              else if isAssocConflicting((aObj as TBearingTrack), (SimManager.HookedPlat) as TPointTrack) = True then
//              begin
//                EventManager.OnMsg(0,
//                  '',
//                  'Track Identity Is Conflicting',
//                  ''
//                )
//              end;
//            end;
//          end
//          else
//            EventManager.OnMsg(0,
//              '',
//              'No Track Selected',
//              ''
//            );
//        end;
//      end;
//    end;
//  end
//
//  // Hold Fire
//  else if word = '1_26' then begin
//    if Assigned(SimManager.HookedPlat) then begin
////      TBaseTrack(SimManager.HookedPlat).HoldFire := not TBaseTrack(SimManager.HookedPlat).HoldFire;
//      recHF.IdTrack  := TBaseTrack(SimManager.HookedPlat).ObjectID;
//      recHF.Identity := Byte(tiHostile);
//      recHF.OrderID  := Byte(CPID_CHANGE_HOLDFIRE);
//
//      if TBaseTrack(SimManager.HookedPlat).HoldFire = True then
//        recHF.Holdfire := False
//      else
//        recHF.Holdfire := True;
//
//      MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_HOLDFIRE), recHF);
//    end;
//
//
//    //FHoldFireReportDef.Show;
//  end
//
//
//
//  {collision Avoidance - Icha}
//  else if word = '1_29' then
//  begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//      aTargetFullName := (SimManager.HookedPlat as TBaseTrack).TrackSource + ' ' +
//                             (SimManager.HookedPlat as TBaseTrack).TkNumber;
//      if SimManager.Sigma.CollisionAvoidance.TrackList.Count > 0 then
//      begin
//        for i := 0 to SimManager.Sigma.CollisionAvoidance.TrackList.Count -1 do
//        begin
//          aDetectName := SimManager.Sigma.CollisionAvoidance.TrackList.Strings[i];
//          aTemptName := Copy(aDetectName, 1,5);
//          if aTargetFullName = aTemptName then
//          begin
//            Exit;
//          end
//          else
//          begin
//            SimManager.Sigma.CollisionAvoidance.TrackList.AddObject(aTargetFullName, SimManager.HookedPlat);
//          end;
//        end;
//      end;
//
//      if SimManager.Sigma.CollisionAvoidance.TrackList.Count <= 0 then
//        SimManager.Sigma.CollisionAvoidance.TrackList.AddObject(aTargetFullName, SimManager.HookedPlat);
//    end;
//  end
//
//
//  //ICM
//  else if word = '1_30' then begin
////    SimManager.ICM.Visible := True;
////    SimManager.ICM.PosX := SimManager.CursorX;
////    SimManager.ICM.PosY := SimManager.CursorY;
//    IdxRoleSend := Integer(SimManager.ActiveRole);
//    IdxRolRcv   := SimManager.IdxRoleRcv;
//
//    MessageHandle.Send_Data_ICM(IdxRoleSend, IdxRolRcv, SimManager.CursorX, SimManager.CursorY);
//  end
//
//  // DR AIR
//  // BY NAOKI
//  else if word = '2_11' then
//  begin
//    SimManager.CrossVisual.MapPress := False;
//
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.TrackID := CORD_DR_AIR;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
////    recTrack.CreateFrom := CRT_TRAINING;
//
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  //*************************************************************** ica
//  // CORD_VIS_B_AIR ,  CORD_VIS_B_SURF, CORD_VIS_B_SUB
//  else if word = '2_12' then
//  begin
//    if SimManager.RulerVisual.Visible then
//    begin
//      SimManager.CrossVisual.MapPress := False;
//
//      recTrack.MOCSender := VConsoleIdent.ConsoleName;
//      recTrack.TrackID := CORD_VIS_B_AIR;
//      recTrack.PosX := SimManager.CrossVisual.MidX;
//      recTrack.PosY := SimManager.CrossVisual.MidY;
//  //    recTrack.CreateFrom := CRT_TRAINING;
//
//      MessageHandle.Send_Engage_Manual_Track(recTrack);
//    end;
//  end
//
//  else if word = '3_12' then
//  begin
//    if SimManager.RulerVisual.Visible then
//    begin
//      SimManager.CrossVisual.MapPress := False;
//
//      recTrack.MOCSender := VConsoleIdent.ConsoleName;
//      recTrack.TrackID := CORD_VIS_B_SURF;
//      recTrack.PosX := SimManager.CrossVisual.MidX;
//      recTrack.PosY := SimManager.CrossVisual.MidY;
//  //    recTrack.CreateFrom := CRT_TRAINING;
//
//      MessageHandle.Send_Engage_Manual_Track(recTrack);
//    end;
//  end
//  else if word = '4_12' then
//  begin
//    if SimManager.RulerVisual.Visible then
//    begin
//      SimManager.CrossVisual.MapPress := False;
//
//      recTrack.MOCSender := VConsoleIdent.ConsoleName;
//      recTrack.TrackID := CORD_VIS_B_SUB;
//      recTrack.PosX := SimManager.CrossVisual.MidX;
//      recTrack.PosY := SimManager.CrossVisual.MidY;
//  //    recTrack.CreateFrom := CRT_TRAINING;
//
//      MessageHandle.Send_Engage_Manual_Track(recTrack);
//    end;
//  end
//
//  // CORD_ESM_B_AIR , CORD_ESM_B_SURF, CORD_ESM_B_SUB
//
//  else if word = '2_17' then                                               {icha}
//  begin
//    if SimManager.RulerVisual.Visible then
//    begin
//      SimManager.CrossVisual.MapPress := False;
//      recTrack.MOCSender := VConsoleIdent.ConsoleName;
//      recTrack.TrackID := CORD_ESM_B_AIR;
//      recTrack.PosX := SimManager.CrossVisual.MidX;
//      recTrack.PosY := SimManager.CrossVisual.MidY;
//    end;
//
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//  else if word = '3_17' then
//  begin
//    if SimManager.RulerVisual.Visible then
//    begin
//      SimManager.CrossVisual.MapPress := False;
//      recTrack.MOCSender := VConsoleIdent.ConsoleName;
//      recTrack.TrackID := CORD_ESM_B_SURF;
//      recTrack.PosX := SimManager.CrossVisual.MidX;
//      recTrack.PosY := SimManager.CrossVisual.MidY;
//    end;
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//  else if word = '4_17' then
//  begin
//    if SimManager.RulerVisual.Visible then
//    begin
//      SimManager.CrossVisual.MapPress := False;
//      recTrack.MOCSender := VConsoleIdent.ConsoleName;
//      recTrack.TrackID := CORD_ESM_B_SUB;
//      recTrack.PosX := SimManager.CrossVisual.MidX;
//      recTrack.PosY := SimManager.CrossVisual.MidY;
//    end;
//
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  //********************************************************************
//
//  // POINT GEN AIR, POINT GEN SURF, POINT GEN SUBSURF
//  else if (word = '2_13') or (word = '3_13') or (word = '4_13') then
//  begin
//
//    SimManager.CrossVisual.MapPress := False;
//    recTrack.TrackID := CORD_POINT_GEN;
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
////    recTrack.CreateFrom := CRT_TRAINING;
//
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  // RAM AIR
//  else if word = '2_16' then begin
//
//    SimManager.CrossVisual.MapPress := False;
//
//    recTrack.TrackID := CORD_RAM_AIR;
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
////    recTrack.CreateFrom := CRT_TRAINING;
//
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  // POINT AIR
//  else if word = '2_18' then begin
//    SimManager.CrossVisual.MapPress := False;
//
//    recTrack.TrackID := CORD_POINT_AIR;
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  // TAKE RAM AIR, SURF
//  else if (word = '2_26') or (word = '3_26') then begin
//    if Assigned(SimManager.HookedPlat) then begin
//      aObj := SimManager.HookedPlat as TSimulationUnit;
//      if aObj is TRAMTrack then begin
//        if TRAMTrack(aObj).MocName <> SimManager.MOCName then
//          TRAMTrack(aObj).MocName := SimManager.MOCName;
//      end;
//    end;
//  end
//
//  // NEXT RAM AIR, SURF
//  else if (word = '2_27') or (word = '3_27') then begin
//    for I := 0 to SimManager.SimDetectTrack.ItemCount - 1 do begin
//      aObj := SimManager.SimDetectTrack.getObject(i) as TsimulationUnit;
//      if (TPointTrack(aObj).CloseCtrl = True) and (aObj.ObjectName <> 'NGS-101') then begin
//        for j := i to SimManager.SimDetectTrack.ItemCount - 1 do begin
//          tempObj := SimManager.SimDetectTrack.getObject(j) as TsimulationUnit;
//          if tempObj = aObj then
//            Continue;
//
//          if tempObj is TRAMTrack then begin
//            TPointTrack(aObj).CloseCtrl := False;
//            TPointTrack(tempObj).CloseCtrl := true;
//            isFind := True;
//            break;
//          end;
//
//        end;
//        if not isFind then
//        for j := 0 to SimManager.SimDetectTrack.ItemCount - 1 do begin
//          tempObj := SimManager.SimDetectTrack.getObject(j) as TsimulationUnit;
//          if tempObj = aObj then
//            Continue;
//
//          if tempObj is TRAMTrack then begin
//            TPointTrack(aObj).CloseCtrl := False;
//            TPointTrack(tempObj).CloseCtrl := true;
//            isFind := True;
//            break;
//          end;
//
//        end;
//        if isFind then
//          Break;
//      end;
//    end;
//
//  end
//
//  {icha  -JOY TO LIROD}
//  else if word = '6_25' then //7_11
//  begin
//    if (SimManager.Sigma.LIROD_MK2.KBandPower) and (SimManager.Sigma.LIROD_MK2.KBandTxAuth = kbtAuth) then
//    begin
////      SimManager.Sigma.LIROD_MK2.JoytoLirod := true;
////      recLirod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
////      recLIROD.isJoytoLirod := true;
////      Messagehandle.Send_Data_LIROD(recLirod);
////      EventManager.OnMsg(0,'','joytolirod true','');
//    end;
//  end
//
//  // Desig Lirod
//  else if word = '6_15' then begin //7_16
//    if Assigned(SimManager.HookedPlat) then begin
//      if SimManager.Sigma.LIROD_MK2.Desig then begin
//        if Assigned(EventManager.OnMsg) then begin
//          EventManager.OnMsg(    0,
//            '',
//            'LIROD is occupied',
//            ''
//          );
//        end;
//
//      end
//      else begin
//        if SimManager.HookedPlat is TBaseTrack then begin
//          recLIrod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
//          recLIROD.TargetID := SimManager.HookedPlat.ObjectID;
//          recLIROD.OrdID := CORD_DESIG_LIROD;
//          recLirod.IsDesig := True;
//          recLIrod.TrackingMode := Byte(ltmManual);
//          Messagehandle.Send_Data_LIROD(recLirod);
//
//        end;
//      end;
//
//    end;
//  end
//
//  {SRV LIROD}
//  else if word = '6_19' then  //7_17
//  begin
//
//    recLirod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
//    recLIROD.IsSrvLirod  := True;
//    recLirod.MocControling := VConsoleIdent.ConsoleName;
//    recLIROD.TrackingMode := Byte(ltmSurvey);
//    recLIROD.Bearing := SimManager.Sigma.LIROD_MK2.LirodBrn;
//    MessageHandle.Send_Data_LIROD(recLIROD);
//
//  end
//
//  {
//  //OTO LIROD
//  else if word = '7_18' then    // who's OTO?
//  begin
//
//    recLirod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
//    recLIROD.MocControling  := VConsoleIdent.ConsoleName;
//    MessageHandle.Send_Data_LIROD(recLIROD);
//
//  end
//  }
//
//  // Break Lirod
//  else if word = '6_20' then // 7_21
//  begin
//    if SimManager.Sigma.LIROD_MK2.TargetObject <> nil then
//    begin
//      recLirod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
//      recLIROD.TargetID := SimManager.Sigma.LIROD_MK2.TargetObject.ObjectID;
//      recLIROD.OrdID := CORD_BREAK_LIROD;
//      recLirod.IsDesig := False;
//      recLIrod.TrackingMode := Byte(ltmNone);
//      Messagehandle.Send_Data_LIROD(recLirod);
//    end;
//  end
//
//  // SS LIROD
//  else if word = '6_14' then //7_22
//  begin
////    if (SimManager.Sigma.LIROD_MK2.KBandPower) and (SimManager.Sigma.LIROD_MK2.KBandStatus = kbtAuth) then
////    begin
//      recLirod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
//      recLIROD.TrackingMode := Byte(ltmSectorSearch);
//      recLIROD.Bearing := SimManager.Sigma.LIROD_MK2.LirodBrn;
//      MessageHandle.Send_Data_LIROD(recLIROD);
////    end;
//  end
//
//  // Auto Track
//  else if word = '6_18' then //7_23
//  begin
////    if (SimManager.Sigma.LIROD_MK2.KBandPower) and (SimManager.Sigma.LIROD_MK2.KBandStatus = kbtAuth) then
////    begin
//      recLirod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
//      recLIROD.TrackingMode := Byte(ltmAutoTrack);
//
//      MessageHandle.Send_Data_LIROD(recLIROD);
////    end;
//  end
//
//  // KILL
//  else if word = '6_26' then  //7_26
//  begin
//    if SimManager.HookedPlat <> nil then
//    begin
//      if SimManager.Sigma.LIROD_MK2.TargetObject <> nil then
//      begin
//        if SimManager.Sigma.LIROD_MK2.TargetObject.ObjectID = SimManager.HookedPlat.ObjectID then
//        begin
//          recLirod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
//          recLIROD.OrdID := CORD_KILL_LIROD;
//          Messagehandle.Send_Data_LIROD(recLirod);
//        end;
//      end;
//    end;
//  end
//
//  // MISS
//  else if word = '6_27' then // 7_27
//  begin
//
//  end
//
//  // DR SURF
//  else if word = '3_11' then begin
//
//
//    SimManager.CrossVisual.MapPress := False;
//
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.TrackID := CORD_DR_SURF;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  // RAM Surf
//  else if word = '3_16' then begin
//    SimManager.CrossVisual.MapPress := False;
//
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.TrackID := CORD_RAM_SURF;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//
//  end
//
//  // POINT ESMFIX
//  else if word = '3_18' then
//  begin
//    SimManager.CrossVisual.MapPress := False;
//
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.TrackID := CORD_POINT_ESMFIX;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  // Keep Lost Air, Surf, Subsurf
//  else if (word = '2_23') or (word = '3_23') or (word = '4_23') then
//  begin
//    if (SimManager.HookedPlat <> nil) and (SimManager.HookedPlat.ObjectID <> '') then
//    begin
//      recTrackPosition.TrackID := StrToInt(SimManager.HookedPlat.ObjectID);
//      recTrackPosition.OrderID := CORD_TRACK_KEEPLOST;
//      recTrackPosition.ReposX := 0.0;
//      recTrackPosition.ReposY := 0.0;
//      recTrackPosition.Speed := 0.0;
//      recTrackPosition.Heading := 0.0;
//
//      MessageHandle.Send_Track_Positioning(recTrackPosition);
//
//    end;
//
//  end
//
//  // Change source Air, Surf, Subsurf
//  else if (word = '2_24') or (word = '3_24') or (word = '4_24') then
//  begin
//    if (SimManager.HookedPlat <> nil) and (SimManager.HookedPlat.ObjectID <> '') then
//    begin
//      recTrackPosition.TrackID := StrToInt(SimManager.HookedPlat.ObjectID);
//      recTrackPosition.OrderID := CORD_TRACK_CHANGE_SRC;
//      recTrackPosition.ReposX := 0.0;
//      recTrackPosition.ReposY := 0.0;
//      recTrackPosition.Speed := 0.0;
//      recTrackPosition.Heading := 0.0;
//
//      MessageHandle.Send_Track_Positioning(recTrackPosition);
//    end;
//  end
//
//  // wipe source air, Wipe Source Surf,  wipe source subsurf
//  else if (word = '2_25') or (word = '3_25') or (word = '4_25') then begin
//    if Assigned(SimManager.HookedPlat) and (SimManager.HookedPlat.ObjectID <> '') then
//    begin
//      SimManager.CursorPointer.ClearPointed(SimManager.HookedPlat);
//      SimManager.CursorPointer.ClearCursor;
//      recTrackPosition.TrackID := StrToInt(SimManager.HookedPlat.ObjectID);
//      recTrackPosition.OrderID := CORD_TRACK_WIPE_SRC;
//      recTrackPosition.ReposX := 0.0;
//      recTrackPosition.ReposY := 0.0;
//      recTrackPosition.Speed := 0.0;
//      recTrackPosition.Heading := 0.0;
//
//      MessageHandle.Send_Track_Positioning(recTrackPosition);
//
//    end;
//  end
//
//  // REPOSIT AIR, SURF, SUBSURF
//  else if (word = '2_28') or (word = '3_28') or (word = '4_28') then
//  begin
//
//    SimManager.CrossVisual.MapPress := False;
//
//    aObj := SimManager.CursorPointer.CloseCtrlObj as TSimulationUnit;
//    if aObj <> nil then
//    begin
//      if SimManager.CursorPointer.IsCloseControl then
//      begin
//        recTrackPosition.TrackID := StrToInt(aObj.ObjectID);
//        recTrackPosition.OrderID := CORD_TRACK_REPOST;
//        recTrackPosition.ReposX := SimManager.CrossVisual.MidX;
//        recTrackPosition.ReposY := SimManager.CrossVisual.MidY;
//        recTrackPosition.Speed := 0.0;
//        recTrackPosition.Heading := 0.0;
//
//        MessageHandle.Send_Track_Positioning(recTrackPosition);
//      end;
//    end;
//
//
//  end
//
//  // CORR AIR, CORR SURF, CORR SUBSURF
//  else if (word = '2_29') or (word = '3_29') or (word = '4_29')then
//  begin
//
//    SimManager.CrossVisual.MapPress := False;
//
//    aObj := SimManager.CursorPointer.CloseCtrlObj as TSimulationUnit;
//    if aObj <> nil then
//    begin
//      if SimManager.CursorPointer.IsCloseControl then
//      begin
//        ramRng := CalcRange(
//          aObj.PosX,
//          aObj.PosY,
//          SimManager.CrossVisual.MidX,
//          SimManager.CrossVisual.MidY
//        );
//
//        ramBrn := CalcBearing(
//          aObj.PosX,
//          aObj.PosY,
//          SimManager.CrossVisual.MidX,
//          SimManager.CrossVisual.MidY
//        );
//
//        ramSpd := ramRng / (TRAMTrack(aObj).Time / 3600) ;
//        ramCrs := ramBrn;
//
//        recTrackPosition.TrackID := StrToInt(aObj.ObjectID);
//        recTrackPosition.OrderID := CORD_TRACK_CORR;
//        recTrackPosition.ReposX := SimManager.CrossVisual.MidX;
//        recTrackPosition.ReposY := SimManager.CrossVisual.MidY;
//        recTrackPosition.Speed := ramSpd;
//        recTrackPosition.Heading := ramCrs;
//
//        MessageHandle.Send_Track_Positioning(recTrackPosition);
//      end;
//    end;
//
//
//  end
//
//  // WIPE AIR, WIPE SURF, WIPE SUBSURF
//  else if (word = '2_30') or (word = '3_30') or (word = '4_30') then begin
//    if SimManager.HookedPlat <> nil then begin
//
//      SimManager.CursorPointer.ClearPointed(SimManager.HookedPlat);
//      SimManager.CursorPointer.ClearCursor;
//      recTrackPosition.TrackID := StrToInt(SimManager.HookedPlat.ObjectID);
//      recTrackPosition.OrderID := CORD_TRACK_WIPE;
//      recTrackPosition.ReposX := 0.0;
//      recTrackPosition.ReposY := 0.0;
//      recTrackPosition.Speed := 0.0;
//      recTrackPosition.Heading := 0.0;
//
//      MessageHandle.Send_Track_Positioning(recTrackPosition);
//    end;
//  end
//
//  // DR SURF SUBSURF
//  // BY NAOKI
//  else if word = '4_11' then
//  begin
//    SimManager.CrossVisual.MapPress := False;
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.TrackID := CORD_DR_SURF_SUBSURF;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  // DATUM
//  else if word = '4_16' then
//  begin
////    datum := TDatum.Create;
////    datum.AddSource(stRefPos);
////    datum.TrackNumber := StrToInt(VIDGenerator.GenerateTrackNumber);
////    datum.ObjectID := VIDGenerator.GenerateNonRealID;
////    datum.Speed := 20;
////    datum.Heading := 90;
////    datum.TgtX  := SimManager.CrossVisual.MidX;
////    datum.TgtY  := SimManager.CrossVisual.MidY;
////    datum.InitRingPos(SimManager.CrossVisual.MidX, SimManager.CrossVisual.MidY, 2);
////
////    SimManager.SimDetectTrack.AddObject(datum);
//    SimManager.CrossVisual.MapPress := False;
//    recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.TrackID := CORD_DATUM;
//    recTrack.DatumX := SimManager.CrossVisual.MidX;
//    recTrack.DatumY := SimManager.CrossVisual.MidY;
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  // POINT ASW
//  // BY NAOKI
//  else if word = '4_18' then
//  begin
//    SimManager.CrossVisual.MapPress := False;
//
//     recTrack.MOCSender := VConsoleIdent.ConsoleName;
//    recTrack.TrackID := CORD_POINT_ASW;
//    recTrack.PosX := SimManager.CrossVisual.MidX;
//    recTrack.PosY := SimManager.CrossVisual.MidY;
//    MessageHandle.Send_Engage_Manual_Track(recTrack);
//  end
//
//  // Create Object
//  else if word= '6_11' then begin
//
//    if frmCreateObjects <> nil then begin
//      ConvLattLongToCartesianDM(SimManager.Sigma.PosX, SimManager.Sigma.PosY,
//        SimManager.CrossVisual.MidX, SimManager.CrossVisual.MidY, PosX, PosY);
//
//      frmCreateObjects.Close;
//      PosX := StrToFloat(FormatFloat('0.00', PosX));
//      PosY := StrToFloat(FormatFloat('0.00', PosY));
//      frmCreateObjects.Cx := PosX;
//      frmCreateObjects.Cy := PosY;
//      frmCreateObjects.Caption := 'Create Object';
//      frmCreateObjects.Show;
//    end;
//  end
//
//  // Launch Weapon
//  else if word= '6_12' then begin
//    if SimManager.HookedPlat <> nil then begin
//      if (SimManager.HookedPlat is TVehicle) then
//      begin
//        if Assigned(FOnLaunchWeapon) then
//          FOnLaunchWeapon(SimManager.HookedPlat);
//      end;
//    end
//    else begin
//      EventManager.OnMsg(   0,
//        '','No Object Selected',''
//      );
//    end;
//  end
//
//  // CC Object  Close control object cc obj
//  else if word = '6_13' then
//  begin
//
//
//    if SimManager.HookedPlat <> nil then
//    begin
//      if not (SimManager.HookedPlat is TBaseTrack) then
//      begin
//        SimManager.CursorPointer.IsCloseControl := True;
//        SimManager.CursorPointer.CloseCtrlObj := SimManager.HookedPlat;
//      end;
//    end;
//
//  end
//
//
//  // Edit Object
//  else if word ='6_16' then begin
//    if Assigned(SimManager.HookedPlat) then begin
//
//      if (SimManager.HookedPlat is TVehicle) then begin
//
//        aObj := SimManager.HookedPlat as TSimulationUnit;
//        if Assigned(aObj) then begin
//          frmCreateObjects.Close;
//          frmCreateObjects.Caption := 'Edit Object';;
//          frmCreateObjects.SelectedObject      := aobj;
//          frmCreateObjects.ObjID    := aobj.ObjectID;
//          frmCreateObjects.Show;
//        end;
//
//      end;
//
//    end;
//
//  end
//
//  // Delete Object
//  else if word ='6_21' then begin
//    if SimManager.HookedPlat <> nil then begin
//      if SimManager.HookedPlat is TBasePlatform then begin
//        i := SimManager.SimPlatforms.getIndexOf(SimManager.HookedPlat);
//
//        MessageHandle.Send_Data_Obj(i , StrToInt(SimManager.HookedPlat.ObjectID),
//                    Byte(CORD_DELETE_OBJ),0, 0,
//                    False, False, False, False, False,
//                    False, False, False , False ,
//                    '', '', '', 0, 0,
//                    0, 0, 0,
//                    0, False, False, False, 0, 0,0);
//      end;
//    end;
//  end
//
//  // DREQ OBJECT
//  else if word ='6_26' then begin
//    if SimManager.HookedPlat <> nil then begin
//      if SimManager.HookedPlat is TBasePlatform then begin
//        if Assigned(FOnRequestDataObj) then
//          FOnRequestDataObj(SimManager.HookedPlat);
//      end;
//    end;
//  end
//
//  // Repost Object
//  else if word='6_28' then
//  begin
//    if SimManager.CursorPointer.CloseCtrlObj <> nil then
//    begin
//      if SimManager.CursorPointer.CloseCtrlObj is TBasePlatform then
//      begin
//        recTrackPosition.TrackID := StrToInt(SimManager.CursorPointer.CloseCtrlObj.ObjectID);
//        recTrackPosition.OrderID := CORD_OBJECT_REPOST;
//        recTrackPosition.ReposX := SimManager.CrossVisual.MidX;
//        recTrackPosition.ReposY := SimManager.CrossVisual.MidY;
//        recTrackPosition.Speed := 0.0;
//        recTrackPosition.Heading := 0.0;
//
//        MessageHandle.Send_Track_Positioning(recTrackPosition);
//      end;
//
//
//
//    end;
//  end
//
//  // Desig TWS-1
//  else if word = '8_18' then begin
////    if SimManager.Sigma.MW08.isTransmitting then
//    if SimManager.Sigma.SMARTS.isTransmitting then
//    begin
//
//      SimManager.CrossVisual.MapPress := False;
//
//      recTrack.TrackID := CORD_TWS_1;
//      recTrack.PosX := SimManager.CrossVisual.MidX;
//      recTrack.PosY := SimManager.CrossVisual.MidY;
//
//
//      recTrack.PlatID := '';
//
//      if SimManager.HookedPlat <> nil then
//      begin
//
//        if SimManager.HookedPlat is TBaseTrack then
//        begin
//
//          recTrack.PlatID := SimManager.HookedPlat.ObjectID;
//          recTrack.PosX := SimManager.HookedPlat.PosX;
//          recTrack.PosY := SimManager.HookedPlat.PosY;
//        end;
//      end;
//
//      MessageHandle.Send_Engage_Manual_Track(recTrack);
//    end;
//  end
//
//  // Desig TWS-2
//  else if word = '8_19' then begin
//    if SimManager.Sigma.SMARTS.isTransmitting then
//    begin
//
//      SimManager.CrossVisual.MapPress := False;
//
//      recTrack.TrackID := CORD_TWS_2;
//      recTrack.PosX := SimManager.CrossVisual.MidX;
//      recTrack.PosY := SimManager.CrossVisual.MidY;
//
//      recTrack.PlatID := '';
//
//      if SimManager.HookedPlat <> nil then
//      begin
//        if SimManager.HookedPlat is TBaseTrack then
//        begin
//          recTrack.PlatID := SimManager.HookedPlat.ObjectID;
//          recTrack.PosX := SimManager.HookedPlat.PosX;
//          recTrack.PosY := SimManager.HookedPlat.PosY;
//        end;
//      end;
//
//      MessageHandle.Send_Engage_Manual_Track(recTrack);
//    end;
//  end
//
//  // Break TWS-1
//  else if (word = '8_23') then
//  begin
//    SimManager.CursorPointer.ClearCursor;
//    recTrackPosition.TrackID := 0;
//    recTrackPosition.OrderID := CORD_BREAK_TWS_1;
//    recTrackPosition.ReposX := 0.0;
//    recTrackPosition.ReposY := 0.0;
//    recTrackPosition.Speed := 0.0;
//    recTrackPosition.Heading := 0.0;
//
//    MessageHandle.Send_Track_Positioning(recTrackPosition);
//  end
//
//  // Break TWS-2
//  else if word = '8_24' then
//  begin
//    SimManager.CursorPointer.ClearCursor;
//    recTrackPosition.TrackID := 0;
//    recTrackPosition.OrderID := CORD_BREAK_TWS_2;
//    recTrackPosition.ReposX := 0.0;
//    recTrackPosition.ReposY := 0.0;
//    recTrackPosition.Speed := 0.0;
//    recTrackPosition.Heading := 0.0;
//
//    MessageHandle.Send_Track_Positioning(recTrackPosition);
//  end
//
//  // Tetral Desfwd & Tetral Desaft
//  else if (word = '9_12') or (word = '9_13')then begin
//
//    if word = '9_12' then
//      iTetralID := 0
//    else
//      iTetralID := 1;
//
//    if Assigned(SimManager.Sigma) and
//        Assigned(SimManager.HookedPlat) then
//    begin
//
//      if Assigned(SimManager.Sigma.FTetralLauncher[iTetralID].TargetObject) then
//      begin
//        if SimManager.Sigma.FTetralLauncher[iTetralID].TargetObject.ObjectID <>
//           SimManager.HookedPlat.ObjectID then
//        begin
//          EventManager.OnMsg(  0,
//            '',
//            'SAM Tetral Designation is Disabled.',
//            ''
//          );
//        end;
//        Exit;
//      end;
//
//      if (TBaseTrack(SimManager.HookedPlat).Domain = tdAir) and
//             (SimManager.Sigma.FTetralLauncher[iTetralID].OperationalStatus = sopOn) and
//             (SimManager.Sigma.FTetralLauncher[iTetralID].OperationalOn = True) and
//             (SimManager.Sigma.FTetralLauncher[iTetralID].IsFiring = True) and
//             (SimManager.Sigma.FTetralLauncher[iTetralID].CheckMissileQuantity = True) and
//             (TBaseTrack(SimManager.HookedPlat).TrackUnit <> nil) then
//      begin
//        recFireTetral.ObjectId := SimManager.Sigma.ObjectID;
//        recFireTetral.TargetID := SimManager.HookedPlat.ObjectID;
//
//        if word = '9_12' then
//          recFireTetral.TetralID := CORD_TETRAL_FWD
//        else if word = '9_13' then
//          recFireTetral.TetralID := CORD_TETRAL_AFT;
//
//        MessageHandle.Send_Desigt_Tetral(recFireTetral);
//
//      end
//      else
//      begin
//        if (SImManager.Sigma.FTetralLauncher[iTetralID].OperationalStatus = sopOff) or
//           (SImManager.Sigma.FTetralLauncher[iTetralID].OperationalOn = False) or
//           (SImManager.Sigma.FTetralLauncher[iTetralID].IsFiring = False) then
//        begin
//          eventmanager.OnMsg(   0,
//            '',
//            'SAM Tetral Designation is not possible because Tetral subsystem is powered down.',
//            ''
//          );
//        end
//        else if (TBaseTrack(SimManager.HookedPlat).Domain <> tdAir) or
//                (TBaseTrack(SimManager.HookedPlat).TrackUnit = nil) then
//        begin
//          Eventmanager.OnMsg(   0,
//              '',
//              'SAM Tetral cannot be used for designation on non-air track or track id is not valid',
//              ''
//            );
//
//        end
//        else if (SimManager.Sigma.FTetralLauncher[iTetralID].MissileInventory[0].Quantity = 0) and
//         (SimManager.Sigma.FTetralLauncher[iTetralID].MissileInventory[1].Quantity = 0) and
//         (SimManager.Sigma.FTetralLauncher[iTetralID].MissileInventory[2].Quantity = 0) and
//         (SimManager.Sigma.FTetralLauncher[iTetralID].MissileInventory[3].Quantity = 0) then
//        begin
//          eventmanager.OnMsg(   0,
//            '',
//            'SAM Tetral Designation is Disabled.',
//            ''
//          );
//        end;
//      end;
//
//      //baru
//
//    end;
//  end
//
//  // Desig A244
//  else if word='9_15' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//
//     track := SimManager.SimDetectTrack.FindObjectByUid(SimManager.HookedPlat.ObjectID) as TSimObject;
//
//      if Assigned(track) then
//      begin
//        if (track is TBaseTrack) and not (track is TBearingTrack)then
//        begin
//          if (TBaseTrack(track).Domain = tdSubSurface) then
//          begin
//            if not Assigned(SimManager.Sigma.TorpedoA244_OnVehicle.TargetObject) then
//            begin
//              if SimManager.Sigma.TorpedoA244_OnVehicle.ListTargetConfirm.Count < 2 then
//              begin
//                recDataA244.ObjectId := SimManager.Sigma.ObjectID;
//                recDataA244.TargetID := SimManager.HookedPlat.ObjectID;
//
//                MessageHandle.Send_Desigt_A244(recDataA244);
//              end
//              else
//              begin
//                 if Assigned(EventManager.OnMsg) then
//                      EventManager.OnMsg(        0,
//                      '',
//                      'Already two A244/S Engagement in the Manoeuvre,',
//                      'pre-launch or launch phase');
//              end;
//            end
//            else
//            begin
//              if Assigned(EventManager.OnMsg) then
//                EventManager.OnMsg(0,'',
//                      'Only one A244/S Engagement in the Manoeuvre,',
//                      'pre-launch or launch phase allowed');
//            end;
//          end
//          else
//          begin
//            if Assigned(EventManager.OnMsg) then
//              EventManager.OnMsg(  0,
//              '',
//              'Wrong Track, Must be an existing',
//              'subsurface point track');
//          end;
//        end
//        else
//        begin
//          if Assigned(EventManager.OnMsg) then
//            EventManager.OnMsg(    0,
//            '',
//            'Wrong Track, Must be an existing',
//            'subsurface point track');
//        end;
//      end
//      else
//      begin
//        if Assigned(EventManager.OnMsg) then
//          EventManager.OnMsg(    0,
//          '',
//          'Wrong Track, Must be an existing',
//          'subsurface point track');
//      end;
//
//
//    end
//    else
//    begin
//      if Assigned(EventManager.OnMsg) then
//        EventManager.OnMsg(    0,
//        '',
//        'Wrong Track, Must be an existing',
//        'subsurface point track');
//    end;
//  end
//
//  // Tetral Brkfwd & Brkaft
//  else if (word = '9_17') or (word = '9_18') then begin
//    if Assigned(SimManager.Sigma) and
//        Assigned(SimManager.HookedPlat) then
//    begin
//      recFireTetral.ObjectId := SimManager.Sigma.ObjectID;
//      recFireTetral.TargetID := SimManager.HookedPlat.ObjectID;
//
//      if word = '9_17' then
//        recFireTetral.TetralID := CORD_TETRAL_FWD
//      else if word = '9_18' then
//        recFireTetral.TetralID := CORD_TETRAL_AFT;
//
//      MessageHandle.Send_Break_Tetral(recFireTetral);
//    end;
//  end
//
//  // Break A244
//  else if word='9_20' then
//  begin
//    if Assigned(SimManager.Sigma.TorpedoA244_OnVehicle.TargetObject) then
//    begin
//      recDataA244.ObjectId := SimManager.Sigma.ObjectID;
//      recDataA244.TargetID := SimManager.Sigma.TorpedoA244_OnVehicle.TargetObject.ObjectID;
//
//      MessageHandle.Send_Break_A244(recDataA244);
//    end
//    else
//    begin
//      if Assigned(EventManager.OnMsg) then
//        EventManager.OnMsg(    0,
//        '',
//        'No A244/S Engagement in the Manoeuvre,',
//        'pre-launch or launch phase');
//    end;
//  end
//
//  {ichaECM}
//  else if word = '9_25' then
//  begin
//    { icha }
////    if SimManager.Sigma.Scorpion.ECMTrasmiter = tPermitted then
////    begin
//      if (SimManager.HookedPlat is TESM_Brg_Track) or (SimManager.HookedPlat is TBearingTrack) and
//         (TBearingTrack(SimManager.HookedPlat).BearingType = tbElectro) then
//      begin
//        if SimManager.Sigma.Scorpion.ListTrack.Count < 2 then
//        begin
//          { Send Sync }
//          recECMEngagement.ObjectID := SimManager.HookedPlat.ObjectID;
//          recECMEngagement.OrderID := CORD_ECM_DESIG;
//          MessageHandle.Send_ECMEngagement(recECMEngagement);
//        end
//        else
//        begin
//          if Assigned(EventManager.OnMsg) then
//            EventManager.OnMsg(0,'', 'Already Engage 2 Tracks ESM', '');
//        end;
//      end
//      else
//      begin
//        if Assigned(EventManager.OnMsg) then
//          EventManager.OnMsg(0,'', 'Not Valid ESM Bearing Track', '');
//      end;
////    end;
//  end
//
//  else if word='9_30' then
//  begin
//    {break ECM}
//    if (SimManager.HookedPlat is TESM_Brg_Track) or (SimManager.HookedPlat is TBearingTrack) and
//        (TBearingTrack(SimManager.HookedPlat).BearingType = tbElectro) then
//    begin
//      { Send Sync }
//      recECMEngagement.ObjectID := SimManager.HookedPlat.ObjectID;
//      recECMEngagement.OrderID := CORD_ECM_BREAK;
//      MessageHandle.Send_ECMEngagement(recECMEngagement);
//    end;
//  end
//
//  // Ident Neutral
//  else if word='10_12' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//
//      recHF.IdTrack := TBaseTrack(SimManager.HookedPlat).ObjectID;
//      recHF.Identity := Byte(tiNeutral);
//      recHF.OrderID  := Byte(CPID_CHANGE_IDENTITY);
//      recHF.Holdfire := False;
//
//      MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_IDENTITY), recHF);
//    end;
////      TBaseTrack(SimManager.HookedPlat).Identity := tiNeutral;
//  end
//
//  // Ident Unknown
//  else if word='10_13' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//          recHF.IdTrack := TBaseTrack(SimManager.HookedPlat).ObjectID;
//          recHF.Identity := Byte(tiUnknown);
//          recHF.OrderID  := Byte(CPID_CHANGE_IDENTITY);
//          recHF.Holdfire := False;
//
//          MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_IDENTITY), recHF);
//    end;
////      TBaseTrack(SimManager.HookedPlat).Identity := tiUnknown;
//  end
//
//  // Ident Assumed-Friend
//  else if word='10_16' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//          recHF.IdTrack := TBaseTrack(SimManager.HookedPlat).ObjectID;
//          recHF.Identity := Byte(tiAssumedFriend);
//          recHF.OrderID  := Byte(CPID_CHANGE_IDENTITY);
//          recHF.Holdfire := False;
//
//          MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_IDENTITY), recHF);
//    end;
////      TBaseTrack(SimManager.HookedPlat).Identity := tiAssumedFriend;
//  end
//
//  // Ident Suspect
//  else if word='10_19' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//          recHF.IdTrack := TBaseTrack(SimManager.HookedPlat).ObjectID;
//          recHF.Identity := Byte(tiSuspect);
//          recHF.OrderID  := Byte(CPID_CHANGE_IDENTITY);
//          recHF.Holdfire := False;
//
//          MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_IDENTITY), recHF);
//    end;
////      TBaseTrack(SimManager.HookedPlat).Identity := tiSuspect;
//  end
//
//  // Ident Friend
//  else if word='10_21' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//          recHF.IdTrack := TBaseTrack(SimManager.HookedPlat).ObjectID;
//          recHF.Identity := Byte(tiFriend);
//          recHF.OrderID  := Byte(CPID_CHANGE_IDENTITY);
//          recHF.Holdfire := False;
//
//          MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_IDENTITY), recHF);
//    end;
////      TBaseTrack(SimManager.HookedPlat).Identity := tiFriend;
//  end
//
//  // Ident Hostil
//  else if word='10_24' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//
//      recHF.IdTrack := TBaseTrack(SimManager.HookedPlat).ObjectID;
//      recHF.Identity := Byte(tiHostile);
//      recHF.OrderID  := Byte(CPID_CHANGE_IDENTITY);
//      recHF.Holdfire := False;
//
//      MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_IDENTITY), recHF);
//    end;
////      TBaseTrack(SimManager.HookedPlat).Identity := tiHostile;
//
//  end
//
//  // Ident Joker
//  else if word='10_27' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//          recHF.IdTrack := TBaseTrack(SimManager.HookedPlat).ObjectID;
//          recHF.Identity := Byte(tiJoker);
//          recHF.OrderID  := Byte(CPID_CHANGE_IDENTITY);
//          recHF.Holdfire := False;
//
//          MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_IDENTITY), recHF);
//    end;
////      TBaseTrack(SimManager.HookedPlat).Identity := tiJoker;
//  end
//
//  // Ident Faker
//  else if word='10_28' then begin
//    if Assigned(SimManager.HookedPlat) then
//    begin
//          recHF.IdTrack := TBaseTrack(SimManager.HookedPlat).ObjectID;
//          recHF.Identity := Byte(tiFaker);
//          recHF.OrderID  := Byte(CPID_CHANGE_IDENTITY);
//          recHF.Holdfire := False;
//
//          MessageHandle.Send_Change_Idnt_Hf(Byte(CPID_CHANGE_IDENTITY), recHF);
//    end;
////      TBaseTrack(SimManager.HookedPlat).Identity := tiFaker;
//  end
//
//  // Data Req
//  else if (word = '1_31') or (word = '2_31') or (word = '3_31') or (word = '4_31')
//    or (word = '5_31') or (word = '6_31') or (word = '7_31') or (word = '8_31')
//    or (word = '9_31') or (word = '10_31') then
//  begin
//
//    if Assigned(FOnRequestData) then
//      FOnRequestData(SimManager.HookedPlat);
//  end
//  // Close Control
//  else if (word = '1_33') or (word = '2_33') or (word = '3_33') or (word = '4_33')
//    or (word = '5_33') or (word = '6_33') or (word = '7_33') or (word = '8_33')
//    or (word = '9_33') or (word = '10_33') then
//  begin
//
//    if SimManager.HookedPlat <> nil then
//    begin
//      if SImManager.HookedPlat is TBaseTrack then
//      begin
//        SimManager.CursorPointer.IsCloseControl := True;
//        SimManager.CursorPointer.CloseCtrlObj := SimManager.HookedPlat;
//      end;
//    end;
//
////    for I := 0 to SimManager.SimDetectTrack.ItemCount - 1 do begin
////      aObj := SimManager.SimDetectTrack.getObject(i) as TSimulationUnit;
////      if aObj <> nil then begin
////        if aObj is TBaseTrack then
////          TBaseTrack(aObj).CloseCtrl := False;
////
////      end;
////    end;
////
////    aObj := SimManager.HookedPlat as TSimulationUnit;
////    if aObj <> nil then begin
////      if aObj is TBaseTrack then
////        if TBaseTrack(aObj).Controlled then
////          TBaseTrack(aObj).CloseCtrl := True;
////    end;
//
//  end
//
//  // Search Track
//  else if word='0_34' then begin
//
//  end
//
//  // Track Label
//  else if word='0_35' then begin
//
//  end
//
//  //Track Monitor Request
//  else if(word = '0_32') or (word = '1_32') or (word = '2_32') or (word = '3_32') or (word = '4_32')
//    or (word = '5_32') or (word = '6_32') or (word = '7_32') or (word = '8_32')
//    or (word = '9_32') or (word = '10_32') then
//  begin
//    if assigned (SimManager.HookedPlat) then
//    begin
//      if Simmanager.Sigma.TrackMonitor.TrackMonitList.Count > 0  then
//      begin
//        for i := 0 to Simmanager.Sigma.TrackMonitor.TrackMonitList.Count - 1 do
//        begin
//          dataMonit := TTrackMonitData(Simmanager.Sigma.TrackMonitor.TrackMonitList.Items[i]);
//          recTrackMonit.CheckID := i + 1;
//        end;
//      end;
//
//      if SimManager.HookedPlat is TPointTrack then
//      begin
//        recTrackMonit := initializeTRec_Track_Monitor_Data;
//
//        recTrackMonit.ObjectID := TBaseTrack(simManager.HookedPlat).ObjectID;
//        recTrackMonit.OrderID := CORD_TRACK_MONIT_UPDATE;
//        recTrackMonit.NameTrack := tbasetrack(simmanager.HookedPlat).DetectedName;
//        recTrackMonit.Identity := byte(tbasetrack(simmanager.HookedPlat).Identity);
//        recTrackMOnit.Envi := byte(tbasetrack(simmanager.HookedPlat).Domain);
//        rectrackMonit.Brn := Tbasetrack(simmanager.HookedPlat).Bearing;
//        rectrackMonit.Rng := Tbasetrack(simmanager.HookedPlat).Range;
//        rectrackMonit.Crs := Tbasetrack(simmanager.HookedPlat).Course;
//        rectrackMonit.Speed := Tbasetrack(simmanager.HookedPlat).Speed;
//        rectrackMonit.HD := Tbasetrack(simmanager.HookedPlat).Height;
//        rectrackMonit.PrivCode := Tbasetrack(simmanager.HookedPlat).PrivateCode;
//        rectrackMonit.TypeTrk := '';
//        rectrackMonit.OrgBrn := Tbasetrack(simmanager.HookedPlat).Bearing;
//        rectrackMonit.ColorQ := '';
//        rectrackMonit.XCoor := Tbasetrack(simmanager.HookedPlat).PosX;
//        rectrackMonit.YCoor := Tbasetrack(simmanager.HookedPlat).PosY;
//        rectrackMonit.OrgCourse := Tbasetrack(simmanager.HookedPlat).Course;
//        MessageHandle.Send_Track_Monit_Data(recTrackMonit);
//
//        SimManager.SimMonitTrackList.Add(SimManager.HookedPlat);
//
////        simmanager.Sigma.TrackMonitor.TrackMonitList.Add(simmanager.HookedPlat);
//      end
//      else if SimManager.HookedPlat is TBearingTrack then
//      begin
//
//        recTrackMonit := initializeTRec_Track_Monitor_Data;
//
//        recTrackMonit.ObjectID := TBaseTrack(simManager.HookedPlat).ObjectID;
//        recTrackMonit.OrderID := CORD_TRACK_MONIT_UPDATE;
//        recTrackMonit.NameTrack := tbasetrack(simmanager.HookedPlat).DetectedName;
//        recTrackMonit.Identity := byte(tbasetrack(simmanager.HookedPlat).Identity);
//        recTrackMOnit.Envi := byte(tbasetrack(simmanager.HookedPlat).Domain);
//        rectrackMonit.Brn := Tbasetrack(simmanager.HookedPlat).Bearing;
//        rectrackMonit.Rng := Tbasetrack(simmanager.HookedPlat).Range;
//        rectrackMonit.Crs := Tbasetrack(simmanager.HookedPlat).Course;
//        rectrackMonit.Speed := Tbasetrack(simmanager.HookedPlat).Speed;
//        rectrackMonit.HD := Tbasetrack(simmanager.HookedPlat).Height;
//        rectrackMonit.PrivCode := Tbasetrack(simmanager.HookedPlat).PrivateCode;
//        rectrackMonit.TypeTrk := '';
//        rectrackMonit.OrgBrn := Tbasetrack(simmanager.HookedPlat).Bearing;
//        rectrackMonit.ColorQ := '';
//        rectrackMonit.XCoor := Tbasetrack(simmanager.HookedPlat).PosX;
//        rectrackMonit.YCoor := Tbasetrack(simmanager.HookedPlat).PosY;
//        rectrackMonit.OrgCourse := Tbasetrack(simmanager.HookedPlat).Course;
//        MessageHandle.Send_Track_Monit_Data(recTrackMonit);
//        SimManager.SimMonitTrackList.Add(SimManager.HookedPlat);
////        simmanager.Sigma.TrackMonitor.TrackMonitList.Add(simmanager.HookedPlat);
//      end;
//    end;
//  end;
//
//  if word='PK1' then begin
//     //0 untuk tetral Forward
//    bObj := SimManager.SimDetectTrack.
//            FindObjectByUid(SimManager.Sigma.FTetralLauncher[0].TargetObject.ObjectID);
//
//    if bObj <> nil then
//    begin
//      Range := CalcRangeDM(SimManager.Sigma.PosX,
//                            SimManager.Sigma.PosY,
//                            TBaseTrack(bObj).PosX,
//                            TBaseTrack(bObj).PosY);
//
//      bearing := CalcBearing(SimManager.Sigma.PosX,
//                          SimManager.Sigma.PosY,
//                          TBaseTrack(bObj).PosX,
//                          TBaseTrack(bObj).PosY);
//
//      with SimManager.Sigma do
//      begin
//        rec.ShipID := ObjectIndex;
//        Rec.mLauncherID      := FTetralLauncher[0].LauncherNumber;
//        Rec.mMissileID       := FTetralLauncher[0].getMisiileNumber;
//        Rec.mMissileNumber   := 1;
//        Rec.OrderID          := 1;
//
//        Rec.mTargetBearing   := ValidateDegree(Bearing + ActHeading);
//        Rec.mTargetRange     := ((Range * C_DataMile_To_NauticalMile) * C_NauticalMile_To_Metre);
//        Rec.mTargetElev      := FTetralLauncher[0].Elevasi;
//
//        Rec.mWeaponID        := C_DBID_TETRAL;
//      end;
//
//      case SimManager.ProjectMode of
//        prjTpNFS :
//        begin
//          SimManager.netSendLaunchTetral(rec);
//        end;
//
//        prjTpTCMS :
//        begin
//          LaunchMissileTetral(0,SimManager.Sigma.FTetralLauncher[0].TargetObject);
//        end;
//      end;
//    end
//    else
//      SimManager.Sigma.FTetralLauncher[0].TargetObject := nil;
//
//  end;
//
//  if word='PK2' then begin
//    //1 untuk tetral after
//    bObj := SimManager.SimDetectTrack.
//            FindObjectByUid(SimManager.Sigma.FTetralLauncher[1].TargetObject.ObjectID);
//
//    if bObj <> nil then
//    begin
//      Range := CalcRangeDM(SimManager.Sigma.PosX,
//                            SimManager.Sigma.PosY,
//                            TBaseTrack(bObj).PosX,
//                            TBaseTrack(bObj).PosY);
//
//      bearing := CalcBearing(SimManager.Sigma.PosX,
//                          SimManager.Sigma.PosY,
//                          TBaseTrack(bObj).PosX,
//                          TBaseTrack(bObj).PosY);
//
//      with SimManager.Sigma do
//      begin
//        rec.ShipID := ObjectIndex;
//        Rec.mLauncherID      := FTetralLauncher[1].LauncherNumber;
//        Rec.mMissileID       := FTetralLauncher[1].getMisiileNumber;
//        Rec.mMissileNumber   := 1;
//        Rec.OrderID          := 1;
//
//        Rec.mTargetBearing   := ValidateDegree(Bearing + ActHeading);
//        Rec.mTargetRange     := ((Range * C_DataMile_To_NauticalMile) * C_NauticalMile_To_Metre);
//        Rec.mTargetElev      := FTetralLauncher[1].Elevasi;
//
//        Rec.mWeaponID        := C_DBID_TETRAL;
//      end;
//
//      case SimManager.ProjectMode of
//        prjTpNFS :
//        begin
//          SimManager.netSendLaunchTetral(rec);
//        end;
//
//        prjTpTCMS :
//        begin
//          LaunchMissileTetral(1,SimManager.Sigma.FTetralLauncher[1].TargetObject);
//        end;
//      end;
//    end
//    else
//      SimManager.Sigma.FTetralLauncher[1].TargetObject := nil;
//  end;
//
//  if word='PK3OFF' then begin
//    case SimManager.ProjectMode of
//      prjTpNFS :
//      begin
//        Fire76(C_76_BALLISTIC_LOW, ORD_CANNON_76_STOP_F, C_MODE_SURF,0,0);
//      end;
//
//      prjTpTCMS :
//      begin
//        MessageHandle.Send_Fire76(rec76, CPID_STOP76);
//      end;
//    end;
//  end;
//
//  if word='PK3ON' then begin
//
//    case SimManager.ProjectMode of
//      prjTpNFS :
//      begin
//        if SimManager.Sigma.Gun76mm.GunConnection = gcNGS then begin
//          case SimManager.Sigma.Gun76mm.BallisticType of
//            btHigh:begin
//              Fire76(C_76_BALLISTIC_HIGH, ORD_CANNON_76_START_F, C_MODE_NGS,0,0);
//            end;
//            btLow: begin
//              Fire76(C_76_BALLISTIC_LOW, ORD_CANNON_76_START_F, C_MODE_NGS,0,0);
//            end;
//          end;
//        end
//        else begin
//          case SimManager.Sigma.Gun76mm.BallisticType of
//            btHigh:begin
//              Fire76(C_76_BALLISTIC_HIGH, ORD_CANNON_76_START_F, C_MODE_SURF,0,0);
//            end;
//            btLow: begin
//              Fire76(C_76_BALLISTIC_LOW, ORD_CANNON_76_START_F, C_MODE_SURF,0,0);
//            end;
//          end;
//        end;
//      end;
//
//      prjTpTCMS :
//      begin
//        MessageHandle.Send_Fire76(rec76, CPID_FIRE76);
//      end;
//    end;
//  end;
//
//  if word='PK4' then begin
//      FireExocet;
//  end;
//end;

{$ENDREGION}

procedure TPtkReceiver.NetPdkReceive(word: string);
var
  data : string;
begin
  word := CleanIncoming(word);
  data := Trim(word);
  data := StringReplace(data, #13, '', [rfReplaceAll]);
  data := StringReplace(data, #10, '', [rfReplaceAll]);

  if Assigned(FOnPtkCommand) then
    FOnPtkCommand(data);
//
//  case word of
//
//    'btn_NS':
//      begin
//
//      end;
//    'btn_NN':
//      begin
//
//      end;
//    'btn_4':
//      begin
//
//      end;
//    'btn_5':
//      begin
//
//      end;
//    'btn_N1':
//      begin
//
//      end;
//    'btn_N2':
//      begin
//
//      end;
//    'btn_N3':
//      begin
//
//      end;
//    'btn_NDot':
//      begin
//
//      end;
//    'btn_NUp':
//      begin
//
//      end;
//    'btn_NBackspace':
//      begin
//
//      end;
//    'btn_N4':
//      begin
//
//      end;
//    'btn_N5':
//      begin
//
//      end;
//    'btn_N6':
//      begin
//
//      end;
//    'btn_NPlus':
//      begin
//
//      end;
//    'btn_NDown':
//      begin
//
//      end;
//    'btn_NDel':
//      begin
//
//      end;
//    'btn_N7':
//      begin
//        keybd_event(VK_NUMPAD7,0,0,0);
//      end;
//    'btn_N8':
//      begin
//
//      end;
//    'btn_N9':
//      begin
//
//      end;
//    'btn_NMinus':
//      begin
//
//      end;
//    'btn_NEnter':
//      begin
//
//      end;
//    'btn_23':
//      begin
//
//      end;
//    'btn_NLeft':
//      begin
//
//      end;
//    'btn_N0':
//      begin
//
//      end;
//    'btn_NRight':
//      begin
//
//      end;
//    'btn_27':
//      begin
//
//      end;
//    'btn_NCancel':
//      begin
//
//      end;
//    'btn_NConfirm':
//      begin
//
//      end;
//
//  end;
//
//  {$REGION 'TRAIN'}
//  //*************************************************  TRAIN *************************************************
//
//  // Create Object
//  if word= '6_11' then begin
//
//
//  end
//
//  // Launch Weapon
//  else if word= '6_12' then begin
//
//  end
//
//  // Edit Object
//  else if word ='6_16' then begin
//
//
//  end
//
//  // Delete Object
//  else if word ='6_21' then begin
//
//  end
//
//  {$ENDREGION}
//
//  {$REGION 'STING-EO'}
//
//  //*************************************************  STING-EO *************************************************
//  {icha  -JOY TO LIROD}
//  else if word = '6_25' then //7_11
//  begin
//
//  end
//
//  // Desig Lirod
//  else if word = '6_15' then begin //7_16
//
//  end
//
//  {SRV LIROD}
//  else if word = '6_19' then  //7_17
//  begin
//
//
//  end
//
//  {
//  //OTO LIROD
//  else if word = '7_18' then    // who's OTO?
//  begin
//
//    recLirod := SimManager.Sigma.LIROD_MK2.GetDataLirod;
//    recLIROD.MocControling  := VConsoleIdent.ConsoleName;
//    MessageHandle.Send_Data_LIROD(recLIROD);
//
//  end
//  }
//
//  // Break Lirod
//  else if word = '6_20' then // 7_21
//  begin
//
//  end
//
//  // SS LIROD
//  else if word = '6_14' then //7_22
//  begin
//
//  end
//
//  // Auto Track
//  else if word = '6_18' then //7_23
//  begin
//
//  end
//
//  // KILL
//  else if (word = '6_26') or (word = '9_26') or (word = '10_26') then  //7_26
//  begin
//
//  end
//
//  // MISS
//  else if (word = '6_27') or (word = '9_27') or (word = '10_27') then // 7_27
//  begin
//
//  end
//
//  {$ENDREGION}
//
//  {$REGION 'VLMICA'}
//  //************************************************* VLMICA *************************************************
//
//  // VLMICA DESIG //
//
//  else if (word = '10_13') then begin
//
//
//  end
//
//  // VLMICA BREAK //
//
//  // Tetral Brkfwd & Brkaft
//  else if (word = '10_18') then begin
//
//  end
//
//  {$ENDREGION}
//
//  {$REGION 'GUN76'}
//  // Desig 76mm
//  else if word = '10_11' then begin
//
//  end
//
//  // Break 76mm
//  else if word = '10_16' then begin
//
//  end
//  {$ENDREGION}
//
//  {$REGION 'Anti Air Warfare'}
//
//  // Advice Air
//  else if word = '10_28' then begin
//
//  end
//  // Include AAW/EW
//  else if word = '10_25' then begin
//
//
//  end
//  // Exclude AAW/EW
//  else if word = '10_30' then begin
//
//
//
//  end
//
//  {$ENDREGION}
//
//  {$REGION 'MISCS'}
//  //************************************************* MISCS *************************************************
//
//  // Inhibit Fire
//  else if (word = '1_32') or (word = '6_32') or (word = '10_32') then begin
//
//  end
//
//  // CC Object  Close control object cc obj
//  else if word = '6_13' then
//  begin
//
//
//  end
//
//  //Track Monitor Request
//  else if(word = '1_34') or (word = '3_34') or (word = '5_34') then
//  begin
//
//  end;
//
//  {$ENDREGION}
//
//
//  {$REGION 'PROTECTED KEYS'}

  //************************************************* PK *************************************************
//
//  if word='PK1' then begin
//
//
//  end;
//
//  if word='PK2' then begin
//
//  end;
//
//  if word='PK3OFF' then begin
//
//  end;
//
//  if word='PK3ON' then begin
//
//
//  end;
//
//  if word='PK4' then begin
//
//  end;

//  {$ENDREGION}

end;

procedure TPtkReceiver.UpdateHandler;

begin



//    // tetral aft on = tetaft1, off = tetaft0
//    if FTetralLauncher[1].IsPowerOnPK then
//    begin
//      SimManager.ServerPDK.Send(PDK_TETAFT_ON);
//    end
//    else
//    begin
//      SimManager.ServerPDK.Send(PDK_TETAFT_OFF);
//    end;
end;

end.
