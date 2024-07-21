EJERCICIO 5
program ejercicio5practica2;
const
  dimf = 5;
type
  tRan = 1..dimf;
  vector = array [tRan] of integer;

procedure cargarvector(var v:vector; diml: integer);
var
  pos:integer;
begin
  pos:= 1;
  diml:= 1;
  writeln('Ingrese el numero entero');
  read(v[pos]);
  while(v[pos] <> 0) and (diml < dimf) do begin
    diml:= diml + 1;
    pos:= pos + 1;
    writeln('Ingrese el numero entero');
    read(v[pos]);
  end;
end;
procedure elementmax (v:vector; var maxvalor: integer; var maxpos: integer;diml:integer);
var
   i:integer;
begin
  for i:= 1 to diml do begin
    if(v[i] > maxvalor)then begin
      maxpos:= i;
      maxvalor:= v[i];
    end;
  end;
end;
procedure elementmin(v:vector; var minvalor:integer; var minpos: integer;diml: integer);
var
  i:integer;
begin
  for i:= 1 to diml do begin
    if(v[i] < minvalor)then begin
      minpos:= i;
      minvalor:= v[i];
    end;
  end;
end;
procedure intercambio (var v: vector; x,y: tRan);
var
  aux:integer;
begin
  aux:= v[x];
  v[x]:= v[y];
  v[y]:= aux;
end;
var
  diml,minv,minp,maxv,maxp,elementomaximo,elementominimo:integer;
  v:vector;
begin
  minv:= 999;
  minp:= 1;
  maxv:= -999;
  maxp:= 1;
  cargarvector(v,diml);
  elementmax(v,maxv,maxp,diml);
  elementmin(v,minv,minp,diml);
  intercambio(v,maxp,minp);
  writeln('El elemento máximo ', maxv ,' que se encontraba en la posición ', maxp ,' fue intercambiado con el elemento mínimo ', minv ,' que se encontraba en la posición ', minp);
end.
