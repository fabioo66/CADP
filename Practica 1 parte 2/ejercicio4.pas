{Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}

program ejercicio4;
var
    numero, min1, min2, i: integer;
begin
    min1 := 99999;
    min2 := 99999;
    writeln('Ingrese numeros enteros: ');
    for i:= 1 to 1000 do begin
        readln(numero);
        if (numero < min1)then begin
            min2 := min1;
            min1 := numero;
        end
        else if (numero < min2) then
            min2 := numero;
    end;
    writeln('Los dos numeros minimos leidos son: ', min1, ' y ', min2);
end.

{a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.}

program ejercicio4;
var
    numero, min1, min2: integer;
begin
    min1 := 99999;
    min2 := 99999;
    repeat
        writeln('Ingrese numeros enteros, la lectura finaliza al ingresar 0: ');
        readln(numero);
        if (numero < min1)then begin
            min2 := min1;
            min1 := numero;
        end
        else if (numero < min2) then
            min2 := numero;
    until (numero = 0);
    writeln('Los dos numeros minimos leidos son: ', min1, ' y ', min2);
end.

{b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}

program ejercicio4;
var
    numero, min1, min2: integer;
begin
    min1 := 99999;
    min2 := 99999;
    writeln('Ingrese numeros enteros, la lectura finaliza al ingresar 0: ');
    readln(numero);
    while (numero <> 0) do begin
        if (numero < min1)then begin
            min2 := min1;
            min1 := numero;
        end
        else if (numero < min2) then
            min2 := numero;
        readln(numero);
    end;
    writeln('Los dos numeros minimos leidos son: ', min1, ' y ', min2);
end.