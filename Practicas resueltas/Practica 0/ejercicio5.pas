{Un kiosquero debe vender una cantidad Xde caramelos entre Yclientes, dividiendo cantidades
iguales entre todos los clientes. Los que le sobren se los quedará para él.
a.Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la
cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de
caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se
quedará para sí mismo.
b.Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
valor de $1.60.}

program ejercicio5;
const
    valor = 1.60;
var 
    x, y: integer;
begin
    writeln('Ingrese la cantidad de caramelos que posee el kiosquero');
    readln(x);
    writeln('Ingrese la cantidad de clientes');
    readln(y);
    writeln('La cantidad de caramelos para cada cliente es ', x DIV y);
    writeln('La cantidad de caramelos que se quedara el kiosquero es ', x MOD y);
    writeln('Dinero que debera cobrar el cliente sabiendo que cada caramelo cuesta $1.60 --> ', (y * (x DIV y)) * valor:0:2);
end.