{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}

{a}
procedure armarNodoatras(var pri: lista; v: integer);
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
end;

{b}
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