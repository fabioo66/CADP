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
procedure multiplos(L:lista; num:integer ; var multi:integer);
begin
  multi:= 0;
  while (L <> nil)do begin
    if(L^.num MOD num = 0)then 
      multi:= multi + 1;
    L:= L^.sig;
  end;
end;
var
  pri : lista;
  valor,num,multi : integer;
begin
  writeln('Ingrese un numero que quiera contar la cantidad de multiplos de este que hay en la lista.');
  read(num);
  pri := nil;
  writeln('Ahora ingrese un numero a la lista');
  read(valor);
  while (valor <> 0) do begin
    armarNodo(pri, valor);
    writeln('Ingrese un numero');
    read(valor);
  end;
  multiplos(pri,num,multi);
  writeln('La cantidad de multiplos de ' ,num, ' fue: ',multi);
end.
