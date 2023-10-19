program ejercicio;
const
  semanas = 42;
type
  vector = array[1..semanas]of real;
  paciente = record
    nombre: string;
    apellido: string;
    peso: vector;
    diml: integer;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: paciente;
    sig: lista;
  end;
  
procedure leerpaciente (var p:paciente); //se dispone
procedure cargarlista(var L:lista); //se dispone

procedure recorrervector(v:vector; diml: integer; p:paciente; var max: real);
var 
  i:integer;
begin
  for i:= 2 to diml do begin
    if(p.v[i] - p.v[i-1] > max)then 
      max:= p.v[i] - p.v[i-1];
  end;

procedure procesar(L:lista; var max, aumentopesotot: real);
var
  diml: integer;
begin
  max:= -9999;
  while(L <> nil)do begin
    recorrervector(L^.dato.peso, L^.dato.diml, L^.dato, max);
    aumentopesotot:= L^.dato.peso[L^.dato.diml] - L^.dato.peso[1];
    writeln('..', aumentopesotot);
    L:= L^.sig;
  end;
end;

var
  maximo, pesototalaumentado: real;
  L: lista;
begin
  cargarlista(L); //se dispone
  procesar(L, maximo, pesototalaumentado);
  writeln('..', maximo);
end;
