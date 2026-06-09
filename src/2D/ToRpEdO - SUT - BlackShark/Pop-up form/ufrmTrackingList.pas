unit ufrmTrackingList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTrackListNumber = class(TForm)
    pnlMain: TPanel;
    lblNumberofTracks: TLabel;
    lvTracklistNumber: TListView;
    lblReset: TLabel;
    lblClose: TLabel;
    lblNumber: TLabel;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrackListNumber: TfrmTrackListNumber;

implementation

{$R *.dfm}

end.
