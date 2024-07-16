{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}

program ejercicio2;
var
    num: real;
begin
    writeln('Ingrese un numero real');
    readln(num);
    if (num >= 0)then
        writeln(num:0:1)
    else
        writeln(num * -1:0:1);
end.