module Alu #(parameter Bits=5)(InA,InB,Control,Result,Flags);
	
	input logic [ Bits-1 : 0 ] InA,InB;
	input logic [1:0] Control;
	output logic [ Bits-1 : 0 ] Result;
	output logic [ 3 : 0 ] Flags;
	
	//Señales
	logic [ Bits-1 : 0 ] nB, Resultadder, Resultado;
	logic cout, aux1, aux2, aux3, InO1, InO2, OverFlow;
	
	//Instanciación del sumador de n bits
	nbitAdder #(Bits) sumador(Control[0], InA, nB, cout, Resultadder);
	
	always_comb begin
	
		//Mux que se usará para realizar la resta 
		if(Control[0]) begin
			nB = ~InB; //Complemento a 2 de B
		end else
			nB = InB;
	end
	
	always_comb begin
		casez(Control)
			//Suma Y Resta
			2'b0?: Resultado = Resultadder;
			//And
			2'b10: Resultado = InA & InB;
			//Or
			2'b11: Resultado = InA | InB;
			default: Resultado = 0;
		endcase
	end
	
	//Proceso para obtener la Bandera Overflow
	assign aux1 = Resultadder[ Bits-1];
	assign aux2 = InA[ Bits-1];
	assign aux3 = InB[ Bits-1];
	assign InO1 = aux1 ^ aux2;
	assign InO2 = ~(Control[0] ^ aux2 ^ aux3);
	
	
	//Asignación de las salidas, Banderas y resultado de la ALU
	assign Result = Resultado;
	assign Flags[3] = Resultado[Bits-1]; //Negativo
	assign Flags[2] = (Resultado == 0) ? 1:0; //Zero
	assign Flags[1] = ~Control[1] & cout; //Carry
	assign Flags[0] = InO1 & InO2 & ~(Control[1]); //Overflow
	
endmodule