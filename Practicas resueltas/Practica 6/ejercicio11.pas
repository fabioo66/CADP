program ejercicio11;
type
  alumno = record
    nro: integer;
    apellido: string;
    promedio: real;
  end;
  lista= ^nodo;
  nodo = record
    dato:alumno;
    sig:lista;
  end;
procedure leeralumno(var a: alumno);
begin
  writeln('Ingrese el codigo');
  readln(a.nro);
  if(a.nro <> 0)then begin
    writeln('Ingrese el apellido');
    readln(a.apellido);
    writeln('Ingrese el promedio');
    readln(a.promedio);
  end;
end;
procedure agregarAdelante(var L:lista; a:alumno);
var
  nue: lista;
begin
  new (nue);
  nue^.dato := a;
  nue^.sig := L;
  L:= nue;
end;
procedure cargarLista(var L:lista);
var
  a: alumno;
Begin
  leeralumno(a); 
  while(a.nro <> 0) do begin
    agregarAdelante(L, a);
    leeralumno(a);
  end;
end;
procedure insertarordenado(var L:lista; a:alumno);
var
  nue, act, ant:lista;
begin
  new(nue);
  nue^.dato:= a;
  act:= L;
  ant:= L;
  while(act <> nil)and(a.promedio < act^.dato.promedio)do begin
    ant:= act;
    act:= act^.sig;
  end;
  if(act = ant)then
    L:= nue
  else 
    ant^.sig:= nue;
  nue^.sig:= act;
end;
procedure informarpromedios(L: lista);
var
  i:integer;
begin 
  for i:= 1 to 10 do begin 
    if(L <> nil)then begin
      writeln(L^.dato.apellido, L^.dato.nro);
      L:= L^.sig;
    end;
  end;
end;
var
  L: lista;
  a: alumno;
begin
  L:= nil;
  cargarLista(L);
  insertarordenado(L, a);
  informarpromedios(L);
end.
