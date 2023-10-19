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

procedure eliminar(var L:lista; num:integer);
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
      ant^.sig:= act^.sig;
      
    dispose(act);
  end;
end;
