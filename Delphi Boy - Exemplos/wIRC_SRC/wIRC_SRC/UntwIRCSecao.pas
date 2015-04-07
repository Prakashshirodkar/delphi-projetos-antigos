{----------------------------------------------------------------
 Nome: UntwIRCSecao
 Descri��o: Unit que cont�m a defini��o do form TwIRCSecao, que
cont�m o comportamento padr�o usado de base para constru��o dos
outros forms(wIRCPVT, wIRCCanal, wIRCStatus).
 O comportamento padr�o est� descrito abaixo:

 -Procedure AdLinha (Adicina texto a �rea de texto TMemo(MemTexto))
 -Itera��o com a BarraJanelas do form principal, que funciona como
uma barra de tarefas. O form ao ser criado adiciona uma barra ao
objeto BarraJanelas e obedece aos comandos tal como minimizar,
restaurar.

 As descri��es individuais est�o na implementa��o de cada uma.
 ----------------------------------------------------------------}
unit UntwIRCSecao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Menus, Buttons, FatThings;

type
  TwIRCSecao = class(TForm)
    CmdTexto: TEdit;
    MenuContexto: TPopupMenu;
    Limpar1: TMenuItem;
    MemTexto: TFatMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MemTextoaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MemTextoaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Estado: TWindowState;
    Ativo: boolean;
    procedure BarraClick(Sender: TObject);
    procedure Tamanho(var Menssagem: TWMSize); message WM_SIZE;
  public
    { Public declarations }
    Barra: TSpeedButton;
    procedure AdLinha(Texto: string);
  end;

var
  wIRCSecao: TwIRCSecao;

implementation

uses UntPrincipal;

{$R *.DFM}

procedure TwIRCSecao.BarraClick(Sender: TObject);
{Ativamento da barra de tarefas}
begin {Verifica se ela n�o est� desativada(minimizada)}
  if (Ativo) then
  begin {Caso ela esteja focada, ent�o ela � desativada}
    if FrmPrincipal.ActiveMDIChild = Self then
    begin {Esconde janela}
      Ativo:=false;
      ShowWindow(Self.Handle, SW_HIDE);
      FrmPrincipal.Previous;
    end
    else {D� foco}
      Self.BringToFront;
  end
  else
  begin {Mostra janela, restaurando suas caracter�sticas}
   if (Estado = wsMinimized) then
      ShowWindow(Self.Handle, SW_RESTORE)
    else
      ShowWindow(Self.Handle, SW_SHOW);

    Ativo:=true;
    Self.Perform(WM_MDIRESTORE, Self.Handle, 0);
    Self.BringToFront;
  end;
end;

procedure TwIRCSecao.FormCreate(Sender: TObject);
begin {Cria��o da barra na BarraJanelas}
  MemTexto.Lines.Clear;
  Ativo:=true;
  Barra:=TSpeedButton.Create(Self);
  with Barra do
  begin {S�o definidas suas caracter�sticas b�sicas}
    Parent:=FrmPrincipal.BarraJanelas;
    OnClick:=BarraClick; {Procedimento local para controle da barra}
    {Caracter�sticas b�sicas}
    ShowHint:=true;
    GroupIndex:=1;
    Width:=100;
    Align:=alLeft;
    Flat:=true;
    Down:=true;
    AllowAllUp:=true;
    Margin:=0;
  end;
end;

procedure TwIRCSecao.Tamanho(var Menssagem: TWMSize);
begin {Intercepta redimencionamento da janela}
  if (Menssagem.SizeType = SIZE_MINIMIZED) then
  begin {Verifica se ela foi minimizada}
    Ativo:=false; {vari�vel de controle}
    ShowWindow(Self.Handle, SW_HIDE);
    Self.Perform(WM_MDIRESTORE, Self.Handle, 0);
    FrmPrincipal.Previous;
    Barra.Down:=false;
    Estado:=wsMinimized;
  end
  else if (Menssagem.SizeType = SIZE_MAXIMIZED) then
    Estado:=wsMaximized;
  inherited;
end;

procedure TwIRCSecao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TwIRCSecao.MemTextoaMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Posicao: TPoint;

begin {N�o permite que o menu de contexto padr�o do Windows intereja}
  GetCursorPos(Posicao); {Um menu Popup � acinado na posi��o do mouse}
  if (Button = mbRight) then
    MenuContexto.Popup(Posicao.x, Posicao.y);
end;

procedure TwIRCSecao.MemTextoaMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin {Caracter�stica padr�o do mIRC}
{ MemTexto.CopyToClipboard; {Para copiar um texto basta seleciona-lo
  MemTexto.SelLength:=0;
  CmdTexto.SetFocus;}
end;

procedure TwIRCSecao.AdLinha(Texto: string);
begin
  MemTexto.Lines.AddLineWithIrcTags(Texto);
  FrmPrincipal.RolarTexto(MemTexto);
end;

procedure TwIRCSecao.FormActivate(Sender: TObject);
begin
  Barra.Down:=true;
end;

end.
