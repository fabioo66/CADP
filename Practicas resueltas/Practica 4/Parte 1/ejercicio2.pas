{ Dado el siguiente programa, complete las líneas indicadas, considerando que:
a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.
b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.}

program Vectores;
const
    cant_datos = 150;
type
    vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var diml:integer);
var 
    i : integer;
    num : real;
begin
    diml := 0;
    readln(num);
    while ((num <> 0) and (diml < cant_datos)) do begin
        diml := diml + 1;
        v[diml] := num;
        readln(num);
    end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
    i : integer;
begin
    suma := 0;
    for i := 1 to dimL do begin
        v[i] := v[i] + n;
        suma := suma + v[i];
    end;
end;

{ programa principal }
var
    datos : vdatos;
    i, dim : integer;
    num, suma : real;
begin
    dim := 0;
    sumaTotal := 0;
    cargarVector(datos, diml); 
    writeln('Ingrese un valor a sumar');
    readln(num);
    modificarVectorySumar(...);{completar}
    writeln('La suma de los valores es: ', suma);
    writeln('Se procesaron: ',dim, ' números')
end.