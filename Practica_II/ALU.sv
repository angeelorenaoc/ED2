module ALU #(PARAMETER Bits=5)(A,B,Control,Result,Flags);
	
	input logic [ Bits-1 : 0 ] A,B;
	input logic [1:0] Control;
	output logic [ Bits-1 : 0 ] Result;
	output logic [ 3 : 0 ] Flags;
	
	logic [ Bits-1 : 0 ] nB, Resultado;
	
	nbitAdder sumador(parameter N = 5)(Control[0], A, nB, cout, Resultado);
	
	always_comb begin
		if(Control[0]) begin
			nB = ~B ;
		end else
			nB = B;
	end


endmodule