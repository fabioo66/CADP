{Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y 
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un 
programa que analice esta información, determine e informe: 
a. Para cada embarazada, la semana con mayor aumento de peso.  
b. El aumento de peso total de cada embarazada durante el embarazo.}

program ejercicio4;
const   
    cantSemanas = 42;
type
    paciente = record
        nombre: string;
        apellido: string;
        peso: vector;
        diml: integer;
    end;

    vector = array [1..cantSemanas] of real;

    lista = ^nodo;	
    nodo = record
        dato: paciente;
        sig: lista;
    end;

// se dispone
procedure cargarLista(var l: lista);

function semanaMayorAumento(v: vector; diml: integer): integer;
var
    i: integer;
    maxAumento: real;
    semana: integer;
begin
    maxAumento := -1;
    for i := 2 to diml do begin
        if (v[i] - v[i-1] > maxAumento) then begin
            maxAumento := v[i] - v[i-1];
            semana := i;
        end;
    end;
    semanaMayorAumento := semana;
end;

procedure informar(l: lista);
begin
    while (l <> nil) do begin
        writeln('La semana con mayor aumento de peso de ', l^.dato.nombre, ' ', l^.dato.apellido, ' es: ', semanaMayorAumento(l^.dato.peso, l^.dato.diml));
        writeln('El aumento de peso total de ', l^.dato.nombre, ' ', l^.dato.apellido, ' es: ', l^.dato.peso[l^.dato.diml] - l^.dato.peso[1]);
        l := l^.sig;
    end;
end;

var
    l: lista;
begin
    l := nil;
    cargarLista(l);
    informar(l);
end.