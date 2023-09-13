// **********************
// Multiplier Unit Module
// **********************
module multiplierunit (dataA, dataB, dataR);
	input logic [31:0] dataA, dataB;
	output logic [31:0] dataR;


	// Internal signals to perform the multiplication	
	logic [47:0] Result;
	logic [7:0] exponent;
	logic [22:0] mantissa;
	logic sign;
	
	
	always_comb begin
		//Mantissa multiplier
		Result = {1'b1, A[22:0]} * {1'b1, B[22:0]};
		//Exponent adder
		if(Result[47] == 0)begin
			exponent = (A[30:23]-7'b1111111) + B[30:23];
			mantissa = Result[45:22];
		end
		else begin
			exponent = (A[30:23]-7'b1111111) + B[30:23] + 1b'1;
			mantissa = Result[46:23];
		end
		
	end
	
	assign sign = dataA[31] ^ dataB[31];
	
	//Assembler
	assign dataR = {sign,exponent,mantissa}
	
endmodule

// ***************************** 
// Testbench for Multiplier Unit
// ***************************** 
module tb_multiplierunit ();
	// WRITE HERE YOUR CODE
endmodule