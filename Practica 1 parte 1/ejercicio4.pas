{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).}

program ejercicio4;
var
    num, num1: real;
begin
    writeln('Ingrese un numero real');
    readln(num);
    
    writeln('Ingrese numeros hasta que se ingrese el doble de num');
    readln(num1);
    while(num1 <> num*2)do begin
        writeln('Ingrese numeros hasta que se ingrese el doble de num');
        readln(num1);
    end;
end.