{Implemente un programa que lea el diámetro Dde un círculo e imprima:
a.El radio (R) del círculo (la mitad del diámetro).
b.El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R^2
c.El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2).}

program ejercicio4;
var 
    diametro, radio : real;
begin
    writeln('Ingrese el diametro de un circulo');
    readln(diametro);
    radio := diametro/2;
    writeln('a. El radio del circulo es ', radio:0:2);
    writeln('b. El area del circulo es ', (PI * radio * radio):0:2);
    writeln('c. El perimetro del circulo es ', (diametro * PI):0:2);
end.