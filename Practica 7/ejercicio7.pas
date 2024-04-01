program ejercicio7repaso;
type
  alumno = record
    numalu: integer;
    apellido: string;
    nombre: string;
    mail: string;
    anioingreso: integer;
    anioegreso: integer;
    notas: listamaterias;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: alumno;
    sig: lista;
  end;
  
  listamaterias = ^nodo;
  nodo = record
    dato: real;
    sig: listamaterias;
  end;
  
procedure leeralumno(var a:alumno);
begin
  readln(a.numalu);
  if(a.numalu <> -1)then begin 
    readln(a.apellido);
    readln(a.nombre);
    readln(a.mail);
    readln(a.anioingreso);
    readln(a.anioegreso);
    readln(a.notas);
  end;
end;
procedure agregaradelante(var L: lista; a: alumno);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= a;
  nue^.sig:= L;
  L:= nue;
end;
procedure cargarlista(var L: lista);
var
  a:alumno;
begin
  L:= nil;
  leeralumno(a);
  while(L^.dato.numalu <> -1)do begin
    agregaradelante(L,a);
    leeralumno(a);
  end;
end;
procedure agregarnota(var L: lista; notas: real);
var
  nuevo, act, ant: lista;
begin
  new(nuevo);
  nuevo^.dato:= notas;
  act:= L;
  ant:= L;
  while(act <> nil) and (notas < L^.dato.notas)do begin 
    ant:= act;
    act:= act^.sig;
  end;    
    if(act = ant)then
      L:= nuevo;
    else 
      ant^.sig:= nuevo;
    nuevo^.sig:= act;  
end;
procedure cargarnotas(l: lista; var pri:listamaterias);
var
  i: integer;
begin
  pri:= nil;
  for i:= 1 to 24 do 
    agregarnota(L, L^.dato.notas);
end;
function digimpares(num: integer): boolean;
var 
  resto, pares: integer;
begin
  pares:= pares + 1;
  while(num <> 0)do begin
    resto:= num mod 10;
    if(resto mod 2 = 0)then 
      pares:= pares + 1;
    num:= num div 10;
  end;
  digimpares:= (pares = 0);
end;
procedure minimos(var apellido1, apellido2, nombre1, nombre2, gmail1, gmail2: string; aniodeingreso, aniodeegreso: integer; apellido, nombre, gmail: string);
var
  duracion: integer;
begin
  duracion:= (aniodeegreso - aniodeingreso);
  if(duracion < duracion1)then begin
    duracion2:= duracion1;
    apellido2:= apellido1;
    nombre2:= nombre1;
    gmail2:= gmail1;
    duracion1:= duracion;
    apellido1:= apellido;
    gmail1:= gmail2
  end
  else if(duracion < duracion2)then begin
    duracion2:= duracion;
    apellido2:= apellido;
    nombre2:= nombre;
    gmail2:= gmail;
  end;
end;
procedure procesar(L: lista; pri:listamaterias; var cantalumnosdigimpar: integer; var apellido1, apellido2, nombre1, nombre2, gmail1, gmail2: string;) 
var
  duracion1, duracion2: integer;
begin
  duracion1:= 9999;
  duracion2:= 9999;
  cantalumnosdigimpar:= 0;
  while(L <> nil)do begin
    if(digimpares(L^.dato.numalu))and(L^.dato.aniodeingreso = 2012)then
      cantalumnosdigimpar:= cantalumnosdigimpar + 1;
    minimos(apellido1, apellido2, nombre1, nombre2, gmail1, gmail2, L^.dato.aniodeingreso, L^.dato.aniodeegreso, L^.dato.apellido, L^.dato.nombre, L^.dato.mail);
    L:= L^.sig; 
  end;
end;
procedure eliminar(var L:lista; numalumno: integer);
var
  nue, ant, act: lista;
begin
  ant:= L;
  act:= L;
  while(act <> nil)and(act^.dato.numalu <>  numalumno)do begin
    ant:= act;
    act:= act^.sig;
  end;
  if(act <> nil)then begin
    if(act = ant)then 
      L:= act^.sig;
    else
      ant^.sig:= act^.sig;
    dispose(act);
  end;
end;
var
  L: lista;
  pri: listamaterias;
  apellido1, apellido2, nombre1, nombre2, gmail1, gmail2: string;
  cantalumnosdigimpar: integer;
  num: integer;
begin
  cargarlista(L);
  cargarnotas(L, pri);
  procesar(L, pri, cantalumnosdigimpar, apellido1, apellido2, nombre1, nombre2, gmail1, gmail2);
  writeln('La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares es: ', cantalumnosdigimpar);
  writeln('....', apellido1, apellido2, nombre1, nombre2, gmail1, gmail2);
  readln(num);
  eliminar(L, num);
end.
