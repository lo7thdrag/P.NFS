unit ufrmTorpedoAllocation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, AdvPageControl;

type
  TfrmTorpedoAllocation = class(TForm)
    pnlMain: TPanel;
    AdvPageTorpedoAllocation: TAdvPageControl;
    AdvEngage: TAdvTabSheet;
    AdvRealloc: TAdvTabSheet;
    AdvTransfer: TAdvTabSheet;
    AdvTerminate: TAdvTabSheet;
    AdvfireRel: TAdvTabSheet;
    pnlEngage: TPanel;
    Panel6: TPanel;
    Label1: TLabel;
    lblToTarget: TLabel;
    pnlEngagementAnalysisStart: TPanel;
    Label2: TLabel;
    lblEngagementAnalysisStarted: TLabel;
    imgAllocation2: TImage;
    imgAllocation1: TImage;
    imgAllocation4: TImage;
    imgAllocation3: TImage;
    imgAllocation6: TImage;
    imgAllocation5: TImage;
    imgAllocation8: TImage;
    imgAllocation7: TImage;
    lbl1: TLabel;
    rbMSI01: TRadioButton;
    Label3: TLabel;
    rbSonar: TRadioButton;
    Label4: TLabel;
    rbMSI02: TRadioButton;
    Label5: TLabel;
    RadioButton4: TRadioButton;
    lblSonar05: TLabel;
    rbMSI03: TRadioButton;
    Label7: TLabel;
    lblAllocate: TLabel;
    Label8: TLabel;
    lvReallocation: TListView;
    Label9: TLabel;
    Label10: TLabel;
    lbltarget: TLabel;
    Label11: TLabel;
    lblNumberToTarget: TLabel;
    Label12: TLabel;
    cbReallocate: TComboBox;
    Label13: TLabel;
    rbReallocateMSI01: TRadioButton;
    rbReallocateSonar04: TRadioButton;
    Label14: TLabel;
    Label15: TLabel;
    rbReallocateMSI02: TRadioButton;
    rbReallocateSonar05: TRadioButton;
    Label16: TLabel;
    Label17: TLabel;
    rbReallocateMSI03: TRadioButton;
    Label18: TLabel;
    lblReallocate: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    cbTorpInSalvo: TComboBox;
    Label21: TLabel;
    ComboBox1: TComboBox;
    chkReserveFunctions: TCheckBox;
    Label6: TLabel;
    lblReset: TLabel;
    lblClose: TLabel;
    lblRemoveTorpedo: TLabel;
    lblChangeTorpedo: TLabel;
    Label22: TLabel;
    lvTransfer: TListView;
    Label23: TLabel;
    Label24: TLabel;
    lblTargetTransfer: TLabel;
    Label25: TLabel;
    lblSalvoTransfer: TLabel;
    Label26: TLabel;
    rbTransferMSI01: TRadioButton;
    rbTransferSonar04: TRadioButton;
    Label27: TLabel;
    Label28: TLabel;
    rbTransferMSI02: TRadioButton;
    rbTransferSonar05: TRadioButton;
    Label29: TLabel;
    Label30: TLabel;
    rbTransferMSI03: TRadioButton;
    Label31: TLabel;
    lblTransferTorpedoSalvo: TLabel;
    Label32: TLabel;
    lvTermination: TListView;
    lblTerminateAllocation: TLabel;
    Label33: TLabel;
    lblTargetTerminate: TLabel;
    Label35: TLabel;
    cbTorpedoTerminate: TComboBox;
    lblSwitchRunToOff: TLabel;
    lblDeleteSalvoInfo: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Panel1: TPanel;
    imgFireRelease2: TImage;
    imgFireRelease1: TImage;
    imgFireRelease4: TImage;
    imgFireRelease3: TImage;
    imgFireRelease6: TImage;
    imgFireRelease5: TImage;
    imgFireRelease8: TImage;
    imgFireRelease7: TImage;
    Panel2: TPanel;
    lblReleaseAll: TLabel;
    lblAllocationStatus1: TLabel;
    lblAllocationStatus2: TLabel;
    lblAllocationStatus3: TLabel;
    lblAllocationStatus7: TLabel;
    lblAllocationStatus8: TLabel;
    lblAllocationStatus4: TLabel;
    lblAllocationStatus6: TLabel;
    lblAllocationStatus5: TLabel;
    Label34: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTorpedoAllocation: TfrmTorpedoAllocation;

implementation

{$R *.dfm}

end.
