{Calcule e indique la cantidad de memoria estática y dinámica que utiliza el siguiente programa. Mostrar los valores intermedios para llegar al resultado y justificar.

Char 1 byte
Integer 6 bytes
Real 8 bytes
Boolean 1 bytes
String Longitud + 1 byte
Puntero 4 bytes
}

program ejercicio1;
const 
    dimF = 120;
type
    cadena = string[45]; rango = 0..100;
    estudiante = record
        ape_nom: cadena; promedio: real; leg: integer;
    end;
    vector = array [0..dimF] of ^estudiante;

var
    v: vector;
    legajo: real; 
    i, j: integer;
begin
    for i := 0 to 100 do begin
        new(v[i]);
        read(legajo);
        v[i]^.leg := leg;
    end;

    j := 20;
    while (j > 0) and (v[j]^.leg <> 1234) do begin
        dispose(v[j]);
        j := j - 2;
    end;
end.

{
Memoria estatica:
    const -> 6 bytes
    v: vector; -> vector de punteros -> 120 * 4 = 480 bytes
    legajo: real; -> 8 bytes
    i, j: integer; -> 2 * 6 = 12 bytes

    total = 6 + 480 + 8 + 12 = 506 bytes

Memorya dinamica:
    for se ejecuta 101 veces 
    new(v[i]); -> puntero que apunta a un registro estudiante -> 46 + 8 + 6 = 60 bytes
    101 * 60 = 6060 bytes

    while se ejecuta 10 veces
    dispose(v[j]); -> 60 bytes
    10 * 60 = 600 bytes

    total = 6060 - 600 = 5460 bytes

Tiempo de ejecucion:
    for = (3N+2) + N(cuerpo for)
    N = 101
    for = (3*101+2) + 101(1) = 305 + 101 = 406ut

    j := 20; -> 1ut

    while = C(N+1) + N(cuerpo while)
    N = 10
    C = 3
    while = 3(10+1) + 10(2) = 33 + 20 = 53ut

    total = 406 + 1 + 53 = 460ut 
}