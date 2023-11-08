/*
 * This module is the Control Unit of ARM single-cycle processor
 */ 
module controller(input logic clk, reset,
						input logic [31:12] Instr,
						input logic [3:0] ALUFlagsD,
						output logic [1:0] RegSrc,
						output logic RegWrite,
						output logic [1:0] ImmSrc,
						output logic ALUSrcE,
						output logic [2:0] ALUControlE,
						output logic MemWriteM, MemtoReg, BrL,
						output logic PCSrcW,
						output logic Enable);
	
	//***********************************************************************
	//NOP
	//Output enable Combinacional que apaga los Register files en caso de NOP
	//Pd: Si está bueno fue Oscar, si no fue idea de Angee c;
	//***********************************************************************
	
	//Signals Decode
	logic [3:0] FlagsD;
	logic [2:0] ALUControlE;
	logic [1:0] FlagWriteD;
	logic PCSrcD, RegWriteD, MemWriteD, BranchD, MemtoRegD, ALUSrcD;

	
	//Signals Execute
	logic [3:0] CondE;
	logic [1:0] FlagWriteE;
	logic PCSrcE, RegWriteE, MemWriteE, BranchE, MemtoRegE;
	
	//Signals Memory
	logic PCSrcM, RegWriteM, MemWriteM, MemtoRegM;
	
	//Signals Writeback
	logic PCSrcW, RegWriteW, MemWriteW, MemtoRegW;
	
	decoder dec(Instr[27:26], Instr[25:20], Instr[15:12],
					FlagWriteD, PCSrcD, RegWriteD, MemWriteD, BranchD, BrL,
					MemtoRegD, ALUSrcD, ImmSrc, RegSrc, ALUControlD);

	condlogic cl(clk, reset, Branch,Instr[31:28], ALUFlagsD, ALUFlagsE,
					FlagWriteE, PCSrcE, RegWriteD, MemWriteE,
					PCSrc, RegWrite, MemWrite, ALUFlagsD);
	//Registers files
	regfileCF RFFetchC(clk, Enable, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD, FlagWriteD, ALUControlD, Instr[31:28], ALUFlagsD, 
											  PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE, FlagWriteE, ALUControlE, CondE, ALUFlagsE);
											  
	regfileCMW RFM(clk, Enable, PCSrcE, RegWriteE, MemtoRegE, MemWriteE,
										 PCSrcM, RegWriteM, MemtoRegM, MemWriteM);
						
	regfileCMW RFW(clk, Enable, PCSrcM, RegWriteM, MemtoRegM, MemWriteW,
										 PCSrcW, RegWriteW, MemtoRegW, MemWriteW);

endmodule
