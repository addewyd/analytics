program ShrfsPFC;

{$APPTYPE CONSOLE}
{$Define console}

{$R *.res}

uses
  System.SysUtils, System.Classes,
  XmlParseUnit in '..\project\XmlParseUnit.pas',
  DmConUnit in 'DmConUnit.pas';

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
