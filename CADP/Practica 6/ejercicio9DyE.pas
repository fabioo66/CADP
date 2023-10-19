procedure sublistaasc(L:lista; var ListaC:lista ; A,B:integer);
begin
  while (L <> nil) and (L^.num > B) do begin
    if((L^.num > A) and (L^.num < B))then
      agregaradelante(ListaC,L^.num);
    L:= L^.sig;
  end;
end;

procedure sublistadesc(L:lista; var ListaC:lista ; A,B:integer);
begin
  while (L <> nil) and (L^.num < A) do begin
    if((L^.num > A) and (L^.num < B))then
      agregaradelante(ListaC,L^.num);
    L:= L^.sig;
  end;
end;
