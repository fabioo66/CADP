{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5}

program ejercicio1;
var
    numero, suma, cantidadMayoresA5, i: integer;
begin
    writeln('Ingrese 10 numeros enteros: ');
    suma := 0;
    cantidadMayoresA5 := 0;
    for i:= 1 to 10 do begin
        readln(numero);
        suma := suma + numero;
        if (numero > 5) then
            cantidadMayoresA5 := cantidadMayoresA5 + 1;
    end;
    writeln('La suma total de los numeros leidos es: ', suma);
    writeln('La cantidad de numeros mayores a 5 es: ', cantidadMayoresA5);
end.