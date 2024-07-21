program ejercicio5practica4p2;
const
  dimf = 500;
type
  rangodias: 1..31;
  rangomes: 1..12;
  rangoanio: 2010..2030;
  rangocod: 1..2400;
  rangocat: 'A'..'F';
  fec = record;
    dia:rangodias;
    mes:rangomes;
    anio: rangoanio;
  end;
  cliente = record;
    fecha: fec;
    categoria: rangocat;
    codigo: rangocod;
  end;
vectorclientes = array [1..dimf] of cliente;
vectormes = array [rangomes] of integer;
vectoranio = array [rangoanio] of integer;

procedure leerfecha(var f:fec);
begin
  read(f.dia);
  read(f.mes);
  read(f.anio);
end;
procedure leercliente(var c:cliente);
begin
  leerfecha(c.fecha);
  read(c.categoria);
  read(c.codigo);
end;
procedure cargarvector(var v:vectorclientes);
begin
  for i:= 1 to 500 do
    leercliente(v[i]);
end;
procedure inicializarmes (var vm:vectormes);
var
  i:rangomes;
begin
  for i:= 1 to 12 do
    vm[i]:= 0;
end;
procedure inicializaranio (var va:vectoranio);
var
  i:rangoanio;
begin
  for i:= 2010 to 2030 do
    va[i]:= 0;
end;
{a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos}
procedure incisoA(v: vectorclientes; var vm: vectormes; var va: vectoranio; var maximo:rangoanio);
var
  mesactual: rangomes;
  anioactual: rangoanio;
  i:integer;
begin
  for i:= 1 to 500 do begin
    mesactual:= v[i].fecha.mes;
    while (mesactual = )
end.
