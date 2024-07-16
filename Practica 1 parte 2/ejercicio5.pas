{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦El número máximo leído.
◦El número mínimo leído.
◦La suma total de los números leídos.}

program ejercicio5;
var
    numero, max, min, suma: integer;
begin
    max := -1;
    min := 9999;
    suma := 0;
    repeat
        writeln('Ingrese numeros enteros, la lectura finaliza al ingresar 100: ');
        readln(numero);
        if (numero > max)then
            max := numero;
        if (numero < min) then
            min := numero;
        suma := suma + numero;
    until (numero = 100);
    writeln('El numero maximo leido es: ', max);
    writeln('El numero minimo leido es: ', min);
    writeln('La suma total de los numeros leidos es: ', suma);
end.