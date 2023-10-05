module deco7seg(
	input  logic [3:0] D,
	output logic [6:0] SEG
);

always_comb begin
	case(D)
							// gfedcba
		4'b0000: SEG = 7'b1000000;
		4'b0001: SEG = 7'b0010010;
		4'b0010: SEG = 7'b1000110;
		4'b0011: SEG = 7'b0001000;
		4'b0100: SEG = 7'b1001110;
		4'b0101: SEG = 7'b0000010; 
		default: SEG = 7'b1111111;
	endcase
end
	
endmodule
