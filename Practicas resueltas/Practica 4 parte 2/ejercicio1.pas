{a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente}

program ejercicio1;
const
	dimf = 500;
type 
	vector = array[1..dimf] of integer;
	
function buscarDesordenado(v : vector; diml, n : integer): boolean;
var
	pos : integer;
	ok : boolean;
begin
	pos := 1;
	ok := false;
	while ((pos <= diml) and (not ok)) do begin
		if (v[pos] = n) then
			ok := true
		else
			pos := pos + 1;
	end;
	buscarDesordenado := ok;
end;

function buscarOrdenado(v: vector; diml, n: integer): boolean;
var
    pos: integer;
    ok: boolean;
begin
    pos := 1;
    ok := false;
    while (pos <= diml) and (v[pos] < n) do
        pos := pos + 1;
    if (pos <= diml) and (v[pos] = n) then
        ok := true;
    buscarOrdenado := ok;
end;
	
	
	
	
	
