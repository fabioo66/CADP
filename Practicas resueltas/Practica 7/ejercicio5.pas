{Una  empresa  de  transporte  de  cargas  dispone  de  la  información  de  su  flota  compuesta  por  100 
camiones.  De  cada  camión  se  tiene:  patente,  año  de  fabricación  y  capacidad  (peso  máximo  en 
toneladas que puede transportar). 
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De 
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en  kilómetros recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando 
se lee el código de viaje -1. Una vez leída y almacenada la información, se pide: 1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que 
menos kilómetros recorridos posee. 2. Informar la  cantidad  de  viajes  que  se  han realizado  en  camiones  con  capacidad  mayor  a  30,5 
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en 
que se realizó el viaje). 3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.  
Nota: Los códigos de viaje no se repiten.}

program ejercicio5;
const 
    cantCamiones = 100;
type
    camion = record
        patente: string;
        anioFabricacion: integer;
        capacidad: real;
    end;

    viaje = record
        codigo: integer;
        codigoCamion: integer;
        distancia: real;
        ciudadDestino: string;
        anio: integer;
        dniChofer: integer;
    end;

    vector = array [1..cantCamiones] of real;

    lista = ^nodo;
    nodo = record
        dato: viaje;
        sig: lista;
    end;

// se dispone
procedure cargarVector(var v: vector);

procedure leerViaje(var v: viaje);
begin
    writeln('Ingrese el codigo del viaje');
    readln(v.codigo);
    if (v.codigo <> -1) then begin
        writeln('Ingrese el codigo del camion');
        readln(v.codigoCamion);
        writeln('Ingrese la distancia recorrida');
        readln(v.distancia);
        writeln('Ingrese la ciudad de destino');
        readln(v.ciudadDestino);
        writeln('Ingrese el anio del viaje');
        readln(v.anio);
        writeln('Ingrese el DNI del chofer');
        readln(v.dniChofer);
    end;
end;

procedure agregarAdelante(var l: lista; v: viaje);
var
    nue: lista;
begin
    new(nue);
    nue^.dato := v;
    nue^.sig := l;
    l := nue;
end;

procedure cargarLista(var l: lista);
var
    v: viaje;
begin
    leerViaje(v);
    while (v.codigo <> -1) do begin
        agregarAdelante(l, v);
        leerViaje(v);
    end;
end;

procedure maxYMin(v: vector; codigo: integer; var maxPatente, minPatente: string; distancia: real; var max, min: real);
begin
    if (distancia > max) then begin
        max := distancia;
        maxPatente := v[codigo].patente;
    end;
    if (distancia < min) then begin
        min := distancia;
        minPatente := v[codigo].patente;
    end;
end;

function soloImpares(num: integer): boolean;
var 
    ok: boolean;
begin
    ok := true;
    while ((num <> 0) and (ok) do begin
        if (num mod 10 mod 2 = 0) then
            ok := false;
        num := num div 10;
    end;
    soloImpares := ok;
end;

procedure procesar(l: lista; v: vector; var maxPatente, minPatente: string; var cantViajes: integer);
var
    max, min: real;
begin
    max := -1;
    min := 9999;
    cantViajes := 0;
    while (l <> nil) do begin
        maxYMin(v, l^.dato.codigoCamion, maxPatente, minPatente, l^.dato.distancia, max, min);
        if (v[l^.dato.codigoCamion].capacidad > 30.5) and (2023 - l^.dato.anio > 5) then
            cantViajes := cantViajes + 1;
        if (soloImpares(l^.dato.dniChofer)) then
            writeln('Codigo de viaje: ', l^.dato.codigo);
        l := l^.sig;
    end;
end;

var 
    v: vector;
    l: lista;
    maxPatente, minPatente: string;
    cantViajes: integer;
begin
    cargarVector(v);
    l := nil;
    cargarLista(l);
    procesar(l, v, maxPatente, minPatente, cantViajes);
    writeln('La patente del camion con mas km recorridos es: ', maxPatente);
    writeln('La patente del camion con menos km recorridos es: ', minPatente);
    writeln('La cantidad de viajes realizados en camiones con capacidad mayor a 30.5 toneladas y con antiguedad mayor a 5 anios es: ', cantViajes);
end.