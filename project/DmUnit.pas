unit DmUnit;

interface

uses
  System.SysUtils, System.Classes, System.ImageList, Vcl.ImgList, Vcl.Controls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait,
  Vcl.Forms,
  ErrorUnit;

  procedure ErrorMessageBox(f: TForm; msg: String);

type
  TDM = class(TDataModule)
    imlist: TImageList;
    FDQuery: TFDQuery;
    FDUpdateSQL: TFDUpdateSQL;
    FDCommand: TFDCommand;
    FDConnection: TFDConnection;
    FDTransaction: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


  procedure ErrorMessageBox(f: TForm; msg: String);
  begin

  ErrorForm := TErrorForm.Create(f);
          try
            ErrorForm.Memo1.Lines.Add(msg);
            ErrorForm.ShowModal;
          finally
            ErrorForm.Free;
          end;
  end;

end.
