{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98"
a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}

program ejercicio2;
var
    numero, max, i, posicion: integer;
begin
    writeln('Ingrese 10 numeros enteros: ');
    max := -1;
    for i:= 1 to 10 do begin
        readln(numero);
        if (numero > max) then begin
            max := numero;
            posicion := i;
        end;
    end;
    writeln('El mayor numero leido fue el ', max, ', en la posicion ', posicion);
end.