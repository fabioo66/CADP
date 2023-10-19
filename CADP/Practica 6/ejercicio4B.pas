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
procedure minimo(L:lista; var min:integer);
begin
  min:= 999;
  while(L <> nil) do begin
    if(L^.num < min)then
      min:= L^.num;
    L:= L^.sig;
  end;
end;
var
  pri : lista;
  valor,min : integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do begin
    armarNodo(pri, valor);
    writeln('Ingrese un numero');
    read(valor);
  end;
  minimo(pri,min);
  writeln('El valor minimo ingresado fue: ',min);
end.
