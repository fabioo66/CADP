{a  ha  realizado  un  relevamiento  sobre  los  distintos  objetos 
astronómicos observados durante el año 2015.  Los objetos se clasifican en 7 categorías: 1: estrellas, 
2: planetas, 3: satélites, 4: galaxias, 5: asteroides,  6: cometas y 7: nebulosas. 
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7), 
nombre del objeto,  distancia a  la Tierra (medida  en años  luz), nombre del  descubridor y  año de  su 
descubrimiento.  A. Desarrolle  un  programa  que  lea  y  almacene  la  información  de  los  objetos  que  han  sido 
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe 
procesarse). La estructura generada debe mantener el orden en que fueron leídos los datos.  B. Una vez  leídos  y almacenados  todos  los datos,  se  pide  realizar  un  reporte con  la  siguiente 
información: 1. Los códigos  de los dos objetos más lejanos de la tierra que se hayan observado.  2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.  3. La cantidad de objetos observados por cada categoría.  4. Los  nombres  de  las  estrellas  cuyos  códigos  de  objeto  poseen  más  dígitos  pares  que 
impares.}

program ejercicio6;
type
    cRango = 1..7;

    objeto = record
        codigo: integer;
        categoria: cRango;
        nombre: string;
        distancia: real;
        descubridor: string;
        anioDescubrimiento: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: objeto;
        sig: lista;
    end;

    vectorContador = array[cRango] of integer;

procedure inicializarVector(var vc: vectorContador);
var
    i: integer;
begin
    for i := 1 to 7 do 
        vc[i] := 0;
end;

procedure leerObjeto(var o: objeto);
begin
    writeln('Ingrese el codigo del objeto');
    readln(o.codigo);
    if (o.codigo <> -1) then begin
        writeln('Ingrese la categoria del objeto');
        readln(o.categoria);
        writeln('Ingrese el nombre del objeto');
        readln(o.nombre);
        writeln('Ingrese la distancia a la Tierra');
        readln(o.distancia);
        writeln('Ingrese el nombre del descubridor');
        readln(o.descubridor);
        writeln('Ingrese el anio de su descubrimiento');
        readln(o.anioDescubrimiento);
    end;
end;

procedure agregarAtras(var l: lista; o: objeto);
var
    nue, aux: lista;
begin
    new(nue);
    nue^.dato := o;
    nue^.sig := nil;
    if (l = nil) then
        l := nue
    else begin
        aux := l;
        while (aux^.sig <> nil) do 
            aux := aux^.sig;
        aux^.sig := nue;
    end;
end;

procedure cargarLista(var l: lista);
var
    o: objeto;
begin
    leerObjeto(o);
    while (o.codigo <> -1) do begin
        agregarAtras(l, o);
        leerObjeto(o);
    end;
end;

procedure maximo(var max1, max2: real; var maxCodigo1, maxCodigo2: integer; codigo: integer; distancia: real);
begin
    if (distancia > max1) then begin
        max2 := max1;
        maxCodigo2 := maxCodigo1;
        max1 := distancia;
        maxCodigo1 := codigo
    end
    else if (distancia > max2) then begin
        max2 := distancia;
        maxCodigo2 := codigo;
    end;
end;

function masParesQueImpares(num: integer): boolean;
var
    pares, impares: integer;
begin
    pares := 0;
    impares := 0;
    while (num <> 0) do begin
        if (num mod 10 mod 2 = 0) then
            pares := pares + 1
        else
            impares := impares + 1;
        num := num div 10;
    end;
    masParesQueImpares := pares > impares;
end;

procedure procesar(l: lista; var maxCodigo1, maxCodigo2, cantPlanetas: integer; var vc : vectorContador);
var
    max1, max2 : real;
begin
    max1 := -1;
    max2 := -1;
    cantPlanetas := 0;
    while (l <> nil) do begin
        maximo(max1, max2, maxCodigo1, maxCodigo2, l^.dato.codigo, l^.dato.distancia);
        if ((l^.dato.descubridor = 'Galileo Galilei') and (l^.dato.anioDescubrimiento < 1600)) then 
            cantPlanetas := cantPlanetas + 1;
        vc[l^.dato.categoria] := vc[l^.dato.categoria] + 1;
        if (masParesQueImpares(l^.dato.codigo)) then
            writeln('Estrella ', l^.dato.nombre);
        l := l^.sig;
    end;
end;

procedure informarVector(var vc: vectorContador);
var 
    i: integer;
begin
    for i := 1 to 7 do 
        writeln('En la categoria ', i, ' se han observado ', vc[i], ' elementos ');
end;

var
    l : lista;
    maxCodigo1, maxCodigo2, cantPlanetas: integer;
    vc: vectorContador;
begin   
    l := nil;
    cargarLista(l);
    inicializarVector(vc);
    procesar(l, maxCodigo1, maxCodigo2, cantPlanetas, vc);
    writeln('Los dos objetos mas lejanos a la Tierra son ', maxCodigo1, ' y ', maxCodigo2);
    writeln('La cantidad de planetas descubiertos por Galileo Galilei antes del 1600 es ', cantPlanetas);
    informarVector(vc);
end.