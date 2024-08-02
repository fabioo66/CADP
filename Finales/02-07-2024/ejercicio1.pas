{Realice un programa que resuelva lo siguiente: dos amigos juegan a la batalla naval (simplificada). Para esto cada amigo dispone de su tablero de 20 filas x 15 columnas donde en alguna posicion del tablero tiene ubicados cada uno de sus 7 barcos (cada barco se encuentra en una unica posicion). El juego consiste en lo siguiente:
- Se juegan 10 rondas, en cada ronda, cada jugador invoca a la funcion dameNumeroFila y a la funcion dameNumeroColumna y a partir de esos valores se deve invocar al procedimiento juego, que dado un tablero, una fila y una columna, retorna verdadero si habia un varco en esa posicion o falso en caso contrario. Primero juega el jugador 1 y luego el 2 hasta que ocurran las 10 rondas. 
- Luego de las 10 rondas se deve informar el puntaje de cada jugador, es decir, a cuantos barcos del otro jugador haa logrado hundir.}

program ejercicio1;
type 
    fRango = 1..20;
    cRango = 1..15;

    vectorColumnas = array[cRango] of Boolean;
    tabla = array[fRango] of vectorColumnas;

    jugador = record
        tablero: tabla;
        puntaje: integer;
    end;

function dameNumeroFila(): fRango;
begin
    dameNumeroFila := random(20) + 1;
end;

function dameNumeroColumna(): cRango;
begin
    dameNumeroColumna := random(15) + 1;
end;

procedure inicializarJugador(var j: jugador);
var
    i, c, numeroFila, numeroColumna: integer;
begin
    // Inicializo el tablero sin barcos 
    for i := 1 to 20 do begin
        for c := 1 to 15 do 
            j.tablero[i][c] := false;
    end;

    for i := 1 to 7 do begin
        numeroFila := random(20) + 1;
        numeroColumna := random(15) + 1;
        while (j.tablero[numeroFila][numeroColumna]) do begin
            numeroFila := random(20) + 1;
            numeroColumna := random(15) + 1;
        end;
        j.tablero[numeroFila][numeroColumna] := true;
    end;
    j.puntaje := 0;
end;

procedure juego(var j: jugador; fila: fRango; columna: cRango; var hayBarco: boolean);
begin
    hayBarco := false;
    if (j.tablero[fila][columna]) then begin
        j.tablero[fila][columna] := false;
        hayBarco := true;
    end;
end;

var
    jugador1, jugador2: jugador;
    i: integer;
    hayBarco: boolean;
begin
    randomize;
    inicializarJugador(jugador1);
    inicializarJugador(jugador2);
    for i := 1 to 10 do begin
        // Juega el jugador 1
        juego(jugador2, dameNumeroFila(), dameNumeroColumna(), hayBarco);
        if (hayBarco) then
            jugador1.puntaje := jugador1.puntaje + 1;

        // Juega el jugador 2
        juego(jugador1, dameNumeroFila(), dameNumeroColumna(), hayBarco);
        if (hayBarco) then
            jugador2.puntaje := jugador2.puntaje + 1;
    end;

    writeln('Puntaje jugador 1: ', jugador1.puntaje);
    writeln('Puntaje jugador 2: ', jugador2.puntaje);
end.
