{Calcule e indique la cantidad de memoria estatica y dinamica que utiliza el siguiente programa. Mostar los valores intermedios para llegar al resultado y justificar.}

{Char: 1 byte
Integer: 6 bytes
real: 10 bytes
boolean: 1 byte
String: Longitud + 1 byte
puntero: 4 bytes}

program ejercicio3;
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
CALCULO DE MEMORIA

memoria estatica:
vector: dimf * tipo --> tipo = registro info
info: 
    nombre: 256 bytes
    nota: 6 bytes
    datos: 4 bytes
total = 266

vector: 100 * 266 = 26600 bytes
i, j: 12 bytes
info: 266 bytes

memoria estatica total = 26878


Memoria dinamica: 
el for se ejecuta 100 veces 
new(v[j].datos); // 6 bytes, new del campo datos, puntero a integer

total = 100 * 6 = 600 bytes
}