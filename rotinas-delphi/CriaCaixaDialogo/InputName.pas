function InputName(var Nome: string): boolean;
//
// cria uma caixa de dialogo para entrada de dados
//
// Esta fun��o retorna true se for pressionado OK e false
// em caso contr�rio. Se for OK, o texto digitado pelo usu�rio
//   ser� copiado para a vari�vel Nome
//
// Exemplo:
//
// var
//   S: string;
// begin
//   if ObterNome(S) then
//     Edit1.Text := S;
//

var
  Form: TForm; { Vari�vel para o Form }
  Edt: TEdit; { Vari�vel para o Edit }
begin
  Result := false; { Por padr�o retorna false }
  { Cria o form }
  Form := TForm.Create(Application);
  try
    { Altera algumas propriedades do Form }
    Form.BorderStyle := bsDialog;
    Form.Caption := 'Aten��o';
    Form.Position := poScreenCenter;
    Form.Width := 200;
    Form.Height := 150;
    { Coloca um Label }
    with TLabel.Create(Form) do begin
      Parent := Form;
      Caption := 'Digite seu nome:';
      Left := 10;
      Top := 10;
    end;
    { Coloca o Edit }
    Edt := TEdit.Create(Form);
    with Edt do begin
      Parent := Form;
      Left := 10;
      Top := 25;
      { Ajusta o comprimento do Edit de acordo com a largura
        do form }
      Width := Form.ClientWidth - 20;
    end;
    { Coloca o bot�o OK }
    with TBitBtn.Create(Form) do begin
      Parent := Form;
      { Posiciona de acordo com a largura do form }
      Left := Form.ClientWidth - (Width * 2) - 20;
      Top := 80;
      Kind := bkOK; { Bot�o Ok }
    end;
    { Coloca o bot�o Cancel }
    with TBitBtn.Create(Form) do begin
      Parent := Form;
      Left := Form.ClientWidth - Width - 10;
      Top := 80;
      Kind := bkCancel; { Bot�o Cancel }
    end;
    { Exibe o form e aguarda a a��o do usu�rio. Se for OK... }
    if Form.ShowModal = mrOK then begin
      Nome := Edt.Text;
      Result := true;
    end;
  finally
    Form.Free;
  end;
end;
