program ejercicio4practica4p2;
const
  dimf = 1000;
type
  Alumno = record
    nro: integer;
    apenom: string;
    cantasist: integer;
  end;
  vector = array [1..dimf]of Alumno;
function posalumno(v: vector; nro: integer): integer;
var
  pos: integer;
begin
  pos:= 1;
  while(nro <> v[pos].nro)do 
    pos:= pos + 1;
  posalumno:= pos;  
end;
procedure insertaralu(var v:vector; var diml: integer; alu: alumno; var pude: boolean);
var
  pos, i: integer;
begin
  pude:= false;
  pos:= 1;
  while (alu.nro > v[pos].nro)do 
    pos:= pos + 1;
  if(diml + 1 <= dimf) and (alu.nro >= 1) and (alu.nro <= diml)then begin
    for i:= diml downto pos do
      v[i+1]:= v[i];
    pude:= true;
    diml:= diml + 1;
    v[pos]:= alu;
  end;
end;
procedure eliminarpos(var v:vector; var diml:integer; pos: integer; var ok:boolean);
var
  i: integer;
begin 
  ok:= false;
  if(pos >= 1) and (pos <= diml)then begin
    for i:= pos to diml do
      v[i]:= v[i+1];
    diml:= diml - 1;
    ok:= true;
  end;
end;
procedure eliminarnro(var v:vector; var diml: integer; nro:integer; var okey:boolean);
var
  pos,i:integer;
begin
  okey:= false;
  pos:= 1;
  while (nro > v[pos].nro)do
    pos:= pos + 1;
  if(nro >= 1) and (nro <= diml)then begin 
    for i:= pos to diml do 
      v[i]:= v[i+1];
  okey:= true;
  diml:= diml - 1;
  end;
end;
procedure eliminar0(var v:vector; var diml:integer; nro:integer; var okey:boolean);
var
  i,ocurrencias:integer;
begin
  okey:= false
  ocurrencias:= 0;
  for i:= 1 to diml do begin
    if (v[i].cantasist = 0)then
      ocurrencias := ocurrencias + 1;
    else
      if (ocurrencias > 0)then
        v[i - ocurrencias]:= v[i];
  end;
  diml:= diml - ocurrencias;
  if(ocurrencias = 0)then
    okey:= false
  else 
    okey:= true;
end;
var 
  a:alumno;
  v:vector;
begin
  cargarvector(v,diml);
  writeln('la posiciÃ³n del alumno es: ', posalumno(v, num));
  insertaralu(v,diml, alu, pude);
  eliminarpos(v,diml,pos,ok);
  eliminarnro(v,diml, nro, okey);
  eliminar0(v,diml,oka);
end.
