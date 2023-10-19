program ejercicio9;
const
  dimf = 400;
type
  alumno = record
    nro: integer;
    dni: integer;
    apellido: string;
    nombre: string;
    anio: integer;
end;
  vector = array [1..dimf] of alumno;
procedure leer (a: alumno);
begin
  writeln('Ingrese el numero de inscripcion');
  readln(a.nro); 
  writeln('Ingrese el numero de DNI');
  readln(a.dni);
  writeln('Ingrese el apellido del alumno');
  readln(a.apellido);
  writeln('Ingrese el nombre del alumno');
  readln(a.nombre);
  writeln('Ingrese el año de nacimiento del alumno');
  readln(a.anio);
end;
procedure cargarvector(var v:vector; var diml: integer);
var 
  pos: integer;
begin
  diml:= 0;
  pos:= 1;
  leer(v[pos]);
  while(v[pos].dni <> -1) and (diml < dimf)do begin
    diml:= diml + 1;
    pos:= pos + 1;
    leer(v[pos]);
  end;
end;
function esDniConDigitosPares (dni: integer):boolean;
var
  resto, num:integer;
  ok: boolean;
begin
  ok:= true;
  num:= dni;
  while(num <> 0)and(ok = true)do begin
    resto:= num mod 10;
    if(resto = 0)then 
      ok:= true
    else
      ok:= false;
    num:= num div 10;  
  end;
  esDniConDigitosPares:= ok;
end;
function porcentaje (v: vector; diml:integer):real;
var
  dnipares,i: integer;
begin
  dnipares:= 0;
  for i:= 1 to diml do begin
    if(esDniConDigitosPares(v[i].dni))then
      dnipares:= dnipares + 1;
  end;
  porcentaje:= dnipares * 100 / diml;
end;
procedure maximos(v: vector; var nombre1, nombre2, apellido1, apellido2: string; var max1, max2: integer;diml:integer);
var
  i:integer;
begin
  max1:= -9999;
  max2:= -9999;
  for i:= 1 to diml do begin
    if(v[i].anio < max1)then begin
      max2:= max1;
      nombre2:= nombre1;
      apellido2:= apellido1;
      max1:= v[i].anio;
      nombre1:= v[i].nombre;
      apellido1:= v[i].apellido;
    end
    else 
      if(v[i].anio < max2)then begin
        max2:= v[i].anio;
        nombre2:= v[i].nombre;
        apellido2:= v[i].apellido;
    end;
  end;  
end;
var
  v: vector;
  a:alumno;
  diml,max1,max2:integer;
  nombre1, nombre2, apellido1, apellido2: string;
begin
  cargarvector(v,diml);
  maximos(v, nombre1, nombre2, apellido1, apellido2, max1, max2,diml);
  writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares es: ', porcentaje(v,diml));
  writeln('Los dos alumnos de mayor edad son: ', nombre1 , apellido1, ' y ', nombre2, apellido2);
end.
