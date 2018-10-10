unit TabUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseFormUnit1, System.ImageList,
  Vcl.ImgList, Vcl.Menus, System.Actions, Vcl.ActnList, JvFormPlacement,
  JvComponentBase, JvAppStorage, JvAppRegistryStorage, Vcl.ComCtrls,
  JvExComCtrls, JvStatusBar, Vcl.ToolWin, JvToolBar, JvComCtrls;

type
  TTabForm = class(TBaseForm)
    Pages: TJvPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TabForm: TTabForm;

implementation

{$R *.dfm}

end.
