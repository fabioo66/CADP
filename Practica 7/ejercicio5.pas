program ejercicio5repaso;
const
  tam = 100;
type
  crango = 1..100;
  camion = record
    patente: string;
    aniodefabricacion: integer;
    toneladas: real;
  end;
  trucks = array[1..tam]of camion;
  
  viaje = record
    codigo: integer;
    codigocamion: crango;
    distancia: real;
    destino: string;
    anio: integer;
    DNI: integer;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: viaje;
    sig: lista;
  end;
  
procedure leercamion(var c:camion); //se dispone
procedure cargarvector(var t:trucks); //se dispone

procedure leerviaje(var v: viaje);
begin
  readln(v.codigo);
  if(v.codigo <> -1)then begin
    readln(v.codigocamion);
    readln(v.distancia);
    readln(v.destino);
    readln(v.anio);
    readln(v.DNI);
  end; 
end;

procedure agregaradelante(var L: lista; v:viaje);
var
  nue: lista;
begin
  new(nue);
  nue^.dato:= v;
  nue^.sig:= L;
  L:= nue;
end;
procedure cargarlista(var L: lista);
var
  v: viaje;
begin
  L:= nil;
  leerviaje(v);
  While(v.codigo <> -1)do begin
    agregaradelante(L, v);
    leerviaje(v);
  end;
end;  

procedure maxymin(t: trucks; var maxpatente, minpatente: string; Var max, min: real; km: real; c: camion);
Var
  i: crango;
begin
  for i:= 1 to 100 do begin
    if(km > max)then begin
      max:= km;
      maxpatente:= t[i].patente;
    end;
    if(km < min)then begin
      min:= km;
      minpatente:= t[i].patente;
    end;
  end;
end;
procedure viajestonant(t: trucks; var cantviajes: integer; c: camion; anio: integer);
var
  i: crango;
begin
  for i:= 1 to 100 do begin
    if(t[i].toneladas > 30.5)and(anio < 2018)then
      cantviajes:= cantviajes + 1;
  end;
end;
function dni2impar(num: integer):boolean;
Var
  resto, cant: integer;
begin
  cant:= 0;
  while(num <> 0)do begin
    resto:= num mod 10;
    if(resto mod 2 <> 0)then 
      cant:= cant + 1;
    num:= num div 10;
  end;
  dni2impar:= (cant = 2);
end;
procedure codigos(t: trucks; c: camion; var codigo: integer);
var
  i: crango;
begin
  for i:= 1 to 100 do begin
    if(dni2impar(t[i].dni))then
      writeln(codigo);
  end;      
end;
procedure procesar(L: lista; var maxpatente, minpatente: string; Var max, min: real; var cantviajes: integer);
Var
  max, min, km: real;
  t: trucks;
  c: camion;
  anio: integer;
begin
  cantviajes:= 0;
  max:= -9999;
  min:= 9999;
  while(L <> nil)do begin
    maxymin(t, maxpatente, minpatente, max, min, L^.dato.distancia, c);
    viajestonant(t, cantviajes, c, L^.dato.anio,);
    codigos(t, c, L^.dato.codigo);
    L:= L^.sig;
  end;
end;
var
  t: trucks;
  L: lista;
  maxpatente, minpatente: string;
  max, min: real;
  cantviajes: integer;
begin
  cargarvector(t); //se dispone
  cargarlista(L);
  procesar(L, maxpatente, minpatente, max, min, cantviajes);
  writeln('la patente del camión que más kilómetros recorridos posee es: ', maxpatente,' y la patente del camión que menos kilómetros posee es: ', minpatente);
  writeln('La cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5 toneladas y que poseen una antigüedad mayor a 5 años al momento de realizar el viaje es: ', cantviajes);
end.
