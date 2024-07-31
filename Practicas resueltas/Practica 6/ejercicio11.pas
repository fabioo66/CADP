{La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor).}

program ejercicio11;

type
    egresado = record
        numero: integer;
        apellido: string;
        promedio: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: egresado;
        sig: lista;
    end;

procedure leerEgresado(var e: egresado);
begin
    write('Ingrese el número de alumno: '); 
    readln(e.numero);
    if(e.numero <> 0) then begin
        write('Ingrese el apellido: '); 
        readln(e.apellido);
        write('Ingrese el promedio: '); 
        readln(e.promedio);
    end;
end;

procedure insertarordenado(var L: lista; e: egresado);
var
    nue, act, ant: lista;
begin
    new(nue);
    nue^.dato := e;
    act := L;
    ant := L;
    while (act <> nil) and (e.promedio < act^.dato.promedio) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act = ant) then
        L := nue
    else
        ant^.sig := nue;
    nue^.sig := act;
end;

procedure cargarLista(var L: lista);
var
    e: egresado;
begin
    leerEgresado(e);
    while(e.numero <> 0) do begin
        insertarordenado(L, e);
        leerEgresado(e);
    end;
end;

procedure informarpromedios(L: lista);
var
    i: integer;
begin
    i := 0;
    while (L <> nil) and (i < 10) do begin
        writeln('Apellido: ', L^.dato.apellido, ', Número: ', L^.dato.numero, ', Promedio: ', L^.dato.promedio:0:2);
        L := L^.sig;
        i := i + 1;
    end;
end;

var
    L: lista;
begin
    L := nil;
    cargarLista(L);
    informarpromedios(L);
end.