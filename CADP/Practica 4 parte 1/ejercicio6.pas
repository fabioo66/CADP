procedure maximoyminimo (v:vector; var maxvalor, maxpos, minvalor, minpos: integer; diml: integer);
var
  i:integer
begin
   for i:= 1 to diml do begin
     if(v[i] > maxvalor)then begin
       maxpos:= i;
       maxvalor:= v[i];
     end
     else 
       if(v[i] < minvalor)then begin
         minpos:= i;
         minvalor:= v[i];
       end;
   end;
end;
