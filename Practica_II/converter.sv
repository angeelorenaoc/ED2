module converter #(parameter Bits=5)(FlagNeg,value, oper, tens, unit);
	input logic [Bits-1:0] value;
	input logic FlagNeg;
	input logic [1:0] oper;
	output logic [3:0] tens, unit;

	logic [Bits-1:0] valuediv;
	//Este es el módulo que se encarga de separar las decenas y unidades del número ingresado, 
	//teniendo en cuenta si este es positivo o negativo
	always_comb begin 
		if (FlagNeg == 1 && (oper == 2'b00 || oper == 2'b01))begin 
			valuediv = (~value + 1'b1) ;//Complemento a2

		end
		else begin
			valuediv = value;
		end
		tens = valuediv / (4'b1010);
		unit = valuediv % (4'b1010);

	end
endmodule