unit ufrmTorpedoVerticalView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.OleServer, MapXLib_TLB;

type
  TfrmTorpedoVerticalView = class(TForm)
    pnlMain: TPanel;
    edtMaxDepth: TEdit;
    edtMinDepth: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    edtStopDistance: TEdit;
    edtStartDistance: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    RadioGroup2: TRadioGroup;
    Label5: TLabel;
    lblRuntime: TLabel;
    Label7: TLabel;
    lblRunLength: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    lblApproachTime: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    lblApproachLength: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    lbl1: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    lblSearchLength: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    lblOwnShipwireLeft: TLabel;
    Label19: TLabel;
    lblBatteryCapacity: TLabel;
    lblBatteryCapacity1: TLabel;
    Label21: TLabel;
    lbl2: TLabel;
    lblToSoRange: TLabel;
    Label22: TLabel;
    lblClose: TLabel;
    Panel3: TPanel;
    Graphic1: TGraphic;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoVerticalView: TfrmTorpedoVerticalView;

implementation

{$R *.dfm}

end.
