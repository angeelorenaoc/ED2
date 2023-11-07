module regfileF(input logic clk,
					input logic we,//enable
					input logic [31:0] InstrF,
					output logic [31:0] InstrD);

	// Internal signals
	logic [31:0] rf;
	
	// Three ported register file
	// Write third port on rising edge of clock
	always_ff @(posedge clk)
		if (we) rf <= InstrF;
		
	// Read two ports combinationally
	// register 15 reads PC + 8 instead
	assign InstrD = rf;
endmodule