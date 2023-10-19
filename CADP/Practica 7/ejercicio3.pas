program ejercicio3;
type
  cadena = string[30]
  viaje = record
    numero: integer;
    codigo: integer;
    direccionori: cadena;
    direcciondest: cadena;
    kilometros: real;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: viaje;
    sig: lista;
  end;
procedure leerviaje(var v: viaje); //se dispone 
procedure cargarlista(var L:lista); //se dispone 

calcularmaximos(var maxcodigo1, maxcodigo2: integer; var max1, max2: real; km: real; codigo: integer);
begin
  if(km > max1)then begin
    max2:= max1;
    maxcodigo2:= codigo1;
    max1:= km;
    maxcodigo1:= codigo
  end    
  else if(km > max2)then begin
    max2:= km;
    maxcodigo2:= codigo;
  end;    
end;
procedure agregarviaje(var Lcumple: lista; v: viaje);
var
  nue,ant,act: lista;
begin
  new(nue);
  nue^.dato:= v;
  ant:= L;
  act;
  while(act <> nil) and (act^.dato.numero < v.numero)do begin
    ant:= act;
    act:= act^.sig;
  end;
  if(act = ant)then
    L:= nue;
  else 
    ant^.sig:= nue;
  nue^.sig:= act;    
end;    
end;
procedure procesar(L: lista; var lcumple: lista; var maxcodigo1, maxcodigo2: integer);
var
  actcodigo: integer;
  max1, max2, km: real;
begin
  lcumple:= nil;
  max1:= -9999;
  maxo2:= -9999;
  while (L <> nil)do begin
    km:= 0;
    actcodigo:= l^.dato.codigo
    while (L <> nil) and (L^.dato.codigo = actcodigo)do begin
      km:= km + L^.dato.kilometros;
      if(L^.dato.kilometros > 5)then
        agregarviaje(lcumple, l^.dato);
    L:= L^.sig;
    end;
    calcularmaximos(maxcodigo1, maxcodigo2, max1, max2, km, actcodigo);
  end;    
end;

var
  L, Lcumple: lista;
  maxcode1, maxcode2: integer;
begin
  cargarlista(L) //se dispone
  procesar(L, Lcumple, maxcode1, maxcode2);
  writeln(maxcode1, maxcode2);
end;
