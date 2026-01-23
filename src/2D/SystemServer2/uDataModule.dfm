object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 294
  Width = 429
  object EmuConn: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    HostName = '192.168.1.122'
    Port = 3306
    Database = 'dbNSuFs_Armabar'
    User = 'root'
    Password = 'admin'
    Protocol = 'mysql-5'
    Left = 32
    Top = 16
  end
  object DS: TZQuery
    Connection = EmuConn
    Params = <>
    Left = 32
    Top = 88
  end
end
