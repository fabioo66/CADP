{Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

program ejercicio5;
const 
    dimf = 100;
type 
    vector = array [1..dimf] of integer;

procedure cargarVector(var v : vector; var diml : integer);
var
    num : integer;
begin
    readln(num);
    diml := 0;
    while ((num <> 0) and (diml < dimf)) do begin
        diml := diml + 1;
        v[diml] := num;
        readln(num);
    end;
end;

var
    v : vector;
    diml, posMin, posMax : integer;
begin
    cargarVector(v, diml);
    posMin := elementoMinimo(v, diml);
    posMax := elementoMaximo(v, diml);
    intercambio(v, posMin, posMax);
    writeln('El elemento máximo ', v[posMax], ' que se encontraba en la posición ', posMax ,'fue intercambiado con el elemento mínimo ', v[posMin], ' que se encontraba en la posición ', posMin);
end.