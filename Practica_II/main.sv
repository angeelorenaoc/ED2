module main #(PARAMETER Bits = 5)

	(
	input logic clk, rst, Opersel,
	input logic [Bits-1:0] vA, vB,
	output logic [6:0] minus, tens, units,
	output logic [3:0] ALUflags, operation
	);
	
	logic control, Result;
	
	counterpulse oper(Opersel, clk, rst control);
	ALU alu(vA, vB,control,Result,ALUFlags);
	
	
	
	endmodule