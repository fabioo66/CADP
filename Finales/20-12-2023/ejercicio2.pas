{Dada la siguiente declaracion de tipos de datos y los procesos A y B, indique si son correctos o no. El objetivo es duplicar el valor de cada elemento de la estructura de datos numeros. Justifique su respuesta.}

type
    numeros = ^array[1..100] of real;
    lista = record
        num: numeros;
        diml: integer;
    end;

{A}
procedure duplicar1(n: lista);
var
    i: integer;
begin
    for i:= 1 to 100 do
        n.num^[i] := n.num^[i] * 2;
end;

{B}
procedure duplicar2(n: lista);
var
    i: integer;
begin
    for i:= 1 to n.diml do 
        n.num[i]^ := n.num[i]^ * 2;
end;

{Respuesta}
// A es incorrecto, ya que el for va de 1 a 100, y no de 1 a n.diml. Por lo tanto, si diml es menor a 100, se accederá a posiciones de memoria que no pertenecen a la lista, lo que generara un error de puntero nulo.

// B es incorrecto, ya que n.num[i]^ no es correcto. La notación correcta es n.num^[i]. 