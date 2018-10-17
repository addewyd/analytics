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
{$Include 'consts.inc'}

type
  TSessionListForm = class(TFormWithGrid)
    QuerySST: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure JvDBGridDblClick(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetStartSession: String;
    procedure sessionadded(var Msg: TMessage); message WM_SESSION_ADDED;
    procedure PrepareAndLoad;
  end;

var
  SessionListForm: TSessionListForm;

implementation

{$R *.dfm}

uses HttpServiceUnit, MainUnit, TabUnit, BaseFormUnit1;


procedure TSessionListForm.PrepareAndLoad;
var
  sst: String;
begin
  sst := GetStartSession;
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
        with Add do
        begin
          Name := 'sst';
          DataType := ftString;
          ParamType := ptInput;
        end;
    end;
    ParamByName('azs').AsString := current_azscode;
    ParamByName('sst').AsString := sst;
  end;
  inherited;
  LoadData;
  JvDBGrid.Refresh;

end;


procedure TSessionListForm.FormCreate(Sender: TObject);
begin
  inherited;
  PrepareAndLoad;
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

procedure TSessionListForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  PrepareAndLoad;
end;

// .............................................................................

function TSessionListForm.GetStartSession: String;
begin
  result := '2000-01-01 00:00:00';
  // last_sessions_count
  try
    with QuerySST do
    begin
      Transaction.StartTransaction;
      with Params do
      begin
        Clear;
        with Add do
        begin
          Name := 'cnt';
          DataType := ftInteger;
          ParamType := ptInput;
        end;
        with Add do
        begin
          Name := 'azs';
          DataType := ftString;
          ParamType := ptInput;
        end;
      end;
      ParamByName('cnt').AsInteger := last_sessions_count;
      ParamByName('azs').AsString := current_azscode;
      Prepare;
      Open;
      First;
      if not Eof then
      begin
        // First;
        result := FieldByName('startdatetime').AsString;
      end;

      Close;
      Transaction.Commit;
    end;
  except
    on e: Exception do
    begin
      QuerySST.Transaction.Rollback;
      AddToLog(e.Message);
    end;

  end;

end;

// .............................................................................

procedure TSessionListForm.sessionadded(var Msg: TMessage);
begin
  AddToLog('SESSIONADDED');
  PrepareAndLoad;
end;


end.
