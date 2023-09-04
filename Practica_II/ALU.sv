module ALU #(PARAMETER Bits=5)(InA,InB,Control,Result,Flags);
	
	input logic [ Bits-1 : 0 ] InA,InB;
	input logic [1:0] Control;
	output logic [ Bits-1 : 0 ] Result;
	output logic [ 3 : 0 ] Flags;
	
	logic [ Bits-1 : 0 ] nB, Resultadder, Resultado;
	logic cout, aux1, aux2, aux3, InO1, InO2, OverFlow;
	
	
	nbitAdder sumador(parameter N = 5)(Control[0], InA, nB, cout, Resultadder);
	
	always_comb begin
	
		//Mux que se usará para realizar la resta 
		if(Control[0]) begin
			nB = ~InB; //Complemento a 2 de B ¿Es legal y lógico? xd
		end else
			nB = InB;
	end
	
	always_comb begin
		case(Control)
			
			//Suma
			2'b00:begin 
				Resultado <= signed(Resultadder);
			end	
			//Resta
			2'b01: begin  
				Resultado <= Resultadder;
			end
			//And
			2'b10: begin
				Resultado <= InA and InB;
			end
			//Or
			2'11:begin
				Resultado <= InA or InB;
			end
			default: Resultado = 0;
		endcase
	end
	
	//Proceso para obtener la Bandera Overflow
	aux1 = Resultadder[ Bits-1];
	aux2 = InA[ Bits-1];
	aux3 = InB[ Bits-1];
	InO1 = aux1 XOR aux2;
	InO2 = ~(aux1 XOR aux2);
	
	
	//Asignación de las salidas, Bnaderas y resultado de la ALU
	assign Result = Resultado;
	assign Flags[2] = (~Resultado) and (~Resultado);
	assign Flags[3] = Resultado[Bits-1];
	assign Flags[1] = Control[1] and cout;
	assign Flags[0] = InO1 and InO1 and ~(Coltrol[1]);
	
endmodule