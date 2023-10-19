program ejercicio10;
type
  lista= ^nodo
  nodo= record
    dato:cliente;
    sig:lista;
  end;
procedure agregaralfinal(dni: integer; var L: lista;  var ULT: lista; nro: integer);
var
  nue:lista;
begin
  new(nue);
  nue^.dato.nro:= nro;
  nue^.dato.dni:= dni;
  nue^.sig:= nil;
  if(L = nil)then
    L:= nue;
  else 
    ult^.sig:= nue;
  ult:= nue;
end;
procedure recibirCliente (var L:lista; var nro:integer; dni:integer; var ULT: lista);
begin
  agregaralfinal(dni, L, ULT, nro);
  nro:= nro + 1;
end;
AtenderCliente(var L:lista; var nro: integer; var DNI: integer; var ULT: lista);
var
  act: lista;
begin
  act:= L;
  nro:= act^.dato.nro;
  dni:= act^.dato.dni;
  L:= L^.sig;
  dispose(act);
end;
var
  L, ult: lista;
  nro, dni: integer;
begin
  L:= nil;
  nro:= 1;
  Writeln('Ingrese su numero de DNI');
  readln(DNI);
  while(DNI <> 0)do begin
    recibirCliente (L, nro, dni, ULT);
    Writeln('Ingrese su numero de DNI');
    readln(DNI);
  end;    
  while(L <> nil)do
    AtenderCliente(L, nro, DNI, ULT);
end. 
