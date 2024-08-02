{Calcule e indique la cantidad de memoria estatica y dinamica que utiliza el siguiente programa. Mostar los valores intermedios para llegar al resultado y justificar.

Char: 1 byte
Integer: 6 bytes
real: 10 bytes
boolean: 1 byte
String: Longitud + 1 byte
puntero: 4 bytes}

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
Memoria estatica:
fin: constante -> 6 bytes
v: vector; -> vector de punteros -> 16 * 4 = 64 bytes
i, j: integer; -> 2 * 6 = 12 bytes
e: info; -> 256 + 6 + 4 = 266 bytes

total = 6 + 64 + 12 + 266 =  348 bytes

Memoria dinamica:
new(v[i]); -> 266 bytes
for se ejecuta 11 veces
266 * 11 = 2926 bytes

dispose(v[j]); -> 266 bytes
for se ejecuta 6 veces
266 * 6 = 1596 bytes

total = 2926 - 1596 = 1330 bytes 
}