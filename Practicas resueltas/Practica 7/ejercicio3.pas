{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. 
De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y 
kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y 
para un mismo código de auto pueden existir 1 o más viajes. Se pide:  
a. Informar los dos códigos de auto que más kilómetros recorrieron.  
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de 
viaje.}

program ejercicio3;
type
    viaje = record
        numero: integer;
        codigo_auto: integer;
        origen: string;
        destino: string;
        km_recorridos: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: viaje;
        sig: lista;
    end;

procedure maximo(codigoActual: integer; kmRecorridos: real; var max1, max2: real; var codigoMax1, codigoMax2: integer);
begin
    if (kmRecorridos > max1) then begin
        max2:= max1;
        max1:= kmRecorridos;
        codigoMax2:= codigoMax1;
        codigoMax1:= codigoActual;
    end
    else if (kmRecorridos > max2) then begin
        max2:= kmRecorridos;
        codigoMax2:= codigoActual;
    end;
end;

// se dispone
procedure cargarLista(var l: lista);

procedure insertarOrdenado(var l: lista; v: viaje);
var
    nue, act, ant : lista;
begin
    new(nue);
    nue^.dato:= v;
    act:= l;
    while (act <> nil) and (act^.dato.numero < v.numero) do begin
        ant:= act;
        act:= act^.sig;
    end; 
    if (act = ant) then
        l:= nue
    else
        ant^.sig:= nue;
    nue^.sig:= act;
end;

procedure procesarLista(l: lista; var listaNueva: lista; var codigoMax1, codigoMax2: integer);
var
    max1, max2, kmRecorridos: real;
    codigoActual: integer;
begin
    max1 := -1;
    max2 := -1;
    while (l <> nil) do begin
        codigoActual:= l^.dato.codigo_auto;
        kmRecorridos:= 0;
        while (l <> nil) and (l^.dato.codigo_auto = codigoActual) do begin
            kmRecorridos+= l^.dato.km_recorridos;
            if (L^.dato.km_recorridos > 5) then 
                insertarOrdenado(listaNueva, l^.dato);
            l:= l^.sig;
        end;
        maximo(codigoActual, kmRecorridos, max1, max2, codigoMax1, codigoMax2);
    end;
end;

var
    l, listaNueva: lista;
    codigoMax1, codigoMax2: integer;
begin
    l:= nil;
    listaNueva:= nil;
    cargarLista(l);
    procesarLista(l, listaNueva, codigoMax1, codigoMax2);
    writeln('Los dos codigos de auto que mas kilometros recorrieron son: ', codigoMax1, ' y ', codigoMax2);
end.