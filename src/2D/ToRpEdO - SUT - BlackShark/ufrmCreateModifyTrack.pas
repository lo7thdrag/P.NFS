unit ufrmCreateModifyTrack;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmCreateModifyTrack = class(TForm)
    pnlMain: TPanel;
    lbl1: TLabel;
    edtTrackNo: TEdit;
    Label1: TLabel;
    lblSource: TLabel;
    Label2: TLabel;
    cbTrackType: TComboBox;
    Label3: TLabel;
    cbCategory: TComboBox;
    Label4: TLabel;
    cbIdentity: TComboBox;
    Label5: TLabel;
    cbPlatform: TComboBox;
    Label6: TLabel;
    cbType: TComboBox;
    Label7: TLabel;
    cbActivity: TComboBox;
    Label8: TLabel;
    Label9: TLabel;
    cbSubmarineConf: TComboBox;
    Label10: TLabel;
    cbDataReport: TComboBox;
    Label11: TLabel;
    cbEstimatedDepth: TComboBox;
    cbPositionFormat: TComboBox;
    Label12: TLabel;
    edtbearing: TEdit;
    Label13: TLabel;
    Edit1: TEdit;
    cbRange: TComboBox;
    Label14: TLabel;
    edtCourse: TEdit;
    Edit3: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    edtSpeed: TEdit;
    Label17: TLabel;
    edtDepth: TEdit;
    Label18: TLabel;
    edtError: TEdit;
    Label19: TLabel;
    edtFreeText: TEdit;
    lblApply: TLabel;
    lblReselect: TLabel;
    lblReset: TLabel;
    lblClose: TLabel;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreateModifyTrack: TfrmCreateModifyTrack;

implementation

{$R *.dfm}

end.
