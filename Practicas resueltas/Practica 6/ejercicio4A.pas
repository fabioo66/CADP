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
procedure maximo(L:lista; var max:integer);
begin
  max:= -999;
  while (L <> nil)do begin
    if (L^.num > max)then
      max:= L^.num;
    L:= l^.sig;
  end;
end;
var
  pri : lista;
  valor,max : integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do begin
    armarNodo(pri, valor);
    writeln('Ingrese un numero');
    read(valor);
  end;
  maximo(pri,max);
  writeln(max);
end.
