{-----------------------------------------------------------------
 Declara��o do componente TwIRCBar.
 Nome: UntTwIRCBar
 Vers�o: 1.3
 Autor: Waack3(Davi Ramos)
 Descri��o: Componente sucessor do componente TPanel(TCustomPanel)
que simula uma barra de tarefas para janelas MDI.
 O controle das janelas � quase total.
 Especifica��es: Este componente foi criado exclusivamente para
trabalhar com forms do tipo TwIRCSecao, que se encontra no wIRC.
 Obs: Vers�es anteriores todas falharam.
-----------------------------------------------------------------}
unit UntTwIRCBar;

interface
 uses
   ComCtrls, Buttons, StdCtrls, Classes, ExtCtrls;

 type
   {Objeto que se comporta como uma barra no TwIRCBar}
   TwIRCBarBotao = class(TSpeedButton)
   private
   public
   end;

   {Objeto principal(TwIRCBar)}
   TwIRCBar = class(TCustomPanel)
   private
   public
   end;

implementation

end.
 