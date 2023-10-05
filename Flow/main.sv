module main 
(
	output logic [6:0] o,s,c,a,r,g
);

deco7seg d1 (4'b0000,o);
deco7seg d2 (4'b0001,s);
deco7seg d3 (4'b0010,c);
deco7seg d4 (4'b0011,a);
deco7seg d5 (4'b0100,r);
deco7seg d6 (4'b0101,g);

endmodule