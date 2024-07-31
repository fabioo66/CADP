{Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}       

program ejercicio5;
type
    cadena = string[50];

    producto = record
        codigo: integer;
        descripcion: cadena;
        stockActual: integer;
        stockMinimo: integer;
        precio: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: producto;
        sig: lista;
    end;

procedure leerProducto(var p: producto);
begin
    writeln('Ingrese el codigo del producto: ');
    readln(p.codigo);
    if (p.codigo <> -1) then begin
        writeln('Ingrese la descripcion del producto: ');
        readln(p.descripcion);
        writeln('Ingrese el stock actual del producto: ');
        readln(p.stockActual);
        writeln('Ingrese el stock minimo del producto: ');
        readln(p.stockMinimo);
        writeln('Ingrese el precio del producto: ');
        readln(p.precio);
    end;
end;

procedure agregarAdelant(var L : lista; p: producto);
var
    aux: lista;
begin
    new(aux);
    aux^.dato := p;
    aux^.sig := L;
    L := aux;
end;

procedure cargarLista(var L: lista);
var
    p: producto;
begin
    leerProducto(p);
    while (p.codigo <> -1) do begin
        agregarAdelant(L, p);
        leerProducto(p);
    end;
end;

function tresDigitosPares(codigo: integer): boolean;
var
    digitosPares : integer;
begin
    while(codigo <> 0) do begin
        if ((codigo mod 10) mod 2 = 0) then
            digitosPares := digitosPares + 1;
        codigo := codigo div 10;
    end;
    tresDigitosPares := (digitosPares >= 3);
end;

procedure minimo(precio: real; var min1, min2: real; codigo: integer; var codigoMin1, codigoMin2: integer);
begin
    if (precio < min1) then begin
        min2 := min1;
        codigoMin2 := codigoMin1;
        min1 := precio;
        codigoMin1 := codigo;
    end
    else if (precio < min2) then begin
        min2 := precio;
        codigoMin2 := codigo;
    end;
end;

procedure procesar(L : lista; var porcentaje : real; var codigoMin1, codigoMin2 : integer);
var
    cantProductos, productosStockMin : integer;
    min1, min2 : real;
begin
    cantProductos := 0;
    productosStockMin := 0;
    min1 := 9999;
    min2 := 9999;
    while (L <> nil) do begin
        cantProductos := cantProductos + 1;
        if (L^.dato.stockActual < L^.dato.stockMinimo) then
            productosStockMin := productosStockMin + 1;
        if (tresDigitosPares(L^.dato.codigo)) then
            writeln('Descripcion: ', L^.dato.descripcion);
        minimo(L^.dato.precio, min1, min2, L^.dato.codigo, codigoMin1, codigoMin2);
        L := L^.sig;
    end;
    porcentaje := (productosStockMin * 100) / cantProductos;
end;

var
    L: lista;
    porcentaje: real;
    codigoMin1, codigoMin2: integer;
begin
    L := nil;
    cargarLista(L);
    procesar(L, porcentaje, codigoMin1, codigoMin2);
    writeln('Porcentaje de productos con stock actual por debajo de su stock minimo: ', porcentaje:2:2);
    writeln('Codigo de los dos productos mas economicos: ', codigoMin1, ' y ', codigoMin2);
end.


