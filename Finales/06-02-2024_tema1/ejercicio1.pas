{Una empresa dispone de una estructura de datos con las ventas de su comercio. De cada venta se conoce numero de venta, cantidad de productos y tipo de pago (efectivo o tarjeta). Se pide implementar un programa que genere una segunda estructura con las ventas cuya cantidad de productos tenga mas digitos pares que impares. En la estructura generada deben quedar almacenadas las ventas de tipo de pago efectivo antes que las de tipo de pago tarjeta.}

program ejercicio;
type 
    venta = record
        numero: integer;
        cantidad: integer;
        tipoPago: string;
    end;

    lista = ^nodo
    nodo = record
        dato: venta;
        sig: lista;
    end;

// Se dispone (?
procedure cargarLista(var l: lista);

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

procedure agregarAdelante(var l: lista; v: venta);
var
    nue: lista;
begin
    new(nue);
    nue^.dato := v;
    nue^.sig := l;
    l := nue;
end;

procedure agregarAtras(var l: lista; v: venta);
var
    nue, aux: lista;
begin
    new(nue);
    nue^.dato := v;
    nue^.sig := nil;
    if (l = nil) then
        l := nue
    else begin
        aux := l;
        while (aux^.sig <> nil) do
            aux := aux^.sig;
        aux^.sig:= nue;
    end;
end;

procedure procesar(l: lista; var listaNueva: lista);
begin
    while (l <> nil) do begin
        if (masParesQueImpares(l^.dato.numero)) then begin
            if (l^.dato.tipoPago = 'efectivo') then
                agregarAdelante(listaNueva, l^.dato)
            else
                agregarAtras(listaNueva, l^.dato);
        end;
        l := l^.sig;
    end;    
end;

var
    l, listaNueva: lista;
begin
    l := nil;
    listaNueva := nil;
    // se dispone
    cargarLista(l);
    procesar(l, listaNueva); 
end;
