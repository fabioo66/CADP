{Dada la siguiente declaracion y los siguientes procesos. Indique para cada uno de los procesos si son correctos o no. El objetivo es duplicar el contenido del ultimo nodo de la lista. Justifique su respuesta.}

type 
    miLista = ^nodo;

    nodo = record
        dato: integer; 
        sig: miLista;
    end;

    lista = record
        pri: miLista; 
        ult: miLista;
    end;

Procedure duplicar1 (L: lista);
begin
    L.ult^.dato:= L.ult^.dato * 2;
end;

Procedure duplicar2 (L: lista);
var 
    aux: miLista;
begin
    aux:= L.pri;
    while (aux^.sig <> nil) do
        aux:= aux^.sig;
    aux^.dato:= aux^.dato * 2;
end;

{Si el registro lista contiene dos punteros uno con el primer elemento de la lista y otro con el ultimo elemento de la lista el primer procedimiento es correcto. El duplicar2 es incorrecto ya que si la lista esta vacia accedes al siguiente de nil y esto es incorrecto.}