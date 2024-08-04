{Teniendo en cuenta las referencias, calcule e indique la cantidad de memoria estática, memoria dinámica y tiempo de ejecución. Muestre cómo se obtienen los resultados.

Char: 1 byte
Integer: 4 bytes
real: 8 bytes
boolean: 1 byte
String: Longitud + 1 byte
puntero: 4 bytes}

program ejercicio_5;

type
    cadena30 = string[30];
    categorias = 1..5;
    participante = record
        ape_nom: cadena30;
        categ: categorias;
        tiempo: real;
    end;

    vector = array[1..20] of ^participante;

var
    p: vector;
    i: integer;
    c: categorias;
    ayn: cadena30;

begin
    for i := 1 to 10 do begin
        new(p[i]);
        read(c); read(ayn);
        p[i]^.categ := c;
        p[i]^.ape_nom := ayn;
        p[i]^.tiempo := 0.0;
    end;

    for i := 10 downto 5 do
        dispose(p[i]);
end.

{
Memoria estatica:
p: vector; -> 20 * 4 = 80 bytes
i: integer; -> 4 bytes
c: categorias; -> 4 bytes
ayn: cadena30; -> 30 + 1 = 31 bytes
Total: 119 bytes


Memoria dinamica:
for se ejecuta 10 veces 
new(p[i]); -> 10 * (31 + 4 + 8) = 430 bytes

for se ejecuta 6 veces
dispose(p[i]); -> 6 * 43 = 258 bytes

total = 430 - 258 = 172 bytes


Tiempo de ejecucion:
for = (3N+2) + N(cuerpo del for) 
for = (3*10+2) + 10(3) = 32 + 30 = 62ut
}