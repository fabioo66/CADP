procedure nodoOrdenado(var L:lista; n:integer);
var
  nue:lista;
  act,ant:lista;
begin
  new(nue);
  nue^.num:= n;
  act:= L;
  ant:= L;
  while(act <> nil) and(n > act^.num) do begin
    ant:= act;
    act:= ant^.sig;
  end;
  if(act = ant)then
    L:= nue
  else
    ant^.sig:= nue;
  nue^.sig:= act;
end;
