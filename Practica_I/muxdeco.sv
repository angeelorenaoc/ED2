//¿Debe tener RST?
module muxdeco (clk, rst, on);
	input logic clk;
	input logic rst;
	output logic [1:0] on;
	
logic control <= 1b0;
	
	always_comb(posedge clk, posedge rst) begin
		if (control) begin
			on = 2b'10;
			~control; //¿Es legal y lógico?
		end
	end
	