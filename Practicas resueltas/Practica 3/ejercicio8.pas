{La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
●Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
●Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
●Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

program ejercicio8;
type 
    coordinador = record
        dni : integer;
        nombre : string;
        apellido : string;
        email : string;
    end;

    proyecto = record
        codigo : integer;
        titulo : string;
        docenteCoordinador : coordinador;
        cantidadAlumnos : integer;
        nombreEscuela : string;
        localidad : string;
    end;

procedure leerCoordinador(var c : coordinador); 
begin
    writeln('Ingrese el DNI del coordinador');
    readln(c.dni);
    writeln('Ingrese el nombre del coordinador');
    readln(c.nombre);
    writeln('Ingrese el apellido del coordinador');
    readln(c.apellido);
    writeln('Ingrese el email del coordinador');
    readln(c.email);
end;

procedure leerProyecto(var p : proyecto);
begin
    writeln('Ingrese el código del proyecto');
    readln(p.codigo);
    if (p.codigo <> -1) then begin
        writeln('Ingrese el título del proyecto');
        readln(p.titulo);
        leerCoordinador(p.docenteCoordinador);
        writeln('Ingrese la cantidad de alumnos que participan del proyecto');
        readln(p.cantidadAlumnos);
        writeln('Ingrese el nombre de la escuela');
        readln(p.nombreEscuela);
        writeln('Ingrese la localidad de la escuela');
        readln(p.localidad);
    end;
end;

procedure maximo(cantAlumnos : integer; var max1, max2 : integer; var escuelaMax1, escuelaMax2 : string; escuelaActual : string);
begin
    if (cantAlumnos > max1) then begin
        max2 := max1;
        escuelaMax2 := escuelaMax1;
        max1 := cantAlumnos;
        escuelaMax1 := escuelaActual;
    end
    else if (cantAlumnos > max2) then begin
        max2 := cantAlumnos;
        escuelaMax2 := escuelaActual;
    end;
end;

function cumple(codigo : integer) : boolean;   
var
    cantPares, cantImpares : integer;
begin
    cantPares := 0;
    cantImpares := 0;
    while (codigo <> 0) do begin
        if ((codigo mod 10) mod 2 = 0) then
            cantPares := cantPares + 1
        else
            cantImpares := cantImpares + 1;
        codigo := codigo div 10;
    end;
    cumple := cantPares = cantImpares;
end;

procedure procesar(var cantEscuelas : integer; var escuelaMax1, escuelaMax2 : string);
var
    p : proyecto;
    localidadActual, escuelaActual : string;
    cantEscuelasLocalidad, max1, max2 : integer;
begin
    leerProyecto(p);
    max1 := -1;
    max2 := -1;
    cantEscuelas := 0;
    while (p.codigo <> -1) do begin
        localidadActual := p.localidad;
        cantEscuelasLocalidad := 0;
        while ((p.codigo <> -1) and (localidadActual = p.localidad)) do begin
            if ((localidadActual = 'Daireaux') and (cumple(p.codigo)))then
                writeln('El título del proyecto de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares es: ', p.titulo);
            escuelaActual := p.nombreEscuela;
            while ((p.codigo <> -1) and (localidadActual = p.localidad) and (escuelaActual = p.nombreEscuela)) do begin
                cantEscuelasLocalidad := cantEscuelasLocalidad + 1;
                maximo(p.cantidadAlumnos, max1, max2, escuelaMax1, escuelaMax2, escuelaActual);
                leerProyecto(p);
            end;
        end;
        cantEscuelas := cantEscuelas + cantEscuelasLocalidad;
        writeln('La cantidad de escuelas de la localidad ', localidadActual, ' es: ', cantEscuelasLocalidad);
    end;
end;

var 
    cantEscuelas : integer;
    escuelaMax1, escuelaMax2 : string;
begin
    procesar(cantEscuelas, escuelaMax1, escuelaMax2);
    writeln('La cantidad total de escuelas que participan en la convocatoria 2018 es: ', cantEscuelas);
    writeln('Las dos escuelas con mayor cantidad de alumnos participantes son: ', escuelaMax1, ' y ', escuelaMax2);
end.