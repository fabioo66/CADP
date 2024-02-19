program CodigosNecesarios;
//cargar vector

procedure cargarVector(var v: vector);
var
	i: integer;
begin
	for i:= 1 to dimf do begin
		leerEmpleado(v[i]);
end;

//cargar vector con diml

procedure cargarVector(var v: vector; var diml: integer);
var
	e: empleado;
begin
	diml:= 0;
	leerEmpleado(e);
	while(e.codigo <> -1)and(diml < dimf)do begin
		diml:= diml + 1;
		v[diml]:= e;
		leerEmpleado(e);
	end;
end;

//agregar un elemento al vector

procedure agregar(var v: vector; var diml: integer; var pude: boolean; e: empleado);
var
	i: integer;
begin
	pude:= false;
	if(diml+1 <= dimf)then begin
		diml:= diml + 1;
		v[diml]:= e;
		pude:= true;
	end;
end;

//insertar un elemento al vector

procedure insertar(var v:vector; var diml: integer; var pude: boolean; pos: integer; e: empleado);
var
	i: integer;
begin
	pude:= false;
	if(diml+1 <= dimf)and(pos >= 1 and pos <= diml)then begin
		for i:= diml downto pos do 
			v[i+1]:= v[i];
		pude:= true;
		v[pos]:= e;
		diml:= diml + 1;
	end;
end;

//eliminar un elemento del vector

procedure eliminar(var v:vector; var diml: integer; var pude: boolean; pos: integer; e: empleado);
var
	i: integer;
begin
	pude:= false
	if(pos >= 1 and pos <= diml)then begin
		for i:= pos to diml-1 do 
			v[i]:= v[i+1];
		pude:= true;
		diml:= diml - 1;
	end;
end;

//busqueda de un vector desordenado

function buscarCodigo(v:vector; diml: integer; codigo: integer): boolean;
var 
	pos: integer;
	encontre: boolean;
begin
	pos:= 1;
	encontre:= false;
	while(pos <= diml) and (not encontre)do begin
		if(v[pos].codigo <> codigo)then
			pos:= pos + 1
		else
			encontre:= true;
	end;
	buscarCodigo:= encontre;
end;

//busqueda de un vector ordenado

function buscarCodigo(v:vector; diml: integer; codigo: integer): boolean;
var
	pos: integer;
	encontre: boolean;
begin
	pos:= 1;
	while(pos <= diml)and(v[pos].codigo < codigo)do
		pos:= pos + 1;
	if(pos <= diml)and(v[pos].codigo = codigo)then
		encontre:= true
	else
		encontre:= false
end;

//cargar lista

procedure cargarLista(var L: lista);
var
	e: empleado;
begin
	leerEmpleado(e);
	while(e.codigo <> -1)do begin
		agregarEmpleado(L, e);
		leerEmpleado(e);
	end;
end;

//agregar adelante

procedure agregarAdelante(var L: lista; e:empleado);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= e;
	nue^.sig:= L;
	L:= nue;
end;

//agregar atras

//con un puntero que tiene la direccion del ultimo nodo
procedure agregarAtras(var L, ult: lista; e: empleado);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= e;
	nue^.sig:= nil;
	if(L = nil)then
		L:= nue
	else
		ult^.sig:= nue;
	ult:= nue;
end;

procedure agregarAtras(var L: lista; e: empleado);
var
	nue, aux: lista;
begin
	new(nue);
	nue^.dato:= e;
	nue^.sig:= nil;
	if(L = nil)then
		L:= nue
	else begin
		aux:= L;
		while(aux^.sig <> nil)do
			aux:= aux^.sig;
		aux^.sig:= nue;
	end;
end;

//insertar ordenado

procedure insertarOrdenado(var L: lista; e:empleado);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato:= e;
	act:= L;
	while(act <> nil)and(act^.dato.codigo < e.codigo)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then
		L:= nue
	else
		ant^.sig:= nue;
	nue^.sig:= act;
end;

//eliminar

procedure eliminar(var L:lista; codigo: integer);
var
	act, ant: lista;
begin
	act:= L;
	while(act <> nil)and(L^.dato.codigo <> codigo)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act <> nil)then begin
		if(ant = act)then
			L:= act^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

//eliminar si la lista esta ordenada

procedure eliminar(var L:lista; codigo: integer);
var
	act, ant: lista;
begin
	act:= L;
	while(act <> nil)and(L^.dato.codigo < codigo)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act <> nil)then begin
		if(ant = act)then
			L:= act^.sig
		else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

//eliminar ocurrencias

procedure eliminar(var L: lista; codigo: integer);
var
	act, ant: lista;
begin
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
			actual:= ant;
		end;
	end;
end;

//eliminar ocurrencias si la lista esta ordenada

procedure eliminar(var L: lista; codigo: integer);
var
	act, ant: lista;
begin
	act:= L;
	while(act <> nil)do begin
		if(act^.dato < codigo)then begin
			ant:= act;
			act:= act^.sig;
		end
		else begin
			if(act = L)then
				L:= L^.sig
			else
				ant^.sig:= act^.sig;
			dispose(act);
			actual:= ant;
		end;
	end;
end;

//busqueda en una lista desordenada

function buscar(L: lista; codigo: integer): boolean;
var
	encontre: boolean;
begin
	encontre:= false;
	while(L <> nil)and(encontre = false)do begin
		if(L^.dato.codigo = codigo)then
			encontre:= true
		else
			L:= L^.sig;
	end;
	buscar:= encontre;
end;

//busqueda en una lista ordenada

function buscar(L: lista; codigo: integer): boolean;
var
	encontre: boolean;
begin
	while(L <> nil)and(L^.dato.codigo < codigo)do 
		L:= L^.sig;
	if(L <> nil)and(L^.dato.codigo = codigo)then
		encontre:= true
	else
		encontre:= false;
end;

//corte de control

procedure procesar(L: lista);
var
	codigoActual, cant: integer;
begin
	while(L <> nil)do begin
		codigoActual:= L^.dato.codigo;
		cant:= 0;
		while(L <> nil)and(L^.dato.codigo = codigoActual)do 
			cant:= cant + 1;
		L:= L^.sig;
	end;
end;

//descomponer un numero

function masParesQueImpares(num: integer): boolean;
var
	pares, impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while(num <> 0)do begin
		if((num mod 10) mod 2 = 0)then 
			pares:= pares + 1;
		else
			impares:= impares + 1;
		num:= num div 10;
	end;
end;

//maximos/minimos

procedure obtenerMaximos(var codigoMax1, codigoMax2: integer; codigo, cantidad: integer);
var
	max1, max2: integer;
begin
	max1:= -9999;
	if(cantidad > max1)then begin
		codigoMax2:= codigoMax1;
		max2:= max1;
		codigoMax1:= codigo;
		max1:= cantidad
	end
	else
		if(cantidad > max2)then begin
			codigoMax2:= codigo;
			max2:= cantidad;
		end;
end;
			
			
