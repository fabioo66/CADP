{9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
●Apellido de los dos alumnos con número de inscripción más chico.
●Nombre de los dos alumnos con número de inscripción más grande.
●Porcentaje de alumnos con nro de inscripción par.}

program ejercicio9;

procedure leerDatos(var numero : integer; var apellido, nombre : string);
begin
    writeln('Ingrese el numero de inscripcion');
    readln(numero);
    writeln('Ingrese el apellido');
    readln(apellido);
    writeln('Ingrese el nombre');
    readln(nombre);
end;

procedure procesar(var apellidoMin1, apellidoMin2, nombreMax1, nombreMax2 : string; var porcentaje : real);
var 
    numero, numeroMax1, numeroMax2, numeroMin1, numeroMin2, cantPares, cantAlumnos : integer;
    apellido, nombre : string;
begin
    numeroMin1 := 9999;
    numeroMin2 := 9999;
    numeroMax1 := -1;
    numeroMax2 := -1;
    cantPares := 0;
    cantAlumnos := 0;

    repeat
        leerDatos(numero, apellido, nombre);

        if (numero < numeroMin1) then begin
            numeroMin2 := numeroMin1;
            apellidoMin2 := apellidoMin2;
            numeroMin1 := numero;
            apellidoMin1 := apellido
        end
        else if (numero < numeroMin2) then begin
            numeroMin2 := numero;
            apellidoMin2 := apellido;
        end;

        if (numero > numeroMax2) then begin
            numeroMax2 := numeroMax1;
            nombreMax2 := nombreMax1;
            numeroMax1 := numero;
            nombreMax1 := nombre
        end
        else if (numero > numeroMax2) then begin
            numeroMax2 := numero;
            nombreMax2 := nombre;
        end;

        if (numero mod 2 = 0)then 
            cantPares := cantPares + 1;

        cantAlumnos := cantAlumnos + 1;

    until (numero = 1200);

    porcentaje := cantPares/cantAlumnos * 100;
end;

var 
    apellidoMin1, apellidoMin2, nombreMax1, nombreMax2 : string;
    porcentaje : real;
begin
    procesar(apellidoMin1, apellidoMin2, nombreMax1, nombreMax2, porcentaje);

    writeln('Apellido del alumno con menor numero de inscripcion: ', apellidoMin1);
    writeln('Apellido del segundo alumno con menor numero de inscripcion: ', apellidoMin2);
    writeln('Nombre del alumno con mayor numero de inscripcion: ', nombreMax1);
    writeln('Nombre del segundo alumno con mayor numero de inscripcion: ', nombreMax2);
    writeln('Porcentaje de alumnos con numero de inscripcion par: ', porcentaje:0:2, '%');
end.