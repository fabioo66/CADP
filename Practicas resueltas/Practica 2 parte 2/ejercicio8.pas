{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}

program ejercicio8;

procedure descomponerNum(num : integer; var sumaPares, impares : integer);
begin
    sumaPares := 0;
    impares := 0;
    while (num <> 0) do begin
        if (num mod 10 mod 2 <> 0) then
            impares := impares + 1
        else 
            sumaPares := sumaPares + num mod 10;
        num := num DIV 10;
    end;
end;

var
    num, sumaPares, impares : integer;
begin
    readln(num);
    while (num <> 1234) do begin
        descomponerNum(num, sumaPares, impares);
        writeln('Num: ', num, ' Suma de digitos pares: ', sumaPares, ' Cantidad de digitos impares: ', impares);
        readln(num);
    end;
end.