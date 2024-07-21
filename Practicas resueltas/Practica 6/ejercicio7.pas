function cumple(S:sonda):boolean;
begin
  cumple:= (s.costomant < s.costoconst) and (s.rango <> 1);
end;

procedure procesarlistas(L:lista; var Listasi:lista; var Listano:lista);
begin
  Listasi:= nil;
  Listano:= nil;
  while(L <> nil) do begin
    if(cumple(L^.dato))then
      agregaradelante(Listasi,L^.dato)
    else
      agregaradelante(Listano,L^.dato);
    L:= L^.sig;
  end;
end;

procedure listasnofinanciadas (L:lista; var costototal:real; var cantsondas:integer);
begin
  cantsondas:= 0;
  costototal:= 0;
  while(L <> nil)do begin
    cantsondas:= cantsondas + 1;
    costototal:= costototal + (L^.dato.costoconst + L^.dato.costomant);
    L:= L^.sig;
  end;
end;
