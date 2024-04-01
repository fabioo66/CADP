program ejercicio3;
type
	viaje = record 
		num: integer;
		codigo: integer;
		origen: string;
		destino: string;
		km: real;
	end;
	
	lista = ^nodoLista;
	nodoLista = record
		dato: viaje;
		sig: lista;
	end;
	
procedure cargarLista(var L: lista); //se dispone

procedure autosMasKm(var code1, code2: integer; km: real; codigo: integer);
var
	max1, max2: real;
begin
	max1:= -9999;
	max2:= -9999;
	if(km > max1)then begin
		max2:= max1;
		code2:= code1;
		max1:= km;
		code1:= codigo
	end
	else
		if(km > max2)then begin
			max2:= km;
			code2:= codigo;
		end;		
end;

procedure agregarOrdenado(var L2: lista; v: viaje);
var
	ant, act, nue: lista;
begin
	new(nue);
	nue^.dato:= v;
	act:= L;
	ant:= L;
	while(act <> nil)and(v.num < act^.dato.num)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then
		L:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

procedure procesar(L: lista; var code1, code2: integer; var L2: lista);
var
	actual: integer;
	km: real;
begin
	L2:= nil;
	while(L <> nil)do begin
		km:= 0;
		actual:= L^.dato.codigo;
		while(L <> nil)and(actual = l^.dato.codigo)do begin
			km:= km + L^.dato.km;
			if(l^.dato.km > 5)then
				agregarOrdenado(L2, L^.dato);
	    end;
	    L:= L^.sig;
		autosMasKm(code1, code2, km, actual);
	end;
end;

VAR
	L: lista;
	L2: lista;
	code1, code2: integer;
BEGIN
	L:= nil;
	cargarLista(L); //se dispone
	procesar(L, code1, code2, L2);
	writeln('Los codigos maximos son ', code1, ' y ', code2);
END.
