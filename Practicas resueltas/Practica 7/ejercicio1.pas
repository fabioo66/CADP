{Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva 
película, para ello se debe leer y almacenar la información de las personas que desean participar  de 
dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación 
que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega 
una persona con DNI 33555444, la cual debe procesarse.  
Una vez finalizada la lectura de todas las personas, se pide:  
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.  
b. Informar los dos códigos de género más elegidos.  
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no 
existir. Invocar dicho módulo en el programa principal.}

program ejercicio1;
type
    cadena = string[30];
    genero = 1..5;

    persona = record
        dni: integer;
        apellido: cadena;
        nombre: cadena;
        edad: integer;
        codGenero: genero;
    end;

    lista = ^nodo;
    nodo = record
        dato: persona;
        sig: lista;
    end;

    vectorContador = array[genero] of integer;

procedure leerPersona(var p: persona);
begin
    writeln('Ingrese el DNI de la persona');
    readln(p.dni);
    if (p.dni <> 33555444) then
    begin
        writeln('Ingrese el apellido de la persona');
        readln(p.apellido);
        writeln('Ingrese el nombre de la persona');
        readln(p.nombre);
        writeln('Ingrese la edad de la persona');
        readln(p.edad);
        writeln('Ingrese el codigo de genero de actuacion que prefiere');
        readln(p.codGenero);
    end;
end;

procedure agregarAdelante(var l: lista; p: persona);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := p;
    nuevo^.sig := l;
    l := nuevo;
end;

procedure cargarLista(var l: lista);
var 
    p: persona;
begin
    repeat
        leerPersona(p);
        agregarAdelante(l, p);
    until(p.dni = 33555444) 
end;

function masParesQueImpares(dni: integer): boolean;
var
    cantPares, cantImpares: integer;
begin
    cantPares := 0;
    cantImpares := 0;
    while (dni <> 0) do begin
        if ((dni mod 10) mod 2 = 0) then
            cantPares := cantPares + 1
        else
            cantImpares := cantImpares + 1;
        dni := dni div 10;
    end;
    masParesQueImpares := cantPares > cantImpares;
end;

procedure procesar(l: lista; var vc: vectorContador; var cantPares: integer);
begin
    cantPares := 0;
    while(l <> nil) do begin
        if (masParesQueImpares(l^.dato.dni)) then
            cantPares := cantPares + 1;
        vc[l^.dato.codGenero] := vc[l^.dato.codGenero] + 1;
        l := l^.sig;
    end;
end;

procedure informarMasElegidos(vc: vectorContador; var cod1, cod2: genero);
var
    i, max1, max2: integer;
begin
    max1 := -1;
    max2 := -1;
    for i := 1 to 5 do begin
        if (vc[i] > max1) then begin
            max2 := max1;
            cod2 := cod1;
            max1 := vc[i];
            cod1 := i;
        end
        else if (vc[i] > max2) then begin
            max2 := vc[i];
            cod2 := i;
        end;
    end;
end;

procedure eliminar(var L:lista; dni: integer; var encontre: boolean);
var
    act, ant: lista;
begin
	encontre:= false;
	act:= L;
	while(act <> nil)and(dni <> act^.dato.dni)do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act <> nil)then begin
		encontre:= true;
		if(act = L)then
			L:= act^.sig
	    else
			ant^.sig:= act^.sig;
		dispose(act);
	end;
end;

var
    l: lista;
    vc: vectorContador;
    cantPares: integer;
    cod1, cod2: genero;
    dni: integer;
    encontre: boolean;
begin   
    l := nil;
    cargarLista(l);
    procesar(l, vc, cantPares);
    informarMasElegidos(vc, cod1, cod2);
    writeln('La cantidad de personas cuyo DNI contiene mas digitos pares que impares es: ', cantPares);
    writeln('Los dos codigos de genero mas elegidos son: ', cod1, ' y ', cod2);
    writeln('Ingrese el DNI a eliminar');
    readln(dni);
    eliminar(l, dni, encontre);
    if (encontre) then
        writeln('El DNI se elimino correctamente')
    else
        writeln('El DNI no se encontro');
end.