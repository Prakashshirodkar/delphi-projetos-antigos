{----------------------------------------------------------------
 Nome: UntProcMsgIRCSrv
 Descri��o: Unit que cont�m uma fun��o para processar
menssagens vindas do servidor.
 ----------------------------------------------------------------}

unit UntProcMsgIRCSrv;

interface
 uses
   Classes, Dialogs, SrvAnalisesUtils, UntPrincipal, UntwIRCStatus;

 procedure ProcMsgIRCSrv(Tipo: TIRCSrvMsg; SaidaSrv: TStringList);

implementation

 procedure ProcMsgIRCSrv;
 var
   Contador: integer;

 begin
   if (Tipo = ismSimples) then
   begin {Menssagens que n�o s�o interpretadas, apenas mostradas no FrmStatus}
     wIRCStatus.AdLinha(SaidaSrv.Strings[0]);
   end
   else
   begin
     case Tipo of

       ism353:
       begin {Listagem de nicks de um canal}
         {SaidaSrv.Strings[0] cont�m o nome do canal o restante da lista s�o os nicks}
         for Contador:=1 to SaidaSrv.Count - 1 do
           FrmPrincipal.AdNick(SaidaSrv.Strings[Contador], SaidaSrv.Strings[0], true);
       end;

     end;
   end;
 end;

end.
