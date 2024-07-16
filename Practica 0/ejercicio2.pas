{Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a.Utilizando una variable adicional
b.Sin utilizar una variable adicional}

program ejercicio2;

// a
var 
    num1, num2, suma: integer;
begin
    writeln('Ingrese un numero entero');
    readln(num1);
    writeln('Ingrese un numero entero');
    readln(num2);
    suma := num1 + num2;
    writeln('La suma de ambos numeros es: ', suma);
end

//b
{var 
    num1, num2: integer;
begin
    writeln('Ingrese un numero entero');
    readln(num1);
    writeln('Ingrese un numero entero');
    readln(num2);
    writeln('La suma de ambos numeros es: ', num1 + num2);
end.}