{Dado los siguientes programas, explicar la diferencia.}

program alcance4a;
var 
    a,b: integer;

procedure uno;
begin
    a := 1;
    writeln(a);
end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.

//

program alcance4b;
procedure uno;
begin
    a := 1;
    writeln(a);
end;

var 
    a,b: integer;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);
end.

// el primer programa imprime 1 21. El segundo programa tira error ya que la variable a en el procedure uno no esta declarada