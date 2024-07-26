{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a.Realizar un módulo que lea la información de una línea de teléfono.
b.Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a.) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35}

program ejercicio4;
type
    cliente = record
        codigo : integer;
        cantLineas : integer;
    end;

    linea = record
        numero : integer;
        cantMinutos : integer;
        cantMb : integer;
    end; 

procedure leerLinea(var l : linea);
begin
    writeln('Ingrese el numero de telefono');
    readln(l.numero);
    writeln('Ingrese la cantidad de minutos consumidos');
    readln(l.cantMinutos);
    writeln('Ingrese la cantidad de MB consumidos en el mes');
    readln(l.cantMb);
end;

procedure procesarCliente(var c: cliente; var totalMinutos: integer; var totalMb: real);
var
    l: linea;
    i: integer;
    totalMbCliente: real;
begin
    writeln('Ingrese el codigo de cliente:');
    readln(c.codigo);
    writeln('Ingrese la cantidad de lineas:');
    readln(c.cantLineas);

    totalMinutos := 0;
    totalMbCliente := 0;
    for i := 1 to c.cantLineas do begin
        leerLinea(l);
        totalMinutos := totalMinutos + l.cantMinutos;
        totalMbCliente := totalMbCliente + l.cantMb;
    end;

    totalMb := totalMinutos * 3.40 + totalMbCliente * 1.35;
end;

