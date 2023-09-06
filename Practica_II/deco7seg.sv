module deco7seg(
	input  logic [3:0] D, tens,
	input logic Flag, 
	input int deco,
	output logic [6:0] SEG
);
 
	always_comb begin
		if ((tens==0 & Flag == 1 & deco == 1) | (tens!=0 & Flag == 1 & deco == 1)) begin
			SEG = 7'b0111111;
		end
		else if ((tens==0 & Flag == 0 & deco == 1) | (tens==0 & Flag == 0 & deco == 0) | (tens==0 & Flag == 1 & deco == 0))begin
			SEG = 7'b1111111;
		end
		else begin
			case(D)
									// gfedcba
				4'b0000: SEG = 7'b1000000;
				4'b0001: SEG = 7'b1111001;
				4'b0010: SEG = 7'b0100100;
				4'b0011: SEG = 7'b0110000;
				4'b0100: SEG = 7'b0011001;
				4'b0101: SEG = 7'b0010010; 
				4'b0110: SEG = 7'b0000010;
				4'b0111: SEG = 7'b1111000;
				4'b1000: SEG = 7'b0000000;
				4'b1001: SEG = 7'b0011000;
				default: SEG = 7'b1111111;
			endcase
		end
	end
endmodule
