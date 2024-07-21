program ejercicio10;
type
  lista= ^nodo
  nodo= record
    dato:cliente;
    sig:lista;
  end;
procedure agregaralfinal(dni: integer; L: lista;  var ULT: lista; nro: integer);
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
