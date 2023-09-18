// **********************************************
// 			Datapath Unit Module						*
// **********************************************
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
	localparam CLK_PERIOD = 20ns;
	logic clk;
	logic rst;
	logic enter;
	logic [7:0] inputdata;
	logic loaddata;
	logic inputdata_ready;
	logic [6:0] disp3;
	logic [6:0] disp2;
	logic [6:0] disp1;
	logic [6:0] disp0;
	
	datapathunit unidatapath (clk, rst, enter, inputdata,loaddata, inputdata_ready,disp3, disp2, disp1, disp0);
	
	initial begin
	
	clk = 0;
	rst = 0;
	enter = 0;
	inputdata = 8'b0;
	loaddata = 0;
	
	#(CLK_PERIOD * 1);//
	rst = 1;
	
	//Los siguientes for son usados para la variación en la data de entrada y la captura del dato
	for ( int i = 0; i < 4 ;i++) begin
		for ( int j = 0; j < 4 ;j++) begin
			
			#(CLK_PERIOD * 1);
			loaddata = 0;
			enter = 1;
			
			#(CLK_PERIOD * 4);
			inputdata = inputdata + 8'b0000_0100;
			enter = 0;
		
		end
		
		#(CLK_PERIOD * 1);
		loaddata =1;
		
		#(CLK_PERIOD * 1);
		inputdata = inputdata + 5'b0000_0001;
		
	end
		$stop;
	end

	
always #(CLK_PERIOD / 2) clk = ~clk;
	
endmodule