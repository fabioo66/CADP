{Un comercio dispone de una estructura de datos con las facturas realizadas durante agosto de 2023. De cada factura se conoce el numero de factura, codigo de cliente, codigo de sucursal (1..5) y monto total. Se pide implementar un programa que lea un codigo de sucursal e invoque a un modulo que reciba dicho codigo y elimine las facturas correspondientes al codigo de sucursal recibida. Ademas debe retornar la cantidad de facturas eliminadas.}

program ejercicio1;
type 
    cRango = 1..5;

    factura = record
        numeroFactura: integer;
        codigoCliente: integer;
        codigoSucursal: cRango;
        montoTotal: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: factura;
        sig: lista;
    end;

// se dispone
procedure cargarLista(var l: lista);

function eliminarFacturas(var l: lista; codigo: cRango): integer;
var
	act, ant: lista;
begin
    cant := 0;
	act:= L;
	while(act <> nil)do begin
		if(act^.dato <> codigo)then begin
			ant:= act;
			act:= act^.sig;
		end
		else begin
			if(act = L)then
				L:= L^.sig
			else
				ant^.sig:= act^.sig;
			dispose(act);
            cant := cant + 1;
			actual:= ant;
		end;
	end;
    eliminarFacturas:= cant;
end;

var
    l: lista;
    codigo: cRango;
begin
    l := nil;
    cargarLista(l);
    write('Ingrese el codigo de sucursal a eliminar: ');
    readln(codigo);
    writeln('Se eliminaron ', eliminarFacturas(l, codigo), ' facturas');
end.