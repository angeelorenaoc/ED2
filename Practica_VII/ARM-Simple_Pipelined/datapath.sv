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
					 input logic PCSrc,
					 output logic [3:0] ALUFlags,
					 output logic [31:0] PC,
					 input logic [31:0] InstrF,
					 output logic [31:0] ALUOutM, WriteDataM,
					 input logic [31:0] ReadDataM);
	// Internal signals
	logic [31:0] PCNext, PCPlus4, PCPlus8, InstrD;
	logic [31:0] ExtImm, SrcA, SrcBE, SrcB_aux, Result, WD3, SrcAE, RD2, WriteDataE, ExtImmE;
	logic [31:0] ReadDataW, ALUResultW;
	logic [3:0] RA1, RA2, RA3, InstrE, WA3M, WA3W;
	
	
	// next PC logic
	mux2 #(32) pcmux(PCPlus4, Result, PCSrc, PCNext);
	flopr #(32) pcreg(clk, reset, PCNext, PC);
	adder #(32) pcadd1(PC, 32'b100, PCPlus4);
	adder #(32) pcadd2(PCPlus4, 32'b100, PCPlus8);

	// register file logic
	mux2 #(4) ra1mux(InstrD[19:16], 4'b1111, RegSrc[0], RA1);
	mux2 #(4) ra2mux(InstrD[3:0], InstrD[15:12], RegSrc[1], RA2);
	mux2 #(4) r14mux(InstrD[15:12], 4'b1110, BrL, RA3);
	mux2 #(32) blmux(Result, PCPlus4, BrL, WD3);
	regfile rf(clk, RegWrite, RA1, RA2, RA3, WD3, PCPlus8, SrcA, RD2);
	mux2 #(32) resmux(ALUResultW, ReadDataW, MemtoReg, Result);
	extend ext(InstrD[23:0], ImmSrc, ExtImm);

	// ALU logic
	shifter #(32) shifter(InstrD[11:7],RD2,InstrD[6:5],SrcB_aux);
	mux2 #(32) srcbmux(WriteDataE, ExtImmE, ALUSrc, SrcBE);
	alu #(32) alu(SrcAE, SrcB, ALUControl, ALUResultE, ALUFlags);
	
	//Registers Files
	regfileF RFFetch(clk, RegWrite, InstrF, InstrD);
	regfileD RFDecode(clk, RegWrite, SrcA, RD2, ExtImm,InstrD[15:12], SrcAE, WriteDataE, ExtImmE,InstrE);
	regfileEM RFExecute(clk, RegWrite, ALUResultE, WriteDataE, InstrE, ALUOutM, WriteDataM, WA3M);
	regfileEM RFMemory(clk, RegWrite, ReadDataM, ALUOutM, WA3M, ReadDataW, ALUResultW, WA3W);
	
endmodule