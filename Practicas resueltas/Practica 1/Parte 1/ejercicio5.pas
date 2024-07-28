{Modifique el ejercicio anterior para que, luego de leer el número X, se lean alosumo10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

program ejercicio5;
var
    num, num1: real;
    cant: integer;
begin
    writeln('Ingrese un numero real');
    readln(num);
    
    writeln('Ingrese numeros hasta que se ingrese el doble de num');
    readln(num1);
    cant:= 1;
    while((num1 <> num*2) and (cant < 10))do begin
        cant:= cant + 1;
        writeln('Ingrese numeros hasta que se ingrese el doble de num');
        readln(num1);
    end;
end.