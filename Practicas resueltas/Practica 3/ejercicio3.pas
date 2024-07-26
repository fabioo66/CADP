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
const
    relacion = 23.435;
type
    escuela = record
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
    relacionDocenteAlumno := cantAlumnos / cantDocentes;
end;

var
    e : escuela;
    i, cueMax1, cueMax2, escuelasLP : integer;
    max1, max2, relacionDocAlu : real;
    nombreMax1, nombreMax2 : string;
begin
    escuelasLP := 0;
    max1 := -1;
    max2 := -1;
    for i:= 1 to 2400 do begin
        leerEscuela(e);

        relacionDocAlu := relacionDocenteAlumno(e.cantAlumnos, e.cantdDocentes);
        if(e.localidad = 'La Plata') and (relacionDocAlu > relacion) then
                escuelasLP:= escuelasLP + 1;

        if (relacionDocAlu > max1) then begin
            max2 := max1;
            cueMax2 := cueMax1;
            nombreMax2 := nombreMax1;
            max1 := relacionDocAlu;
            cueMax1 := e.cue;
            nombreMax1 := e.nombre
        end
        else if (relacionDocAlu > max2) then begin
            max2 := relacionDocAlu;
            cueMax2 := e.cue;
            nombreMax2 := e.nombre;
        end;
    end;
    writeln('Cantidad de escuelas de La Plata con relación alumnos/docente superior a la sugerida: ', escuelasLP);
    writeln('CUE y nombre de la escuela con mejor relación docente/alumno: ', cueMax1, ' ', nombreMax1);
    writeln('CUE y nombre de la segunda escuela con mejor relación docente/alumno: ', cueMax2, ' ', nombreMax2);
end.