{ El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada
usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y
cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la
revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden
ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

program ejercicio13;
const
	dimf = 3600;
type
	rango = 1..4;

	usuario = record
		email : string;
		rol : rango;
		revista : string;
		cantDias : integer;
	end;
	
	vector = array [1..dimf] of usuario;
	vectorContador = array [rango] of integer;
	
	lista = ^nodo;
	nodo = record
		dato : usuario;
		sig : lista;
	end;
	
// se dispone
procedure cargarVector(var v : vector); 

procedure insertarOrdenado(var L : lista; u : usuario);
var
	nue, act, ant : lista;
begin
	new(nue);
	nue^.dato := u;
	act := L;
	while((act <> nil) and (act^.dato.cantDias < u.cantDias)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (act = ant) then
		L := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;
		
procedure inicializarVectorContador(var vc : vectorContador);
var
	i : rango;
begin
	for i := 1 to 4 do
		vc[i] := 0;
end;

procedure maximo(cantDias : integer; email : string; var max1, max2 : integer; var max1, max2 : string);
begin
	if (cantDias > max1) then begin
		max2 := max1;
		Emailmax2 := Emailmax1;
		max1 := cantDias;
		Emailmax1 := email;
	end
	else
		if (cantDias > max2) then begin
			max2 := cantDias;
			Emailmax2 := email;
		end;
end;

procedure procesarVector(v : vector; var vc : vectorContador; var L : lista; var Emailmax1, Emailmax2 : String);
var
	i, max1, max2 : integer;
begin
	max1 := -1;
	max2 := -1;
	for i := 1 to dimf do begin
		if (v[i].revista = 'Economica') then
			insertarOrdenado(L, v[i]);
		vc[v[i].rol] := vc[v[i].rol] + 1;
		maximo(v[i].cantDias, v[i].email, max1, max2, EmailMax1, Emailmax2);
	end;
end;

procedure procesarLista(L : lista);
var
	penultimo : lista;
begin
	while(L <> nil) do begin
		writeln('Usuario: ', L^.dato.email, ' Ultimo acceso: ', L^.dato.cantDias, ' dias ');
		L := L^.sig;
	end;
end;

procedure informarVectorContador(vc : vectorContador);
var
	i : rango;
begin
	for i := 1 to 4 do
		writeln('Cantidad de usuarios en el rol ', i, ' es ', vc[i]);
end;

var
	v : vector;
	vc : vectorContador;
	L : lista;
	Emailmax1, Emailmax2 : string;
begin
	L := nil;
	inicializarVectorContador(vc);
	cargarVector(v);
	procesarVector(v, vc, L, Emailmax1, Emailmax2);
	procesarLista(L);
	informarVectorContador(vc);
	writeln('Los dos usuarios que hace mas tiempo que no ingresan al portal son: ', Emailmax1, ' y ', Emailmax2);
end.

		
