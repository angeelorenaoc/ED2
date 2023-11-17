/*
 * This module is the ARM single-cycle processor, 
 * which instantiates the Control and Datapath units
 */ 
module arm(input logic clk, reset,
			  output logic [31:0] PC,
			  input logic [31:0] Instr,
			  output logic MemWrite,
			  output logic [31:0] ALUResult, WriteData,
			  input logic [31:0] ReadData);

	// Internal signals to interconnect the control and datapath units
	logic [3:0] ALUFlags;
	logic RegWrite, ALUSrc, MemtoReg, PCSrc, BrL, Enable;
	logic [1:0] RegSrc, ImmSrc;
	logic [2:0]	ALUControl;
	logic [31:0] InstrD;

	// Control unit instantiation
	controller c(clk, reset, InstrD[31:12], ALUFlags,
						RegSrc, RegWrite, ImmSrc,
						ALUSrc, ALUControl,
						MemWrite, MemtoReg, BrL, PCSrc, Enable);
						
	// Datapath unit instantiation
	datapath dp(clk, reset,
						RegSrc, RegWrite, ImmSrc,
						ALUSrc, ALUControl, BrL,
						MemtoReg, PCSrc, Enable,
						ALUFlags, PC, Instr,
						ALUResult, WriteData, ReadData, InstrD);
endmodule
