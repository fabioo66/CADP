program ejercicio1;
const 
  dimf = 500;
type 
  vector = array [1..dimf]of integer;
function buscar(var v:vector; diml, valorn: integer): boolean;
var
  pos: integer;
  esta: boolean;
begin
  esta:= false;
  pos:= 1;
  while(pos < diml) and (not esta) do begin
    if(v[pos] = valorn) then 
      esta:= true
    else 
      pos:= pos + 1;
  end;
  buscar:= esta;
end;
var
  v: vector;
  valorn, diml: integer;
begin
  cargarvector(v, diml);
  read(valorn);
  buscar(v, diml, valorn);
end;
