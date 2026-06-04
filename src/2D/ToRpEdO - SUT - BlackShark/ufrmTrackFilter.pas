unit ufrmTrackFilter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmTrackFilter = class(TForm)
    pnlMain: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    cbAirTrack: TComboBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    chkOwnShipHistory: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    lblToggleSingle: TLabel;
    Label6: TLabel;
    cbHistoryLength: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    chkAir1: TCheckBox;
    chkSurface1: TCheckBox;
    chkSubsurf1: TCheckBox;
    chkAir2: TCheckBox;
    chkSurface2: TCheckBox;
    chkSubsurf2: TCheckBox;
    Label10: TLabel;
    Label11: TLabel;
    CheckBox8: TCheckBox;
    Label12: TLabel;
    CheckBox7: TCheckBox;
    Label13: TLabel;
    CheckBox9: TCheckBox;
    Label14: TLabel;
    CheckBox10: TCheckBox;
    Label15: TLabel;
    CheckBox11: TCheckBox;
    Label16: TLabel;
    CheckBox12: TCheckBox;
    Label17: TLabel;
    CheckBox13: TCheckBox;
    Label18: TLabel;
    CheckBox14: TCheckBox;
    chkAir3: TCheckBox;
    chkAir4: TCheckBox;
    chkAir5: TCheckBox;
    chkAir6: TCheckBox;
    chkAir7: TCheckBox;
    chkAir8: TCheckBox;
    chkAir9: TCheckBox;
    chkSurface3: TCheckBox;
    chkSurface4: TCheckBox;
    chkSurface5: TCheckBox;
    chkSurface6: TCheckBox;
    chkSurface7: TCheckBox;
    chkSurface8: TCheckBox;
    chkSurface9: TCheckBox;
    chkSubsurf3: TCheckBox;
    chkSubsurf4: TCheckBox;
    chkSubsurf5: TCheckBox;
    chkSubsurf6: TCheckBox;
    chkSubsurf7: TCheckBox;
    chkSubsurf8: TCheckBox;
    chkSubsurf9: TCheckBox;
    Label19: TLabel;
    chkArea: TCheckBox;
    chkSpecial: TCheckBox;
    Label20: TLabel;
    chkRim: TCheckBox;
    Label21: TLabel;
    chkRadar: TCheckBox;
    Label22: TLabel;
    chkLink: TCheckBox;
    Label23: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrackFilter: TfrmTrackFilter;

implementation

{$R *.dfm}

end.
