{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A}

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
function maximo(L: lista): integer;
var
    max: integer;
begin
    max := -1;
    while (L <> nil) do begin
        if (L^.num > max) then
            max := L^.num;
        L := L^.sig;
    end;
    maximo := max;
end;

{b}
function minimo(L: lista): integer;
var
    min: integer;
begin
    min := 9999;
    while (L <> nil) do begin
        if (L^.num < min) then
            min := L^.num;
        L := L^.sig;
    end;
    minimo := min;
end;

{c}
function multiplos(L: lista; A: integer): integer;
var
    cant: integer;
begin
    cant := 0;
    while (L <> nil) do begin
        if (L^.num mod A = 0) then
            cant := cant + 1;
        L := L^.sig;
    end;
    multiplos := cant;
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