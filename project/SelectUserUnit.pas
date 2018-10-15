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
begin
  FDQuery.Locate('id', combo.LookupValue, []);
  uid := FDQuery.FieldByName('id').AsInteger;
  urole := FDQuery.FieldByName('urole').AsInteger;
  login := FDQuery.FieldByName('login').AsString;
  fio := FDQuery.FieldByName('fio').AsString;
  Action := caFree;
end;

end.
