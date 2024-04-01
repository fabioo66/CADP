program ejercicio4Apractica4;
function posx(v:vector; numx:integer):integer ;
var
  pos:integer;
  seguir:boolean;
begin
  seguir:= true;
  pos:= 1;
  while (seguir = true) and (pos < dimf) do begin
    if(v[pos] = numx)then begin
      posx:= pos;
      seguir:= false;
    end
    else
      pos:= pos + 1;
  end;
  if(seguir = false)then
      posx:= pos;
  else
    posx:= -1;
end;
procedure intercambio (var v: vector; x,y: tRan);
var
  aux:integer;
begin
  aux:= v[x];
  v[x]:= v[y];
  v[y]:= aux;
end;
function sumavector (v: vector): integer;
var
  i, suma:integer
begin
  suma:= 0;
  for i:= 1 to dimf do 
    suma:= suma + v[i];
  sumavector:= suma;
end;
function promedio(v:vector): real;
begin
  promedio:= sumavector(v)/dimf;
end;
function elementmax(v:vector): integer;
var
  maxvalor, i, maxpos:integer;
begin
  maxvalor:= -9999;
  maxpos:= -1;
  for i:= 1 to dimf do begin
    if(v[i] < maxvalor)then begin
      maxpos:= i;
      maxvalor:= v[i];
    end;
  end;
  elementmax:= maxpos;
end;
function elementmin(v:vector): integer;
var
  minvalor, i, minpos:integer;
begin
  minvalor:= 9999;
  minpos:= 1;
  for i:= 1 to dimf do begin
    if(v[i] < minvalor)then begin
      minpos:= i;
      minvalor:= v[i];
    end;
  end;
  elementmin:= minpos;
end;
