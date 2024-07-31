{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.}

function cumple(S:sonda):boolean;
begin
    cumple:= (s.costomant < s.costoconst) and (s.rango <> 1);
end;

procedure procesarlistas(L:lista; var Listasi:lista; var Listano:lista);
begin
    Listasi:= nil;
    Listano:= nil;
    while(L <> nil) do begin
        if(cumple(L^.dato))then
            agregaradelante(Listasi,L^.dato)
        else
            agregaradelante(Listano,L^.dato);
        L:= L^.sig;
    end;
end;

procedure listasnofinanciadas (L:lista; var costototal:real; var cantsondas:integer);
begin
    cantsondas:= 0;
    costototal:= 0;
    while(L <> nil)do begin
        cantsondas:= cantsondas + 1;
        costototal:= costototal + (L^.dato.costoconst + L^.dato.costomant);
        L:= L^.sig;
    end;
end;
