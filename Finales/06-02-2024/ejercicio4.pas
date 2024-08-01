program ejercicio4;
type 
    info = record
        nombre: string;
        nota: integer;
        datos: ^integer;
    end;

vector = array [1..100] of info;

var
    v: vector; 
    i,j: integer; 
    e: info;

begin
    read(e.nombre);
    i := 0;
    while (i < 100) and (e.nombre <> 'ZZZ') do begin
        read(e.nota);
        e.datos := nil;
        i := i + 1;
        v[i] := e;
        read(e.nombre);
    end;

    for j := 1 to i do begin
        new(v[j].datos);
        v[j].datos^ := v[j].nota MOD 10;
    end;
end.

{
CALCULO DE TIEMPO

i := 0; // 1 ut
while = C(N+1) + N(cuerpo while)
C = 3
N = 100

3(100+1) + 100(cuerpo)

cuerpo = 
e.datos := nil; 1ut
i := i + 1; 2ut
v[i] := e;  1ut

303 + 100(4) = 703

for = (3N+2) + N(cuerpo for)
N = 100

(3*100+2) + N(2) = 
302 + 200 = 502

total = 703 + 502 + 1 = 1206
}