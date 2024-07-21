{Implemente un programa que lea por teclado dos números enteros e imprima en pantalla los
valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el
mensaje: Se ingresaron los valores 8 y 4}

program ejercicio1;
var 
    num1, num2 : integer;
begin
    writeln('Ingrese un numero entero');
    readln(num1);
    writeln('Ingrese un numero entero');
    readln(num2);
    writeln('Se ingresaron los valores ', num2, ' ', num1);
end.