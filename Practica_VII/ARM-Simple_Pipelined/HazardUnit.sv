module HazardUnit(input logic MemtoRegE,RegWriteW, RegWriteM, PCSrcD, PCSrcE, PCSrcM, PCSrcW,
			  input logic [3:0] Match,
			  output logic [1:0] ForwardAE, ForwardBE,
			  output logic FlushE, FlushD, StallD, StallF);
			  
	logic Match_12D_E, LDRstall, PCWrPendingF;
	
	always_comb begin
	
		if (Match[0] & RegWriteM ) ForwardAE = 10; // SrcAE = ALUOutM
		
		else if (Match[1] & RegWriteW) ForwardAE = 01; // SrcAE = ResultW
		
		else ForwardAE = 00; // SrcAE from regfile
		
	end
	
	always_comb begin //Preguntar
	
		if (Match[2] & RegWriteM ) ForwardBE = 10; // SrcAE = ALUOutM
		
		else if (Match[3] & RegWriteW) ForwardBE = 01; // SrcAE = ResultW
	
		else ForwardBE = 00; // SrcAE from regfile
		
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