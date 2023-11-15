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
					 output logic [31:0] InstrDOUT);
	// Internal signals
	logic [31:0] PCNext, PCPlus4, PCPlusD4, PCPlus8, PCPlusE4, PCPlusM4, PCPlusW4, ALUResultE, InstrD;
	logic [31:0] ExtImm, SrcA, SrcBE, SrcB_aux, Result, WD3, SrcAE, RD2, WriteDataE, ExtImmE, InstrE;
	logic [31:0] ReadDataW, ALUResultW;
	logic [3:0] RA1, RA2, RA3, WA3M, WA3W;
	logic clkn;
	
	assign clkn = ~clk;	
	assign InstrDOUT = InstrD;
	
	// next PC logic
	mux2 #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);
	flopr #(32) pcreg(clk, reset, PCNext, PC);
	adder #(32) pcadd1(PC, 32'b100, PCPlus4);

	// register file logic
	mux2 #(4) ra1mux(InstrD[19:16], 4'b1111, RegSrc[0], RA1);
	mux2 #(4) ra2mux(InstrD[3:0], InstrD[15:12], RegSrc[1], RA2);
	mux2 #(4) r14mux(WA3W, 4'b1110, BrL, RA3);
	mux2 #(32) blmux(Result, PCPlusW4, BrL, WD3);
	regfile rf(clkn, RegWrite, RA1, RA2, RA3, WD3, PCPlus4, SrcA, RD2);
	mux2 #(32) resmux(ALUResultW, ReadDataW, MemtoReg, Result);
	extend ext(InstrD[23:0], ImmSrc, ExtImm);

	// ALU logic
	shifter #(32) shifter(InstrE[11:7],WriteDataE,InstrE[6:5],SrcB_aux);
	mux2 #(32) srcbmux(SrcB_aux, ExtImmE, ALUSrc, SrcBE);
	alu #(32) alu(SrcAE, SrcBE, ALUControl, ALUResultE, ALUFlags);
	
	//Registers Files
	regfileF RFFetch(clk, Enable, reset, InstrF,PCPlus4, 
													 InstrD, PCPlusD4);
	regfileD RFDecode(clk, Enable, reset, SrcA, RD2, ExtImm,InstrD, PCPlusD4, 
													  SrcAE, WriteDataE, ExtImmE,InstrE,PCPlusE4);
	regfileEM RFExecute(clk, Enable, reset, ALUResultE, WriteDataE, InstrE[15:12],PCPlusE4, 
														 ALUOutM, WriteDataM, WA3M,PCPlusM4);
	regfileEM RFMemory(clk, Enable, reset, ReadDataM, ALUOutM, WA3M, PCPlusM4, 
														ReadDataW, ALUResultW, WA3W,PCPlusW4);
	
endmodule