{a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program ejercicio5;

function esElDoble (numA, numB : integer): boolean;
begin
    esElDoble := numA * 2 = numB;
end;

var
    a, b, cantPares, cantCumplen : integer;
begin
    cantPares := 0;
    cantCumplen := 0;
    readln(a);
    readln(b);
    while ((a <> 0) and (b <> 0)) do begin
        cantPares := cantPares + 1;
        if (esElDoble(a, b)) then
            cantCumplen := cantCumplen + 1;
        readln(a);
        readln(b);
    end;
    writeln('Cantidad de pares leidos ', cantPares, ' Cantidad de pares en los que numB es el doble de numA ', cantCumplen);
end.
