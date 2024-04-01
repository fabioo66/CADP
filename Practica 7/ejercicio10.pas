program ejercicio10;
type
  estatalrango = 0..1;

  cultivo = record
    tipo:string;
    hect:integer;
    meses:integer;
  end;
  vector = array [1..20] of cultivo;
  
  empresa = record
    codigo:integer;
    nombre:string;
    estatal:estatalrango; { 0 = estatal / 1 = privada }
    ciudad:string;
    cultivos:vector;
    diml:integer;
    end;

  lista = ^nodo;
  nodo = record
    dato:empresa;
    sig:lista;
  end;

procedure leercultivo(var c:cultivo);
begin
  writeln('Ingrese el numero de hectáreas del cultivo');
  readln(c.hect);
  if(c.hect <> 0) then begin
    writeln('Ingrese el tipo de cultivo');
    readln(c.tipo);
    writeln('Ingrese el numero de meses del cultivo');
    readln(c.meses);
  end;
end;

procedure cargarvector(var v:vector; var diml:integer);
var
  c:cultivo;
begin
  diml:= 0;
  leercultivo(c);
  while (c.hect <> 0) and (diml < 20) do begin
    diml:= diml + 1;
    v[diml]:= c;
    leercultivo(c);
  end;
end;

procedure leerempresa (var e:empresa);
begin
  writeln('Ingrese el codigo de la empresa');
  readln(e.codigo);
  if (e.codigo <> -1) then begin
    writeln('Ingrese el nombre de la empresa');
    readln(e.nombre);
    writeln('Ingrese si la empresa es privada(1) o publica (0)');
    readln(e.estatal);
    writeln('Ingrese la ciudad donde reside la empresa');
    readln(e.ciudad);
    cargarvector(e.cultivos,e.diml);
  end;
end;

procedure agregarAdelante(var L:lista; e:empresa);
var
  nue:lista;
begin
  new(nue);
  nue^.dato:= e;
  nue^.sig:= L;
  L:= nue;
end;

procedure cargarlista(var L:lista);
var
  e:empresa;
begin
  leerempresa(e);
  while (e.codigo <> -1) do begin
    agregarAdelante(L,e);
    leerempresa(e);
  end;
end;

//c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
//al total de hectáreas.

function cumpledigitos(num:integer):boolean;
var
  cant:integer;
begin
  cant:= 0;
  while (num <> 0) do begin
    if (num mod 10 = 0) then
      cant:= cant + 1;
    num:= num div 10;
  end;
  cumpledigitos:= (cant >= 2)
end;

function cumple (ciudad:string; v:vector; diml:integer; codigo:integer):boolean;
var
  ok:boolean;
  i:integer;
begin
  ok:= false;
  if (ciudad = 'San Miguel del Monte' ) and (cumpledigitos(codigo))then begin
    for i:= 1 to diml do begin
      if (v[i].tipo = 'trigo') then
        ok:= true;
    end;
  end;
  cumple:= ok;
end;

//d. La empresa que dedica más tiempo al cultivo de maíz

procedure recorrer(V:vector; diml:integer; var cantsoja,cantotal:integer; var cantmaiz:integer);
var
  i:integer;
begin
  for i:= 1 to diml do begin
    cantotal:= cantotal + v[i].hect;
    if (v[i].tipo = 'soja')then
      cantsoja:= cantsoja +  v[i].hect;
    if (v[i].tipo = 'maiz') then
      cantmaiz:= cantmaiz + v[i].meses;
  end;
end;

procedure maximos (nombre:string; cantmaiz:integer; var maxnombre:string; var maxcant:integer);
begin
  if (cantmaiz > maxcant) then begin
    maxcant:= cantmaiz;
    maxnombre:= nombre;
  end;
end;

procedure procesar(L:lista; var cantsoja:integer; var porcentaje:real; var maxnombre:string);
var
  maxcant:integer;
  cantmaiz:integer;
  cantotal:integer;
begin
  cantsoja:= 0;
  cantotal:= 0;
  while (L <> nil) do begin
    cantmaiz:= 0;
    if (cumple(L^.dato.ciudad, L^.dato.cultivos, L^.dato.diml, L^.dato.codigo)) then
      writeln('La empresa ' , L^.dato.nombre ,  'radicada en “San Miguel del Monte” cultiva trigo y su código de empresa posee al menos dos ceros');
    recorrer(L^.dato.cultivos, L^.dato.diml,cantsoja,cantotal,cantmaiz);
    maxcant:= -999;
    maximos(L^.dato.nombre,cantmaiz,maxnombre,maxcant);
    L:= L^.sig;
  end;
  porcentaje:= (cantsoja * 100 ) / cantotal;
end;         

//e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
//hectáreas de todas las empresas que no son estatales.

procedure incrementarmes(L:lista);
var
  i:integer;
begin
  while (L <> nil) do begin
      for i:= 1 to L^.dato.diml do begin
        if (L^.dato.estatal = 1) and (L^.dato.cultivos[i].hect < 5) and (L^.dato.cultivos[i].tipo = 'girasol') then
          L^.dato.cultivos[i].meses := L^.dato.cultivos[i].meses + 1;
      end;
    L:= L^.sig;
  end;
end;

var
  maxnombre:string;
  porcentaje:real;
  cantsoja:integer;
  L:lista;
begin
  cargarlista(L);
  procesar(L,cantsoja,porcentaje,maxnombre);
  writeln('La cantidad de hectáreas dedicadas al cultivo de soja es ' , cantsoja , ' y el porcentaje que representa con respecto al total de hectáreas es ' , porcentaje:0:2);
  writeln('La empresa que dedica más tiempo al cultivo de maíz es ' , maxnombre);
  incrementarmes(L);
end.
