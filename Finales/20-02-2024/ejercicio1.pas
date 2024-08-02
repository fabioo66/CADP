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
    vectorDni = arry [dRango] of integer;

// se dispone
procedure cargarVector(var v: vector; var dimL: integer);

function cargarVectorDni()

function esCapicua(vd: vectorDni): boolean;


function cantidadClientesCapicua(v: vector; dimL: integer; var vd : vectorDni): integer;
var
    i, cant: integer;
begin
    cant := 0;
    for i := 1 to diml do begin
        cargarVectorDni(vd);
        if (esCapicua(vd) then
            cant += 1;
    end;
    cantidadClientesCapicua := cant;
end;