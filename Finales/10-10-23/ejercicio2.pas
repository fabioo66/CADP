{ Dada la siguiente declaración y los procesos A y B, indique para cada uno de ellos si elimina de forma correcta el primer elemento. Justifique su respuesta.}

type
    numeros = array [1..100] of ^real;
    vector = record
        elem: numeros;
        diml: integer;
    end;

procedure eliminar1(var v: vector);
var 
    i: integer;
begin
    for i := 1 to (v.diml - 1) do 
        v.elem[i] := v.elem[i+1];
    if (v.diml > 0) then begin
        dispose(v.elem[v.diml]);
        v.diml := v.diml - 1;
    end;
end;

procedure eliminar2(var v: vector);
var 
    i: integer;
begin
    for i := 1 to (v.diml - 1) do
        v.elem[i]^ := v.elem[i+1]^;
    if (v.diml > 0) then begin
        dispose(v.elem[v.diml]);
        v.diml := v.diml - 1;
    end;
end;

// A: No elimina de forma correcta el primer elemento, ya que no se actualiza el puntero al primer elemento del vector.
// B: Elimina de forma correcta el primer elemento, ya que se actualiza el puntero al primer elemento del vector.