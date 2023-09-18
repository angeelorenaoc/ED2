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
	localparam CLK_PERIOD = 20ns;
	logic clk;
	logic rst;
	logic loaddata;
	logic inputdata_ready;
	
	controlunit unidad_control(clk, rst, loaddata, inputdata_ready);
	
	initial begin
	
	clk = 0;
	rst = 0;
	inputdata_ready = 0;
	loaddata = 0;
	
	#(CLK_PERIOD * 1);//
	rst = 1;
	
	//Los siguientes for son usados para la variación en la data de entrada y la captura del dato
	for ( int i = 0; i < 4 ;i++) begin
		for ( int j = 0; j < 4 ;j++) begin
			
			#(CLK_PERIOD * 1);
			loaddata = 1;
		
		end
		
		#(CLK_PERIOD * 1);
		loaddata =0;
		inputdata_ready = 1;
		
	end
		$stop;
	end

	
always #(CLK_PERIOD / 2) clk = ~clk;
endmodule