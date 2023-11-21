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
	logic [3:0] ALUFlags, Match, RA1D, RA2D, WA3E;
	logic RegWriteW, ALUSrc, MemtoReg, PCSrcD, PCSrcE, PCSrcM, PCSrcW, BrL, Enable, BranchtakenE, MemtoRegE, RegWriteM;
	logic FlushE, FlushD, StallD, StallF;
	logic [1:0] RegSrc, ImmSrc, ForwardAE, ForwardBE;
	logic [2:0]	ALUControl;
	logic [31:0] InstrD;

	// Control unit instantiation
	controller c(clk, reset, InstrD[31:12], ALUFlags,
						RegSrc, RegWriteW, RegWriteM, ImmSrc,
						ALUSrc, ALUControl,
						MemWrite, MemtoReg, BrL, MemtoRegE, PCSrcD, PCSrcE, PCSrcM, PCSrcW, Enable, BranchtakenE);
						
	// Datapath unit instantiation
	datapath dp(clk, reset,
						RegSrc, RegWriteW, ImmSrc,
						ALUSrc, ALUControl, BrL,
						MemtoReg, PCSrcW, Enable,
						ALUFlags, PC, Instr,
						ALUResult, WriteData, ReadData, InstrD, BranchtakenE, Match, 
						ForwardAE, ForwardBE, FlushE, FlushD, StallD, StallF,
						RA1D, RA2D, WA3E);
						
	// Hazard unit instantiation
	HazardUnit HU(MemtoRegE,RegWriteW, RegWriteM, PCSrcD, PCSrcE, PCSrcM, PCSrcW,BranchtakenE, Match,
						RA1D, RA2D, WA3E,
						ForwardAE, ForwardBE, FlushE, FlushD, StallD, StallF);
						

endmodule
