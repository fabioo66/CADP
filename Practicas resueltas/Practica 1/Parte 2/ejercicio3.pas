{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota}

program ejercicio3;
type
    nrango = 1..10;
begin
var
    cantidadAprobados, cantidadSiete, : integer;
    nombre: string;
    nota: nrango;
begin
    cantidadAprobados := 0;
    cantidadSiete := 0;
    writeln('Ingrese el nombre del alumno: ');
    readln(nombre); 
    while (nombre <> 'Zidane Zinedine') do begin
        writeln('Ingrese la nota del alumno: ');
        readln(nota);
        if (nota >= 8) then
            cantidadAprobados := cantidadAprobados + 1;
        if (nota = 7) then
            cantidadSiete := cantidadSiete + 1;
        writeln('Ingrese el nombre del alumno: ');
        readln(nombre);
    end;
    writeln('La cantidad de alumnos aprobados es: ', cantidadAprobados);
    writeln('La cantidad de alumnos que obtuvieron un 7 como nota es: ', cantidadSiete);
end.