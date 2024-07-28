{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program ejercicio7;
type
    crango = 1..100;
var
    piloto: string;
    tiempo, min1, min2, max1, max2: integer;
    i: crango;
begin
    min1 := 99999;
    min2 := 99999;
    max1 := -1;
    max2 := -1;
    for i := 1 to 100 do begin
        writeln('Ingrese el nombre del piloto: ');
        readln(piloto);
        writeln('Ingrese el tiempo total que le tomo finalizar la carrera: ');
        readln(tiempo);
        if (tiempo < min1) then begin
            min2 := min1;
            min1 := tiempo;
        end
        else if (tiempo < min2) then
            min2 := tiempo;
        if (tiempo > max1) then begin
            max2 := max1;
            max1 := tiempo;
        end
        else if (tiempo > max2) then
            max2 := tiempo;
    end;
    writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos son: ', min1, ' y ', min2);
    writeln('Los nombres de los dos pilotos que finalizaron en los dos ultimos puestos son: ', max1, ' y ', max2);
end.