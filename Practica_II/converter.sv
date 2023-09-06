module converter #(parameter Bits=5)(FlagNeg,value, oper, tens, unit);
	input logic [Bits-1:0] value;
	input logic FlagNeg;
	input logic [1:0] oper;
	output logic [3:0] tens, unit;

	logic [Bits-1:0] valuediv;

	always_comb begin 
					// No le dió la gana de tomarlo así oper == 2'b0? >:c
		if (FlagNeg == 1 && (oper == 2'b00 || oper == 2'b01))begin 
			valuediv = (~value + 1'b1) ;

		end
		else begin
			valuediv = value;
		end
		tens = valuediv / (4'b1010);
		unit = valuediv % (4'b1010);

	end
endmodule