module fsm (clk, rst, up, value);
	input logic clk, up, rst;
	output logic [3:0] value;

	int position = 0;
	localparam logic [3:0] array [0:7] = '{4, 8, 12, 0, 3, 7, 11, 15};

	always_ff @(posedge clk, posedge rst) begin
		
		if (rst) begin
			position <= 0;
		end
		
		else if (up) begin
			if(position < 7) begin
				position <= position + 1;
			end else
				position <= 0;
		end else begin
			if(position > 0) begin
				position <= position - 1;
			end else
				position <= 7;
			end
		
		value <= array[position];
		
		end
		
endmodule

