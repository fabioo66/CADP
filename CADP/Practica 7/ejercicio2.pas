program ejercicio2repaso;
type
  prango = 1..6;
  cliente = record
    codigo: integer;
    DNI: integer;
    apellido: string;
    nombre: string;
    poliza: prango;  //monto adicional, de acuerdo al código de póliza que tiene contratada.
    montomensual: real;
  end;
  lista = ^nodo;
  nodo = record
    dato: cliente;
    sig: lista;
  end;
  
procedure leercliente(var c:cliente);
begin
  readln(c.codigo);
  readln(c.DNI);
  readln(c.nombre);
  readln(c.apellido);
  readln(c.poliza);
  readln(c.montomensual);
end;
procedure agregaradelante(var L:lista; c:cliente);
var 
  nue:lista;
begin
  new(nue);
  nue^.dato:= c;
  nue^.sig:= L;
  L:= nue;
end;  
procedure cargarlista(var L:lista);
var
  c:cliente;
begin
  L:= nil;
  repeat
    leercliente(c);
    agregaradelante(L,c);
  until(c.codigo = 1122);
end;  
function DNI9(num: integer):boolean;
var
  resto, cant: integer;
begin
  cant:= 0;
  while(num <> 0)do begin
    resto:= num mod 10;
    if(resto = 9)then 
      cant:= cant + 1;
    num:= num div 10;
  end;
  DNI9:= (cant >= 9);
end;
procedure procesar(L: lista; montoadi: real);
begin 
  while(L <> nil)do begin
    writeln(L^.dato.DNI, L^.dato.apellido, L^.dato.nombre, L^.dato.montomensual + montoadi);
    if(DNI9(L^.dato.DNI))then
      writeln(L^.dato.apellido, L^.dato.nombre);
    L:= L^.sig; 
  end;    
end;    
procedure eliminar(var L: lista; num: integer);
var 
  ant, act: lista;
begin
  act:= L;
  ant:= L;
  while(act^.dato.codigo <> num)do begin
    ant:= act;
    act:= act^.sig;
  if(act <> nil)then begin
    if(act = ant)then
      L:= act^.sig
    else
      ant^.sig:= act^.sig;
    dispose(act);  
  end;
  end;    
end;
var
  L: lista;
  c: cliente;
  montoadicional: real;
  code: integer;
begin
  cargarlista(L);
  readln(montoadicional);
  procesar(L, montoadicional);
  readln(code);
  eliminar(L, code);
end.
