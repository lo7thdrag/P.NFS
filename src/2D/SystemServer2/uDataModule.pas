unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  ZAbstractConnection, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, uClassDatabase;

type
  TdmMain = class(TDataModule)
    EmuConn: TZConnection;
    DS: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function InitZDB(const zDbServer, zDBProto, zDBname, zDBuser, zDBPass,
      mDBPort: string): Boolean;
    function GetStatusconDB: Boolean;
    procedure GetScenarioDefByID(const SceID: integer; var rec: TScenario);
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  //
end;

function TdmMain.InitZDB(const zDbServer, zDBProto, zDBname, zDBuser, zDBPass,
  mDBPort: string): Boolean;
begin
  Result := false;

  EmuConn.HostName := zDbServer;
  EmuConn.Port := StrToInt(mDBPort);
  EmuConn.Protocol := zDBProto;
  EmuConn.Database := zDBname;
  EmuConn.User := zDBuser;
  EmuConn.Password := zDBPass;

  try
    EmuConn.Connect;
    Result := EmuConn.Connected;
  except
  end;
end;

procedure TdmMain.GetScenarioDefByID(const SceID: integer; var rec: TScenario);
begin
  with DS do
  begin
    Close;

    SQL.Clear;
    SQL.Add('SELECT * FROM sce_main WHERE ID=' + IntToStr(SceID));

    Open;
    First;
  end;

  while not DS.Eof do
  begin
    rec.Scenario_ID := DS.FieldByName('ID').AsInteger;
    rec.Scenario_Desc := DS.FieldByName('KET').AsString;
    rec.Scenario_Port := DS.FieldByName('ENV_PETA').AsInteger;
    rec.Scenario_Building := DS.FieldByName('ENV_BUILDING').AsInteger;
    rec.Scenario_StaticShip := DS.FieldByName('ENV_SSHIPS').AsInteger;
    rec.Scenario_Buoy := DS.FieldByName('ENV_BUOY').AsInteger;
    rec.Scenario_Tree := DS.FieldByName('ENV_TREE').AsInteger;
    rec.Scenario_Theme := DS.FieldByName('ENV_THEME').AsInteger;

    rec.Scenario_WindScale := DS.FieldByName('ENV_WSCALE').AsFloat;
    rec.Scenario_WindSpeed := DS.FieldByName('ENV_WSPEED').AsFloat;
    rec.Scenario_WindDir_X := DS.FieldByName('ENV_WDIR_X').AsFloat;
    rec.Scenario_WindDir_Y := DS.FieldByName('ENV_WDIR_Y').AsFloat;
    rec.Scenario_WindDir_Deg := DS.FieldByName('ENV_WDIR_DEG').AsFloat;

    rec.Scenario_SeaState := DS.FieldByName('ENV_SEASTATE').AsFloat;

    rec.Scenario_CurrSpeed := DS.FieldByName('ENV_CURSPEED').AsFloat;
    rec.Scenario_CurrDir_X := DS.FieldByName('ENV_CURDIR_X').AsFloat;
    rec.Scenario_WindDir_Y := DS.FieldByName('ENV_CURDIR_Y').AsFloat;
    rec.Scenario_CurrDir_Deg := DS.FieldByName('ENV_CURDIR_DEG').AsFloat;

    rec.Scenario_Temperature := DS.FieldByName('ENV_TEMP').AsFloat;
    rec.Scenario_BaroPressure := DS.FieldByName('ENV_BAROPRESSURE').AsFloat;
    rec.Scenario_Humidity := DS.FieldByName('ENV_HUMIDITY').AsFloat;
    rec.Scenario_FogHeight := DS.FieldByName('ENV_FOG_H').AsFloat;
    rec.Scenario_FogHeight_Persen := DS.FieldByName('ENV_FOG_H_PERSEN').AsFloat;

    DS.Next;
  end;
end;

function TdmMain.GetStatusconDB: Boolean;
begin
  Result := EmuConn.Connected;
end;

end.
