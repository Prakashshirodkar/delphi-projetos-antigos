unit Unidade_Forward_de_Classes;

interface

   Uses Classes, SysUtils, DbTables;

type

  //declaracao FORWARD da ClasseBase...
  TClasseBase = Class;

  TCalculateClass = class
     Private
       //campo interno do Tipo da Classebase...
       FClassBase : TClassebase;
       //campos internos manipuladores da Base e do Exponente...
       FBase     : Extended;
       FExpoente : Integer;

       //---------------------------------
       // Se��o  Privada � TOOPClass.   //
       //---------------------------------
     Protected
       function SetValue : Extended;
       //---------------------------------
       // Se��o  Protegida              //
       //---------------------------------
     Public
       constructor Create;
       destructor Destroy; override;
       //---------------------------------
       // Se��o  Publica                //
       //---------------------------------
     Published
       property Base        : Extended read FBase     write FBase;
       property Expoente    : Integer  read FExpoente write FExpoente;
       property ResutlValue : Extended read SetValue;
       //---------------------------------
       // Se��o  Publicada              //
       //---------------------------------

  end;//

  TClasseBase = Class
     Private
       //---------------------------------
       // Se��o  Privada � TOOPClass.   //
       //---------------------------------
     Protected
       function ResultPowerEx(const Base: Extended; Expoente: Integer): Extended;
       //---------------------------------
       // Se��o  Protegida              //
       //---------------------------------
     Public
       constructor Create(AOwner : TObject); reintroduce;
       destructor Destroy; override;
       //---------------------------------
       // Se��o  Publica                //
       //---------------------------------
     Published
       //---------------------------------
       // Se��o  Publicada              //
       //---------------------------------

  end;//

implementation

{ TClasseBase }

//*******************************************************************//
// METODO :  Create                                                  //
// AUTOR, DATA : Roberto, 28/10/2002                                 //
// DESCRI��O : instanciar novos objetos e/ou iniciar valores....     //
//*******************************************************************//
constructor TClasseBase.Create(AOwner : TObject);
begin
end;

//*******************************************************************//
// METODO : Destroy                                                  //
// AUTOR, DATA : Roberto, 28/10/2002                                 //
// DESCRI��O : Liberar um objeto instanciado e/ou reinicalizar valor.//
//*******************************************************************//
destructor TClasseBase.Destroy;
begin
end;

//*******************************************************************//
// METODO : ResultPowerEx                                            //
// AUTOR, DATA : Roberto, 28/10/2002                                 //
// DESCRI��O : Calcular o Exponencial de um Numero...                //
//*******************************************************************//
function TClasseBase.ResultPowerEx(const Base: Extended; Expoente: Integer): Extended;
var
   Index  : integer;
   exBase : Extended;
begin

  //pegamos a base passada como parametro...
  exBase := 1;

  //caso o Exponente seja...
  case Expoente of
    //Zero(0) entao Resulte 1.
    0 : begin
          Result := 1;
          //sai.
          Exit;
        end;//

  end;//case-of.

  //precorre de q ate o valor do expoente...
  for index := 1 to Expoente do
    //calculando a base
    exBase := exBase * Base;

  //resultando o valor calculado.
  Result := exBase;

end;

{ TCalculateClass }

constructor TCalculateClass.Create;
begin
  FClassBase := TClasseBase.Create(Self);
end;

destructor TCalculateClass.Destroy;
begin
  //liberando a Classe Base que se tornou Filha de TCalculateClass...
  FClassBase.Free;
end;

//*******************************************************************//
// METODO : SetValue                                                 //
// AUTOR, DATA : Roberto, 28/10/2002                                 //
// DESCRI��O : Setar a propriedade ResultValue....                   //
//*******************************************************************//
function TCalculateClass.SetValue : Extended;
begin

   //se temos as propriedades preenchidas entao...
   if (Base <> 0) and (Expoente <> 0) then
     //calculamos o valor do Exponencial...
     Result := FClassBase.ResultPowerEx(Base, Expoente)
   else
     raise Exception.Create('N�o Podemos continuar com o C�lculo.'+#13+#10+
                            'Para isso preencha as propriedades Base e Expoente...');
end;

end.

