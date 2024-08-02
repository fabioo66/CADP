{Indique Verdadero o Falso. Justifique en todos los casos
a. incluir modulos dentro de un programa implica que el programa es mas eficiente que otro programa que realiza la misma tarea pero sin utilizar modulos

Falso. Que un programa utilice modulos no lo hace mas eficiente, la funcionalidad de los modulos es conseguir un programa mas legible. Tambien para hacer tareas que se repiten, por lo tanto se hace mas reutilizable.

b. El siguiente programa es valido}
program ejercicio;
  function auxiliar(val: integer): integer;
  begin
    val := val * val;
    auxiliar := val;
  end;
  
  procedure calculo(c: integer; var b: integer);
  begin
    b := b + c DIV 4;
  end;

var
  a, b: integer;
begin
  a := 16;
  b := 6;
  calculo(auxiliar(a), b);
end.

{Verdadero. El programa es valido. Se declara una funcion auxiliar que recibe un valor entero y devuelve un valor entero. Luego se declara un procedimiento calculo que recibe un valor entero y una variable entera. Se inicializan las variables a y b. Se llama al procedimiento calculo con los parametros auxiliar(a) y b. El metodo auxiliar recibe el valor de a y lo multiplica por si mismo, luego se llama al procedimiento calculo con el resultado de la funcion auxiliar y la variable b. Esto hace que b sea igual a 6 + 16*16 DIV 4 = 6 + 256 DIV 4 = 6 + 64 = 70.}

{c. No es posible declarar un tipo subrango donde su tipo base sea cualquiera de los tipos simples vistos en la teoria
Falso, es posible declarar un tipo subrango con cualquier tipo simple.

d. Un programa que utiliza un repeat until puede reescribirse utilizando un while
Verdadero. Un programa que utiliza un repeat until puede reescribirse utilizando un while. La estructura de un repeat until es la siguiente:
repeat
  //codigo
until condicion;
La estructura de un while es la siguiente:
while condicion do
  //codigo;
Ambos hacen lo mismo, pero la condicion del repeat until se evalua al final del bloque de codigo, mientras que la condicion del while se evalua al principio del bloque de codigo.
Repeat until utilizando while:
//codigo
while not condicion do
  //codigo;

e. La comunicacion entre el programa y los modulos no solo se puede hacer utilizando parametros 
Falso. La comunicacion entre el programa y los modulos se puede hacer utilizando parametros, variables globales y funciones.}



