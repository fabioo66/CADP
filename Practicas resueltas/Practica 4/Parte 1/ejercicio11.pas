{ El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página. }


program ejercicio11practica4;
const
  dimf = 200;
type
  foto = record
    titulo: string;
    autor: string;
    cantmg: integer;
    cantclicks: integer;
    cantcoment: integer;
  end;
  vector = array[1..dimf] of foto;
procedure leer(f: foto);
begin
  writeln('Ingrese el titulo de la foto');
  readln(f.titulo);
  writeln('Ingrese el autor de la foto');
  readln(f.autor);
  writeln('Ingrese la cantidad de me gusta');
  readln(f.cantmg);
  writeln('Ingrese la cantidad de clicks');
  readln(f.cantclicks);
  writeln('Ingrese la cantidad de comentarios');
  readln(f.cantcoment);
end;
procedure cargarvector(var v:vector);
var
  i:integer;
begin
  for i:= 1 to dimf do 
    leer(v[i]);
end;
procedure titulodelafotoconmasclicks(v:vector; var titulo:string);
var
  i,max:integer;
begin
  max:= -999;
  for i:= 1 to dimf do begin
    if(v[i].cantclicks > max)then begin
      max:= v[i].cantclicks;
      titulo:= v[i].titulo;
    end;
  end;
end;
{b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.}
function cantidadmegusta(v:vector):integer;
var
  i,cant:integer;
begin
  cant:= 0;
  for i:= 1 to dimf do begin
    if(v[i].autor = 'Art Vandelay')then 
      cant:= cant + v[i].cantmg;
  end;
  cantidadmegusta:= cant;
end;
{c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
procedure comentariosrecibidos(v:vector);
var
  i:integer;
begin
  for i:= 1 to dimf do 
    writeln('La cantidad de comentarios recibidos para esta foto es: ', v[i].cantcoment);
end;
var
  titulo:string;
  v:vector;
begin
  cargarvector(v);
  titulodelafotoconmasclicks(v,titulo);
  writeln('Título de la foto más vista ', titulo);
  writeln('Cantidad total de me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay” ', cantidadmegusta(v));
  comentariosrecibidos(v);
end.
