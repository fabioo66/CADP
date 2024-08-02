program ejercicio3;
const 
    fin = 20;
type 
    info = record
        nombre: string;
        nota: integer;
        datos: ^integer;
    end;

    vector = array[5..fin] of ^info;

var 
    v: vector; 
    i, j: integer; 
    e: info;
begin
    for i := 5 to 15 do begin
        read(e.nombre); read(e.nota);
        new(v[i]);
        if (e.nota MOD 3 = 0) then 
            v[i] := nil;
        else begin
            v[i]^.nombre := e.nombre;
            v[i]^.nota := e.nota + (e.nota MOD 5);
        end;
    end;
    for j := 5 to 10 do 
        dispose (v[j]);
end.

{
Calculo de tiempo:
for = (3N+2) + N(cuerpo del for)
N = 11
(3*11+2) + N(cuerpo)

cuerpo del for:
if -> tiempo en evaluar la cond -> 1 + -> max(if, else)
total = 1 + 1 + 2 = 4 

total 35 + 11(4) = 79ut
}
