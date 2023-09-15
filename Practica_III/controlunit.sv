

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

	// Process (Sequential): update currentState
	
	always_ff @(posedge clk, posedge reset) 
		if (reset)
			currentState <= load;
		else 
			currentState <= nextState;
	
	// Process (Combinational): update nextState
	always_comb begin
		nextState = currentState;	// Para evitar escribir los else
		case (currentState)
			result:	
				nextState = result;
			load:
				if(inputdata_ready)begin 
					nextState = result;
					loaddata = 1'b1;//Aquí se actualiza la salida, ¿estaría bien?
				end
			default:		
				nextState = load;
		endcase
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