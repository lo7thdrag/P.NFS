unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  ZAbstractConnection, ZConnection,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

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

function TdmMain.GetStatusconDB: Boolean;
begin
  Result := EmuConn.Connected;
end;

end.
