{Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía,
indicar en qué línea se encuentra cada error y en qué consiste:}

1.  program ejercicio5;
2.  { suma los números entre a y b, y retorna el resultado en c }
3.  procedure sumar(a, b, c : integer)
4.  var
5.      suma : integer;
6.  begin
7.
8.      for i := a to b do
9.          suma := suma + i;
10.         c := c + suma;
11. end;
12. var
13.     result : integer;
14. begin
15.     result := 0;
16.     readln(a); readln(b);
17.     sumar(a, b, 0);
18.     write('La suma total es ',result);
19.     { averigua si el resultado final estuvo entre 10 y 30}
20.     ok := (result >= 10) or (result <= 30);
21.     if (not ok) then
22.         write ('La suma no quedó entre 10 y 30');
23. end.

// en la linea 3 c deberia estar por referencia
// en la linea 8 i no esta declarada
// en la linea 9 suma no esta inicializada
// en la linea 10 la lógica de suma debería estar fuera del bucle for.
// en la linea 16 las variables a y b no estan declaradas
// en la linea 17 se deberia pasar sumar(a, b, result)
// en la linea 20 ok no esta declarado
// en la linea 20 hay que cambiar el or por un and