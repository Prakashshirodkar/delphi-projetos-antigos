{----------------------------------------------------------------
 Nome: UntwIRCCanal
 Descri��o: Descendente do form TwIRCSecao.
 Especializa��o: Form para comunica��o em salas(canais) na rede
IRC. 
 M�todos:
  -procedure AdNick(Nick: string); Adicina Nick a lista
  -procedure RmNick(Nick: string); Remove um nick da lista

 Propriedades:
  -Canal: string que designa o canal que est� conectado
  -Topico: string que guarda o t�pico do canal
 ----------------------------------------------------------------}
unit UntwIRCCanal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UntwIRCSecao, Menus, StdCtrls, IRCUtils, FatThings;

type
  TwIRCCanal = class(TwIRCSecao)
    LsbNicks: TListBox;
    procedure CmdTextoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LsbNicksDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    Canal: string;
    Topico: string;
    procedure AdNick(Nick: string);
    procedure RmNick(Nick: string);
  end;

var
  wIRCCanal: TwIRCCanal;

implementation

uses UntComandos, Untprincipal;

{$R *.DFM}

procedure TwIRCCanal.AdNick(Nick: string);
var
  IndiceA, IndiceB: integer;

begin
  {S� adiciona o nick se ele n�o estiver adicionado}
  IndiceA:=LsbNicks.Items.IndexOf(Nick);
  IndiceB:=LsbNicks.Items.IndexOf(NickReal(Nick)); {Testa sem os atributos}
  if ((IndiceA < 0) or (IndiceB < 0)) then
    LsbNicks.Items.Add(Nick);
end;

procedure TwIRCCanal.RmNick(Nick: string);
var {Remove nick da lista}
  Contador: integer;

begin
  for Contador:=0 to LsbNicks.Items.Count - 1 do
    if (NickReal(LsbNicks.Items.Strings[Contador]) = NickReal(Nick)) then
    begin
      LsbNicks.Items.Delete(Contador);
      break;
    end;
end;

procedure TwIRCCanal.CmdTextoKeyPress(Sender: TObject; var Key: Char);
var {Envia menssagem para a se��o atual (PVT ou Canal)}
  Texto: string;

begin
  if (Key = #13) then
  begin
    if (FrmPrincipal.EstIRC = eiDesconectado) then
    begin {Caso n�o esteja conectado a menssagem n�o pode ser enviada}
      AdLinha('N�o conectado!');
      CmdTexto.Text:='';
    end
    else
      if (Length(CmdTexto.Text) > 0) then
      begin
        Texto:=CmdTexto.Text;
        AdLinha('[MeuNick] ' + Texto); {TEMP}
        PvtMsg(Canal, Texto); {Envia menssagem para seu destino}
        CmdTexto.Text:='';
      end;
    FrmPrincipal.RolarTexto(Self.MemTexto);
    Abort; {Nesess�rio para n�o produzir um beep do Windows(blergh!)}
  end;
end;

procedure TwIRCCanal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  PartCha(Canal);
end;

procedure TwIRCCanal.FormShow(Sender: TObject);
begin
  inherited; {Redimenciona todos os componentes para posi��o adequada no form}
  LsbNicks.Left:=ClientWidth - LsbNicks.Width;
  CmdTexto.Top:=ClientHeight - 23;
  CmdTexto.Width:=ClientWidth;
  MemTexto.Width:=ClientWidth - LsbNicks.Width;
  MemTexto.Height:=(ClientHeight - CmdTexto.Height) - 1;
  LsbNicks.Height:=(ClientHeight - CmdTexto.Height) - 1;
end;

procedure TwIRCCanal.FormCreate(Sender: TObject);
begin
  inherited;
  FrmPrincipal.ImlIcones.GetBitmap(1, Self.Barra.Glyph);
end;

procedure TwIRCCanal.LsbNicksDblClick(Sender: TObject);
begin
  FrmPrincipal.AbrirPvt(NickReal(LsbNicks.Items.Strings[LsbNicks.ItemIndex]));
end;

end.
