module fsm #(parameter array[7:0] = [4, 8, 12, 0, 3, 7, 11, 15]) (clk, rst, up, value)
	input logic clk, up, rst;
	output logic [3:0] value;

integer position <= 0;

always_comb (posedge clk, posedge rst) begin
	
	if (rst) begin
		position = 0;
	end
	
	
	if (up) begin
		if(position =< 7) begin
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
end

