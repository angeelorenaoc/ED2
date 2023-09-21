// ******************* 
// Get Operands Module
// ******************* 
module peripheral_getoperands (clk, reset, inputdata, loaddata, datainput_i, dataA, dataB);
	input logic clk, reset;
	input logic [7:0] inputdata;
	input logic loaddata;
	input logic [3:0] datainput_i;
	output logic [31:0] dataA, dataB;

	// Internal signals and processes to store data into proper registers
	logic [63:0] aux;
	
	
	always_ff @(posedge clk, posedge reset) begin
		if(reset) begin
			aux[63:0] <= 63'b0;
		end
		else if(loaddata)begin 
			if (datainput_i < 4'd8) begin
				aux[datainput_i*8+:8] <= inputdata;
			end
		end
	end
	
	assign dataA = aux[31:0];
	assign dataB = aux[63:32];
	
endmodule			