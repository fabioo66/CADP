{Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera descendente.}

program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

procedure imprimirLista(L: lista);
begin
    while (L <> nil) do begin
        writeln(L^.num);
        L := L^.sig;
    end;
end;

procedure incrementar(L: lista; valor: integer);
begin
    while (L <> nil) do begin
        L^.num := L^.num + valor;
        L := L^.sig;
    end;
end;

{a}
function estaOrdenada(L:lista):boolean;
var
    ok:boolean;
    act:integer;
begin
    ok:= true;
    while(L <> nil) and (ok) do begin
        act:= L^.num;
        L:= L^.sig;
        if (act > L^.num)then
            ok:= false;
    end;
    estaOrdenada:= ok;
end;

{b}
procedure eliminarDesordenado(var L:lista; num:integer);
var
    act,ant:lista;
begin
    act:= L;
    while(act <> nil)and (act^.num <> num) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil)then begin
        if(act = L)then
            L:= L^.sig
        else
            nt^.sig:= act^.sig;
        dispose(act);
    end;
end;

procedure eliminarOrdenado(var L:lista; codigo: integer);
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

procedure eliminar(var L:lista; num:integer);
begin
    if(estaOrdenada(L))then
        eliminarOrdenado(L,num)
    else
        eliminarDesordenado(L,num);
end;

{c}
procedure sublista(L:lista; A,B:integer; var L2:lista);
var
    aux:lista;
begin
    L2:= nil;
    while(L <> nil) do begin
        if(L^.num > A) and (L^.num < B)then 
            armarNodo(L2, L^.num);
        L:= L^.sig;
    end;
end;

{d}
procedure sublistaAsc(L:lista; var ListaC:lista ; A,B:integer);
begin
    while (L <> nil) and (L^.num > B) do begin
        if((L^.num > A) and (L^.num < B))then
            agregaradelante(ListaC,L^.num);
        L:= L^.sig;
    end;
end;

{e}
procedure sublistaDesc(L:lista; var ListaC:lista ; A,B:integer);
begin
    while (L <> nil) and (L^.num < A) do begin
        if((L^.num > A) and (L^.num < B))then
            agregaradelante(ListaC,L^.num);
        L:= L^.sig;
    end;
end;

var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirLista(pri);
end.