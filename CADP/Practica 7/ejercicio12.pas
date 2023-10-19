program ejercicio12;
type
  srango = 1..4;
  vector = array[srango] of real;
  vectorcontador = array[srango]of integer;
  cliente = record
    nombre: string;
    DNI: integer;
    edad: integer;
    tipo: srango;
  end;
  lista = ^nodo;
  nodo = record
    dato: cliente;
    sig: lista;
  end;
  clientecumple = record
    nombre: string;
    DNI: integer;
  end;
  Lcumple = ^nodo1;
  nodo1 = record;
    dato: clientecumple;
    sig: Lcumple;
  end;
procedure leerclientecumple(var cc: clientecumple);
begin
  readln(cc.nombre);
  readln(cc.DNI);
end;
procedure agregarcliente(var Lc: lcumple; cc: clientecumple);
var
  act, ant, nue: lcumple;
begin
  new(nue);
  nue^.dato:= cc;
  nue^.sig:= nil;
  ant:= Lc;
  act:= Lc;
  while(act <> nil)and(act^.dato.DNI < cc.DNI)do begin
    ant:= act;
    act:= act^.sig;
  end;
  if(ant = act)then 
    L:= nue;
  else
    ant^.sig:= nue;
  nue^.sig:= act;
end;
procedure cargarvector(var v: vector); //se dispone
var
  num: real;
  i: srango;
begin
  for i:= 1 to 4 do begin
    readln(num);
    v[i]:= num;
  end;
end;
procedure leercliente(var c: cliente);
begin
  readln(c.DNI);
  if(c.DNI <> 0)then begin
    readln(c.nombre);
    readln(c.edad);
    readln(c.tipo);
  end;
end;
procedure agregaradelante(var L: lista; c:cliente);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= c;
  nue^.sig:= L;
  L:= nue;
end;
procedure cargarlista(var L:lista);
var
  c: cliente;
begin
  leercliente(c);
  while(c.DNI <> 0)do begin
    agregaradelante(L, c);
    leercliente(c);
  end;
end;
procedure inicializar(var vc: vectorcontador);
var 
  i: srango;
begin
  for i:= 1 to 4 do
    vc[i]:= 0;
end;
procedure procesarlista(L: lista; v: vector; vc: vectorcontador; var montototal: real; var Lc: lcumple);
var
  cc: clientecumple;
begin
 Lc:= nil;
  montototal:= 0;
  while(L <> nil)do begin
    montototal:= montototal + v[L^.dato.tipo]; 
    vc[L^.dato.tipo]:= vc[L^.dato.tipo] + 1;
    Lc^.dato.DNI:= L^.dato.DNI;
    Lc^.dato.nombre:= L^.dato.nombre;
    if(L^.dato.edad >= 40)and((L^.dato.tipo = 3) or (L^.dato.tipo = 4))then
      agregarcliente(Lc, Lc^.dato);
    L:= L^.sig;
  end;
end;
procedure max(vc: vectorcontador; var tipo1, tipo2: integer);
var
  max1, max2: integer;
  i: srango;
begin
  max1:= -9999;
  max2:= -9999;
  for i:= 1 to 4 do begin
    if(vc[i] > max1)then begin
      max2:= max1;
      tipo2:= tipo1;
      max1:= vc[i];
      tipo1:= i
    else if(vc[i] > max2)then begin
      max2:= vc[i];
      tipo2:= i;
    end;
end;
var
  Lc: lcumple;
  L: lista;
  v: vector;
  vc: vectorcontador;
  totalmonto: real;
  type1, type2: integer;
begin
  L:= nil;
  cargarvector(v);  //se dispone
  cargarlista(L);
  inicializar(vc);
  procesarlista(L, v, vc, totalmonto, Lc);
  writeln('...', totalmonto);
  max(vc, type1, type2);
  writeln('....', type1, type2);
end.
