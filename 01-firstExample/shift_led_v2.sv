module shift_led_v2 #(BITS = 10) (clk, rst, q);
	// Inputs and outputs
	input logic clk, rst;
	output logic [BITS - 1: 0] q;
     
	// internal signals
	logic   toLeft;
	logic   [BITS - 1 : 0] rShiftReg;

	// circuit is activated on clk or rst
	always_ff @(posedge clk, posedge rst) begin
		if (rst) begin
			rShiftReg <= 1'b1;
			toLeft <= 1;
		end else if (toLeft) begin	// Next LED to the left
			if (rShiftReg[BITS - 2] == 1'b1) begin
				toLeft = 0;
			end 
			rShiftReg <= rShiftReg << 1;
		end else begin					// Next LED to the right
			if (rShiftReg[1] == 1'b1) begin
				toLeft = 1;
			end
			rShiftReg <= rShiftReg >> 1;
		end
	end
	
	assign q = rShiftReg;
endmodule

