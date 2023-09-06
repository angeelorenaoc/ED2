module counterpulse (select, clk, reset, cnt,operation);
	input logic select, clk, reset;
	output logic [1:0] cnt;
	output logic [3:0] operation;
	
	// Internal signals
	logic intPulse;
	
	// Parallel circuits

	pulse p0 (select, clk, reset, intPulse);
	
	// Counter process. Activates each time intPulse is 1'b1
	always_ff @(posedge clk, posedge reset) begin
		if (reset)
			cnt <= 0;
		else if (intPulse)
			cnt <= cnt + 2'b1;
	end
	
	always_comb begin
		case(cnt)
			2'b00: operation = 4'b0001;
			2'b01: operation = 4'b0010;
			2'b10: operation = 4'b0100;
			2'b11: operation = 4'b1000;
			default: operation = 4'b0000;
		endcase
	end
	
endmodule