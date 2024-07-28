{Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
Tipo de zona  Rendimiento por ha
1             6 toneladas por ha
2             2,6 toneladas por ha
3             1,4 toneladas por ha}

program ejercicio12;

function calcularRendimientoEconomico(cantidadHectareas, tipoZona:integer; precioToneladaSoja:real): real;
var
    rendimiento : real;
begin
    if (tipoZona = 1)then begin
        rendimiento := 6 * precioToneladaSoja * cantidadHectareas
    else if (tipoZona = 2)
        rendimiento := 2.6 * precioToneladaSoja * cantidadHectareas
    else 
        rendimiento := 1.4 * precioToneladaSoja * cantidadHectareas
    
    calcularRendimientoEconomico := rendimiento;
end;

