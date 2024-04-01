program ejercicio7;
type 
  rango = 0..9;
  vector = array [rango]of integer;

procedure inicializar(var v:vector);
var 
  i:integer;
begin
  for i:= 0 to 9 do 
    v[i]:= 0;
end;

procedure descomponer (var v:vector; num: integer);
var
  resto:integer;
begin
  while(num <> 0)do begin 
    resto:= num mod 10;
    v[resto]:= v[resto] + 1;
    num:= num div 10;
  end;
end;
procedure maximodigito(v:vector; var max:integer; var posmax:integer);
var
  i:integer;
begin
  max:= -1;
  posmax:= -1;
  for i:= 0 to 9 do begin
    if(v[i] > max)then begin
      max:= v[i];
      posmax:= i;
    end;
  end;
end;
procedure ocurrencias(v:vector);
var
  i:integer;
begin
  for i:= 0 to 9 do
    if(v[i] <> 0)then
      writeln(i,' = ',v[i] , 'veces');
  end;
procedure sinocurrencias(v:vector);
var
  i:integer;
  begin
    write('Los dígitos que no tuvieron ocurrencias son: ' );
    for i:= 0 to 9 do begin
      if(v[i] = 0) then 
        write (i);
    end;
end;
var
  posmax,num,max:integer;
  v:vector;
begin
  max:= -1;
  posmax:= -1;
  inicializar(v);
  read(num);
  while(num <> -1)do begin
    descomponer(v,num);
    read(num);
  end;
  maximodigito(v,max,posmax);
  writeln('el dígito más leído es: ', posmax, ' con ', max, ' ocurrencias.');
  ocurrencias(v);
  sinocurrencias(v);
end.
