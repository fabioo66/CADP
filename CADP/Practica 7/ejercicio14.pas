{14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información
de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue
prestado. Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par.}

program ejercicio14;
type
  drango = 1..31;
  prestamo = record
    numprestamo: integer;
    ISBN: integer;
    numsocio: integer;
    dia: drango;
  end;
  
  listaprestamos = ^nodoprestamos;
  nodoprestamos = record
    dato: prestamo;
    sig: listaprestamos;
  end;
  
  book = record
    ISBN: integer;
    cantprestamos: integer;
  end;
  
  lista2 = ^nodo2;
  nodo2 = record
    dato: book;
    sig: lista2;
  end;
  
  vectorcontador = array[drango]of integer;
  
procedure leerprestamo(var p: prestamo);
begin
  readln(p.ISBN);
  if(p.ISBN <> -1)then begin
    readln(p.numprestamo);
    readln(p.numsocio);
    readln(p.dia);
  end;
end;

procedure insertarordenado(var L: listaprestamos; p: prestamo);
var
  ant, act, nue: listaprestamos;
begin
  new(nue);
  nue^.dato:= p;
  act:= L;
  ant:= L;
  while(act <> nil)and(p.ISBN > act^.dato.ISBN)do begin
    ant:= act;
    act:= act^.sig;
  end;
  if(act = ant)then
    L:= nue
  else
    ant^.sig:= nue;
  nue^.sig:= act;
end;

procedure cargarlista(var L:listaprestamos);
var
  p: prestamo;
begin
  L:= nil;
  leerprestamo(p);
  while(p.ISBN <> -1)do begin
    insertarordenado(L, P);
    leerprestamo(p);
  end;
end;

procedure agregaradelante(var L2: lista2; b: book);
var
  nue: lista2;
begin
  new(nue);
  nue^.dato:= b;
  nue^.sig:= L2;
  L2:= nue;
end;

procedure inicializar(var vc: vectorcontador);
var
  i: drango;
begin
  for i:= 1 to 31 do
    vc[i]:= 0;
end;

function esimpar(num: integer): boolean;
begin
  esimpar:= (num mod 2 = 1)
end;

function espar(num: integer): boolean;
begin
  espar:= (num mod 2 = 0)
end;

procedure procesar(L: listaprestamos; var L2: lista2; var vc: vectorcontador; var porcentaje: real);  
var
  ISBNactual: integer;
  b: book;
  cant, total, cantcumple: integer;
begin
  total:= 0;
  cantcumple:= 0;
  L2:= nil;
  while(L <> nil)do begin
    cant:= 0;
    ISBNactual:= L^.dato.ISBN;
    while(L <> nil)and(ISBNactual = L^.dato.ISBN)do begin
      cant:= cant + 1;
      vc[L^.dato.dia]:= vc[L^.dato.dia] + 1;
      if (esimpar(L^.dato.numprestamo) and espar(L^.dato.numsocio))then
        cantcumple:= cantcumple + 1;
      total:= total + 1;    
      L:= L^.sig;
    end;
    b.ISBN:= ISBNactual;
    b.cantprestamos:= cant;
    agregaradelante(L2, b);
    porcentaje:= cantcumple * 100/ total;
  end;
end;

function minimo(vc: vectorcontador): integer;
var
  min, mindia: integer;
  i: drango;
begin
  min:= 9999;
  for i:= 1 to 31 do begin
    if(vc[i] < min)then begin
      min:= vc[i];
      mindia:= i;
    end;
  end;
  minimo:= mindia;
end;

var
  L: listaprestamos;
  L2: lista2;
  vc: vectorcontador;
  percent: real;
begin
  cargarlista(L);
  inicializar(vc);
  procesar(L,L2,vc,percent);
  writeln('el día del mes en que se realizaron menos préstamos es: ', minimo(vc));
  writeln('el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio par es: ', percent);
end.
