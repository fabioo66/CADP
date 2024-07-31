{Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su
número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán
todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a
uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}

program ejercicio10;
type
    cliente = record
        dni: integer;
        numero: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: cliente;
        sig: lista;
    end;

{a}
procedure agregarAtras(var L: lista; c: cliente);
var
    nue, aux: lista;
begin
    new(nue);
    nue^.dato := c;
    nue^.sig := nil;
    if(L = nil) then
        L := nue
    else begin
        aux := L;
        while(aux^.sig <> nil) do
            aux := aux^.sig;
        aux^.sig := nue;
    end;
end;

{b}
procedure RecibirCliente(var L: lista; var ultimoNumero: integer);
var
    c: cliente;
begin
    write('Ingresa el D.N.I del cliente: '); 
    readln(c.dni);
    while (c.dni <> 0) do begin
        ultimoNumero := ultimoNumero + 1;
        c.numero := ultimoNumero;
        writeln('El cliente con D.N.I ', c.dni, ' recibe el número: ', c.numero);
        agregarAtras(L, c);
        write('D.N.I: '); 
        readln(c.dni);
    end;
end;

{c}
procedure AtenderCliente(var L: lista);
var
    aux: lista;
begin
    aux := L;
    L := L^.sig;
    dispose(aux);
    writeln('El cliente con D.N.I ', L^.dato.dni, ' y número ', L^.dato.numero, ' fue atendido');

end;

{d}
var 
    L: lista;
    ultimoNumero: integer;  { Variable local para llevar el número de espera }
begin
    L := nil;
    ultimoNumero := 0;  { Inicializa el número de espera en 0 }
    RecibirCliente(L, ultimoNumero);
    while (L <> nil) do
        AtenderCliente(L);
end.