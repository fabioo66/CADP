{Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado.}

program ejercicio4;

const
    dimf = 1000;

type
    alumno = record
        num: integer;
        apeYNom: string;
        asistencias: integer;
    end;

    vector = array[1..dimf] of alumno;

procedure leerAlumno(var alu: alumno);
begin
    writeln('Ingrese el número del alumno:');
    readln(alu.num);
    writeln('Ingrese el apellido y nombre del alumno:');
    readln(alu.apeYNom);
    writeln('Ingrese la cantidad de asistencias del alumno:');
    readln(alu.asistencias);
end;

procedure cargarVector(var v: vector; var diml: integer);
var
    i: integer;
begin
    writeln('Ingrese la cantidad de alumnos:');
    readln(diml);
    for i := 1 to diml do begin
        writeln('Alumno ', i, ':');
        leerAlumno(v[i]);
    end;
end;

function posicion(v: vector; diml, num: integer): integer;
var
    pos: integer;
begin  
    pos := 1;
    while ((pos <= diml) and (v[pos].num < num)) do
        pos := pos + 1;
    // Asumimos que seguro existe
    posicion := pos;
end;

procedure insertarAlumno(var v: vector; var diml: integer; alu: alumno; var pude: boolean);
var
    pos, i: integer;
begin
    pude := false;
    pos := 1;
    while ((pos <= diml) and (alu.num > v[pos].num)) do 
        pos := pos + 1;
    if (diml + 1 <= dimf) then begin
        for i := diml downto pos do
            v[i + 1] := v[i];
        pude := true;
        diml := diml + 1;
        v[pos] := alu;
    end;
end;

procedure eliminarPos(var v: vector; var diml: integer; pos: integer; var pude: boolean);
var
    i: integer;
begin
    pude := false;
    if ((pos >= 1) and (pos <= diml)) then begin
        for i := pos to diml - 1 do
            v[i] := v[i + 1];
        diml := diml - 1;
        pude := true;
    end;
end;

procedure eliminarNro(var v: vector; var diml: integer; num: integer; var pude: boolean);
var
    pos: integer;
begin
    pos := posicion(v, diml, num);
    eliminarPos(v, diml, pos, pude);
end;

procedure eliminar0(var v: vector; var diml: integer; var okey: boolean);
var
    i, ocurrencias: integer;
begin
    ocurrencias := 0;
    for i := 1 to diml do begin
        if (v[i].asistencias = 0) then
            ocurrencias := ocurrencias + 1
        else if (ocurrencias > 0) then
            v[i - ocurrencias] := v[i];
    end;
    diml := diml - ocurrencias;
    okey := (ocurrencias > 0);
end;

var
    v: vector;
    diml, num, pos: integer;
    alu: alumno;
    pude, okey: boolean;

begin
    cargarVector(v, diml);
    
    writeln('Ingrese el número del alumno que desea buscar:');
    readln(num);
    pos := posicion(v, diml, num);
    writeln('La posición del alumno es: ', pos);

    writeln('Ingrese los datos del nuevo alumno a insertar:');
    leerAlumno(alu);
    insertarAlumno(v, diml, alu, pude);
    if (pude) then
        writeln('Alumno insertado correctamente.')
    else
        writeln('No se pudo insertar el alumno.');

    writeln('Ingrese la posición del alumno que desea eliminar:');
    readln(pos);
    eliminarPos(v, diml, pos, pude);
    if (pude) then
        writeln('Alumno eliminado correctamente.')
    else
        writeln('No se pudo eliminar el alumno.');

    writeln('Ingrese el número del alumno que desea eliminar:');
    readln(num);
    eliminarNro(v, diml, num, pude);
    if (pude) then
        writeln('Alumno eliminado correctamente.')
    else
        writeln('No se pudo eliminar el alumno.');

    eliminar0(v, diml, okey);
    if (okey) then
        writeln('Alumnos con asistencias 0 eliminados correctamente.')
    else
        writeln('No hay alumnos con asistencias 0.');
end.
