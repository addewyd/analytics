unit SessionListUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DmUnit, FormWithGridUnit, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions,
  Vcl.ActnList, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, JvDBGridFooter, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar,
  JvDBUltimGrid;

type
  TSessionListForm = class(TFormWithGrid)
    procedure FormCreate(Sender: TObject);
    procedure JvDBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SessionListForm: TSessionListForm;

implementation

{$R *.dfm}

uses HttpServiceUnit, MainUnit, TabUnit, BaseFormUnit1;


procedure TSessionListForm.FormCreate(Sender: TObject);
begin
  inherited;
  //MainMenu.Items[0].Caption := formname;
  with FDQuery do
  begin
    with Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'azs';
        DataType := ftString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('azs').AsString := current_azscode;
  end;
  LoadData;
  JvDBGrid.Refresh;
end;

// .............................................................................

procedure TSessionListForm.JvDBGridDblClick(Sender: TObject);
  var
    tb: TForm;
begin
  inherited;
  //
    AddToLog(FDQuery.FieldByName('sessionnum').asString);

  if not MainForm.isWinOpen('tabform')
  then
  begin
    TTabForm.Create(MainForm, 'tabform', FDQuery.FieldByName('id').asInteger);
  end
  else
  begin
    tb := MainForm.GetMDIForm('tabform');
    tb.Close;
    MainForm.RemoveComponent(tb);
    TTabForm.Create(MainForm, 'tabform', FDQuery.FieldByName('id').asInteger);
    //MainForm.GetMDIForm('tabform').Show;
  end;

end;

end.
