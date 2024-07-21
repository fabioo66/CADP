program ejercicio10;
const
  dimf = 300; 
  n = 1.15; 
type
  vector = array [1..dimf] of real;
procedure cargarvector(var v: vector; var diml:integer);
var
  pos:integer;
begin
  diml:= 0;
  pos:= 1;
  readln(v[pos]);
  while(v[pos] <> 0)and(diml < dimf)do begin
    diml:= diml + 1;
    pos:= pos + 1;
    readln(v[pos]);
  end;
end;
procedure incremento(var v:vector; var diml: integer; n:real);
var
  i:integer;
begin
  for i:= 1 to diml do 
    v[i]:= v[i] * n;
end;
function promedio(v: vector; diml: integer):real; 
var
  i: integer;
  suma:real;
begin
  suma:= 0;
  for i:= 1 to diml do
    suma:= suma + v[i];
  promedio:= suma / diml;
end;
var
  v: vector;
  diml:integer;
begin
  cargarvector(v, diml);
  incremento(v, diml, n);
  writeln('El sueldo promedio de los empleados de la empresa es: ', promedio(v, diml));
end.
