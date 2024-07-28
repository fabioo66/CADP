{Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program ejercicio3;
const 
    dimf = 200;
type
	drango = 1..31;
    viaje = record
        dia : dRango;
        monto : real;
        distancia : integer;
    end;

    vector = array[1..dimf] of viaje;
    vectorContador = array[dRango] of integer;

procedure leerViaje(var via : viaje);
begin
    writeln('Ingrese la distancia recorrida');
    readln(via.distancia);
    if (via.distancia <> 0) then begin
        writeln('Ingrese el dia');
        readln(via.dia);
        writeln('Ingrese el monto de dinero transportado');
        readln(via.monto);
    end;
end;

procedure cargarVector(var v : vector; var diml : integer);
var
    via : viaje;
begin
    diml := 0;
    leerViaje(via);
    while (via.distancia <> 0) and (diml < dimf) do begin
        diml := diml + 1;
        v[diml] := via;
        leerViaje(via);
    end;
end;

procedure inicializarVectorContador(var vc : vectorContador);
var
    i : dRango;
begin
    for i := 1 to 31 do 
        vc[i] := 0;
end;

procedure minimo(var min : real; via : viaje; var distanciaMin, diaMin : integer);
begin
    if (via.monto < min) then begin
        min := via.monto;
        distanciaMin := via.distancia;
        diaMin := via.dia;
    end;
end;

procedure procesar(v : vector; diml : integer; var promedio : real; var distanciaMin, diaMin : integer; var vc : vectorContador);
var
    i : integer;
    suma, min : real;
begin
    suma := 0;
    min := 9999;
    inicializarVectorContador(vc); 
    for i := 1 to diml do begin
        suma := suma + v[i].monto;
        minimo(min, v[i], distanciaMin, diaMin);
        vc[v[i].dia] := vc[v[i].dia] + 1;
    end;
    if (diml > 0) then
        promedio := (suma / diml)
    else
        promedio := 0;
end;

procedure informarContador(vc : vectorContador);
var
    i : integer;
begin
    for i := 1 to 31 do 
        if (vc[i] > 0) then
            writeln('El dia ', i, ' se realizaron ', vc[i], ' viajes');
end;

procedure eliminar(var v: vector; var dL: integer);
var 
    i, ocurrencias: integer;
begin
    ocurrencias := 0;
    for i := 1 to dL do begin
        if (v[i].distancia = 100) then 
            ocurrencias := ocurrencias + 1
        else if (ocurrencias > 0) then 
            v[i - ocurrencias] := v[i];
    end;
    dL := dL - ocurrencias;
end;

var
    v : vector;
    vc : vectorContador;
    diml : integer;
    promedio : real;
    distanciaMin, diaMin : integer;
begin
    cargarVector(v, diml);
    procesar(v, diml, promedio, distanciaMin, diaMin, vc);
    
    writeln('El monto promedio transportado de los viajes realizados es: ', promedio:0:2);
    writeln('La distancia recorrida del viaje que transporto menos dinero es: ', distanciaMin);
    writeln('El dia del viaje que transporto menos dinero es: ', diaMin);
    informarContador(vc);
    
    eliminar(v, diml);
    writeln('Eliminados los viajes con distancia igual a 100 km, la nueva cantidad de viajes es: ', diml);
end.
