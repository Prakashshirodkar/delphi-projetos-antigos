

  Plugin X vers�o 1.1 beta - 21/01/2004



[x] Descri��o

    Projeto de comunica��o entre uma DLL/Aplica��o 
    e uma aplica��o Servidor de Internet

[x] Funcionamento

    A biblioteca PluginX cont�m padr�es de fun��es/tipos/constantes
    que s�o usados para comunica��o entre a DLL(Plugin) e a aplica��o
    Servidor.
    Uma DLL Plugin deve conter as fun��es b�sicas LoadPlugin,
    UnloadPlugin e OnExecute para que o Servidor chame essas
    fun��es quando forem necess�rias.


* LoadPlugin/UnloadPlugin
-------------------------

* LoadPlugin
AppInfo       -> Dados que a aplica��o preenche para mandar para o Plugin
PluginInfo    -> Dados que o Plugin preenche para retornar para a aplica��o

A aplica��o Servidor na inicializa��o carrega todas fun��es das
DLLs localizadas na subpasta plugins, ao carregar cada DLL ela
executa(se houver) a fun��o LoadPlugin que tem como par�metros
os dados da aplica��o(TAppInfo) e do Plugin(TPluginInfo),
na finaliza��o da aplica��o a fun��o UnloadPlugin � executada
que pode conter qualquer c�digo que a DLL precise executar ao
ser liberada.


* OnExecute
-----------

Ao executar a fun��o OnExecute mandando os dados recebidos pelo Servidor,
a DLL processa os dados e devolve o valor processado para o par�metro
eReturn.

mWnd          -> Handle da janela principal da aplica��o
eClientThread -> Ponteiro para o Thread socket do cliente
eCmd          -> Dados recebidos pelo servidor
eReturn       -> Dados retornados pela fun��o
NoPause       -> Ainda que pode ser usado para avisar a DLL
                 que a aplica��o n�o pode ser interrompida


* Como o Plugin se comunica com a aplica��o
-------------------------------------------

Usando a API SendMessage(e n�o PostMessage) com a mensgem WM_COPYDATA.

SendMessage(HandleJanelaAplicacao, WM_COPYDATA, HandleDLL, Integer(@TCopyDataStruct));

- TCopyDataStruct:
    dwData: N�mero identificador da mensagem
    cbData: Tamanho em bytes dos dados passados em lpData
    lpData: Ponteiro para os dados a serem enviados
    * Em lpData os dados n�o devem ser qualquer tipo de Ponteiro(TObject, PChar..),
      recomendo usar sempre Array of Char ou String[255] ou records com vari�veis
      desses tipos por exemplo
    * Em dwData s�o usados valores a seguir ou outros que voc� queira criar,
      para que a aplica��o interprete:
       MSG_ERROR            - Ocorreu um erro
       APP_BROADCAST_WRITE  - Mandar texto para todos clientes
       APP_CLIENT_WRITE     - Mandar texto para um cliente
       APP_CLIENT_CLOSE     - Desconectar um cliente
       APP_CLIENT_GETCLIENT - Exibir informa��es de um cliente


* Como a aplica��o captura e interpreta as mensagens
----------------------------------------------------

- declara��o da procedure:
procedure RotinaCopyData(var msg: TWMCopyData); message WM_COPYDATA;

- c�digo:
procedure TForm.RotinaCopyData(var msg: TWMCopyData);
begin
      //verifica identificador da mensagem recebida
      case msg.CopyDataStruct^.dwData of      
        APP_BROADCAST_WRITE : ...C�digo  
        APP_CLIENT_WRITE    : ...C�digo
        ...
      end;

    //Marca a menssagem como processada
    msg.Result := 1;
  end;
end;

 - TWMCopyData:
    Msg: Mensagem
    From: Handle de quem est� enviando a mensagem WM_COPYDATA
    CopyDataStruct: Ponteiro para a estrutura TCopyDataStruct recebida
    Result: Valor retornado pela mensagem
    

[x] Coment�rios

    Comecei a desenvolver esse projeto a partir da id�ia que tive para fazer
    um sistema de plugins para um IRCd feito em Delphi(http://ircdelphi.sourceforge.net/)
    onde poderiam ser implementados os Services ou qualquer tipo de interpreta��o de dados
    a partir de uma DLL. Esse � mais um exemplo a parte de como se comunicar com uma
    aplica��o a partir de uma DLL ou outra aplica��o. Ainda estou procurando por um m�todo
    para que a aplica��o possa se comunicar com uma DLL sem que seja por execu��o de fun��es
    contidas na DLL, se � que isso seja poss�vel =) ..se for para se comunicar com outra
    aplica��o seria s� tamb�m usar SendMessage com WM_COPYDATA.


[x] Autor/Contato

    Glauber Almeida Dantas
    E-Mail: glauber@delphix.com.br
    Site: www.delphix.com.br
    IRC: #DelphiX - irc.brasnet.org
    ICQ: 125689417





EOF