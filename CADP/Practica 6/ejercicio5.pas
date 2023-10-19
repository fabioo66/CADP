program ejercicio5;
type
  producto = record
    codigo: string;
    descripcion: string;
    stockactual: integer;
    stockmin: integer;
    precio: real;
  end;
  lista = ^nodo;
  nodo = record
    elem: producto;
    sig: lista;
  end;
procedure leerproducto(var p:producto);
begin
  readln(p.codigo);
  readln(p.descripcion);
  readln(p.stockactual);
  readln(p.stockmin);
  readln(p.precio);
end;
procedure agregaradelante(var L:lista; p:producto);
var
  nuevo: lista;
begin
  new(nuevo);
  nuevo^.elem:= p;
  nuevo^.sig:= L;
  L:= nuevo
end;
procedure cargarlista(var L:lista);
var
  p:producto;
begin
  leerproducto(p);
  while(p.codigo <> -1)do begin
    agregaradelante(L,P);
    leerproducto(p);
  end;  
end;
function porcentaje(L: lista): real;
var
  cant, total, porc: real;
begin
  cant:= 0;
  total:= 0;
  while(L <> nil)do begin
    total:= total + 1;
    if(L^.elem.stockactual < L^.elem.stockmin)then 
      cant:= cant + 1;
    L:= L^.sig;
  end;
  porc:= (cant/total) * 100;
  porcentaje:= porc;
end;
function cumple(L:lista): boolean;
var
  resto,cant: integer;
  ok: boolean;
  p: producto;
begin
  ok:= false;
  cant:= 0;
  while (L <> nil)do begin
    p := L^.elem;
    while(p.codigo <> 0)do begin
      resto:= p.codigo mod 10;
      if(resto mod 2 = 0)then
        cant:= cant + 1;
      p.codigo:= p.codigo div 10;
    end;
    L:= L^.sig
  end;  
  if(cant >= 3)then
    ok:= true
  cumple:= ok;  
end;
procedure incisob(L:lista);
var
  resto,cant: integer;
begin
  while(L <> nil)do begin
    if(cumple(L))then
      writeln(L^.elem.descripcion);
    L:= L^.sig;  
  end;
end;  
procedure codigoseconomicos(L: lista; var codigo1, codigo2:lista);
var
  min1, min2: real;
begin
  min1:= 9999;
  min2:= 9999;
  while(L <> nil)do begin
    if(L^.elem.precio < min1)then begin
      min2:= min1;
      codigo2:= codigo1;
      min1:= L^.precio;
      codigo:= L^.elem.codigo
    end
    else if(L^.elem.precio < min2)then begin
      min2:= L^.precio;
      codigo2:= L^.elem.codigo;
    end;
    L:= L^.sig;
  end;  
end;
var  
  L, code1, code2:lista;
begin
  L:= nil;
  cargarlista(L);
  writeln('Porcentaje de productos con stock actual por debajo de su stock mínimo es: ', porcentaje(L):0:2);
  incisob(L);
  codigoseconomicos(L, code1, code2);
  writeln('Los códigos de los dos productos más económicos son: ', code1, code2);
end.
