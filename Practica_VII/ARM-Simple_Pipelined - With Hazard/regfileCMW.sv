module regfileCMW(input logic clk,
					input logic we,reset,//enable
					input logic PcSrcIn, RegWriteIn, MemtoRegIn, MemWriteIn, BrlIn,
					output logic PcSrcOut, RegWriteOut, MemtoRegOut, MemWriteOut, BrlOut);

	// Internal signals
	logic PcsrcDaux, RegWriteDaux, MemtoRegDaux, MemWriteDaux;
	
	// Three ported register file
	// Write third port on rising edge of clock
	always_ff @(posedge clk)
		if (reset)begin
			PcsrcDaux <= 0;
			RegWriteDaux <= 0;
			MemtoRegDaux <= 0;
			MemWriteDaux <= 0;
			BrlOut <= 0;
		end
		else if (we)begin//Depende realmente de WD
			PcsrcDaux <= PcSrcIn;
			RegWriteDaux <= RegWriteIn;
			MemtoRegDaux <= MemtoRegIn;
			MemWriteDaux <= MemWriteIn;
			BrlOut <= BrlIn;
		end
		

	assign	PcSrcOut = PcsrcDaux;
	assign	RegWriteOut = RegWriteDaux;
	assign	MemtoRegOut = MemtoRegDaux ;
	assign	MemWriteOut = MemWriteDaux;
	
endmodule