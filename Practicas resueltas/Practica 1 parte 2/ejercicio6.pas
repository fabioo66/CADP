{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program ejercicio6;
type
    crango = 1..200;
var
    codigo, precio, min1, min2, cant, i: integer;
begin
    min1 := 99999;
    min2 := 99999;
    cant := 0;
    for i:= 1 to 200 do begin
        writeln('Ingrese el codigo del producto: ');
        readln(codigo);
        writeln('Ingrese el precio del producto: ');
        readln(precio);
        if (precio < min1) then begin
            min2 := min1;
            min1 := precio;
        end
        else if (precio < min2) then
            min2 := precio;
        if (precio > 16) and (codigo mod 2 = 0) then
            cant := cant + 1;
    end;
    writeln('Los codigos de los dos productos mas baratos son: ', min1, ' y ', min2);
    writeln('La cantidad de productos de mas de 16 pesos con codigo par es: ', cant);
end.