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
Calculo de tiempo:
diml := 5; -> 1ut
i := 0; -> 1ut

while = C(N+1) + N(cuerpo while)
C = 3
N = 5 -> peor caso

3(5+1) + 5(3) = 33ut

total = 1 + 1 + 33 = 35ut
}