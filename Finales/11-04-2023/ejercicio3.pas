{Calcule e indique la cantidad de memoria estatica y dinamica que utiliza el siguiente programa. Mostar los valores intermedios para llegar al resultado y justificar.}

{Char: 1 byte
Integer: 4 bytes
real: 8 bytes
boolean: 1 byte
String: Longitud + 1 byte
puntero: 4 bytes}

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
CALCULO DE MEMORIA

memoria estatica:
v: vector -> vector de punteros -> 200 * 4 = 800 bytes
a: alumno -> 32 + 8 = 40 bytes
nota, i, suma, cant: integer -> 4 * 4 = 16 bytes
aux: lista -> 4 bytes

total = 800 + 40 + 16 + 4 = 860

memoria dinamica:
for i := 1 to dimF do begin
    new (v[i]);

new(vector) -> vector es un puntero que apunta a alumno -> alumno = 40 bytes
total = 200 * 40 = 8000
}