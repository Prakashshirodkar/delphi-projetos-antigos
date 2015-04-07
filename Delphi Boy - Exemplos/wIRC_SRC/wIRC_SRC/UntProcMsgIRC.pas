{----------------------------------------------------------------
 Nome: UntProcMsgIRC
 Descri��o: Processa os tipos de menssagens do IRCUtils
executando os comandos correspondentes
 ----------------------------------------------------------------}

unit UntProcMsgIRC;

interface
 uses
   SysUtils, Classes, IRCUtils, StrUtils, Windows, Dialogs,
   SrvAnalisesUtils, UntPrincipal, UntDepurador, UntProcMsgIRCSrv,
   UntDiversos, UntwIRCStatus;

 procedure ProcMsgIRC(TextoReceb: string);

implementation
 procedure ProcMsgIRC;
 var
   Saida: TStringList; {Saida da fun��o IrcAnalisar(Depende do tipo resultado)}
   TipoMsg: TIRCTipoMsg; {Vari�vel que guarda o tipo da Saida}
   LinhaIRC: TSplitArray; {Vari�vel que conter� todas as linhas separadas de TextoReceb(#10)}
   ContLinhaIRC: integer; {Contador usado para navegar entra as linhaa da array LinhaIRC}
   TipoSrvMsg: TIRCSrvMsg; {Vari�vel que guarda o tipo de menssagem do servidor (Caso TipoMsg = imServMsg)}
   SaidaSrv: TStringList; {Sa�da da fun��o AnalisarMsgSrv (Depende do tipo resultado)}

 begin
   SetLength(LinhaIRC, 0);
   LinhaIRC:=Split(TextoReceb, #10);
   for ContLinhaIRC:=0 to High(LinhaIRC) do
   begin
     Chomp(LinhaIRC[ContLinhaIRC]);
     TipoMsg:=IrcAnalisar(LinhaIRC[ContLinhaIRC], Saida);
     case TipoMsg of

       {Menssagem privada para cliente}
       imPrivMsg:
       begin
         FrmPrincipal.ProcMsg(Saida.Strings[0], Format(CompNick,[Saida.Strings[0]]) + Saida.Strings[3])
       end;

       {Menssagem para canal}
       imChaMsg:
       begin
         FrmPrincipal.ProcChaMsg(Saida.Strings[2], Format(CompNick,[Saida.Strings[0]]) + Saida.Strings[3])
       end;

       {Um usu�rio entrou em um canal}
       imJoin:
       begin
         FrmPrincipal.AdNick(Saida.Strings[0], Saida.Strings[2], false);
       end;

       {Um usu�rio deixou um canal}
       imPart:
       begin
         FrmPrincipal.RmNick(Saida.Strings[0], Saida.Strings[2]);
       end;

       {Notice para cliente}
       imPrivNotice:
       begin
         FrmPrincipal.ProcMsg(Saida.Strings[0], Format(CompNotice, [Saida.Strings[2], Saida.Strings[3]]));
       end;

       {Notice para um canal}
       imChaNotice:
       begin
         FrmPrincipal.ProcChaMsg(Saida.Strings[2], Format(CompNotice, [Saida.Strings[2], Saida.Strings[3]]));
       end;

       {Algu�m mudou de nick}
       imMudNick:
       begin
         FrmPrincipal.AtlNick(Saida.Strings[0], Saida.Strings[2]);
       end;

       {Mudan�a de atributos de nick/canal}
       imMode:
       begin
         //soon...
       end;

       {Algu�m esta oferecendo DCC CHAT}
       imDccChat:
       begin
         MessageBox(0, PChar(Saida.Strings[0] + ' est� oferecendo CHAT'), 'Chat', MB_OK + MB_TASKMODAL + MB_ICONINFORMATION)
       end;

       {Algu�m estaoferecendo DCC SEND}
       imDccSend:
       begin
         MessageBox(0, PChar(Saida.Strings[0] + ' est� oferecendo SEND - ' + Saida.Strings[2]), 'Send', MB_OK + MB_TASKMODAL + MB_ICONINFORMATION)
       end;

       {Menssagens do servidor}
       imServMsg:
       begin
         TipoSrvMsg:=AnalisarMsgSrv(Saida.Strings[1], Saida.Strings[2], SaidaSrv);
         ProcMsgIRCSrv(TipoSrvMsg, SaidaSrv);
       end;

       {Notice do servidor}
       imSrvNotice:
       begin
         wIRCStatus.AdLinha(Saida.Strings[0]);
       end;

       {Erro no servidor}
       imSrvError:
       begin
         wIRCStatus.AdLinha(Saida.Strings[0]);
       end;

     end;
   end;
 end;
 
end.
