{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas.}

program ejercicio8;
const
    dias = 31;
type
    crango = 1..dias;
var
    monto, total, max, dia, i: integer;
begin
    total := 0;
    max := -1;
    for i := 1 to dias do begin
        writeln('Ingrese los montos de las ventas realizadas en el dia ', i, ' del mes: ');
        repeat
            readln(monto);
            if (monto <> 0) then
                total := total + monto;
        until (monto = 0);
        writeln('La cantidad de ventas realizadas en el dia ', i, ' del mes es: ', total);
        if (total > max) then begin
            max := total;
            dia := i;
        end;
        total := 0;
    end;
    writeln('El monto total acumulado en ventas de todo el mes es: ', total);
    writeln('El dia en el que se realizo la mayor cantidad de ventas es: ', dia);
end.