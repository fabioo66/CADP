{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

program ejercicio4;
type 
    vector = array [1..100] of integer;
  
function posicion(v: vector; x: Integer): integer;
var
    i: integer;
    ok: Boolean;
begin
    ok := false;
    i := 1;
    while ((i <= 100) and (not ok)) do begin
        if (v[i] = x) then
            ok := true
        else
            i := i + 1;
    end;
    if (ok) then
        posicion := i
    else
        posicion := -1;
end;

{b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.}

procedure intercambio (var v: vector; x, y: integer);
var
    aux: integer;
begin
    aux := v[x];
    v[x] := v[y];
    v[y] := aux;
end;

{c) sumaVector: retorna la suma de todos los elementos del vector.}

function sumaVector(v : vector): integer;
var
    i, suma : integer;
begin
    suma := 0;
    for i := 1 to 100 do
        suma := suma + v[i];
    sumaVector := suma;
end;

{d) promedio: devuelve el valor promedio de los elementos del vector.}

function promedio (v : vector): real;
begin
    promedio := sumaVector(v) / 100;
end;

{e) elementoMaximo: retorna la posición del mayor elemento del vector}

function elementoMaximo(v : vector): integer;
var
    i, max, pos : integer;
begin
    max := -1;
    for i := 1 to 100 do begin
        if (v[i] > max) then begin
            max := v[i];
            pos := i;
        end;
    end;
    elementoMaximo := pos;
end;

{f) elementoMinimo: retorna la posicion del menor elemento del vector}

function elementoMinimo(v : vector): integer;
var
    i, min, pos : integer;
begin
    minimo := 9999;
    for i := 1 to 100 do begin
        if (v[i] < min) then begin
            min := v[i];
            pos := i;
        end;
    end;
    elementoMinimo := pos;
end;



