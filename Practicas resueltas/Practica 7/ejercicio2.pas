{Implementar un programa que lea y almacene información de clientes de una empresa aseguradora 
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada 
(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código 
1122, el cual debe procesarse.  
La empresa dispone  de una  tabla donde  guarda un valor  que representa  un monto  adicional que  el 
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de  póliza que tiene 
contratada.  Una vez finalizada la lectura de todos los clientes, se pide:  
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente 
por su seguro automotriz (monto básico + monto adicional).  
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.  
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la 
estructura.}

program ejercicio2;
type
    cRango = 1..6;

    cliente = record
        codigo: integer;
        dni: integer;
        apellido: string;
        nombre: string;
        codigo_poliza: cRango;
        monto_basico: real;
    end;
    
    lista = ^nodo;	
    nodo = record
        dato: cliente;
        sig: lista;
    end;

    tabla = array[cRango] of real;

procedure leerCliente(var c: cliente);
begin
    writeln('Ingrese el codigo del cliente');
    readln(c.codigo);
    if (c.codigo <> 1122) then
    begin
        writeln('Ingrese el DNI del cliente');
        readln(c.dni);
        writeln('Ingrese el apellido del cliente');
        readln(c.apellido);
        writeln('Ingrese el nombre del cliente');
        readln(c.nombre);
        writeln('Ingrese el codigo de poliza contratada');
        readln(c.codigo_poliza);
        writeln('Ingrese el monto basico que abona mensualmente');
        readln(c.monto_basico);
    end;
end;

procedure agregarAdelante(var l: lista; c: cliente);
var
    nue: lista;
begin
    new(nue);
    nue^.dato:= c;
    nue^.sig:= l;
    l:= nue;
end;

procedure cargarLista(var l: lista);
var
    c: cliente;
begin
    repeat
        leerCliente(c);
        agregarAdelante(l, c);
    until (c.codigo = 1122);
end;

procedure cargarTabla(var t: tabla);
begin
    t[1]:= 100;
    t[2]:= 200;
    t[3]:= 300;
    t[4]:= 400;
    t[5]:= 500;
    t[6]:= 600;
end;

function dosNueve(dni: integer): boolean;
var
    cantNueve: integer;
begin
    cantNueve:= 0;
    while (dni <> 0) do begin
        if(dni mod 10 = 9) then
            cantNueve:= cantNueve + 1;
        dni:= dni div 10;
    end;
    dosNueve:= cantNueve >= 2;
end;

procedure procesarLista(l: lista; t: tabla);
var
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, ' Apellido: ', l^.dato.apellido, ' Nombre: ', l^.dato.nombre, ' Monto completo: ', l^.dato.monto_basico + t[l^.dato.codigo_poliza]:0:2);
        if (dosNueves(l^.dato.dni)) then
            writeln('Contienen en el DNI al menos dos 9, Apellido: ', l^.dato.apellido, ' Nombre: ', l^.dato.nombre);
        l:= l^.sig;
    end;
end;

procedure eliminarCliente(var l: lista; codigo: integer);
var
    ant, act: lista;
begin
    act := l;
    while ((act <> nil) and (act^.dato.codigo <> codigo)) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if (act <> nil) then begin
        if (act = l) then
            l:= act^.sig
        else
            ant^.sig:= act^.sig;
        dispose(act);
    end;
end;

var
    l: lista;
    t: tabla;
begin
    l:= nil;
    cargarLista(l);
    // La tabla se carga con valores arbitrarios
    cargarTabla(t);
    procesarLista(l, t);
    eliminarCliente(l, 1);
end.