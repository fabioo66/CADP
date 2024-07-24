{Dado el siguiente programa:}

program Registros;
type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;
procedure leer(var alu : alumno);
begin
    writeln('Ingrese el código del alumno');
    read(alu.codigo);
    if (alu.codigo <> 0) then begin
        writeln('Ingrese el nombre del alumno'); 
        readln(alu.nombre);
        writeln('Ingrese el promedio del alumno'); 
        readln(alu.promedio);
    end;
end;
{ declaración de variables del programa principal }
var
    a : alumno;
    cant : integer;
    max : real;
    nombreMax : string;
{ cuerpo del programa principal }
begin
    cant := 0;
    max := -1;
    leer(a);
    while (a.codigo <> 0) do begin
        cant := cant + 1;
        if (a.promedio > max) then begin
            max := a.promedio;
            nombreMax := a.nombre;
        end;
        leer(a);
    end;
    writeln('La cantidad de alumnos leidos fue: ', cant)
end.

{a.Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b.Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}