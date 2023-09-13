// *******************
// Control Unit Module
// *******************
module controlunit (clk, reset, loaddata, inputdata_ready);
	input logic  clk, reset;
	output logic  loaddata;
	input logic inputdata_ready;

	// Internal signals for state machine
	// WRITE HERE YOUR CODE

	// Process (Sequential): update currentState
	always_ff @(posedge clk, posedge reset) begin
		
	endmodule;
	
	// Process (Combinational): update nextState
	// WRITE HERE YOUR CODE

	// Process (Combinational): update outputs 
	// WRITE HERE YOUR CODE
endmodule

// ************************** 
// Testbench for Control Unit
// ************************** 
module tb_controlunit ();
	// WRITE HERE YOUR CODE
endmodule