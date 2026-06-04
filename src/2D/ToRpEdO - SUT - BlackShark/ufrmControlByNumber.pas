unit ufrmControlByNumber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, RzPanel,
  RzRadGrp;

type
  TfrmControlByNumber = class(TForm)
    pnlMain: TPanel;
    lblApply: TLabel;
    lblClose: TLabel;
    rdControlBynumber: TRadioGroup;
    btnMSITNo: TRadioButton;
    RadioButton1: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtTrackNo: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControlByNumber: TfrmControlByNumber;

implementation

{$R *.dfm}

end.
