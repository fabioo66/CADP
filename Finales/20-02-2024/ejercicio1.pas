{Una empresa dispone de una estructura de datos con los clientes de su comercio (500 a lo sumo). De cada cliente conoce el numero de cliente, numero de DNI y monto que paga. Se pide implementar un programa que informe la cantidad de clientes cuyo numero de DNI es capicua (es igual leerlo de izquierda a derecha que de derecha a izquierda).}

program ejercicio1;
const
    dimF = 500;
type
    dRango = 1..8;

    cliente = record
        numCliente: integer;
        numDNI: integer;
        monto: real;
    end;

    vector = array [1..dimF] of cliente;

    lista = ^nodo;
    nodo = record
        dato: integer;
        sig: lista;
    end;

// se dispone
procedure cargarVector(var v: vector; var dimL: integer);

procedure agregarAdelante(var l: lista; num: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := num;
    nuevo^.sig := l;
    l := nuevo;
end;

procedure cargarLista(var l: lista; num: integer);
begin
    l := nil;
    while (num <> 0) do begin
        agregarAdelante(l, num mod 10);
        num := num div 10;
    end; 
end;

function esCapicua(l: lista; dni: integer): boolean;
var
    ok : boolean;
begin
    ok := true;
    while (l <> nil) and (ok) do begin
        if (l^.dato <> dni mod 10) then
            ok := false;
        l := l^.sig;
        dni := dni div 10;
    end;
    esCapicua := ok;
end;

procedure limpiarLista(var l: lista);
var
    aux: lista;
begin
    while (l <> nil) do begin
        aux := l;
        l := l^.sig;
        dispose(aux);
    end;
end;

procedure cantidadClientesCapicua(v: vector; dimL: integer; var l: lista; var cant: integer);
var
    i: integer;
begin
    cant := 0;
    for i := 1 to diml do begin
        cargarLista(l, v[i].numDNI);
        if (esCapicua(l, v[i].numDNI)) then
            cant := cant + 1;
        limpiarLista(l);
    end;
end;

var
    v: vector;
    dimL: integer;
    l: lista;
begin
    cargarVector(v, dimL);
    cantidadClientesCapicua(v, dimL, vd, cant);
    writeln('La cantidad de clientes cuyo DNI es capicua es: ', cant); 
end.