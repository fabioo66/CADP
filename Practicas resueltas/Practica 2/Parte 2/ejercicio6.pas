{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
●Código de los dos productos más baratos.
●Código del producto de tipo “pantalón” más caro.
●Precio promedio.}

program ejercicio6;

procedure leerDatos(var precio : real; var codigo : integer; var tipo : string);
begin
    writeln('Ingrese el precio del producto');
    readln(precio);
    writeln('Ingrese el codigo del producto');
    readln(codigo);
    writeln('Ingrese el tipo');
    readln(tipo);
end;

procedure procesar(var codigoMin1, codigoMin2, codigoMax: integer; var promedio : real);
var
    precio, suma, max, min1, min2 : real;
    codigo, i : integer;
    tipo : string;
begin
    suma := 0;
    min1 := 9999;
    min2 := 9999;
    max := -1;

    for i := 1 to 100 do begin
        leerDatos(precio, codigo, tipo);

        if (precio < min1)then begin
            min2 := min1;
            codigoMin2 := codigoMin1;
            min1 := precio;
            codigoMin1 := codigo
        end
        else if (precio < min2)then begin
            min2 := precio;
            codigoMin2 := codigo;
        end;

        if ((tipo = 'pantalon') and (precio > max))then begin
            max := precio;
            codigoMax := codigo;
        end;

        suma := suma + precio;
    end;
    
    promedio := suma / 100;
end;

var
    codigoMin1, codigoMin2, codigoMax : integer;
    promedio : real;
begin
    procesar(codigoMin1, codigoMin2, codigoMax, promedio);
    writeln('Codigo del producto mas barato: ', codigoMin1);
    writeln('Codigo del segundo producto mas barato: ', codigoMin2);
    writeln('Codigo del pantalon mas caro: ', codigoMax);
    writeln('Precio promedio de los productos: ', promedio:0:2);
end.
