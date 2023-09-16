// *******************
// Control Unit Module
// *******************
module controlunit (clk, reset, loaddata, inputdata_ready);
	input logic  clk, reset;
	output logic  loaddata;
	input logic inputdata_ready;

	// Internal signals for state machine
	typedef enum logic {load, Result} State;
	State currentState, nextState;
	logic loadaux;

	// Process (Sequential): update currentState
	
	always_ff @(posedge clk, posedge reset) begin
		if (reset) begin
			currentState <= load;
			
		end
		else 
			currentState <= nextState;
	end
	// Process (Combinational): update nextState
	always_comb begin
		nextState = currentState;	// Para evitar escribir los else
		case (currentState)
			Result:begin
				nextState = Result;
				loaddata = 1'b0;
			end
			load:begin
				if(inputdata_ready)begin 
					nextState = Result;
				end
				loaddata= 1'b1;
			end
			default:		
				nextState = load;
		endcase
	end	
	
	// Process (Combinational): update outputs 

endmodule

// ************************** 
// Testbench for Control Unit
// ************************** 
module tb_controlunit ();
	// WRITE HERE YOUR CODE
endmodule