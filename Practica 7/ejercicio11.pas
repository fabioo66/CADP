program ejercicio11;
const
  canteventos = 5;
type
  trango = 1..canteventos;
  erango = 1..canteventos;
  evento = record
    nombre: string;
    tipo: trango;
    lugar: string;
    cantmaxpersonas: integer;
    costo: real;
    ventaentradas:integer;
  end;
  vector = array[erango] of evento;
  
  venta = record
    codigo: integer;
    num: erango;
    DNI: integer;
    cantentradas: integer;
  end;
  
  lista = ^nodo;
  nodo = record
    dato: venta;
    sig: lista;
  end;
 
procedure leerevento(var e:evento);
begin
  writeln('Ingrese el nombre del evento');
  readln(e.nombre);
  writeln('Ingrese el tipo de evento');
  readln(e.tipo);
  writeln('Ingrese el lugar');
  readln(e.lugar);
  writeln('Ingrese la cantidad maxima de personas');
  readln(e.cantmaxpersonas);
  writeln('Ingrese el costo');
  readln(e.costo);
end;
procedure cargarvector(var vr: vector);
var
  i: erango;
begin
  for i:= 1 to canteventos do begin
    vr[i].ventaentradas:= 0;
    leerevento(vr[i]);
  end;
end; 
procedure leerventa(var v:venta);
begin
  writeln('Ingrese el codigo de venta');
  readln(v.codigo);
  if(v.codigo <> -1)then begin
    writeln('Ingrese el numero');
    readln(v.num);
    writeln('Ingrese el dni');
    readln(v.DNI);
    writeln('Ingrese el cantentradas');
    readln(v.cantentradas);
  end;
end;
procedure agregaradelante(var L: lista; v: venta);
var 
  nue: lista;
begin
  new(nue);
  nue^.dato:= v;
  nue^.sig:= L;
  L:= nue;
end;
procedure cargarlista(var L:lista);
var
  v: venta;
begin
  leerventa(v);
  while(v.codigo <> -1)do begin
    agregaradelante(L, v);
    leerventa(v);
  end;
end;
function cumple(num:integer):boolean;
var
  resto,pares,impares:integer;
begin
  pares:= 0;
  impares:= 0;
  while (num <> 0) do begin
    resto:= num mod 10;
    if ((resto) mod 2 = 0) then
      pares:= pares + 1
    else
      impares:= impares + 1;
    num:= num div 10;
  end;
  cumple:= (pares > impares);  
end;
procedure procesarlista (L:lista; vr:vector; var entradasespeciales:integer; var entradas50:boolean);
var
  entra50:integer;
begin
  entra50:= 0;
  entradasespeciales:= 0;
  while (L <> nil) do begin
    vr[L^.dato.codigo].ventaentradas:= vr[L^.dato.codigo].ventaentradas + L^.dato.cantentradas;
    if (cumple(L^.dato.dni)) and (vr[L^.dato.codigo].tipo = 3) then
      entradasespeciales:= entradasespeciales + 1;
    if (L^.dato.codigo = 50) then
      entra50:= entra50 + L^.dato.cantentradas;
    L:= L^.sig;
  end;
  if (entra50 = vr[50].cantmaxpersonas) then
    entradas50:= true
  else
    entradas50:= false;
end;
procedure recaudacionminima (vr: vector; var nombre1, nombre2, lugar1, lugar2: string);
var
  min1,min2:integer;
  i: erango;
begin
  min1:= 9999;
  min2:= 9999;
  for i:= 1 to canteventos do begin
    if (vr[i].ventaentradas < min1) then begin
      min2:= min1;
      nombre2:= nombre1;
      lugar2:= lugar1;
      min1:= vr[i].ventaentradas;
      nombre1:= vr[i].nombre;
      lugar1:= vr[i].lugar
    end
    else if (vr[i].ventaentradas < min2) then begin
      min2:= vr[i].ventaentradas;
      nombre2:= vr[i].nombre;
      lugar2:= vr[i].lugar;
    end;
  end;
end;
var
  entradas50cent:boolean;
  specialticket:integer;
  name1,name2,place1,place2:string;
  vr: vector;
  L: lista;
begin
  L:= nil;
  cargarvector(vr);
  cargarlista(L);
  procesarlista(L,vr,specialticket,entradas50cent);
  recaudacionminima(vr,name1,name2,place1,place2);
  writeln('Los nombres de los lugares con menos recaudacion son ', name1,name2, ' respectivamente situados en ' ,place1,place2);
  writeln('La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que impares y que sean para el evento de tipo “obra de teatro” ' , specialticket);
  writeln('La cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de personas permitidas' , entradas50cent);
end.
