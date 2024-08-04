{La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de 
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber: 
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso 
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).  
1. Realizar un  módulo  que  lea y  almacene  la  información de  los  alumnos  hasta que  se  ingrese  el 
alumno con número de alumno  -1, el cual no debe procesarse. Las 24 notas correspondientes  a 
cada  alumno deben quedar ordenadas de forma descendente.  2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:  a. El promedio de notas obtenido por cada alumno.  
b. La  cantidad  de  alumnos  ingresantes  2012  cuyo  número  de  alumno  está  compuesto 
únicamente por dígitos impares. 
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido 
se recibieron (o sea, que tardaron menos años)  
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de 
la estructura generada en el inciso 1. El alumno puede no existir.}

program ejercicio7;
type 
    mRango = 1..24;

    listaMaterias = ^nodoMaterias;
    nodoMaterias = record
        dato: integer;
        sig: listaMaterias;
    end;

    alumno = record
        numero: integer;
        apellido: string;
        nombres: string;
        email: string;
        anioIngreso: integer;
        anioEgreso: integer;
        notas: listaMaterias;
    end;

    listaAlumnos = ^nodoAlumno;
    nodoAlumno = record
        dato: alumno;
        sig: listaAlumnos;
    end;

procedure insertarOrdenado(var l: listaMaterias; n: integer);
var
    nue, ant, act: listaMaterias;
begin
    act := l;
    new(nue);
    nue^.dato := n;
    while ((act <> nil) and (act^.dato > n)) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act = ant) then 
        l := nue
    else
        ant^.sig := nue;
    nue^.sig := act;
end;

procedure leerAlumno(var a: alumno);
var
    i: integer;
begin
    a.notas := nil;
    writeln('Ingrese el numero de alumno');
    readln(a.numero);
    if (a.numero <> -1) then begin
        writeln('Ingrese el apellido');
        readln(a.apellido);
        writeln('Ingrese el nombre');
        readln(a.nombres);
        writeln('Ingrese el email');
        readln(a.email);
        writeln('Ingrese el anio de ingreso');
        readln(a.anioIngreso);
        writeln('Ingrese el anio de egreso');
        readln(a.anioEgreso);
        for i := 1 to 24 do begin
            writeln('Ingrese la nota de la materia ', i);
            insertarOrdenado(a.notas, i);
        end;
    end;
end;

procedure agregarAdelante(var l: listaAlumnos; a: alumno);
var
    nue: listaAlumnos;
begin
    new(nue);
    nue^.dato := a;
    nue^.sig := l;
    l := nue;
end;

procedure cargarLista(var l: listaAlumnos);
var 
    a: alumno;
begin
    leerAlumno(a);
    while (a.numero <> -1) do begin
        agregarAdelante(l, a);
        leerAlumno(a);
    end;
end;

function promedio(l: listaMaterias): real;
var
    suma: integer;
begin
    suma := 0;
    while (l <> nil) do begin
        suma := suma + l^.dato;
        l := l^.sig;
    end;
    promedio := suma / 24;
end;

function soloImpares(num: integer): boolean;
var
    ok: boolean;
begin
    ok := true;
    while ((num <> 0) and (ok)) do begin
        if (num mod 10 mod 2 = 0) then
            ok := false;
        num := num div 10;
    end;
    soloImpares := ok;
end;

procedure maximo(a: alumno; var max1, max2: integer; var Alumnomax1, Alumnomax2: alumno);
begin
    if ((a.anioEgreso - a.anioIngreso) > max1) then begin
        max2 := max1;
        max1 := a.anioEgreso - a.anioIngreso;
        Alumnomax2 := Alumnomax1;
        Alumnomax1 := a;
    end
    else if ((a.anioEgreso - a.anioIngreso) > max2) then begin
        max2 := a.anioEgreso - a.anioIngreso;
        Alumnomax2 := a;
    end;
end;

procedure procesar(l: listaAlumnos; var cantImpares: integer; var Alumnomax1, Alumnomax2: alumno);
var
    max1, max2 : integer;
begin
    cantImpares := 0;
    max1 := -1;
    max2 := -1;
    while (l <> nil) do begin
        writeln('El promedio de notas del alumno ', l^.dato.numero, ' es: ', promedio(l^.dato.notas):4:2);
        if ((l^.dato.anioIngreso = 2012) and (soloImpares(l^.dato.numero))) then
            cantImpares := cantImpares + 1;
        maximo(l^.dato, max1, max2, Alumnomax1, Alumnomax2);
        l := l^.sig;
    end;
end;

procedure eliminar(var l: listaAlumnos; num: integer; var pude: boolean);
var
    act, ant: listaAlumnos;
begin
    pude := false;
    act := l;
    while (act <> nil) and (act^.dato.numero > num) do begin
        ant := act;
        act := act^.sig;
    end;
    if (act <> nil) then begin
        if (act = ant) then
            l := act^.sig
        else
            ant^.sig := act^.sig;
        dispose(act);
        pude := true;
    end;
end;

var 
    l: listaAlumnos;
    cantImpares: integer;
    Alumnomax1, Alumnomax2: alumno;
    num: integer;
    pude: boolean;
begin
    l := nil;
    cargarLista(l);
    procesar(l, cantImpares, Alumnomax1, Alumnomax2);
    writeln('La cantidad de alumnos ingresantes en 2012 cuyo numero de alumno esta compuesto solo por digitos impares es: ', cantImpares);
    writeln('Los dos alumnos que mas rapido se recibieron son: ', Alumnomax1.apellido, ' ', Alumnomax1.nombres, ' ', Alumnomax1.email);
    writeln('Ingrese el numero de alumno a eliminar');
    readln(num);
    eliminar(l, num, pude);
    if (pude) then
        writeln('El alumno se elimino correctamente')
    else
        writeln('El alumno no se encontro');
end.