unit uConfiguracoes;

interface

uses
 Forms, IniFiles, SysUtils, Messages, Windows;

procedure tbLoadFormStatus(Form: TForm; const Section: string);
procedure tbSaveFormStatus(Form: TForm; const Section: string);

implementation

procedure tbSaveFormStatus(Form: TForm; const Section: string);
var
 Ini: TIniFile;
 Maximized: boolean;
begin
 Ini := TIniFile.Create(ChangeFileExt(ExtractFilePath(ParamStr(0)) + '\' + ExtractFileName(ParamStr(0)), '.ini'));
 try
  Maximized := Form.WindowState = wsMaximized;
  Ini.WriteBool(Section, 'Maximized', Maximized);
  if not Maximized then begin
    Ini.WriteInteger(Section, 'Left', Form.Left);
    Ini.WriteInteger(Section, 'Top', Form.Top);
    Ini.WriteInteger(Section, 'Width', Form.Width);
    Ini.WriteInteger(Section, 'Height', Form.Height);
   end;
 finally
  Ini.Free;
 end;
end;

procedure tbLoadFormStatus(Form: TForm; const Section: string);
var
 Ini: TIniFile;
 Maximized: boolean;
begin
 Maximized := false; { Evita msg do compilador }
 Ini := TIniFile.Create(ChangeFileExt(ExtractFilePath(ParamStr(0)) + '\' + ExtractFileName(ParamStr(0)), '.ini'));
 try
  Maximized := Ini.ReadBool(Section, 'Maximized', Maximized);
  Form.Left := Ini.ReadInteger(Section, 'Left', Form.Left);
  Form.Top := Ini.ReadInteger(Section, 'Top', Form.Top);
  Form.Width := Ini.ReadInteger(Section, 'Width', Form.Width);
  Form.Height := Ini.ReadInteger(Section, 'Height', Form.Height);
  if Maximized then
   Form.Perform(WM_SIZE, SIZE_MAXIMIZED, 0);
  { A propriedade WindowState apresenta Bug.
  Por isto usei a mensagem WM_SIZE }
 finally
  Ini.Free;
 end;
end;
{ Em cada formul�rio que deseja salvar/restaurar:
- Inclua na se��o uses: uFormFunc
- No evento OnShow digite:
tbLoadFormStatus(Self, Self.Name);
- No evento OnClose digite:
tbSaveFormStatus(Self, Self.Name);}
{Observa��es
O arquivo INI ter� o nome do execut�vel e extens�o INI e ser� salvo no diret�rio do Windows.
A palavra Self indica o Form relacionado com a unit em quest�o. Poderia ser, por exemplo, Form1, Form2, etc.
Onde aparece Self.Name poder� ser colocado um nome a sua escolha. Este nome ser� usado como SectionName no
arquivo INI e deve ser id�ntico no evento OnShow e OnClose de um mesmo Form, por�m para cada Form dever� ser
usado um nome diferente.}

end.

