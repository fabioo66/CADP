program ejercicio9repaso;
type
  grango = 1..8;
  pelicula = record
    codigopelicula: integer;
    titulo: string;
    codigogenero: grango;
    puntajeprom: real;
  end;
  critica = record
    DNI: integer;
    apenomb: string;
    codigo: integer;
    puntaje: real;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: pelicula;
    sig: lista;
  end;
  
  lista2 = ^nodo2;
  nodo2 = record
    dato: critica;
    sig: lista2;
  end;    
  vector = array[grango]of integer;

procedure leerpelicula(var p:pelicula); //se dispone
cargarlista(var L: lista); //se dispone

procedure inicializarvector(var v: vector);
var
  i: grango;
begin
  for i:= 1 to 8 do
    v[i]:= 0;
end;    
procedure leercritica(var c: critica);
begin
  readln(c.codigo);
  if(c.codigo <> -1)then begin
    readln(c.DNI);
    readln(c.apenomb);
    readln(c.puntaje);
  end;
end;
procedure insertar(var L2: lista2; c: critica);
var
  nue, act, ant: lista2;
begin
  new(nue);
  nue^.dato:= c;
  act:= L2;
  ant:= L2
  while(act <> nil) and (c.codigo > L2^.dato.codigo)do begin
    ant:= act;
    act:= act^.sig;
  end;
  if(act = ant)then
    L2:= nue
  else
    ant^.sig:= nue;
  nue^.sig:= act;
end;  
procedure cargarlista2(var L2: lista2);
var
  c:critica;
begin
  leercritica(c);
  while(c.codigo <> -1)do begin
    insertar(L2, c);
    leercritica(c);
  end;
end;  
procedure recorrer(L2: lista2; var promedio: real; codigopelicula: integer);
var
  total, cant: real;
  act: integer;
begin
  while(L2 <> nil)do begin
    total:= 0;
    cant:= 0;
    act:= codigopelicula;
    while(act = codigopelicula)do begin  
      total:= total + L2^.dato.puntaje;
      cant:= cant + 1;
    L2:= L2^.sig;
    end;
  end;    
  promedio:= total / cant;
end;
procedure procesar(L: lista; L2: lista2;)
var
  promedio: real;
begin
  while(L <> nil)do begin
    recorrer(L2, promedio, L^.dato.codigopelicula);
    L^.dato.puntajeprom:= promedio;
    L:= L^.sig;
  end;
end;
var
  L: lista;
  L2: lista2;
begin
  cargarlista(L); //se dispone
  cargarlista2(L2);
  procesar();
end.  
