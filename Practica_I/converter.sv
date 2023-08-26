module converter (value, tens, unit);
	input logic [3:0] value;
	output logic [3:0] tens, unit;
	
	always_comb begin 
		tens = value / (4'b1010);
		unit = value % (4'b1010);
	end
endmodule