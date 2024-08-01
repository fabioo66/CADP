{Dados los siguientes programas indique para cada uno si son validos o no. Ademas, analice si considera que el funcionamiento en ambos programas es el mismo o no. JUSTIFIQUE}

{A}
Program uno;
Type
    datos = array [1..100] of integer;
Var
    d: datos;

Begin
    // Operaciones e invocaciones a módulos
    // para cargar y recorrer el vector d
End.

{B}
Program dos;
Var
    d: array [1..100] of integer;

Begin
    // Operaciones e invocaciones a módulos
    // para cargar y recorrer el vector d
End.

{En ambos programas se declara un vector de enteros de 100 posiciones. En el programa A se declara un tipo de dato datos que es un array de enteros de 100 posiciones, mientras que en el programa B se declara directamente el vector de enteros. Lo unico del B es que no se puede pasar por parametros a modulos}