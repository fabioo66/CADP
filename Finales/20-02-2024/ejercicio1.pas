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
    vectorDni = array [dRango] of integer;

// se dispone
procedure cargarVector(var v: vector; var dimL: integer);

procedure cargarVectorDni(var vd: vectorDni; dni: integer);
var 
    i: integer;
begin
    for i := 1 to 8 do begin
        vd[i] := dni mod 10;
        dni := dni div 10;
    end;
end;

function esCapicua(vd: vectorDni): boolean;
var
    i, j: integer;
    ok : boolean;
begin
    i := 1;
    j := 8;
    ok := true;
    while((ok) and (i <> 5)) do begin
        if (vd[i] <> vd[j]) then
            ok := false;
        i := i + 1;
        j := j - 1;
    end;
    esCapicua := ok;
end;

function cantidadClientesCapicua(v: vector; dimL: integer; var vd : vectorDni): integer;
var
    i, cant: integer;
begin
    cant := 0;
    for i := 1 to diml do begin
        cargarVectorDni(vd, v[i].numDNI);
        if (esCapicua(vd)) then
            cant += 1;
    end;
    cantidadClientesCapicua := cant;
end;

var
    v: vector;
    dimL: integer;
    vd: vectorDni;
begin
    cargarVector(v, dimL);
    writeln('La cantidad de clientes cuyo DNI es capicua es: ', cantidadClientesCapicua(v, dimL, vd));
end.