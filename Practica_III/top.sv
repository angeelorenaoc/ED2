// **********
// Top Module
// ********** 
module top (clk, nreset, nenter, inputdata, disp3, disp2, disp1, disp0);
	input logic clk, nreset, nenter;
	input logic [7:0] inputdata;
	output logic [6:0] disp3, disp2, disp1, disp0;
	
	// Internal signals 
	logic loaddata, inputdata_ready;
	logic reset, enter;
	assign reset = ~nreset;
	assign enter = ~nenter;
	
	// Module instantation: control unit 
	controlunit cu0 (clk, reset, loaddata, inputdata_ready);

	// Module instantation: datapath unit 
	datapathunit dp0 (clk, reset, enter, inputdata, loaddata, inputdata_ready, disp3, disp2, disp1, disp0);
endmodule

// ********************** 
// Testbench for Top Unit
// ********************** 
module tb_topunit ();
	// WRITE HERE YOUR CODE
	localparam CLK_PERIOD = 20ns;
	logic clk;
	logic nreset;
	logic nenter;
	logic [7:0] inputdata;
	logic [6:0] disp3;
	logic [6:0] disp2;
	logic [6:0] disp1;
	logic [6:0] disp0;
	
	top topis (clk, nreset, nenter, inputdata, disp3, disp2, disp1, disp0);
	
	initial begin
	clk = 0;
	nreset = 0; 
	nenter = 1;
	inputdata = 8'b0;
	
	//Los siguientes for son usados para la variación en la data de entrada y la captura del datos
	
	#(CLK_PERIOD * 1);
	nreset = 1;
	
	for ( int i = 0; i < 4 ;i++) begin
		for ( int j = 0; j < 8 ;j++) begin
			
			#(CLK_PERIOD * 1);
			nenter = 1;
			
			#(CLK_PERIOD * 2);
			inputdata = inputdata + 8'b0000_0100;
			nenter = 0;
		
		end
		
		#(CLK_PERIOD * 1);
		inputdata = inputdata + 5'b0000_0001;
	end

		$stop;
	end
	
	always #(CLK_PERIOD / 2) clk = ~clk;
	
endmodule