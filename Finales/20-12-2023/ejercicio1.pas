{Un comercio dispone de de la informacion de sus ventas. De cada venta se conoce: codigo de producto, DNI del cliente, fecha, cantidad y precio unitario. Implementar un programa que genere una nueva estructura de datos en donde se tenga una unica vez cada DNI del cliente junto al monto total en compras que realizo}

program ejercicio1;
type
    dRango = 1..31;
    mRango = 1..12;

    fech = record
        dia: dRango;
        mes: mRango;
        anio: integer;
    end;

    venta = record
        codigo: integer;
        dni: integer;
        fecha: fech;
        cantidad: integer;
        precio: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: venta;
        sig: lista;
    end;

    cliente = record
        dni: integer;
        monto: real;
    end;

    listaCliente = ^nodoCliente;
    nodoCliente = record
        dato: cliente;
        sig: listaCliente;
    end;

// se dispone
procedure cargarLista(var l: lista);

{solucion recursiva
buscarAgregar(var lC: listaCliente; v: venta);
begin
    if (lC = nil) then begin
        new(lC);
        lC^.dato.dni := v.dni;
        lC^.dato.monto := v.cantidad * v.precio;
        lC^.sig := nil;
    end 
    else if (lC^.dato.dni = v.dni) then begin
        lC^.dato.monto := lC^.dato.monto + v.cantidad * v.precio;
    end
    else
        buscarAgregar(lC^.sig, v);
end;}

procedure buscarAgregar(var lC: listaCliente; v: venta);
begin
    while (lC <> nil) and (lC^.dato.dni <> v.dni) do
        lC := lC^.sig;
    
    if (lC = nil) then begin
        new(lC);
        lC^.dato.dni := v.dni;
        lC^.dato.monto := v.cantidad * v.precio;
        lC^.sig := nil;
    end
    else
        lC^.dato.monto := lC^.dato.monto + v.cantidad * v.precio;
end;

procedure procesar(l: lista; var lC: listaCliente);
begin
    while (l <> nil) do begin
        buscarAgregar(lC, l^.dato);
        l := l^.sig;
    end;
end;

var
    l: lista;
    lC: listaCliente;
begin
    l := nil;
    lC := nil;
    cargarLista(l);
    procesar(l, lC);
end.