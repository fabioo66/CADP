{Dada la siguiente declaración de tipos de datos y variables, justificar para cada sentencia numerada si son válidas o inválidas:}

program ejercicio_3;
type
    cadena50 = string[50];
    cliente = record
        DNI: cadena50;
        ape_nom: cadena50;
    end;

    clientes = ^nodo;
    nodo = record
        dato: cliente;
        sig: clientes;
    end;

var
    c: cliente;
    cli: clientes;
    cli_esp: clientes;

begin
    1. read(c); // Invalida, ya que c es un registro y no se puede leer directamente.
    2. new(c); // Invalida, ya que c es un registro no un puntero.
    3. cli := nil; // Valida, ya que cli es un puntero a nodo.
    4. new(cli); // Valida, ya que cli es un puntero a nodo.
    5. cli_esp := cli; // Valida, ya que cli_esp es un puntero a nodo y cli tambien.
    6. dispose(cli); // Valida, ya que cli es un puntero a nodo.
    7. read(cli_esp^.DNI); // Invalido, no se puede leer directamente un puntero.
    8. write(cli_esp^.DNI); // Invalido ya que cli_esp es un puntero que no apunta a ningun lugar.
end.