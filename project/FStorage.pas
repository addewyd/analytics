unit FStorage;
interface

  uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
    Vcl.Forms, Registry
;


implementation

procedure SaveFormStateToReg(aForm: TForm);
var
  Reg: TRegistry;
  AppTitle: String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    AppTitle := Application.Title;
    if AppTitle = '' then
      AppTitle := 'My application';
    Reg.OpenKey('\Software\' + AppTitle + '\' + aForm.Name, True);
    with aForm do
    begin
      Reg.WriteInteger('WindowState', Integer(WindowState));
      Reg.WriteInteger('Left', Left);
      Reg.WriteInteger('Top', Top);
      Reg.WriteInteger('Width', Width);
      Reg.WriteInteger('Height', Height);
    end;
  finally
    Reg.Free;
  end;
end;
 
procedure SaveAllAppForms;
var
  I: Integer;
begin
  for I := 0 to Screen.FormCount - 1 do
    SaveFormStateToReg(Screen.Forms[I]);
end;
 
procedure CheckFormPlacement(aForm: TForm);
var
  Rct: TRect;
begin
  //Получаем размер рабочей области
  SystemParametersInfo(SPI_GETWORKAREA, 0, @Rct, 0);
  //Проверяем размеры формы чтобы небыли большими от размеров рабочей области
  if aForm.Left + aForm.Width > Rct.Right then    //ширина
    aForm.Left := Rct.Right - aForm.Width;
  if aForm.Top + aForm.Height > Rct.Bottom then   //высота
    aForm.Top := Rct.Bottom - aForm.Height;
  //Проверяем чтобы вся форма находилась в рабочей области
  if aForm.Left < Rct.Left then                   //левая сторона
    aForm.Left := Rct.Left;
  if aForm.Top < Rct.Top then                     //верхняя сторона
    aForm.Top := Rct.Top;
  if aForm.Width > Rct.Right then                 //правая сторона
    aForm.Width := Rct.Right;
  if aForm.Height > Rct.Bottom then               //нижняя сторона
    aForm.Height := Rct.Bottom;
end;
 
procedure LoadFormStateFromReg(aForm: TForm; const aCheckPlacement: Boolean);
var
  Reg: TRegistry;
  AppTitle: String;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    AppTitle := Application.Title;
    if AppTitle = '' then
      AppTitle := 'My application';
    if Reg.OpenKeyReadOnly('\Software\' + AppTitle + '\' + aForm.Name) then
      with aForm do
      begin
        WindowState := TWindowState(Reg.ReadInteger('WindowState'));
        if WindowState = wsNormal then
        begin
          Left := Reg.ReadInteger('Left');
          Top := Reg.ReadInteger('Top');
          Width := Reg.ReadInteger('Width');
          Height := Reg.ReadInteger('Height');
        end;
      end;
  finally
    Reg.Free;
    if aCheckPlacement and (aForm.WindowState = wsNormal) then
      CheckFormPlacement(aForm);
  end;
end;

end.
