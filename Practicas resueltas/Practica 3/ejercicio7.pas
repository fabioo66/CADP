{Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
●Cantidad total de centros para cada universidad.
●Universidad con mayor cantidad de investigadores en sus centros.
●Los dos centros con menor cantidad de becarios.}

program ejercicio7;
type
    centroInvestigacion = record
        nombre : string;
        universidad : string;
        investigadores : integer;
        becarios : integer;
    end;

procedure leerCentroInvestigacion(var c : centroInvestigacion);
begin
    writeln('Ingrese la cantidad de investigadores del centro de investigacion');
    readln(c.investigadores);
    if (c.investigadores <> 0) then begin
        writeln('Ingrese el nombre del centro de investigacion');
        readln(c.nombre);
        writeln('Ingrese la universidad a la que pertenece el centro de investigacion');
        readln(c.universidad);
        writeln('Ingrese la cantidad de becarios del centro de investigacion');
        readln(c.becarios);
    end;
end;

procedure maximo(cantInvestigadores : integer; var max : integer; var universidadMax : string);
begin
    if (cantInvestigadores > max) then begin
        max := cantInvestigadores;
        universidadMax := c.universidad;
    end;
end;

procedure minimo(becarios : integer; var min1, min2 : integer; var centroMin1, centroMin2 : string);
begin
    if (becarios < min1) then begin
        min2 := min1;
        centroMin2 := centroMin1;
        min1 := becarios;
        centroMin1 := c.nombre;
    end
    else if (becarios < min2) then begin
        min2 := becarios;
        centroMin2 := c.nombre;
    end;
end;

procedure procesar(var cantTotalCentros : integer; var universidadMax, centroMin1, centroMin2 : string);
var
    c : centroInvestigacion;
    cantCentros, cantInvestigadores, min1, min2, max : integer;
    universidadActual : string;
begin
    leerCentroInvestigacion(c);
    cantTotalCentros := 0;
    cantCentros := 0;
    min1 := 9999;
    min2 := 9999;
    max := -1;
    while (c.investigadores <> 0) do begin
        universidadActual := c.universidad;
        cantCentros := 0;
        cantInvestigadores := 0;
        while ((c.investigadores <> 0) and (universidadActual = c.universidad)) do begin
            cantCentros := cantCentros + 1;
            cantInvestigadores := cantInvestigadores + c.investigadores;
            minimo(c.becarios, min1, min2, centroMin1, centroMin2);
        end;
        cantTotalCentros := cantTotalCentros + cantCentros;
        maximo(cantInvestigadores, max, universidadMax);
        writeln('La cantidad de centros en la universidad ', universidadActual, ' es: ', cantCentros);
    end;
end;

var 
    cantTotalCentros : integer;
    universidadMax, centroMin1, centroMin2 : string;
begin
    procesar(cantTotalCentros, universidadMax, centroMin1, centroMin2);
    writeln('La cantidad total de centros es: ', cantTotalCentros);
    writeln('La universidad con mayor cantidad de investigadores es: ', universidadMax);
    writeln('Los dos centros con menor cantidad de becarios son: ', centroMin1, ' y ', centroMin2);
end.