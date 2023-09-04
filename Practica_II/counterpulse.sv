module counterpulse (select, clk, nreset, cnt);
	input logic select, clk, nreset;
	output logic [1:0] cnt;
	
	// Internal signals
	logic a, reset, intPulse;
	
	// Parallel circuits
	assign reset = ~nreset;
	assign a = ~select;
	pulse p0 (a, clk, reset, intPulse);
	
	// Counter process. Activates each time intPulse is 1'b1
	always_ff @(posedge clk, posedge reset) begin
		if (reset)
			cnt <= 0;
		else if (intPulse)
			cnt <= cnt + 1;
	end
endmodule