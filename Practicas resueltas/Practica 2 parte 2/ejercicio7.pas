{a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}

program ejercicio7;

procedure descomponerNum(num : integer; var cantDigitos, suma : integer);
begin
    cantDigitos := 0;
    suma := 0;
    while (num <> 0)do begin
        suma := suma + (num mod 10);
        num := num div 10;
        cantDigitos := cantDigitos + 1;
    end;
end;

var
    num, cantDigitos, suma, cantTotal : integer;
begin
    cantTotal := 0;
    repeat
        readln(num);
        descomponerNum(num, cantDigitos, suma);
        cantTotal := cantTotal + cantDigitos;
    until(suma = 10);
    writeln('La cantidad total de digitos leidos es ', cantTotal);
end.