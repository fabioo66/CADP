{Calcule e indique la cantidad de memoria estatica y dinamica que utiliza el siguiente programa. Mostar los valores intermedios para llegar al resultado y justificar.}

{Char: 1 byte
Integer: 8 bytes
real: 12 bytes
boolean: 1 byte
String: Longitud + 1 byte
puntero: 4 bytes}

program ejercicio3;
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
Memoria estatica:
dimf = 8 bytes;
v: vector; -> vector de punteros -> 21 * 4 = 84 bytes
i, pos: rango; -> 8 + 8 = 16 bytes
e: estudiante; -> 51 + 12 + 8 + 8 = 79 bytes
n: notas; -> 8 bytes
j, dimL: integer; -> 8 + 8 = 16 bytes

total = 84 + 16 + 79 + 8 + 16 = 203 bytes

Memoria dinamica: 
for se ejecuta 21 veces 
new(v[i]); -> 79 bytes

total for = 21 * 79 = 1659 bytes

while se ejecuta 4 veces
dispose(v[pos]); -> 79 bytes
4 * 79 = 316 bytes

total = 1659 - 316 = 1343 bytes
}