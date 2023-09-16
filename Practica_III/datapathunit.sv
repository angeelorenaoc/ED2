// ******************** 
// Datapath Unit Module
// ******************** 
module datapathunit (clk, reset, enter, inputdata,
						   loaddata, inputdata_ready,
						   disp3, disp2, disp1, disp0);
	input logic  clk, reset, enter;
	input logic  [7:0] inputdata;
	input logic  loaddata;
	output logic inputdata_ready;
	output logic [6:0] disp3, disp2, disp1, disp0;

	// Internal signals and module instantiation for multiplier unit
	logic [31:0] dataA, dataB, dataR;
	logic [3:0] casesspecial;
	multiplierunit multiplicador (dataA, dataB, dataR, casesspecial);
	
	// Internal signals and module instantiation for peripherals unit
	peripherals perifericos (clk, reset, enter, inputdata, loaddata, casesspecial, inputdata_ready, dataA, dataB, dataR, disp3, disp2, disp1, disp0);
endmodule

// *************************** 
// Testbench for Datapath Unit
// *************************** 
module tb_datapathunit ();
	// WRITE HERE YOUR CODE
endmodule