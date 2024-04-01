program ejercicio6;
type
  erango = 1..7;
  mrango = 1..12;
  sonda = record
    nombre: string;
    cantmeses: mrango;
    costoconstruccion: real;
    costomantenimiento: real;
    espectro: erango;
  end;

  lista = ^nodo;
  nodo = record
    elem: sonda;
    sig: lista;
  end;
  vector = array [erango]of integer;
procedure leersonda(var s:sonda);
begin
  readln(s.nombre);
  if(s.nombre = 'GAIA')then begin
    readln(s.cantmeses);
    readln(s.costoconstruccion);
    readln(s.costomantenimiento);
    readln(s.espectro);
  end;    
end;
procedure agregaradelante(var L: lista; s: sonda);
var
  nue:lista;
begin
  new(nue);
  L^.elem:= s;
  L^.sig:= L;
  L:= nue;
end;
procedure cargarlista(var L:lista);
var
  s: sonda;
begin
  repeat
    leersonda(s);
    agregaradelante(L);
  until(s.nombre = 'GAIA');
end;
procedure inicializar(var v:vector);
var
  i: erango;
begin
  for i:= 1 to 7 do 
    v[i]:= 0;
end;    
procedure contarSondasPorEspectro(L: lista; var v: vector);
var
  actual: integer;
begin
  actual:= 0;
  actual:= L^.elem.espectro;
  v[actual]:= v[actual] + 1;
end;
procedure informarsondas(v: vector);
var
  i:erango;
begin
  for i:= 1 to 7 do
    writeln(i ' = ', v[i]);
end;    
procedure recorrer(L: lista; var maxsonda:string; v: vector; var duracionpromedio, costopromedio: real);
var
  max, costotal, cant2: real;
  v: vector;
  totalduracion, cant1: integer;
begin
  max:= -9999;
  totalduracion:= 0;
  cant1:= 0;
  costototal:= 0;
  cant2:= 0;
  inicializar(v);
  while(L <> nil)do begin
    if(L^.elem.costoconstruccion + L^.elem.costomantenimiento > max)then begin
      max:= L^.elem.costoconstruccion + L^.elem.costomantenimiento;
      maxsonda:= L^.elem.nombre;
    end;
    contarSondasPorEspectro(L, V);
    totalduracion:= totalduracion + L^.elem.cantmeses;
    cant1:= cant1 + 1;
    costototal:= costototal + L^.elem.costoconstruccion;
    cant2:= cant2 + 1;
    L:= L^.sig;
  end;
  duracionpromedio:= totalduracion/cant1;
  costopromedio:= costototal/cant2;
  informarsondas(V);
end;
procedure cantynomsondas(L:lista var cantsondas:integer; var duracionpromedio, costopromedio: real);
var
  cant: integer;
begin  
  cant:= 0;
  while(L <> nil)do begin
    if(L^.elem.cantmeses > duracionpromedio)then
      cant:= cant + 1;
    if(L^.elem.costoconstruccion > costopromedio)then
      writeln(L^.elem.costoconstruccion, 'supera el promedio de costo de construccion entre todas las sondas');  
    L:= L^.sig;
  end;  
  cantsondas:= cant;
end;    
var
  L: lista;
  s: sonda;
  maxson: string;
  v: vector;
  promedioduracion, promediocosto: real;
  cantsondas: integer;
begin
  L:= nil;
  cargarlista(L);
  recorrer(L, maxsonda, V, promedioduracion, promediocosto);
  cantynomsondas(L,cantsondas, promedioduracion, promediocosto);
  writeln('El nombre de la sonda más costosa es: ', maxsonda);
  writeln('La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas: ', cantsondas);
end.
