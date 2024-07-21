program ejercicio1;
type
	crango = 1..5;
	persona = record
		dni: integer;
		nomYApe: string;
		edad: integer;
		codigo: crango;
	end;
  
	lista = ^nodoLista;
	nodoLista = record
		dato: persona;
		sig: lista;
	end;
  
	vector = array[crango] of integer;
  
procedure leerPersona(var p:persona);
begin
	writeln('Ingrese el dni de la persona');
	readln(p.dni);
	if(p.dni <> 335)then begin
		writeln('Ingrese el nombre y apellido');
		readln(p.nomYApe);
		writeln('Ingrese la edad de la persona');
		//readln(p.edad);
		p.edad:= random(20)+18;
		writeln(p.edad);
		writeln('Ingrese el codigo de genero de actuacion');
		//readln(p.codigo);
		p.codigo:= random(5)+1;
		writeln(p.codigo);
	end;
end;

procedure agregarAdelante(var L:lista; p: persona);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig:= L;
	L:= nue;
end;

procedure cargarLista(var L:lista);
var
	p:persona;
begin
	repeat
		leerPersona(p);
		agregarAdelante(L, p);
    until(p.dni = 335);
end;

procedure inicializarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to 5 do
		v[i]:= 0;
end;

function masPares(num: integer): boolean;
var
  pares, impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while(num <> 0)do begin
		if((num mod 10) mod 2 = 0)then
			pares:= pares + 1
		else
			impares:= impares + 1;
		num:= num div 10;
	end;
	masPares:= pares > impares;	
end;

procedure procesarLista(L:lista; var v:vector; var cant: integer);
begin
	cant:= 0;
	while(L <> nil)do begin
	  if(masPares(L^.dato.dni))then
	    cant:= cant + 1;
	  v[L^.dato.codigo]:= v[L^.dato.codigo] + 1;
	  L:= L^.sig;
	end;
end;

procedure codigosMasElegidos(v:vector; var code1, code2: integer);
var
	i, max1, max2: integer;
begin
	max1:= -9999;
	max2:= -9999;
	for i:= 1 to 5 do begin
	  if(v[i] > max1)then begin
	    code2:= code1;
	    max2:= max1;
	    code1:= i;
	    max1:= v[i]
	  end
	  else
	    if(v[i] > max2)then begin
			max2:= v[i];
			code2:= i;
	    end;
	end;
end;

procedure eliminar(var L:lista; dni: integer; var encontre: boolean);
var
  act, ant: lista;
begin
	encontre:= false;
	act:= L;
	while(act <> nil)and(dni <> act^.dato.dni)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act <> nil)then begin
		encontre:= true;
		if(act = L)then
			L:= act^.sig
	    else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

VAR
	L: lista;
	v: vector;
	dni, code1, code2, cant: integer;
	encontre: boolean;
BEGIN
    randomize;
	L:= nil;
	cargarLista(L);
	inicializarVector(v);
	procesarLista(L, v, cant);
	writeln('La cantidad de dni con mas pares que impares es ', cant);
	codigosMasElegidos(v, code1, code2);
	writeln('Los codigos de genero mas elegidos son ', code1, ' y ', code2);
	writeln('Ingrese un dni para eliminar a la persona');
	readln(dni);
	eliminar(l, dni, encontre);
	if(encontre)then
		writeln('El dni fue encontrado y se elimino a esa persona')
	else
		writeln('El dni no fue encontrado');
END.
