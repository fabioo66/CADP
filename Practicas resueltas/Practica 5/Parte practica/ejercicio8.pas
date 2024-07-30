{Analice el siguiente programa:}
1.  program memoria;
2.  type
3.      datos = array [1..20] of integer;
4.      punt = ^datos;
5.
6.  procedure procesarDatos(v : datos; var v2 : datos);
7.  var
8.      i, j : integer;
9.  begin
10.     for i := 1 to 20 do
11.         v2[21 - i] := v[i];
12. end;
13.
14. var
15.     vect : datos;
16.     pvect : punt;
17.     i : integer;
18. begin
19.     for i:= 1 to 20 do
20.         vect[i] := i;
21.     new(pvect);
22.     for i:= 20 downto 1 do
23.         pvect^[i] := 0;
24.     procesarDatos(pvect^, vect);
25.     writeln('fin');
26. end.

{Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.
a) Hasta la sentencia de la línea 18
b) Hasta la sentencia de la línea 20
c) Hasta la sentencia de la línea 23
d) Hasta la sentencia de la línea 11
e) Hasta la sentencia de la línea 25}

//a) Memoria estatica : 
// vect : 21 * 2 = 42 bytes
// pvect : 4 bytes 
// i : 2 bytes

// Memoria dinamica :
// Por el momento no se ha reservado memoria dinamica

//b) Memoria estatica :
// vect : 21 * 2 = 42 bytes
// pvect : 4 bytes 
// i : 2 bytes

// Memoria dinamica :
// Por el momento no se ha reservado memoria dinamica

//c) Memoria estatica :
// vect : 21 * 2 = 42 bytes
// pvect : 4 bytes 
// i : 2 bytes

// Memoria dinamica :
// new(pvect) : 4 bytes

//d) Memoria estatica :
// vect : 21 * 2 = 42 bytes
// pvect : 4 bytes 
// i : 2 bytes

// Memoria dinamica :

//e) Memoria estatica :
// vect : 21 * 2 = 42 bytes
// pvect : 4 bytes 
// i : 2 bytes

// Memoria dinamica :
// new(pvect) : 4 bytes