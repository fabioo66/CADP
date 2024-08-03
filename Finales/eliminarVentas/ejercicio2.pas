{Vimos estructuras de control iterativas:
while, for, repeat until
condicionales:
if, else, case

Enunciado (estructura if):
Realice un programa que lea un número entero y determine si es par o impar.}

program ejercicio;

function esPar(num: integer): boolean;
begin
    esPar := num mod 2 = 0;
end;

var
    num: integer;
begin
    write('Ingrese un número: ');
    readln(num);
    if (esPar(num)) then begin
        writeln('El número es par');
    end
    else begin
        writeln('El número es impar');
    end;
end.