program ShrfsPFC;

{$APPTYPE CONSOLE}
{$Define console}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.Variants,
  System.Types,
  System.IOUtils,
  XmlParseUnit in '..\project\XmlParseUnit.pas',
  Xml.xmldom,
  Xml.XMLIntf,
  Xml.XMLDoc,
  IniFiles,
  DmConUnit in 'DmConUnit.pas';

var
  dir, ifname, exepath, reportsdir, azs: String;
  files: TStringDynArray;
  i, len: Integer;
  Doc: IDOMDocument;
  XMLDoc: TXMLDocument;

  inifile: TIniFile;

begin

  try
    exepath := ExtractFilePath(ParamStr(0));
    ifname := Exepath + 'ShrfsPFC.ini';

    azs := ParamStr(1);

    inifile := TIniFile.Create(ifname);

    dbname := inifile.ReadString('conf', 'dbname', '');
    reportsdir := inifile.ReadString('conf', 'reportsdir', '');
    clientdll := inifile.ReadString('conf', 'clientdll', '');
    db_user := inifile.ReadString('conf', 'db_user', 'SYSDBA');
    db_pass := inifile.ReadString('conf', 'db_pass', 'electro');
    host := inifile.ReadString('conf', 'host', 'localhost');
    dbport := inifile.ReadInteger('conf', 'dbport', 3050);

    embed := false;

    DM := TDM.Create(nil);
    try
      DM.FDConnection.Open();
      user_id := 1;

      dir := reportsdir + '\' + azs;
      XMLDoc := TXMLDocument.Create(nil);

      files := TDirectory.GetFiles(dir, 'CloseS*.xml',
        TSearchOption.soTopDirectoryOnly);
      len := Length(files);
      for i := 0 to len - 1 do
      begin
        try
          CurrentFile := files[i];
          XMLDoc.LoadFromFile(files[i]);
          Doc := XMLDoc.DOMDocument;
          ParseInputFile(Doc, true);

        except
          on e: Exception do
          begin
            Addtolog(e.Message);
          end;

        end;

      end;
    finally
      DM.Free;
      inifile.Free;
    end;
  except
    on e: Exception do
      Writeln(e.ClassName, ': ', e.Message);
  end;

end.
