module main #(PARAMETER Bits = 5)

	(
	input logic clk, rst, Opersel,
	input logic [Bits-1:0] vA, vB,
	output logic [6:0] minus, tens, units,
	output logic [3:0] ALUflags, operation
	);
	
	logic control, Result;
	logic [3:0] ten, unit
	
	counterpulse oper(~Opersel, clk, rst control);
	
	ALU (Bits) alu(vA, vB,control,Result,ALUflags);
	
	converter #(Bits)(ALUflags[3],Result, ten, unit)
	
		input  logic [3:0] D, tens,
	input logic Flag, deco,
	output logic [6:0] SEG
	
	deco7segs decounit(unit, ten, ALUflags[3], 2, units)
	
	deco7segs decodec(ten, ten, ALUflags[3], 1, tens)
	
	deco7segs decominus(0, ten, ALUflags[3], 0, minusv)
	
	
	endmodule
	
	module tbmain ();
	
	localparam CLK_PERIOD = 20ns;
	localparam Bits = 5;
	local clk;
	local rst;
	local Opersel;
	local [Bits-1:0] vA;
	local [Bits-1:0] vB;
	local [6:0] minus;
	local [6:0] tens;
	local [6:0] units;
	local [3:0] ALUflags;
	local [3:0] operation;
	
	main (5)(clk,rst, Opersel, vA, vB, minus, tens, units, ALUflags, operation);
	
	initial begin
	
	clk = 0;
	rst = 1;
	vA = 5'b01001;
	vB = 5'b11010;
	Opersel = 0;
	
	for (int i = 0, i<4, i++) begin
		for (int j = 0, j<4, j++) begin
			Opersel=1;
		end
	end
	
	endmodule