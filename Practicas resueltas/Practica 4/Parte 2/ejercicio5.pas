{La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y
el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}

program ejercicio5;
const 
	dimf = 500;
type
	mRango = A..F;
	cRango = 1..2400;
	dRango : 1..31;
	mRango : 1..12;
	
	fecha = record
		dia : dRango;
		mes : mRango;
		anio : integer;
	end;
	
	cliente = record
		fech : fecha;
		categoria : mRango;
		codigo : cRango;
		montoMensual : real;
	end;
	
	vector = array[1..dimf] of cliente;
	vectorCategorias = array[A..F] of integer;
	vectorCiudades = array[1..10] of cRango;

	
	
procedure leerFecha(var f : fecha);
begin
	with f do begin
		write('Ingrese dia: ');
		readln(dia);
		write('Ingrese mes: ');
		readln(mes);
		write('Ingrese anio: ');
		readln(anio);
	end;
end;

procedure leerCliente(var c : cliente);
begin
	with c do begin
		leerFecha(fech);
		write('Ingrese categoria: ');
		readln(categoria);
		write('Ingrese codigo de ciudad: ');
		readln(codigo);
		write('Ingrese monto mensual: ');
		readln(montoMensual);
	end;
end;

procedure cargarVector(var v : vector);
var
	i : integer;
begin
	for i := 1 to dimf do begin
		leerCliente(v[i]);
	end;
end;

procedure procesar(v : vector);
begin
	writeln('I give up');
end;
