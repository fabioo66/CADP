{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
a.La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b.La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
1).
c.El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%)}

program ejercicio6;
var
    legajo: integer;
    promedio: real;
    cantAlumnos, cantAlumnosSuperan6_5, cantAlumnosDestacados: integer;
begin
    cantAlumnos := 0;
    cantAlumnosSuperan6_5 := 0;
    cantAlumnosDestacados := 0;
    writeln('Ingrese el legajo del alumno: ');
    readln(legajo);
    while (legajo <> -1) do begin
        cantAlumnos := cantAlumnos + 1;
        writeln('Ingrese el promedio del alumno: ');
        readln(promedio);
        if (promedio > 6.5) then
            cantAlumnosSuperan6_5 := cantAlumnosSuperan6_5 + 1;
        if (promedio > 8.5) and (legajo < 2500) then
            cantAlumnosDestacados := cantAlumnosDestacados + 1;
        writeln('Ingrese el legajo del alumno: ');
        readln(legajo);
    end;
    writeln('Cantidad de alumnos leida: ', cantAlumnos);
    writeln('Cantidad de alumnos cuyo promedio supera 6.5: ', cantAlumnosSuperan6_5);
    writeln('Porcentaje de alumnos destacados cuyo legajo es menor a 2500: ', (cantAlumnosDestacados * 100) / cantAlumnos:0:2, '%');
end.