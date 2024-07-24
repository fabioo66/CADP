{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a)Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b)Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c)Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de cada mes. Nota: utilizar el módulo realizado en b)para la lectura de fecha}

program ejercicio2;
type
    drango = 1..31;
    mrango = 1..12;

    fecha = record
        dia : drango;
        mes : mrango;
        anio : integer;
    end;

procedure leerFecha(var f : fecha);
begin
    writeln('Ingrese el dia');
    readln(f.dia);
    writeln('Ingrese el mes');
    readln(f.mes);
    writeln('Ingrese el anio');
    readln(f.anio);
end;

var
    f : fecha;
    cantMes, cantDia : integer;
begin
    cantMes := 0;
    cantDia := 0;
    leerFecha(f);
    while (f.anio <> 2020) do begin 
        if ((f.mes = 1) or (f.mes = 2) or (f.mes = 3)) then
            cantMes := cantMes + 1;
        if ((f.dia >= 1) and (f.dia <= 10)) then
            cantDia := cantDia + 1;
        leerFecha(f);
    end;
    writeln('La cantidad de casamientos realizados durante los meses de verano (enero, febrero y marzo) es ', cantMes);
    writeln('La cantidad de casamientos realizados en los primeros 10 días de cada mes es ', cantDia);
end.



