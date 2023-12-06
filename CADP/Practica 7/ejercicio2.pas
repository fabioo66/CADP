program ejercicio2;
type
	prango = 1..6;
	cliente = record
		codigo: integer;
		dni: integer;
		apellido: string;
		nombre: string;
		poliza: prango;
		monto: real;
	end;
  
	tabla = array[prango]of real; //se dispone
  
	lista = ^nodoLista;
	nodoLista = record
		dato: cliente;
		sig: lista;
	end;
  
procedure leerCliente(var c:cliente);
begin
	writeln('Ingrese el codigo de cliente');
	readln(c.codigo);
	if(c.codigo <> 1122)then begin
		writeln('Ingrese el dni del cliente');
		c.dni:= random(3333)+1;
		writeln(c.dni);
		writeln('Ingrese el apellido');
		readln(c.apellido);
		writeln('Ingrese el nombre');
		readln(c.nombre);
		writeln('Ingrese el codigo de poliza');
		c.poliza:= random(6)+1;
		writeln(c.poliza);
		writeln('Ingrese el monto');
		c.monto:= random(5000)*0.135;
		writeln(c.monto:0:2);
   end;
end;

procedure cargarVector(var v: tabla); //se dispone
var
	i: integer;
begin
	for i:= 1 to 6 do
	  v[i]:= random(2000)+1;
end;

procedure informarTabla(v:tabla); //se dispone
var
	i:integer;
begin
	for i:= 1 to 6 do
		writeln('En el codigo de poliza ', i, ' El monto adicional es de ', v[i]:0:2);
end; 

procedure agregarAdelante(var L: lista; c: cliente);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= c;
	nue^.sig:= L;
	L:= nue;
end;

procedure cargarLista(var L: lista);
var
	c:cliente;
begin
	leerCliente(c);
	while(c.codigo <> 1122)do begin
		agregarAdelante(L, c);
		leerCliente(c);
	end;
end;

function alMenosDosNueves(num: integer): boolean;
var
	nueves: integer;
begin
	nueves:= 0;
	while(num <> 0)do begin
		if((num mod 10) = 9)then
			nueves:= nueves + 1;
	    num:= num div 10;
	end;
	alMenosDosNueves:= nueves >= 2;
end;

procedure informar(L: lista; v:tabla);
var
  montoTotal: real;
begin
	while(L <> nil)do begin
		montoTotal:= L^.dato.monto + v[L^.dato.poliza];
		writeln('DNI: ', L^.dato.dni, ' Apellido y nombre ', L^.dato.nombre, L^.dato.apellido, ' monto: ', montoTotal:0:2);
		if(alMenosDosNueves(L^.dato.dni))then
			writeln('Cliente con al menos dos digitos 9 en el dni -> ', L^.dato.nombre, L^.dato.apellido);
		L:= L^.sig;
	end;
end;

procedure eliminar(var L:lista; codigo: integer);
var
  act, ant: lista;
begin
	act:= L;
	while(act <> nil)and(act^.dato.codigo <> codigo)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act <> nil)then begin
		if(act <> L)then
			L:= act^.sig
	    else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

VAR
	v:tabla;
	L: lista;
	codigo: integer;
BEGIN
	randomize;
	L:= nil;
	cargarLista(L);
	cargarVector(v);
	informarTabla(v);
	informar(l, v);
	writeln('Ingrese un codigo de cliente para eliminarlo');
	readln(codigo);
	eliminar(l, codigo);
END.
