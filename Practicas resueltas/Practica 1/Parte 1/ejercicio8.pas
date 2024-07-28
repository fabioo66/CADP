{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”}

program ejercicio8;

var 
    char1, char2, char3: char;
    vocales: set of char;

begin
    writeln('Ingrese tres caracteres: ');
    readln(char1);
    readln(char2);
    readln(char3);
    
    vocales := ['a', 'e', 'i', 'o', 'u'];

    if (char1 in vocales) and (char2 in vocales) and (char3 in vocales) then
        writeln('Los tres son vocales')
    else
        writeln('Al menos un caracter no era vocal'); 
end.