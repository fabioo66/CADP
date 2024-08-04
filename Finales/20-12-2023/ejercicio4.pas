program ejercicio4;
const 
    dimF = 10;
type
    cadena = string[50]; 
    rango = -10..dimF; 
    notas = 2..10;

    estudiante = record
        ape_nom: cadena;
        promedio: real;
        leg: integer; 
        nota_max: notas;
    end;

    vector = array [rango] of ^estudiante;

var
    v: vector; 
    i, pos: rango;
    e: estudiante; 
    n: notas; 
    j, dimL: integer;
begin
    pos := 5; 
    dimL := 0;
    for i := -10 to 10 do begin
        new(v[i]); 
        read(e.leg); 
        read(e.ape_nom); 
        read(e.nota_max);
        v[i]^ := e; 
        dimL := dimL + 1;
    end;
    j := 3458;
    while (j > 0) do begin
        dispose(v[pos]); 
        j := j DIV 10; 
        pos := pos - 1;
        dimL := dimL - 1;
    end;
end.

{
Calculo de tiempo:
pos:= 5; -> 1ut
diml:= 0; -> 1ut

for = (3N+2) + N(cuerpo for)
N = 21 

(3*21+2) + 21(cuerpo for)
cuerpo for:
2ut

for = 65 + 21(2) = 107ut

j:= 3458; -> 1ut

while = C(N+1) + N(cuerpo while)
N = 4
C = 1

1(4+1) + 4(2+2+2)

while = 5 + 4(6) = 29ut

total = 1 + 1 + 107 + 1 + 29 = 139ut
}