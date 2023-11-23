module HazardUnit(input logic MemtoRegE,RegWriteW, RegWriteM, PCSrcD, PCSrcE, PCSrcM, PCSrcW, BranchTakenE,
			  input logic [3:0] Match, RA1D, RA2D, WA3E,
			  output logic [1:0] ForwardAE, ForwardBE,
			  output logic FlushE, FlushD, StallD, StallF);
			  
	logic Match_12D_E, LDRstall, PCWrPendingF;
	
	always_comb begin
	
		if (Match[0] & RegWriteM ) ForwardAE = 2'b10; // SrcAE = ALUOutM
		
		else if (Match[1] & RegWriteW) ForwardAE = 2'b01; // SrcAE = ResultW
		
		else ForwardAE = 2'b00; // SrcAE from regfile
		
	end
	
	always_comb begin //Preguntar
	
		if (Match[2] & RegWriteM ) ForwardBE = 2'b10; // SrcAE = ALUOutM
		
		else if (Match[3] & RegWriteW) ForwardBE = 2'b01; // SrcAE = ResultW
	
		else ForwardBE = 2'b00; // SrcAE from regfile
		
	end
	
	always_comb begin
	
		Match_12D_E = (RA1D == WA3E) | (RA2D == WA3E);
		LDRstall = Match_12D_E & MemtoRegE;
		
	end

	assign PCWrPendingF = PCSrcD | PCSrcE | PCSrcM;
	assign StallD = LDRstall;
	assign StallF = LDRstall | PCWrPendingF;
	assign FlushE = LDRstall | BranchTakenE;
	assign FlushD = PCWrPendingF | PCSrcW | BranchTakenE;
	
endmodule