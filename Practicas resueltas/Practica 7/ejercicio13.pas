program ejercicio13repaso;
type
  info = record
    titulo:string;
    areatematica:string;
    paginas:integer;
  end;
  
  lista2 = ^nodo2;
  nodo2 = record
    dato:info;
    sig:lista2;
  end;
  
  informacion = record
    nombre:string;
    libroantiguo:integer;
    ventastotales:integer;
    ventas250: lista2;
  end;
  
  trango = 1..35; 
  vector = array [trango] of string;
  libro = record
    titulo:string;
    editorial:string;
    paginas:integer;
    aniodeedicion:integer;
    cantventas:integer;
    codigo:trango;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: libro;
    sig:lista;
  end;
  
procedure leeerlibro(var l:libro);
begin
  readln(l.titulo);
  readln(l.editorial);
  readln(l.paginas);
  readln(l.aniodeedicion);
  readln(l.cantventas);
  readln(l.codigo);
end;

procedure agregarAdelante2(var Lc:lista2; i:info);
var
  nue:lista2;
begin
  new(nue);
  nue^.dato:= i;
  nue^.sig:= Lc;
  Lc:= nue;
end;

procedure agregarAdelante(var L:lista; b:libro);
var
  nue:lista;
begin
  new(nue);
  nue^.dato:= b;
  nue^.sig:= L;
  L:= nue;
end;

procedure cargarlista(var L:lista);
var
  b:libro;
begin
  repeat
    leeerlibro(b);
    agregarAdelante(L,b);
  until(b.titulo = 'Relato de un nÃ¡ufrago');
end;

procedure recorrerlista(v:vector; L:lista;var lc:lista2; var I:informacion);
var
  inf:info;
  min:integer;
begin
  lc:= nil;
  I.ventastotales:= 0;
  min:= 9999;
  while (L <> nil) do begin
    if (L^.dato.editorial = 'Planeta Libros') then begin  {primer inciso}
      I.nombre:= 'Planeta Libros';
      if (L^.dato.aniodeedicion < min ) then {segundo inciso }
        min:= L^.dato.aniodeedicion;
      I.ventastotales:= I.ventastotales + L^.dato.cantventas;
      inf.titulo := L^.dato.titulo;
      inf.areatematica:= v[L^.dato.codigo];
      inf.paginas:= L^.dato.paginas;
      
      if (L^.dato.cantventas > 250) then
        agregarAdelante2(lc,inf);
    end;
    L:= L^.sig;
  end;
  I.libroantiguo:= min;
end;

procedure incisob(Lc: lista2);
begin
  while(lc <> nil)do begin
    writeln('Planeta Libros');
    writeln(Lc^.dato.titulo);
  end;
end;
var
  v:vector;
  lc:lista2;
  i:informacion;
  L:lista;
begin
  //cargarvector(v);  // se dispone
  L:= nil;
  cargarlista(L);
  recorrerlista(v,L,lc,i);
  incisob(Lc);
end.
