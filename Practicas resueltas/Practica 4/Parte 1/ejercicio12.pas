{En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) La cantidad de galaxias de cada tipo.
b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}
program ejercicio12practica4;
const
  maxtipo = 4;
  maxgalaxias= 53;
type
  galrango = 1..maxgalaxias;
  trango = 1..maxtipo;
  galaxia = record
    nombre: string;
    tipo: rango;
    masa: real;
    distancia: real;
  end;
  vectorgalaxias = array[galrango]of galaxia;
  vectortipo = array[trango]of integer;

procedure leergalaxia(g:galaxia);
begin
  writeln('Ingrese el nombre');
  readln(g.nombre);
  writeln('Ingrese el tipo');
  readln(g.tipo);
  writeln('Ingrese la masa');
  readln(g.masa);
  writeln('Ingrese la distancia');
  readln(g.distancia);
end;
procedure cargarvector(var v:vectorgalaxias);
var
  i:galrango;
begin
  for i:=1 to maxgalaxias do begin
    leergalaxia(v[i]);
end;

procedure inicializar(var vtipo: vectortipo);    
var
  i:trango;
begin
  for i:= 1 to maxtipo do
    vtipo[i]:= 0;
end;
procedure cantgalaxiastipo(v:vectorgalaxias; var vtipo: vectortipo);     {a) La cantidad de galaxias de cada tipo.}
var
  i:galrango;
begin
  for i:= 1 to maxgalaxias do 
  vtipo[v[i].tipo]:= vtipo[v[i].tipo] + 1;
  for i:= 1 to maxgalaxias do
    write(vtipo[v[i].tipo])
end;
function masa3(v:vectorgalaxias):integer;
var
  i:galrango;
  cant:integer;
begin
  cant:= 0;
  for i:= 1 to maxgalaxias do begin
    if(v[i].nombre = 'La Vía Láctea') or (v[i].nombre = 'Andromeda') or (v[i].nombre = 'Triangulo')then
      cant:= cant + v[i].masa;
  end;
  masa3:= cant;
end;
function masatotal(v:vectorgalaxia):integer;
var
  cantotal:integer;
  i:galrango;
begin
  cantototal:= 0;
  for i:= 1 to magalaxias do 
    cantotal:= cantotal + v[i].masa;
  masatotal:= cantotal;
end;
function porcentaje:real;
begin
  porcentaje:= masa3 * 100/ masatotal;
end
var
  vtipo: vectortipo;
  v:vectorgalaxias;
begin
  cargarvector(v);
  inicializar(vtipo);
  cantgalaxiastipo(v,vtipo);
  writeln('La cantidad de galaxias de cada tipo son: ',);
  writeln('La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) es ', masa3(v) , ' y el
porcentaje que esto representa respecto a la masa de todas las galaxias es: ', porcentaje;
end.
