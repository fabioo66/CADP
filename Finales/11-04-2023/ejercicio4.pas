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

}