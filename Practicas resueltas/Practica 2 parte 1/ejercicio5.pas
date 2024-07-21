{Dado el siguiente programa, indicar cuál es el error.}

program alcance4;
function cuatro: integer;
begin
    cuatro:= 4;
end;

var 
    a: integer;
begin
    cuatro;
    writeln(a);
end.

// Se intenta informar un valor de una variable que no esta inicializada