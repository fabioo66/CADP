program ejercicio1;
const 
  dimf = 500;
type 
  vector = array [1..dimf]of integer;
function buscar(var v:vector; diml, valorn: integer): boolean;
var
  pos: integer;
begin
  pos:= 1;
  while (pos <= diml) and (v[pos] < valorn) do 
    pos:= pos + 1; 
  if((pos <= diml) and (v[pos] = valorn)) then
    buscar:= true
  else
    buscar:= false;
end;
var
  v: vector;
  valorn, diml: integer;
begin
  cargarvector(v, diml);
  read(valorn);
  buscar(v, diml, valorn);
end;
