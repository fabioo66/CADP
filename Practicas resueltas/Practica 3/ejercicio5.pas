{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a.El precio promedio por marca.
b.Marca y modelo del auto más caro.}

program ejercicio5;
type
    auto = record
        marca : string;
        modelo : string;
        precio : real;
    end;

procedure leerAuto(var a : auto);
begin
    writeln('Ingrese la marca');
    readln(a.marca);
    if (a.marca <> 'ZZZ') then begin
        writeln('Ingrese el modelo');
        readln(a.modelo);
        writeln('Ingrese el precio');
        readln(a.precio);
    end;
end;

procedure procesar(var promedio : real; var marcaMax, modeloMax : string);
var
    cantAutos : integer;
    sumaPrecios, max : real;
    a : auto;
begin
    cantAutos := 0;
    sumaPrecios := 0;
    max := -1;
    leerAuto(a);
    while (a.marca <> 'ZZZ') do begin
        cantAutos := cantAutos + 1;
        sumaPrecios := sumaPrecios + a.precio;
        
        if (a.precio > max)then begin
            max := a.precio;
            marcaMax := a.marca;
            modeloMax := a.modelo;
        end;

        leerAuto(a);
    end;
    if (cantAutos > 0) then 
        promedio := sumaPrecios / cantAutos; 
end;

var
    promedio : real;
    marcaMax, modeloMax : string;
begin
    procesar(promedio, marcaMax, modeloMax);
end.