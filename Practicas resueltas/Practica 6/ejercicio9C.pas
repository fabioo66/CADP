procedure agregaradelante (var L:lista; n:integer);
var
  nue:lista;
begin
  new(nue);
  nue^.dato:= S;
  nue^.sig:= L;
  L:= nue;
end;

function cumple(num,a,b:integer):boolean;
begin
  cumple:= (num > a) and (num < b);
end;

procedure sublista(L:lista; var ListaC:lista ; A,B:integer);
begin
  while(L <> nil)do begin
    if(cumple(L^.num,A,B))then
      agregaradelante(ListaC,L^.num);
    L:= L^.sig;
  end;
end;
