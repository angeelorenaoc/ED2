// *********************** 
// Peripherals Unit Module
// *********************** 
module peripherals (clk, reset, enter, inputdata,
						  loaddata, inputdata_ready,
                    dataA, dataB, dataR, 
						  disp3, disp2, disp1, disp0);
	input logic  clk, reset, enter;
	input logic  [7:0] inputdata;
	input logic  loaddata;
	output logic inputdata_ready;
	output logic [31:0] dataA, dataB;
	input logic  [31:0] dataR;
	output logic [6:0] disp3, disp2, disp1, disp0;
	
	// Internal signals and module instantiation for pulse generation
	logic pulse;
	logic [3:0] count;
	// Instanciación del generador de pulsos 
	peripheral_pulse pulse0 (enter, clk, reset, pulse);

	// Process, internal signals and assign statement to control data input / output indexes and data input ready signals
	always_ff @(posedge clk, posedge reset) begin
		if (reset)
			count = 4'b0000;
			inputdata_ready = 1'b0;
		else if (count < 8 )begin 
			count = count + 1 ;
			inputdata_ready = 1'b0;
		end
	end
	
	// Internal signals and module instantiation for getting operands
	// WRITE HERE YOUR CODE
	peripheral_getoperands getdata (clk, reset, inputdata, pulse, count, dataA, dataB);//¿Aquí entra el inputdata_ready o pulse?, ¿Para qué serviría el pulso?

	// Internal signals, module instantiation and process for showing operands and result
	// WRITE HERE YOUR CODE
endmodule