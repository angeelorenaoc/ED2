/*
 * This module is the TOP of the ARM single-cycle processor
 */ 
module top(input logic clk, nreset,
			  output logic [31:0] WriteData, DataAdr,
			  output logic MemWrite,
			  input logic [9:0] switches,
			  output logic [9:0] leds);

	// Internal signals
	logic reset;
	assign reset = ~nreset;
	logic [31:0] PC, Instr, ReadData;
	
	// Instantiate instruction memory
	imem imem(PC, Instr);

	// Instantiate data memory (RAM + peripherals)
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData, switches, leds);
	//que el switch sea el valor inmediato para la rotación, agregar los botones para determinar las secuencias 

	// Instantiate processor
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
endmodule