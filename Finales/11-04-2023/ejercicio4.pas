program ejercicio3;
const 
    dimF = 200;
type 
    cadena31 = string[31];

    alumno = record
        ape_nom: cadena31;
        promedio: real;
    end;

    vector = array [1..dimF] of ^alumno;
    lista = ^nodo;
    nodo = record
        datos: alumno;
        sig: lista;
    end;

var 
    v: vector; a: alumno; nota, i, suma, cant: integer;
    aux: lista;

begin
    aux := nil;
    for i := 1 to dimF do begin
        read(a.ape_nom); read(nota); cant := 0; suma := 0;
        while (nota <> -1) do begin
            suma := suma + nota; cant := cant + 1;
            read(nota);
        end;
        if (cant <> 0) then 
            a.promedio := suma/cant
        else 
            a.promedio := 0;

        new (v[i]);
        v[i]^ := a;
   end;
end.

{
CALCULO DE TIEMPO:

for = (3N+2) + N(cuerpo del for)
while = C(N+1) + N(cuerpo while)
if = condicion + max(cuerpo if, cuerpo else)

for:
N = 200
(3*200+2) + 2(cuerpo for + cuerpo while + if)

while:
C = 1
1(N+1) + N(2 + 2) 
while = 5N + 1

if:
3 ut

fuera del if (cuerpo del for):
1ut + 1ut + 1ut = 3ut

total = (3*200+2) + 2(3 + 5N + 1 + 3) 
      = (602) + 2(7 + 5N)
      = 602 + 14 + 10N
      = 616ut
}