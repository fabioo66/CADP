{Un comercio dispone de una estuctura de datos con las ventas (como maximo 500 ventas) realizadas durante el mes de enero. De cada venta se conoce el numero de venta, monto total y una lista de los productos vendidos (de cada producto vendido se tiene codigo y cantidad). Se pide implementar un programa que elimine de la estructura de datos todas las ventas cuya lista de productos contengan exactamente 5 productos.}

program ejercicio1;
const
    dimF = 500;
type
    producto = record
        codigo: integer;
        cantidad: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: producto;
        sig: lista;
    end;

    venta = record
        numero: integer;
        monto: real;
        productos: lista;
        cantProductos: integer;
    end;

    ventas = array[1..dimF] of venta;

// se dispone
procedure cargarVector(var v: ventas; var dimL: integer);

function tamanio(l: lista): integer;
var
    cantElementos: integer;
begin
    cantElementos := 0;
    while (l <> nil) do begin
        cantElementos := cantElementos + 1;
        l := l^.sig;
    end;
    tamanio := cantElementos;
end;

procedure eliminarVenta(var v: ventas; var dimL: integer; pos: integer);
begin
    for i := pos to dimL - 1 do begin
        v[i] := v[i + 1];
    end;
    dimL := dimL - 1;
end;

procedure procesar(var v: ventas; var dimL: integer);
var
    i: integer;
begin
    i := 1;
    while (i <= dimL) do begin
        if (tamanio(v[i].productos) = 5) then begin
            eliminarVenta(v, dimL, i);
        end
        else begin
            i := i + 1;
        end;
    end;
end;

var
    v: ventas;
    dimL: integer;
begin
    // asumo que cargarVector inicializa el puntero del inicio de la lista en nil
    cargarVector(v, dimL);
    procesar(v, dimL);
end.