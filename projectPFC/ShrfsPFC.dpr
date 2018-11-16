program ShrfsPFC;

{$APPTYPE CONSOLE}
{$Define console}

{$R *.res}

uses
  System.SysUtils, System.Classes,
  System.Variants, System.Types, System.IOUtils,
  XmlParseUnit in '..\project\XmlParseUnit.pas',
  Xml.xmldom, Xml.XMLIntf,
  Xml.XMLDoc,
  DmConUnit in 'DmConUnit.pas';

var
    dir: String;
    files: TStringDynArray;
    i, len: Integer;
    Doc: IDOMDocument;
    XMLDoc: TXMLDocument;

type
  PRaiseFrame = ^TRaiseFrame;
  TRaiseFrame = packed record
    NextRaise: PRaiseFrame;
    ExceptAddr: Pointer;
    ExceptObject: TObject;
    ExceptionRecord: PExceptionRecord;
  end;

begin


  DM := TDM.Create(nil);;
  user_id := 1;

  dir := 'C:\Users\user\Documents\topaz\Reports\004';
  XMLDoc := TXMLDocument.Create(nil);

  try
    files := TDirectory.GetFiles(dir, 'CloseS*.xml', TSearchOption.soTopDirectoryOnly);
    len := Length(files);
    for i := 0 to len - 1 do
    begin
      try
        CurrentFile := files[i];
        XMLDoc.LoadFromFile(files[i]);
        doc := XmlDoc.DOMDocument;
        ParseInputFile(Doc, true);

      except
        on e: Exception do
        begin
          Addtolog(e.Message);
        end;

      end;

    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
