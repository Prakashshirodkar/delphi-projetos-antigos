unit IRCUtils;
{
-ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo-
-o T�tulo: IRCUtils                                      o-
-o Descri��o: Biblioteca para interpreta��o do protocolo o-
-o IRC                                                   o-
-o Autor: Waack3(Davi Ramos)                             o-
-o �ltima modifica��o: 07/03/02 22:53                    o-
-o As descri��es individuais est�o abaixo                o-
-ooooooooooooooooooooooooooooooooooooooooooooooooooooooooo-
}

interface
 uses
   StrUtils, SysUtils, Classes, Graphics;

 type {Conjunto dos tipos de menssagens}
   TIRCMsg = (imPrivMsg, imChaMsg, imServMsg,
              imDesconhecido, imMudNick, imDccChat,
              imDccSend, imCtcpPing, imCtcpTime,
              imCtcpVersion);

 const
   CI_BRANCO     = $00FFFFFF; { 0}
   CI_PRETO      = $00000000; { 1}
   CI_AZESCURO   = $007F0000; { 2}
   CI_VDESCURO   = $00009300; { 3}
   CI_VERMELHO   = clRed;     { 4}
   CI_MARROM     = $0000007F; { 5}
   CI_ROXO       = $009C009C; { 6}
   CI_LARANJA    = $00007FFC; { 7}
   CI_AMARELO    = clYellow;  { 8}
   CI_VERDE      = $0000FC00; { 9}
   CI_CIANO      = $00939300; {10}
   CI_AZCLARO    = clAqua;    {11}
   CI_AZUL       = $00FC0000; {12}
   CI_ROZA       = clFuchsia; {13}
   CI_CINZA      = $007F7F7F; {14}
   CI_CINZACLARO = $00D2D2D2; {15}

 {Analisa a menssagem IRC e retorna seu tipo e par�metros}
 function AnalisarIRC(Entrada: string; var Saida: TStringList): TIRCMsg;

implementation
 function AnalisarIRC(Entrada: string; var Saida: TStringList): TIRCMsg;
 var
   Nick, Ip,
   Texto, Host,
   Id, Comando,
   MenssagemUsr,
   Parametros: string;
   PosI: integer;
   ParamDccCtcp: TSplitArray;

 begin
   {Incicia vari�veis}
   result:=imDesconhecido;
   Saida:=TStringList.Create;
   SetLength(ParamDccCtcp, 0);

   {Ao apresentar o ponto-v�rgula indica que � uma menssagem vinda do servidor}
   if (Entrada[1] = ':') then
   begin {Presen�a de exclama��o ap�s o nick indica uma menssagem vinda de um usu�rio}
     if ((Pos('!', Entrada) < Pos(' ',Entrada)) and
     (Pos('!',Entrada) > 1)) then
     begin
       {Msg de usu�rio}
       Nick:=PegarStr(Entrada,2,Pos('!',Entrada) - 1);
       Ip:=PegarStr(Entrada,Pos('!',Entrada) + 1,Pos(' ',Entrada) - 1);
       Texto:=Estilete(Entrada,Pos(' ',Entrada) + 1,deDireita);
       Saida.Add(Nick); {Nick de origem}
       Saida.Add(Ip);  {Ip de origem}

       {Separa Texto entre Comando, Par�metros e a mennsagem enviada
       pelo usu�rio}
       Comando:=PegarStr(Texto, 1, Pos(' ', Texto) - 1);
       Parametros:=Estilete(Texto, Pos(' ', Texto) + 1, deDireita); {Tudo que vem ap�s o comando}

       if (Comando = 'PRIVMSG') then
       begin
         MenssagemUsr:=Estilete(Parametros, Pos(':', Parametros) + 1, deDireita);       
         {Menssagem para canal ou para PVT}
         if ((Parametros[1] = '#') or (Parametros[1] = '&')) then
           result:=imChaMsg
         else
           {Verifira se a menssagem � um requerimento DCC ou CTCP}
           if ((MenssagemUsr[1] = #1) and (MenssagemUsr[Length(MenssagemUsr)] = #1)) then
           {� um requerimento DCC ou CTCP. Ser� verificado agora seu tipo}
           begin
             MenssagemUsr:=PegarStr(MenssagemUsr, 2, Length(MenssagemUsr) - 1); {Retira caracteres #1}
             ParamDccCtcp:=Split(MenssagemUsr, #32); {Divide os par�metros do DCC}
             if (ParamDccCtcp[0] = 'DCC') then
               begin {Requerimento DCC}
               if (ParamDccCtcp[1] = 'CHAT') then
               begin {DCC Subtipo CHAT}
                 Saida.Add(ParamDccCtcp[2]);
                 Saida.Add(ParamDccCtcp[3]);
                 Saida.Add(ParamDccCtcp[4]);
                 result:=imDccChat;
               end
               else if (ParamDccCtcp[1] = 'SEND') then
               begin {DCC Subtipo SEND}
                 Saida.Add(ParamDccCtcp[2]);
                 Saida.Add(ParamDccCtcp[3]);
                 Saida.Add(ParamDccCtcp[4]);
                 Saida.Add(ParamDccCtcp[5]);
                 result:=imDccSend;
               end
               else
               begin
                 result:=imDesconhecido;
               end;
           end
           else
           begin {� CTCP. Verifica agora se � Ping, Time ou Version}
             if (ParamDccCtcp[0] = 'PING') then {Envia pacotes PING}
             begin
               Saida.Add(ParamDccCtcp[1]);
               result:=imCtcpPing;
             end
             else if (ParamDccCtcp[0] = 'TIME') then {Pede hora local}
               result:=imCtcpTime
             else if (ParamDccCtcp[0] = 'VERSION') then {Pede string de vers�o}
               result:=imCtcpVersion
             else
               result:=imDesconhecido; {Tipo de menssagem n�o compreendido}
           end;
           end
           else {Se n�o � DCC ou CTCP ent�o � uma menssagem normal}
             result:=imPrivMsg;

         {Gera sa�da, para caso de ser uma menssagem s�mples}
         if ((result = imChaMsg) or (result = imPrivMsg)) then
         begin
           Saida.Add(PegarStr(Parametros, 1, Pos(' ', Parametros))); {Nick/Canal de destino}
           Saida.Add(MenssagemUsr); {Menssagem recebida}
         end;
         
       end
       else if (Comando = 'NICK') then
       begin
         result:=imMudNick; {Algum cliente mudou de nick}
         {Gera saida}
         Saida.Add(Estilete(Parametros, Pos(':', Parametros) + 1, deDireita)); {Novo nick}
       end;
     end
     else
     begin
       {Msg de eventos do servidor}
       PosI:=Pos(' ',Entrada);
       Host:=PegarStr(Entrada,2,PosI - 1);
       Id:=PegarStr(Entrada,PosI + 1,Posicao(' ', Entrada, PosI + 1) - 1);
       PosI:=Posicao(' ', Entrada, PosI + 1);
       Texto:=Estilete(Entrada, PosI + 1, deDireita);
       Saida.Add(Host); {Host que originou menssagem}
       Saida.Add(Id); {ID(N�mero) da menssagem, que indica seu g�nero}
       Saida.Add(Texto); {Menssagem enviada}
       result:=imServMsg;
     end;
   end;
 end;
end.
