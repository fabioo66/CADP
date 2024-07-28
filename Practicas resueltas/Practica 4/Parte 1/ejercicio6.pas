procedure maximoyminimo (v:vector; var maxpos, minpos: integer; diml: integer);
var
  i:integer
begin
   for i:= 1 to diml do begin
     if(v[i] > maxvalor)then 
       maxpos:= i;
     else 
       if(v[i] < minvalor)then 
         minpos:= i;
   end;
end;
