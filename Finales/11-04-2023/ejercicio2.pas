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

{Si el registro lista contiene dos punteros uno con el primer elemento de la lista y otro con el ultimo elemento de la lista los dos procedimientos son correctos. Puede que el duplicar2 sea un poc mas ineficiente ya que recorre toda la lista para llegar al ultimo elemento, sabiendo que el ultimo elemento ya esta guardado en el registro lista. Pero ambos procedimientos cumplen con el objetivo de duplicar el contenido del ultimo nodo de la lista. Si el registro lista no contiene el puntero al ultimo elemento de la lista, el procedimiento duplicar1 no es correcto ya que no se puede acceder al ultimo nodo de la lista. En cambio, el procedimiento duplicar2 si es correcto ya que recorre la lista hasta llegar al ultimo nodo.}