{==========================================================================}
{       Coded by
       	          Mr_Geek : )

        www.dbmsoft.kit.net

        dbmsoft@linuxmail.org

        #Geeks #SourceX #DelphiX

              ________                              _     _____
              ___  __ \_____    __          _   ___(_)_  / /���
              __  / / /_  _ \  / /         / /  __  /\ \/ /
              _  /_/ / /  __/ / /_  /����// -�\ _  /  \ \/
              /_____/  \___/ /____//  � //_//_/ /_/   / /\_____
                                  / /���       �  ___/ /\      \
                                 /_/              �����  �������

Agradecimentos especiais:
- kiyo ( efnet ) que me ajudou com:
* valor := ord(Texto[cont]) - $30;
* resultado := resultado + (char($30 + num));

- LordCrc ( #Delphi - efnet) que me ajudou com a fun��o:
function digits(num: integer; base: integer = 10): integer;
var
t: extended; digits: integer;
begin
t:= ln(abs(num)) / ln(base);
result:= trunc(t)+1;
end;
que serve pra fazer um "length" em n�meros;

- #DelphiX da Brasnet claro hehehe


O QUE ESSE PROGRAMA FAZ:
-Converte String para Integer;
-Converte Integer para String;
A DIFEREN�A � QUE N�O USEI AS FUN��ES IntToStr e StrToInt e nem usei val
(apesar de ser uma fun��o nativa)
                                                                           }
{==========================================================================}


unit Unit1;

interface

uses
  Forms, Buttons, Spin, StdCtrls, Controls, Classes;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    SpinEdit1: TSpinEdit;
    GroupBox2: TGroupBox;
    Edit2: TEdit;
    SpinEdit2: TSpinEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{
Eu fiz essa fun��o apenas para achar as potencias de base 10 de acordo com a posi��o de cada 
n�mero.
Exemplo: se o expoente for 5... o resultado ser� 100000, se for 2 o resultado sera 10� = 100 ...
abaixo eu explico pra que preciso dela...
}
function potencia(expoente: integer): integer;
var
num, cont: integer;
begin
num := 1;
if expoente = 1 then num := 10 else
for cont := 0 to expoente-1 do
num := num * 10;
result := num;
end;
//essa � a fun��o que converte em si a string pra integer. Ela utiliza a fun��o acima
function converterStr2Int(Texto: string):integer;
var
cont, valor, resultado: integer;
S: string;
begin
For cont := Length(Texto) DownTo 0 do S:=S+Texto[cont]; texto := S;  {inverte a string. Abaixo
explico porque inverti ...}
resultado:= 0;
for cont := 1 to length(Texto)-1 do //le cada um dos caracteres da string � ser convertida...
begin
valor := ord(Texto[cont]) - $30; {ve se o caracter � '0' .. '9' e faz a var VALOR ser igual
� seu enquivalente em inteiro}
if cont = 1 then  //se a string s� tiver 1 caracter... o resultado j� � o equivalente
resultado := valor else // se s� tiver 1 caracter j� t� pronto o resultado hehe, do contr�rio ...
resultado := resultado + (potencia(cont-1) * (valor));
{essa pot�ncia serve para separar os algarismos em dezena, centena, milhar... e depois som�-los
ou seja ... 423 � o mesmo que 400 + 20 + 3 .. ent�o primeiro somamos o 3, depois multiplicamos o 2
por 10 porque ele � dezena e somamos no 3 a� d� 23, ent�o multiplicamos o 4 por 100 porque ele � 
centena somamos no 23.. dando 423.
Eu s� inverti os caracteres para poder come�ar trabalhando com o de unidade... depois passar para 
o de dezena, centena... em ordem crescente porque assim eu poderia aproveitar a posi��o deles com
o for que fiz acima e usar ela na fun��o potencia().}
end;
result := resultado;
end;
//essa fun��o pega o n�mero de caracteres de um inteiro. � o mesmo que length() pra uma string
function digits(num: integer; base: integer = 10): integer;
var
t: extended; digits: integer;
begin
 t:= ln(abs(num)) / ln(base);
result:= trunc(t)+1;
end;

Function ConverterInt2Str(Valor: Integer): string;
var
cont, num: integer;
resultado: string;
begin
resultado := '';
for cont := digits(valor) downto 1 do //faz um loop com o n�mero de caracteres do numero total
begin
num := valor div (potencia(cont-1));
{aqui eu fiz com que ele dividisse o n�mero para que ficasse +- assim: x,xxxx e peguei s� o
inteiro.. por exemplo .. se o numero fosse 652 dividiria por 100, daria 6,52.. pegaria s� o 6
(parte inteira) a� n� pr�ximo loop, excluiria o 6 (veja isso na pr�xima 2� linha de c�digo ) e
faria isso com o 5... depois excluiria o 5 e pegaria o 2.}
resultado := resultado + (char($30 + num)); {pega o caracter inteiro e faz a var resultado
valer o que ela vale + o equivalente EM STRING do algarismo atual (aquele que foi pego na
linha acima}
valor := (valor - (num * potencia(cont-1)));
{Aqui usei a pot�ncia novamente para multiplicar pelo inteiro que eu tinha pego e excluir ele
do n�mero... exemplo ... em 652, pegaria o 6 como inteiro, acrecentaria '6' � string depois
ele seria multiplicado por 100 e daria 600... a� seria feito 652 - 600 = 52 ...}
end;
result := resultado;
end;

//exemplo de como usar a fun��o de convers�o de String para Integer
procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
SpinEdit1.Value := converterStr2Int(edit1.text);
end;

//exemplo de como usar a fun��o de convers�o de Integer para String
procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
edit2.Text := converterint2str(spinedit2.value);
end;

end.
