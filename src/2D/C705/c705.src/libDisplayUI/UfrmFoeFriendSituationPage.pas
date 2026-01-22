unit UfrmFoeFriendSituationPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AdvPageControl, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.pngimage;

type
  TfrmFoeFriendSituationPage = class(TForm)
    {$REGION 'Components'}
    advpgcFunctionMenuFoe: TAdvPageControl;
    advtsSituation: TAdvTabSheet;
    advtsFireDistr: TAdvTabSheet;
    advtsMInfo: TAdvTabSheet;
    advtsParSetting: TAdvTabSheet;
    advtsChSelect: TAdvTabSheet;
    advtsMControl: TAdvTabSheet;
    advtsMMonitor: TAdvTabSheet;
    advtsINSTest: TAdvTabSheet;
    advtsLaunchData: TAdvTabSheet;
    advtsExit: TAdvTabSheet;
    pnlExitForm: TPanel;
    Bevel3: TBevel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    pnlHeaderSE: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    pnlBaseLeft_Situation: TPanel;
    pnlBaseRight_Situation: TPanel;
    pnlMap_Situation: TPanel;
    pnlBaseBtm_Situation: TPanel;
    pnlArea3B_Situation: TPanel;
    pnlArea3A_Situation: TPanel;
    pnlArea5_Situation: TPanel;
    pnlArea2_Situation: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    pnlArea1_FireDist: TPanel;
    pnlArea2_FireDist: TPanel;
    Panel5: TPanel;
    pnlArea3B_FireDist: TPanel;
    pnlArea3A_FireDist: TPanel;
    pnlArea5_FireDist: TPanel;
    pnlArea3A: TPanel;
    Image1: TImage;
    {$ENDREGION}
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure advpgcFunctionMenuFoeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFoeFriendSituationPage: TfrmFoeFriendSituationPage;

implementation

{$R *.dfm}

procedure TfrmFoeFriendSituationPage.advpgcFunctionMenuFoeChange(
  Sender: TObject);
begin
  if advpgcFunctionMenuFoe.ActivePage = advtsFireDistr then
  begin
    pnlArea3A.Visible := True;
    pnlArea3A.Parent := pnlArea3A_FireDist;
    pnlArea3A.Align := alClient;
  end
  else if advpgcFunctionMenuFoe.ActivePage = advtsSituation then
  begin
    pnlArea3A.Visible := True;
    pnlArea3A.Parent := pnlArea3A_Situation;
    pnlArea3A.Align := alClient;
  end
  else
    pnlArea3A.Visible := False;
end;

procedure TfrmFoeFriendSituationPage.FormCreate(Sender: TObject);
begin
//
end;

procedure TfrmFoeFriendSituationPage.FormShow(Sender: TObject);
begin
//
end;

procedure TfrmFoeFriendSituationPage.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {$REGION 'Panel Exit Form Enter to Exit'}
  if pnlExitForm.Visible = True then
  begin
    case Key of
      VK_ESCAPE:
        begin
          pnlExitForm.Visible := False;
          //frmWCC.KeyPreview := False;
        end;

      VK_RETURN:
        begin
          Application.Terminate;
        end;
    end;
  end;
  {$ENDREGION}

end;

{$REGION 'Tab Situation'}

{$ENDREGION}

{$REGION 'Tab Fire Distr.'}

{$ENDREGION}

{$REGION 'Tab M. Info'}

{$ENDREGION}

{$REGION 'Tab Par. Setting'}

{$ENDREGION}

{$REGION 'Tab Ch. Select'}

{$ENDREGION}

{$REGION 'Tab M. Control}

{$ENDREGION}

{$REGION 'Tab M. Monitor}

{$ENDREGION}

{$REGION 'Tab INS Test'}

{$ENDREGION}

{$REGION 'Tab Launch Data'}

{$ENDREGION}

{$REGION 'Tab Exit'}

{$ENDREGION}


end.
