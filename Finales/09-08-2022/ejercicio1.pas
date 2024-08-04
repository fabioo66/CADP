{Se dispone de la informacion de los participantes inscriptos a una carrera (a lo suno 5000). De cada participante se tiene DNI, nombre y apellido, categoria (1..5) y fecha de inscripcion. Se pide implementar un programa que guarde en una estructura adecuada los participantes de aquellas categorias que posean a lo sumo 50 inscriptoso. Se sabe que cada partcipante se puede anotar en una sola categoria.}

program ejercicio1;
const
    dimF = 5000;
type
    cRango = 1..5;
    dRango = 1..31;
    mRango = 1..12;

    fech = record
        dia: dRango;
        mes: mRango;
        anio: integer;
    end;

    participante = record
        dni: integer;
        nomYApe: string;
        categoria: cRango;
        fecha: fech;
    end;

    vector = array [1..dimF] of participante;
    vectorContador = array [cRango] of integer;

    lista = ^nodo;
    nodo = record
        dato: participante;
        sig: lista;
    end;

// se dispone
procedure cargarVector(var v: vector; var diml: integer);

procedure inicializarVectorContador(var vc: vectorContador);
var
    i: integer;
begin
    for i:=1 to 5 do
        vc[i]:=0;
end;

procedure contarInscriptos(var vc: vectorContador; v: vector; diml: integer);
var
    i: integer;
begin
    for i:=1 to diml do
        vc[v[i].categoria] := vc[v[i].categoria]+1;
end;

procedure agregarAdelante(var l: lista; p: participante);
var
    nue: lista;
begin
    new(nue);
    nue^.dato:=p;
    nue^.sig:=l;
    l:=nue;
end;

procedure cargarLista(v: vector; diml: integer; vc: vectorContador; var l: lista);
var
    i: integer;
begin
    for i:=1 to diml do
        if (vc[v[i].categoria] <= 50) then
            agregarAdelante(l, v[i]);
end;

var
    v: vector;
    diml: integer;
    vc: vectorContador;
    l: lista;
begin
    l := nil;
    cargarVector(v, diml);
    inicializarVectorContador(vc);
    contarInscriptos(vc, v, diml);
    cargarLista(v, diml, vc, l);
end.