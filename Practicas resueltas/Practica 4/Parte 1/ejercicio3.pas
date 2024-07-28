{Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}

program ejercicio3;
const 
    dimf = ?;
type 
    vnum = array[1..dimf] of integer;

procedure imprimirVector(v:vnum; diml:integer);
var    
    i : integer;
begin 
    for i := 1 to diml do 
        write(v[i], ' ');
end;

procedure imprimirVectorInverso(v:vnum; diml:integer);
var 
    i : integer;
begin 
    for i := diml downto 1 do 
        write(v[i], ' ');
end;

procedure imprimirVectorMitad(v:vnum; diml:integer);
var 
    i : integer;   
begin
    for i := diml div 2 downto 1 do 
        write(v[i], ' ');
    for i := diml div 2 + 1 to diml do 
        write(v[i], ' ');
end;

procedure imprimirVectorPosiciones(v:vnum; diml:integer; x:integer; y:integer);
var 
    i : integer;
begin
    if (x < y) then 
        for i := x to y do 
            write(v[i], ' ')
    else 
        for i := x downto y do 
            write(v[i], ' ');
end;

{e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}}

procedure imprimirVector(v:vnum; diml:integer);
var    
    i : integer;
begin
    imprimirVectorPosiciones(v, diml, 1, diml);
end;

procedure imprimirVectorInverso(v:vnum; diml:integer);
var 
    i : integer;
begin   
    imprimirVectorPosiciones(v, diml, diml, 1);
end;

procedure imprimirVectorMitad(v:vnum; diml:integer);
var 
    i : integer;
begin
    imprimirVectorPosiciones(v, diml, diml div 2, diml);
    imprimirVectorPosiciones(v, diml, diml div 2 + 1, diml);
end;