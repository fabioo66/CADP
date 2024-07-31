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
