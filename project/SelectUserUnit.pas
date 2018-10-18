unit SelectUserUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBLookup, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, JvDataSource, JvExStdCtrls, JvCombobox, JvDBCombobox,
  JvDBLookupComboEdit;

type
  TSelectUser = class(TForm)
    OkButton: TButton;
    CancelButton: TButton;
    ds: TJvDataSource;
    FDQuery: TFDQuery;
    combo: TJvDBLookupEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    uid: Integer;
    urole: Integer;
    login, fio: String;
  end;

var
  SelectUser: TSelectUser;

implementation

{$R *.dfm}

uses DmUnit;

procedure TSelectUser.FormClose(Sender: TObject; var Action: TCloseAction);
var
  id: integer;
begin
  uid := -1;
  id := StrToIntDef(combo.LookupValue, uid);

  if id > 0 then with FDQuery do
  begin
    if Eof then
    begin
  //    uid := -1;
    end
    else
    begin
      uid := FieldByName('id').AsInteger;
      urole := FieldByName('urole').AsInteger;
      login := FieldByName('login').AsString;
      fio := FieldByName('fio').AsString;
    end;
  end;
  Action := caFree;
end;

procedure TSelectUser.FormCreate(Sender: TObject);
begin
  FDQuery.Transaction.StartTransaction;
  FDQuery.Open();
  FDQuery.First;
  combo.Refresh;
end;

end.
