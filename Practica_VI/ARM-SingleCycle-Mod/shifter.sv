module shifter #(parameter N = 4) (shamt5,register,sh,result);
					input logic [4:0] shamt5;
					input logic [N-1:0]register;
					input logic [1:0] sh;
					output logic [31:0] result;

	logic [31:0] aux;
					
	always_comb begin
		case (sh)
			4'b00: begin //LSL
				aux = register << shamt5;
			end
			4'b01: begin //LSR
				aux = register >> shamt5;
			end
			4'b10: begin //ASR
				aux = register >>> shamt5;
			end
			4'b11: begin //ROR
				aux = (register << shamt5) | (register >> (N - shamt5));
			end
			default: begin
				aux = register;
			end
		endcase
	end
	
	assign result = aux;
	
endmodule
