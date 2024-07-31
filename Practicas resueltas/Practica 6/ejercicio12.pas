{Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese
la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

program ejercicio12;

type
    dispositivo = record
        version: string;
        pantalla: real;
        ram: real;
    end;

    lista = ^nodo;
    nodo = record
        dato: dispositivo;
        sig: lista;
    end;

{SE DISPONE
procedure leerDispositivo(var d: dispositivo);
begin
    write('Ingrese la versión de Android: '); 
    readln(d.version);
    if(d.version <> 'ZZZZ') then begin
        write('Ingrese el tamaño de la pantalla: '); 
        readln(d.pantalla);
        write('Ingrese la cantidad de memoria RAM: '); 
        readln(d.ram);
    end;
end;

procedure insertarOrdenado(var L: lista; d: dispositivo);
var
    nue, act, ant: lista;
begin
	new(nue);
	nue^.dato := d;
	act := L;
	ant := nil;
	while ((act <> nil) and (act^.dato.version < d.version)) do begin
		ant := act;
		act := act^.sig;
	end;
	if (ant = nil) then
		L := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;

procedure cargarLista(var L : lista);
var
	d : dispositivo;
begin
	leerDispositivo(d);
	while (d.version <> 'ZZZZ') do begin
		insertarOrdenado(L, d);
		leerDispositivo(d);
	end;
end;}

procedure procesar(L : lista; var dispositivosCumple : integer; var pantallaPromedio : real);
var
	cantDispositivos, dispositivosTotales : integer;
	versionActual : string;
	sumaPantalla : real;
begin
	dispositivosCumple := 0;
	dispositivosTotales := 0;
	sumaPantalla := 0;
	while (L <> nil) do begin
		versionActual := L^.dato.version;
		cantDispositivos := 0;
		while ((L <> nil) and (versionActual = L^.dato.version)) do begin
			cantDispositivos := cantDispositivos + 1;
			if ((L^.dato.ram > 3) and (L^.dato.pantalla <= 5))then
				dispositivosCumple := dispositivosCumple + 1;
			sumaPantalla := sumaPantalla + L^.dato.pantalla;
			L := L^.sig;
		end;
		writeln('La cantidad de dispositivos que tiene la versión ', versionActual, ' es ', cantDispositivos);
		dispositivosTotales := dispositivosTotales + cantDispositivos;
	end;
	if (dispositivosTotales > 0) then
		pantallaPromedio := sumaPantalla / dispositivosTotales
	else
		pantallaPromedio := 0;
end;

var
    L: lista;
    dispositivosCumple: integer;
    pantallaPromedio: real;
begin
    L := nil;
    cargarLista(L);
    procesar(L, dispositivosCumple, pantallaPromedio);
    writeln('La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas es: ', dispositivosCumple);
    writeln('El tamaño promedio de las pantallas de todos los dispositivos es: ', pantallaPromedio:2:2);
end.













