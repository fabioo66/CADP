{La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}

program ejercicio6;
type
    cadena = string[50];
    cRango = 1..7;

    sonda = record
        nombre: cadena;
        duracionEstimada: integer;
        costoConstruccion: real;
        costoMantenimiento: real;
        rango: cRango;
    end;

    lista = ^nodo;
    nodo = record
        dato: sonda;
        sig: lista;
    end; 

    vectorContador = array[cRango] of integer;

procedure inicializarVector(var v: vectorContador);
var
    i: cRango;
begin
    for i := 1 to 7 do
        v[i] := 0;
end;

procedure leerSonda(var s: sonda);
begin
    writeln('Ingrese el nombre de la sonda: ');
    readln(s.nombre);
    if (s.nombre <> 'GAIA') then begin
        writeln('Ingrese la duracion estimada de la mision: ');
        readln(s.duracionEstimada);
        writeln('Ingrese el costo de construccion: ');
        readln(s.costoConstruccion);
        writeln('Ingrese el costo de mantenimiento mensual: ');
        readln(s.costoMantenimiento);
        writeln('Ingrese el rango del espectro electromagnetico sobre el que realizara estudios: ');
        readln(s.rango);
    end;
end;

procedure agregarAdelante(var L: lista; s: sonda);
var
    aux: lista;
begin
    new(aux);
    aux^.dato := s;
    aux^.sig := L;
    L := aux;
end;

procedure cargarLista(var L: lista);
var
    s: sonda;
begin
    repeat 
        leerSonda(s);
        agregarAdelante(L, s);
    until (s.nombre = 'GAIA');
end;

procedure promedios(l: lista; var promedioDuracion, promedioCostoConstruccion: real);
var
    sumaDuracion, cantidadSondas: integer;
    sumaCostoConstruccion: real;
begin
    sumaDuracion := 0;
    sumaCostoConstruccion := 0;
    cantidadSondas := 0;
    while (l <> nil) do begin
        sumaDuracion := sumaDuracion + l^.dato.duracionEstimada;
        sumaCostoConstruccion := sumaCostoConstruccion + l^.dato.costoConstruccion;
        cantidadSondas := cantidadSondas + 1;
        l := l^.sig;
    end;
    promedioDuracion := sumaDuracion / cantidadSondas;
    promedioCostoConstruccion := sumaCostoConstruccion / cantidadSondas;
end;

procedure maximo(var max: real; var nombreSondaMasCostosa: cadena; costoTotal: real; nombreSonda: cadena);
begin
    if(costoTotal > max)then begin
        max := costoTotal;
        nombreSondaMasCostosa := nombreSonda;
    end;
end;

procedure procesar(l : lista; var vc: vectorContador; var nombreSondaMasCostosa: cadena; var cantidadSondasDuracionEstimadaMayorPromedio, cantidadSondasCostoConstruccionMayorPromedio : integer; promedioDuracion, promedioCostoConstruccion: real);
var
    max: real;
begin
    max := -1;
    cantidadSondasDuracionEstimadaMayorPromedio := 0;
    cantidadSondasCostoConstruccionMayorPromedio := 0;
    while (L <> nil) do begin 
        vc[L^.dato.rango] := vc[L^.dato.rango] + 1;
        maximo(max, nombreSondaMasCostosa, L^.dato.costoConstruccion + L^.dato.costoMantenimiento, L^.dato.nombre);
        if (L^.dato.duracionEstimada > promedioDuracion) then
            cantidadSondasDuracionEstimadaMayorPromedio := cantidadSondasDuracionEstimadaMayorPromedio + 1;
        if (L^.dato.costoConstruccion > promedioCostoConstruccion) then
            cantidadSondasCostoConstruccionMayorPromedio := cantidadSondasCostoConstruccionMayorPromedio + 1;
        L := L^.sig;
    end;
end;

procedure imprimir(vc: vectorContador);
var
    i: cRango;
begin
    for i := 1 to 7 do
        writeln('Cantidad de sondas que realizaran estudios en el rango ', i, ': ', vc[i]);
end;

var
    L: lista;
    vc: vectorContador;
    nombreSondaMasCostosa: cadena;
    cantidadSondasDuracionEstimadaMayorPromedio, cantidadSondasCostoConstruccionMayorPromedio: integer;
    promedioDuracion, promedioCostoConstruccion: real;
begin
    L := nil;
    inicializarVector(vc);
    cargarLista(L);
    promedios(L, promedioDuracion, promedioCostoConstruccion);
    procesar(L, vc, nombreSondaMasCostosa, cantidadSondasDuracionEstimadaMayorPromedio, cantidadSondasCostoConstruccionMayorPromedio, promedioDuracion, promedioCostoConstruccion);
    writeln('El nombre de la sonda mas costosa es: ', nombreSondaMasCostosa);
    imprimir(vc);
    writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas es: ', cantidadSondasDuracionEstimadaMayorPromedio);
    writeln('La cantidad de sondas cuyo costo de construccion supera el costo promedio entre todas las sondas es: ', cantidadSondasCostoConstruccionMayorPromedio);
end.