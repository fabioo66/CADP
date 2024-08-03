{Calcule e indique la cantidad de memoria estatica y dinamica que utiliza el siguiente programa. Mostar los valores intermedios para llegar al resultado y justificar.

Char: 1 byte
Integer: 6 bytes
real: 10 bytes
boolean: 1 byte
String: Longitud + 1 byte
puntero: 4 bytes}

program ejercicio3;
type
    cadena43 = string[43];
    
    info = record
        nombre: cadena43;
        nota: integer;
    end;

    lista = ^nodo;
    nodo = record
        datos: info;
        sig: lista;
    end;

    alumno = record
        ape_nom: cadena43;
        promedio: real;
    end;

    vector = array [1..10] of alumno;

var
    v: vector;
    a: alumno;
    i, dimL: integer;
    e: info;
    aux: lista;

begin
    dimL := 5;
    read(a.ape_nom);
    i := 0;
    while (i < 5) and (a.ape_nom <> 'ZZZ') do begin
        read(a.promedio);
        new(v[i]);
        v[i] := a;
        i := i + 1;
        read(a.ape_nom);
    end;
end.

{
Memoria estatica:
v: vector; -> vector de alumno -> 44 + 10 = 54 bytes
a: alumno; -> 44 + 10 = 54 bytes
i, dimL: integer; -> 12 bytes
e: info; -> 44 + 6 = 50 bytes
aux: lista; -> 4 bytes

total = 54 + 54 + 12 + 50 + 4 = 174 bytes

Memoria dinamica:
el peor caso del while es que se ejecute 5 veces 
new(v[i]); -> 54 bytes
total = 5 * 54 = 270 bytes
}