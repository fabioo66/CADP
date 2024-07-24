{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
●Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
●CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a)Un módulo para la lectura de la información de la escuela.
b)Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}

program ejercicio3;
type
    escuela = record;
        cue : integer;
        nombre : string;
        cantdDocentes : integer;
        cantAlumnos : integer;
        localidad : string;
    end;

procedure leerEscuela(var e : escuela);
begin
    writeln('Ingrese el CUE');
    readln(e.cue);
    writeln('Ingrese el nombre del establecimiento');
    readln(e.nombre);
    writeln('Ingrese la cantidad de docentes');
    readln(e.cantDocentes);
    writeln('Ingrese la cantidad de alumnos');
    readln(e.cantAlumnos);
    writeln('Ingrese la localidad');
    readln(e.localidad);
end;

function relacionDocenteAlumno(cantAlumnos, cantDocentes : integer): real;
begin
    relacionDocenteAlumno := e.cantAlumnos / e.cantDocentes;
end;