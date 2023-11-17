module regfileF(input logic clk,
					input logic we,reset,//enable
					input logic [31:0] InstrF, Pcin,
					output logic [31:0] InstrD,Pc);

	// Internal signals
	logic [31:0] rf, Pcaux;
	
	// Three ported register file
	// Write third port on rising edge of clock
	always_ff @(posedge clk)
		if (reset)begin
			rf <= 0;
			Pcaux <= 0;
		end
		else if (we)begin
			rf <= InstrF;
			Pcaux <= Pcin;
		end
		
	// Read two ports combinationally
	// register 15 reads PC + 8 instead
	assign InstrD = rf;
	assign Pc = Pcaux;
endmodule