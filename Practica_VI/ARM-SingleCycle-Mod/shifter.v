module shifter (
					input logic [31:0] imme, register,
					input logic [3:0] id,
					output logic [31:0] result
					);

	logic aux;
					
	always_comb begin
		case (id)
			4'b1000: begin
				//LSL
			end
			4'b1010: begin
				//LSR
			end
			4'b1100: begin
				//ASR
			end
			4'b1110: begin
				//ROR
			end
			default: begin
				aux = imme;
			end
	end
	
	assign result = aux;
