program ejercicio6repaso;
type
  orango = 1..7;
  cadena = string[30];
  objeto = record
    codigo: integer;
    categoria: orango;
    nombre: cadena;
    distancia: real;
    nombredescubridor: cadena;
    anio: integer;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: objeto;
    sig: lista;
  end;
  vector = array[orango]of integer;
procedure leerobjeto(var o: objeto);
begin
  readln(o.codigo);
  if(o.codigo <> -1)then begin
    readln(o.categoria);
    readln(o.nombre);
    readln(o.distancia);
    readln(o.nombredescubridor);
    readln(o.anio);
  end;  
end;    
procedure agregaralfinal(var L, ult: lista; o: objeto);
var
  nue:lista;
begin
  new(nue);
  nue^.dato:= o;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue
  else
    ult^.sig:= nue;
  ult:= nue;
end;
procedure cargarlista(var L: lista);
var
  o: objeto;
  ult: lista;
begin
  L:= nil;
  leerobjeto(o);
  while(L^.dato.codigo <> -1)do begin
    agregaralfinal(L, ult, o);
    leerobjeto(o);
  end;
end;
procedure inicializar(var v:vector);
var
  i: orango;
begin
  for i:= 1 to 7 do 
    V[i]:= 0;
end;
procedure objetoslejanos(var maxcodigo1, maxcodigo2, max1, max2: real; lejos: real; code: integer);
begin
  if(max1 > lejos)then begin
    max2:= max1;
    maxcodigo2:= maxcodigo1;
    max1:= lejos;
    maxcodigo2:= code
  end
  else if(max2 > lejos)then begin
    max2:= lejos;
    maxcodigo2:= code;
  end;
end;  
function masparesqimpares(num: integer): boolean;
var
  resto, impares, pares: integer;
begin
  impares:= 0;
  pares:= 0;
  while(num <> 0)do begin
    resto:= num mod 10;
    if(resto mod 2 = 0)then
      pares:= pares + 1
    else
      impares:= 1;
    num:= num div 10;
  end;
  masparesqimpares:= (pares > impares);
end;
procedure procesar(var L:lista; var v: vector; var maxcodigo1, maxcodigo2: real; var cantidadplanetas: integer);  
var
  max1, max2: real;
begin
  max1:= -9999;
  max2:= -9999;
  while(L <> nil)do begin
    objetoslejanos(maxcodigo1, maxcodigo2, max1, max2, L^.dato.distancia, L^.dato.codigo);
    v[L^.dato.categoria]:= v[L^.dato.categoria] + 1;
    if(L^.dato.categoria = 2)and(L^.dato.anio <= 1600)and(L^.dato.nombredescubridor = 'Galileo Galilei')then 
      cantidadplanetas:= cantidadplanetas + 1;
    if(masparesqimpares(L^.dato.codigo))and(L^.dato.categoria = 1)then 
      writeln(L^.dato.nombre);
    L:= L^.sig;
  end;
end;  
procedure cantobjetos(v: vector);
var
  i: integer;
begin
  for i:= 1 to 7 do
    writeln(i, ' = ',v[i]);
end;
var
  L: lista;
  v: vector;
  maxcode1, maxcode2: real; 
  cantplanetas: integer;
begin
  cargarlista(L);
  procesar(L, v, maxcode1, maxcode2, cantplanetas);
  writeln('Los dos objetos más lejanos de la tierra que se hayan observado son: ', maxcode1, maxcode2);
  writeln('La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600 es: ', cantplanetas);
  cantobjetos(v);
end.
