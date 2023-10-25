module shifter (
					input logic [4:0] shamt5, 
					input logic [31:0]register,
					input logic [1:0] sh,
					output logic [31:0] result
					);

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
				aux = (register << shamt5) | (register >> (32'd - shamt5));
			end
			default: begin
				aux = imme;
			end
	endcase
	
	assign result = aux;
