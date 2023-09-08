module deco7seg(
	input  logic [3:0] D, tens,
	input logic Flag, 
	input int deco, 
	input logic [1:0] oper,	
	output logic [6:0] SEG
);
	//Módulo encargado de realizar la codificación del valor ingresado para que este sea enviado en el formato correcto al display de 7 segmentos,
	//aquí, también se evalúa, si el número es negativo para mostrar el signo en el display, 
	//además, determina es el display que debe estar encendido
 
	logic minus;
	
	assign minus = ~oper[1] & Flag;
	
	always_comb begin
	
		if ((minus == 0 && tens == 0 && deco != 2) || (minus == 0 && deco == 0 && tens != 0) || (minus == 1 && deco == 0 && tens == 0))
			SEG = 7'b1111111;
		else if ((minus == 1 && tens == 0 && deco == 1) || (minus == 1 && tens != 0 && deco == 0) )
			SEG = 7'b0111111;
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
