{a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.}

program ejercicio6;

procedure leerNumeros;
var
    num, max : integer;
begin
    max := -1;
    readln(num);
    while (num >= 0)do begin
        if ((num > max) and (num mod 2 = 0))then
            max := num;
        readln(num);
    end;
    writeln(max); 
end;

begin
    leerNumeros;
end.