{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”.}

program ejercicio1;
var
    num1, num2: integer;
begin
    writeln('Ingrese un numero');
    readln(num1);
    writeln('Ingrese un numero');
    readln(num2);
    if (num1 > num2)then
        writeln('El numero mayor es ', num1)
    else
        if (num1 = num2)then   
            writeln('Los numeros son iguales')
        else 
            writeln('El numero mayor es ', num2);
end.