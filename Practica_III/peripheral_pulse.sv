// **********************
// Pulse Generator Module
// **********************
module peripheral_pulse(input logic d, clk, reset, 
								output logic pulse);
	// Internal signals: outputs from each Flip Flop
	logic q1, q2;
	//Generación del pulso 
	always_ff @(posedge clk, posedge reset) begin
		if (reset) begin
			q1 <= 0;
			q2 <= 0;
		end else begin
			q1 <= d;
			q2 <= ~q1;
		end
	end

	// Parallel circuit to generate a one-cycle pulse signal
	assign pulse = q1 & q2;
endmodule