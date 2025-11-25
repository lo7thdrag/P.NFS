object frmPasswordEntryCode: TfrmPasswordEntryCode
  Left = 0
  Top = 0
  Caption = 'PASSWORD ENTRY CODE'
  ClientHeight = 1041
  ClientWidth = 1904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBackground: TPanel
    Left = 0
    Top = 0
    Width = 1904
    Height = 1041
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 743
      Top = 160
      Width = 417
      Height = 84
      Caption = 'FIRE CONTROL SYSTEM'#13#10'   (ANTI SUB MARINE)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -37
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 817
      Top = 264
      Width = 270
      Height = 21
      Caption = 'Silahkan Masukkan Password Anda:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
    end
    object edtPassword: TEdit
      Left = 868
      Top = 325
      Width = 169
      Height = 39
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      PasswordChar = '*'
      ShowHint = False
      TabOrder = 0
      OnChange = edtPasswordChange
      OnKeyPress = edtPasswordKeyPress
    end
    object btnOk: TButton
      Left = 868
      Top = 404
      Width = 169
      Height = 39
      Caption = 'OK'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
end
