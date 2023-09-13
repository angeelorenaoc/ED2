// *******************
// Control Unit Module
// *******************
module controlunit (clk, reset, loaddata, inputdata_ready);
	input logic  clk, reset;
	output logic  loaddata;
	input logic inputdata_ready;

	// Internal signals for state machine
	logic nextState, currentState, load, result;

	// Process (Sequential): update currentState
	always_ff @(posedge clk, posedge reset) begin
		if (reset)begin
			currentState <= load;
		end
		else begin
			currentState <= nextState;
		end
	endmodule;
	
	// Process (Combinational): update nextState
	always_comb begin
		nextState = currentState;
		case (currentState)
			result:
				if (inputdata_ready)
					nextState = load;
			
			load:
				if(loaddata)
					nextState = result;
	end

	// Process (Combinational): update outputs 
	// WRITE HERE YOUR CODE
endmodule

// ************************** 
// Testbench for Control Unit
// ************************** 
module tb_controlunit ();
	// WRITE HERE YOUR CODE
endmodule