unit WindowListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvListBox,
  JvTextListBox;

type
  TWinListDlg = class(TForm)
    Button1: TButton;
    wlist: TJvTextListBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wlistDblClick(Sender: TObject);
    procedure wlistKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    scapt: String;
  end;

var
  WinListDlg: TWinListDlg;

implementation

{$R *.dfm}

procedure TWinListDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  scapt := 'n/a';
  if (wlist.Count > 0)  and  (wlist.ItemIndex >= 0)
    and (wlist.ItemIndex <= wlist.Count - 1) then
  begin
    scapt := wlist.Items[wlist.ItemIndex];
  end;
  Action := caFree;
end;

// .............................................................................

procedure TWinListDlg.wlistDblClick(Sender: TObject);
begin
//
  scapt := wlist.Items[wlist.ItemIndex];
  Close;

end;

// .............................................................................

procedure TWinListDlg.wlistKeyPress(Sender: TObject; var Key: Char);
begin
  wlistDblClick(sender);
end;

end.
