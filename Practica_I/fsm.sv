module fsm (clk, rst, up, value);
	input logic clk, up, rst;
	output logic [3:0] value;

	int position = 1;
	localparam logic [3:0] array [0:7] = '{4, 8, 12, 0, 3, 7, 11, 15};

	always_ff @(posedge clk, posedge rst) begin
		
		if (rst) begin
			position <= 1;
		end
		
//		else if (up) begin
//			if(position < 7 & position > 0) begin
//				//value <= array[position];
//				position <= position + 1;
//			end else
//				position <= 0;
//				//value <= 4'b0100;
//		end else begin
//			if(position < 7 & position > 0) begin
//				//value <= array[position];
//				position <= position - 1;
//			end else
//				position <= 0;
//			//value <= 4'b1111;
//			end
		
		else if (position < 7 & position > 0) begin
			if(up) begin
				position <= position + 1;
			end else begin
				position <= position - 1;
			end
		end else begin
			position <= 1;
		end
		
		value <= array[position];
		
		end
		
endmodule

