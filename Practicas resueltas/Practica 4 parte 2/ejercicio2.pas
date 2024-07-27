{Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}

program ejercicio2;
const 
    dimf = 500;
type
    vector = array[1..dimf] of string;

procedure cargarVector(var v : vector; var diml : integer);
var
    nombre : string;
begin
    diml := 0;
    writeln('Ingrese el nombre del alumno');
    readln(nombre);
    while ((nombre <> 'ZZZ') and (diml < dimf)) do begin
        diml := diml + 1;
        v[diml] := nombre;
        writeln('Ingrese el nombre del alumno');
        readln(nombre);
    end;
end;

procedure eliminarNombre(var v: vector; var diml: integer);
var
    pos, i: integer;
    nombre: string;
begin
    writeln('Ingrese el nombre del alumno que quiere eliminar');
    readln(nombre);
    pos:= 1;
    while(pos <= diml) and (v[pos] <> nombre) do
        pos:= pos + 1;
    if(pos <= diml) and (v[pos] = nombre) then begin
        for i:= pos to (diml-1) do
            v[i]:= v[i+1];
        diml:= diml-1;
        writeln('Se elimino correctamente del vector el nombre ', nombre);
    end
    else
        writeln('No se encontro el nombre ', nombre);
end;

procedure insertarNombre(var v : vector; var diml : integer);
var
    i : integer;
    nombre : string;
begin
    writeln('Ingrese el nombre del alumno que desea agregar');
    readln(nombre);
    if ((diml + 1 <= dimf) and (4 <= diml)) then begin
        for i:= diml downto 4 do 
            v[i+1]:= v[i];
        v[4]:= nombre;
        diml:= diml + 1;
        writeln('Se inserto el alumno en la posicion 4 correctamente');
    end
    else
        writeln('No se pudo insertar al alumno');
end;

procedure agregarAlVector(var v : vector; var diml : integer);
var
    nombre : string;
begin
    writeln('Ingrese el nombre del alumno que desea agregar');
    readln(nombre);
    if (diml + 1 <= dimf) then begin
        diml := diml + 1;
        v[diml] := nombre;
        writeln('Se agrego el alumno correctamente');
    end
    else
        writeln('No se pudo agregar al alumno');
end;

procedure menu(var v: vector; var diml: integer);
var
    opcion: char;
begin
    repeat
        writeln('Ingrese una opcion:');
        writeln('1. Eliminar un nombre');
        writeln('2. Insertar un nombre en la posicion 4');
        writeln('3. Agregar un nombre al vector');
        writeln('4. Salir');
        readln(opcion);
        case opcion of
            '1': eliminarNombre(v, diml);
            '2': insertarNombre(v, diml);
            '3': agregarAlVector(v, diml);
        end;
    until opcion = '4';
end;

var
    v: vector;
    diml: integer;

begin
    cargarVector(v, diml);
    menu(v, diml);
end.
