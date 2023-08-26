module fsm (clk, rst, up, value);
	input logic clk, up, rst;
	output logic [3:0] value;

	integer position = 0;
	logic [3:0] array [0:7] = '{4, 8, 12, 0, 3, 7, 11, 15};

	always_ff @(posedge clk, posedge rst) begin
		
		if (rst) begin
			position = 0;
		end
		
		else if (up) begin
			if(position <= 7) begin
				value = array[position];
				position ++;
			end else
				position = 0;
		end else
			if(position >= 0) begin
				value = array[position];
				position --;
			end else
				position = 7;
		end
endmodule

