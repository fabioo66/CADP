{Un comercio dispone de una estructura de datos con las facturas (como maximo 2000 facturas) realizadas durante marzo de 2023. Cada factura se conoce el numero de factura, codigo de cliente, codigo de sucursal y monto total. Las facturas se encuentran ordenadas por codigo de sucursal. Se pide implementar un programa con un modulo que reciba la estrucutra que se dispone y devuelva el codigo de sucursal con mayor cantidad de facturas. El programa debe informar el valor retornado por el modulo.}

program ejercicio1;
const
    dimF = 2000;
type
    str20 = string[20];
    rango = 1..dimF;

    factura = record
        nroFactura: integer;
        codCliente: integer;
        codSucursal: integer;
        montoTotal: real;
    end;

    vector = array[rango] of factura;

// se dispone
procedure cargarVector(var v: vector; var diml: integer);

procedure maximo(cant: integer; var max: integer; var codigoMax: integer);
begin
    if (cant > max) then begin
        max := cant;
        codigoMax := codigoActual;
    end;
end;

function codigoMayorFacturas(v: vector; diml: integer): integer;
var
    codigoActual, codigoMax, max, cant, i: integer;
begin
    max := -1;
    codigoMax := -1;
    i := 1;
    while (i <= diml) do begin
        codigoActual := v[i].codSucursal;
        cant := 0;
        while (i <= diml) and (v[i].codSucursal = codigoActual) do begin
            cant := cant + 1;
            i := i + 1;
        end;
        maximo(cant, max, codigoMax);
    end;
    codigoMayorFacturas := codigoMax;
end;

var
    v: vector;
    diml: integer;
begin
    cargarVector(v, diml);
    writeln('El codigo de sucursal con mayor cantidad de facturas es: ', codigoMayorFacturas(v, diml));
end.
