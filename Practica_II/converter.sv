module converter #(parameter Bits=5)(FlagNeg,value, tens, unit);
	input logic [Bits-1:0] value;
	input logic FlagNeg;
	output logic [3:0] tens, unit;

	logic [Bits-1:0] valuediv;

	always_comb begin 

		if (FlagNeg)begin 
			valuediv = (~value + 1'b1) ;

		end
		else begin
			valuediv = value;
		end
		tens = valuediv / (4'b1010);
		unit = valuediv % (4'b1010);

	end
endmodule