/*
 * This module is the Datapath Unit of the ARM single-cycle processor
 */ 
module datapath(input logic clk, reset,
					 input logic [1:0] RegSrc,
					 input logic RegWrite,
					 input logic [1:0] ImmSrc,
					 input logic ALUSrc, 
					 input logic [2:0] ALUControl,
					 input logic BrL, MemtoReg,
					 input logic PCSrc, Enable,
					 output logic [3:0] ALUFlags,
					 output logic [31:0] PC,
					 input logic [31:0] InstrF,
					 output logic [31:0] ALUOutM, WriteDataM,
					 input logic [31:0] ReadDataM,
					 output logic [31:0] InstrDOUT,
					 input logic BranchtakenE,
					 output logic [3:0] Match,
					 input logic [1:0] FowardAE, FowardBE,
					 input logic FlushE, FlushD, StallD, StallF);
	
	//Negación de algunas entradas
	assign clkn = ~clk;	
	assign StallFn = ~StallF;
	assign StallDn = ~StallD;
	assign InstrDOUT = InstrD;
	
	// Internal signals
	logic [31:0] PCNext, PCNextRemix, PCPlus4, PCPlus8, ALUResultE;
	logic [31:0] ExtImm, SrcA, SrcBE, SrcB_aux, Result, WD3, SrcAE, RD2, WriteDataE;
	logic [3:0] RA3;
	logic clkn, StallFn, StallDn;
	
	//Signals Decode
	logic [31:0] InstrD, PCPlusD4;
	logic [3:0] RA1D, RA2D;
	
	//Signals Execute
	logic [31:0] Rd1E, Rd2E, ExtImmE,InstrE,PCPlusE4;
	logic [3:0] RA1E, RA2E;
	
	//Signals Memory
	logic [3:0] WA3M;
	logic [31:0] PCPlusM4;
	
	//Signals WriteBack
	logic [31:0] ReadDataW, ALUResultW, PCPlusW4;
	logic [3:0] WA3W;
	
	// next PC logic
	mux2 #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);
	flopr #(32) pcreg(clk, reset, StallFn, PCNextRemix, PC);
	adder #(32) pcadd1(PC, 32'b100, PCPlus4);

	// register file logic
	mux2 #(4) ra1mux(InstrD[19:16], 4'b1111, RegSrc[0], RA1D);
	mux2 #(4) ra2mux(InstrD[3:0], InstrD[15:12], RegSrc[1], RA2D);
	mux2 #(4) r14mux(WA3W, 4'b1110, BrL, RA3);
	mux2 #(32) blmux(Result, PCPlusW4, BrL, WD3);
	regfile rf(clkn, RegWrite, RA1D, RA2D, RA3, WD3, PCPlus4, SrcA, RD2);
	mux2 #(32) resmux(ALUResultW, ReadDataW, MemtoReg, Result);
	extend ext(InstrD[23:0], ImmSrc, ExtImm);

	// ALU logic
	shifter #(32) shifter(InstrE[11:7],WriteDataE,InstrE[6:5],SrcB_aux);
	mux2 #(32) srcbmux(SrcB_aux, ExtImmE, ALUSrc, SrcBE);
	alu #(32) alu(SrcAE, SrcBE, ALUControl, ALUResultE, ALUFlags);
	
	//Registers Files
	regfileF RFFetch(clk, StallD, FlushD, reset, InstrF,PCPlus4, 
													 InstrD, PCPlusD4);
	regfileD RFDecode(clk, Enable, FlushE, reset, SrcA, RD2, ExtImm,InstrD, PCPlusD4, RA1D, RA2D,
																 Rd1E, Rd2E, ExtImmE,InstrE,PCPlusE4,RA1E, RA2E);
	regfileEM RFExecute(clk, Enable, reset, ALUResultE, WriteDataE, InstrE[15:12],PCPlusE4, 
														 ALUOutM, WriteDataM, WA3M,PCPlusM4);
	regfileEM RFMemory(clk, Enable, reset, ReadDataM, ALUOutM, WA3M, PCPlusM4, 
														ReadDataW, ALUResultW, WA3W,PCPlusW4);
	//Mux Unidad de Hazard
	hazardsmux #(32) RD1Mux(Rd1E, Result, ALUOutM,FowardAE, SrcAE);
	hazardsmux #(32) RD2Mux(Rd2E, Result, ALUOutM,FowardBE, WriteDataE);
	mux2 #(32) pcmuxremix(PCNext, ALUResultE, BranchtakenE, PCNextRemix);
	
	//Match Hazard Unit
	assign Match[0] = RA1E == WA3M;
	assign Match[1] = RA1E == WA3W;
	assign Match[2] = RA2E == WA3M;
	assign Match[3] = RA2E == WA3W;
	
	
endmodule