procedure armarNodoatras(var pri, ult:lista; v: integer);
var
  nuevo : lista;
begin
  new(nuevo);
  nuevo^.num := v;
  nuevo^.sig:= nil;
  if (pri = nil) then begin
    pri:= nuevo;
    ult:= nuevo;
  end
  else begin
    ult^.sig:= nuevo;
    ult:= nuevo;
end;
end;
procedure armarNodoadelante(var pri: lista; v: integer);
var
  aux,nuevo: lista;
begin
  new(nuevo);
  nuevo^.num := v;
  nuevo^.sig := nil;
  if (pri = nil)then
    pri:= nuevo;
  else begin
    aux:= pri;
    while (aux^.sig <> nil) do 
      aux:= aux^.sig;
    aux^.sig:= nuevo:
end;
