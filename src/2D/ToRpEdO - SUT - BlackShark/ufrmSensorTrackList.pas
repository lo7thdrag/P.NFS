unit ufrmSensorTrackList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TfrmSensorTrackList = class(TForm)
    pnlMain: TPanel;
    lblNumberofTracks: TLabel;
    Label1: TLabel;
    lvTracklistNumber: TListView;
    lblClose: TLabel;
    lblSensor: TLabel;
    lblCAS: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSensorTrackList: TfrmSensorTrackList;

implementation

{$R *.dfm}

end.
