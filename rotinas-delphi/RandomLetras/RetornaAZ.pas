function RetornaAZ: String;
//
// Gera letras aleat�rias
//
var
  n: integer;
  i: integer;
begin
  Randomize;
  n := Random(26) * 1000;
  i := (n mod 26); // 26 = N�mero de letras do alfabeto
  Result := Chr(i + 64);
end;

