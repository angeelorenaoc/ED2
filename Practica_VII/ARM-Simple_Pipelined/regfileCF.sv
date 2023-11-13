module regfileCF(input logic clk,
					input logic we,reset,//enable
					input logic PcsrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, AluSrcD, 
					input logic [1:0] FlagWriteD,
					input logic [2:0] AluControlD,
					input logic [3:0] CondD, Flags,
					output logic PcsrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, AluSrcE, 
					output logic [1:0] FlagWriteE,
					output logic [2:0] AluControlE,
					output logic [3:0] CondE, FlagsE);

	// Internal signals
	logic [1:0] FlagWriteDaux;
	logic [2:0] AluControlaux;
	logic [3:0] Condaux, Flagsaux;
	logic PcsrcDaux, RegWriteDaux, MemtoRegDaux, MemWriteDaux, BranchDaux, AluSrcDaux;
	
	// Three ported register file
	// Write third port on rising edge of clock
	always_ff @(posedge clk)
		if (reset)begin
				PcsrcDaux <= 0;
				RegWriteDaux <= 0;
				MemtoRegDaux <= 0;
				MemWriteDaux <= 0;
				BranchDaux <= 0;
				AluSrcDaux <= 0;
				FlagWriteDaux <= 0;
				AluControlaux <= 0;
				Condaux <= 4'b0;
				Flagsaux <= 4'b0;
		end
		else if (we)begin//Depende realmente de WD
			PcsrcDaux <= PcsrcD;
			RegWriteDaux <= RegWriteD;
			MemtoRegDaux <= MemtoRegD;
			MemWriteDaux <= MemWriteD;
			BranchDaux <= BranchD;
			AluSrcDaux <= AluSrcD;
			FlagWriteDaux <= FlagWriteD;
			AluControlaux <= AluControlD;
			Condaux <= CondD;
			Flagsaux <= Flags;
		end
		
	// Read two ports combinationally
	// register 15 reads PC + 8 instead

	assign	PcsrcE = PcsrcDaux;
	assign	RegWriteE = RegWriteDaux;
	assign	MemtoRegE = MemtoRegDaux ;
	assign	MemWriteE = MemWriteDaux;
	assign	BranchE = BranchDaux;
	assign	AluSrcE = AluSrcDaux;
	assign	FlagWriteE = FlagWriteDaux;
	assign	AluControlE = AluControlaux;
	assign 	CondE = Condaux;
	assign 	FlagsE = Flagsaux;
	
endmodule