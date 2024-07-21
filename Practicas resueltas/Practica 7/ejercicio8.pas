program ejercicio8;
type
  mrango = 1..7;
  diarango = 1..31;
  mesrango = 1..12;
  fec = record
    dia:diarango;
    mes:mesrango;
    anio:integer;
  end;
  transfer = record
    nroorigen:integer;
    dniorigen:integer;
    nrodestino:integer;
    dnidestino:integer;
    fecha: fec;
    hora:integer;
    monto:real;
    codigomotivo:mrango;
  end;
  lista = ^nodo;
  nodo = record
    dato:transfer;
    sig:lista;
  end;
  vector = array[mrango] of integer;

procedure insertarordenado(var L:lista; t:transfer);
var
  act,ant,nue:lista;
begin
  new(nue);
  nue^.dato:= t;
  nue^.sig:= nil;
  if (L = nil) then
    L:= nue
  else begin
    ant:= L;
    act:= L;
    while (act <> nil) and (L^.dato.nroorigen < nue^.dato.nroorigen) do begin
      ant:= act;
      act:= act^.sig;
    end;
    if (act = L) then begin
      nue^.sig:= L;
      L:= nue;
    end
    else begin
      ant^.sig:= nue;
      nue^.sig:= act;
    end;
  end;      
end;

procedure nuevaestructura(L:lista; var LN:lista);
begin
  while (L <> nil) do begin
    if (L^.dato.dnidestino <> L^.dato.dniorigen) then begin
      LN:= nil;
      insertarordenado(LN,L^.dato);
    end;
  end;
end;

procedure informarv(v:vector; var maxmotivo:integer);
var
  max:integer;
  i:integer;
begin
  max:= -9999;
  for i:= 1 to 7 do begin
    if (v[i] > max)then begin
      max:= v[i];
      maxmotivo:= i;
    end;
  end;      
end;

function cumple(mes:mesrango; num:integer):boolean;
var
  pares,impares:integer;
begin
  pares:= 0;
  impares:= 0;
  if (mes = 6) then begin
    while (num <> 0) do begin
      if((num mod 10) mod 2 = 0) then
        pares:= pares + 1
      else 
        impares:= impares + 1;
      num:= num div 10;
    end;
  end;
  cumple:= (mes = 6) and (impares > pares);
end;
    
//d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las cuales el número de cuenta destino posea menos dígitos pares que impares.
procedure procesar(L:lista; var v:vector; cantespecial:integer);
var
  total:real;
  actual:integer;
begin
  while (L <> nil) do begin
    v[L^.dato.codigomotivo]:= v[L^.dato.codigomotivo] + 1;
    
    if (cumple(L^.dato.fecha.mes, L^.dato.nrodestino))then
      cantespecial:= cantespecial + 1;
    
    total:= 0;
    actual:= L^.dato.nroorigen;
    while (actual = L^.dato.nroorigen) do begin
      total:= total + L^.dato.monto;
      L:= L^.sig;
    end;
    writeln('El monto total transferido a terceros es ' ,total);
  end;
end;

var
  maxmotivo,cantespecial:integer;
  v:vector;
  L,LN:lista;
begin
  //cargarlista(L);
  nuevaestructura(L,LN);
  procesar(LN,v,cantespecial);
  informarv(v, maxmotivo);
end.
