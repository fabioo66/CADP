{3. Una empresa de transporte de caudales desea optimizar el servicio que 
brinda a sus clientes. Para ello, cuenta con información sobre todos los viajes 
realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero 
transportado y distancia recorrida por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes 
(a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que 
transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los 
viajes cuya distancia recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}

program Practica4Parte2Ejercicio3;
const
  diasMarzo = 31;
  dimFis = 200;
  kmEliminar = 100;
type
    subrangoDia= 1..diasMarzo;
    Viaje=record
        dia: subrangoDia;
        monto: real;
        km: integer;
    end;
    
    arrayViajes = array [1..dimFis] of Viaje;
    arrayDias = array [subrangoDia] of integer;

procedure leerViaje(var v: Viaje);
begin
    readln(d.dia);
    readln(d.monto);
    readln(d.km);
end;

procedure inicializarVectorDias(var vD: arrayDias);
var
    i:subrangoDia;
begin
    for i := 1 to diasMarzo do
    begin
        vD[i] := 0;
    end;
end;

procedure cargarDatos(var vV: arrayViajes; var dL: integer);
var
    via: Viaje;
begin
    dL := 0;
    leerViaje(via);
    while((dL < dimFis) and (via.km <> 0)) do
    begin
      dL := dL + 1;
      vV[dL] := via;
      leerViaje(via);
    end;
end;

procedure calcularMinimo(reg: Viaje; var min:Viaje);
begin
    if(reg.monto < min.monto) then min := reg;
end;

procedure informarViajesPorDia(vD: arrayDias);
var
    i:subrangoDia;
begin
    for i := 1 to diasMarzo do
    begin
        writeln(i, ' - ', vD[i]);
    end;
end;

procedure informar(vV: arrayViajes; dL: integer);
var i: integer;
    totMontos: real;
    min: Viaje;
    vD: arrayDias;
begin
    totMontos := 0;
    min.km := 99999;
    inicializarVectorDias(vD);
    for i := 1 to dL do
    begin
     totMontos := totMontos + vV[i].monto;
     calcularMinimo(vV[i], min);
     vD[vV[i].dia] := vD[vV[i].dia] + 1;
    end;
    writeln('El monto promedio transportado de los viajes realizados es: ', (totMontos / dL):0:2);
    writeln('La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero. ', min.km, ' ',min.dia, ' ', min.monto);
    writeln('La cantidad de viajes realizados cada día del mes.');
    informarViajesPorDia(vD);
end;

procedure eliminar(var v: arrayViajes; var dL: integer; kmE: integer);
var ocurrencias: integer;
begin
  ocurrencias:= 0;
  for i := 1 to dL do
    begin
        if(v[i].km = kmE) then ocurrencias := ocurrencias + 1;
        else if (ocurrencias > 0) then v[i - ocurrencias] := v[i];
    end;
    dL := dL - ocurrencias;
end;

var
    dimL : integer;
    v:arrayViajes;
begin
    cargarDatos(arrayViajes,dimL); 
    informar(arrayViajes,dimL);
    eliminar(arrayViajes,dimL, kmEliminar);
end.
