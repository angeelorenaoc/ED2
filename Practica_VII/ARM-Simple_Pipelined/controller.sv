/*
 * This module is the Control Unit of ARM single-cycle processor
 */ 
module controller(input logic clk, reset,
						input logic [31:12] Instr,
						input logic [3:0] ALUFlagsD,
						output logic [1:0] RegSrc,
						output logic RegWriteW, RegWriteM,
						output logic [1:0] ImmSrc,
						output logic ALUSrcE,
						output logic [2:0] ALUControlE,
						output logic MemWriteM, MemtoRegW, BrlW, MemtoRegE, 
						output logic PCSrcD, PCSrcE, PCSrcM, PCSrcW,
						output logic Enable, BranchtakenE);
	
	assign Enable = 1'b1;
	
	//Signals Decode
	logic [2:0] ALUControlD;
	logic [1:0] FlagWriteD;
	logic RegWriteD, MemWriteD, BranchD, MemtoRegD, ALUSrcD, BrlD;

	
	//Signals Execute
	logic [3:0] CondE, Flags, ALUFlagsE;
	logic [1:0] FlagWriteE;
	logic PCSrcEaux, RegWriteE, RegWriteEaux, MemWriteE, MemWriteEaux, BranchE, BrlE;
	
	//Signals Memory
	logic MemtoRegM, BrlM;
	
	//Signals Writeback
	logic MemWriteW;
	
	decoder dec(Instr[27:26], Instr[25:20], Instr[15:12],
					FlagWriteD, PCSrcD, RegWriteD, MemWriteD, BranchD, BrlD,
					MemtoRegD, ALUSrcD, ImmSrc, RegSrc, ALUControlD);

	condlogic cl(BranchE, CondE, ALUFlagsD, ALUFlagsE,
					FlagWriteE, PCSrcE, RegWriteE, MemWriteE,
					PCSrcEaux, RegWriteEaux, MemWriteEaux, BranchtakenE, Flags);
					
	//Registers files
	regfileCF RFFetchC(clk, Enable, reset, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD, BrlD, FlagWriteD, ALUControlD, Instr[31:28], Flags, 
											  PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE, BrlE,FlagWriteE, ALUControlE, CondE, ALUFlagsE);
											  
	regfileCMW RFM(clk, Enable, reset, PCSrcEaux, RegWriteEaux, MemtoRegE, MemWriteEaux, BrlE,
												  PCSrcM, RegWriteM, MemtoRegM, MemWriteM, BrlM);
						
	regfileCMW RFW(clk, Enable, reset, PCSrcM, RegWriteM, MemtoRegM, MemWriteW, BrlM,
												  PCSrcW, RegWriteW, MemtoRegW, MemWriteW, BrlW);

endmodule
