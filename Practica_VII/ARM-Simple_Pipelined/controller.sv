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
<<<<<<< HEAD
=======
	//						 			 ↑↑↑↑↑↑
	//***********************************************************************
	//NOP
	//Output enable Combinacional que apaga los Register files en caso de NOP
	//Pd: Si está bueno fue Oscar, si no fue idea de Angee c;
	//***********************************************************************
>>>>>>> 713e47386eee7c009d4c1e962b8fc51fa12d121d
	
	assign Enable = 1'b1;
	
	//Signals Decode
	logic [2:0] ALUControlD;
	logic [1:0] FlagWriteD;
	logic PCSrcD, RegWriteD, MemWriteD, BranchD, MemtoRegD, ALUSrcD;

	
	//Signals Execute
	logic [3:0] CondE, Flags, ALUFlagsE;
	logic [1:0] FlagWriteE;
	logic PCSrcE, PCSrcEaux, RegWriteE, RegWriteEaux, MemWriteE, MemWriteEaux, BranchE, MemtoRegE;
	
	//Signals Memory
	logic PCSrcM, RegWriteM, MemtoRegM;
	
	//Signals Writeback
	logic RegWriteW, MemWriteW, MemtoRegW;
	
	decoder dec(Instr[27:26], Instr[25:20], Instr[15:12],
					FlagWriteD, PCSrcD, RegWriteD, MemWriteD, BranchD, BrL,
					MemtoRegD, ALUSrcD, ImmSrc, RegSrc, ALUControlD);

	condlogic cl(BranchE, CondE, ALUFlagsD, ALUFlagsE,
					FlagWriteE, PCSrcE, RegWriteE, MemWriteE,
					PCSrcEaux, RegWriteEaux, MemWriteEaux, Flags);
	//Registers files
	regfileCF RFFetchC(clk, Enable, reset, PCSrcD, RegWriteD, MemtoRegD, MemWriteD, BranchD, ALUSrcD, FlagWriteD, ALUControlD, Instr[31:28], Flags, 
											  PCSrcE, RegWriteE, MemtoRegE, MemWriteE, BranchE, ALUSrcE, FlagWriteE, ALUControlE, CondE, ALUFlagsE);
											  
	regfileCMW RFM(clk, Enable, reset, PCSrcEaux, RegWriteEaux, MemtoRegE, MemWriteEaux,
										 PCSrcM, RegWriteM, MemtoRegM, MemWriteM);
						
	regfileCMW RFW(clk, Enable, reset, PCSrcM, RegWriteM, MemtoRegM, MemWriteW,
										 PCSrcW, RegWriteW, MemtoRegW, MemWriteW);

endmodule
