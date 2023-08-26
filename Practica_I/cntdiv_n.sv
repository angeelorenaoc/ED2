module cntdiv_n #(TOPVALUE = 50_000_000) (clk, rst, clkdiv, timer);
	input logic clk, rst,timer;
	output logic clkdiv;
	
	// Bits for the counter
	localparam BITS = $clog2(TOPVALUE);
	
	// counter register
	logic [BITS - 1 : 0] rCounter;
	
	// increment or reset the counter
	
	always @(posedge clk, posedge rst) begin
		if (rst) begin
			rCounter <= 0;
			clkdiv <= 0;
		end 
		else begin
			if(timer)begin
				if (rCounter == (TOPVALUE - 1))
					rCounter <= 0;
				else begin
					rCounter <= rCounter + 1;
					// Guarantee a registered clock
					clkdiv <= (rCounter >= (TOPVALUE/2)) ? 1'b1 : 1'b0;
				end
			end 
			else begin
				if (rCounter == (TOPVALUE/2 - 1))
					rCounter <= 0;
				else begin
					rCounter <= rCounter + 1;
					// Guarantee a registered clock
					clkdiv <= (rCounter >= (TOPVALUE/4)) ? 1'b1 : 1'b0;
				end
			end
		end
	end
endmodule