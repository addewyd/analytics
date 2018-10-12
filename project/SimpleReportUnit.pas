unit SimpleReportUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormWithGridUnit, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  JvDataSource, System.ImageList, Vcl.ImgList, Vcl.Menus, System.Actions,
  Vcl.ActnList, JvFormPlacement, JvComponentBase, JvAppStorage,
  JvAppRegistryStorage, JvDBGridFooter, Vcl.Grids, Vcl.DBGrids, JvExDBGrids,
  JvDBGrid, Vcl.ComCtrls, JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar,
  JvDBUltimGrid;

type
  TSimpleReportForm = class(TFormWithGrid)
    ToXlsAction: TAction;
    XLS1: TMenuItem;
    procedure ToXlsActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    azscode: String;
    sdt, edt: TDate;
    constructor Create(pr: TComponent; fname, _AzsCode: String;
      _sdt, _edt: TDate); reintroduce; overload;

  end;

var
  SimpleReportForm: TSimpleReportForm;

implementation

{$R *.dfm}

uses ErrorUnit, DmUnit;

constructor TSimpleReportForm.Create(pr: TComponent; fname, _AzsCode: String;
      _sdt, _edt: TDate);
begin
  inherited create(pr, fname);
  azscode := _azscode;
  sdt := _sdt;
  edt := _edt;
end;

procedure TSimpleReportForm.FormCreate(Sender: TObject);
begin
  inherited;
//  ErrorMessageBox(self, azscode);
  JvStatusBar1.Panels[0].Text := 'ÀÇÑ ' + azscode;
  JvStatusBar1.Panels[1].Text := FormatDateTime('dd.mm.yyyy',sdt);
  JvStatusBar1.Panels[2].Text := FormatDateTime('dd.mm.yyyy',edt);
  with FDQuery do
  begin
    with Params do
    begin
      Clear;
      with Add do
      begin
        Name := 'azscode';
        DataType := ftString;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'sdt';
        DataType := ftString;
        ParamType := ptInput;
      end;
      with Add do
      begin
        Name := 'edt';
        DataType := ftString;
        ParamType := ptInput;
      end;
    end;
    ParamByName('azscode').AsString := azscode;
    ParamByName('sdt').AsString := FormatDateTime('yyyy-mm-dd', sdt) + ' 00:00:00';
    ParamByName('edt').AsString := FormatDateTime('yyyy-mm-dd', edt) + ' 23:59:59';
    Transaction.StartTransaction;
    Prepare;
    Open;
  end;
end;

procedure TSimpleReportForm.ToXlsActionExecute(Sender: TObject);
begin
  inherited;
  //
end;

end.
