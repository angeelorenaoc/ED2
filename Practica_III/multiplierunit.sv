// **********************
// Multiplier Unit Module
// **********************
module multiplierunit (dataA, dataB, dataR,casesspecial);
	input logic [31:0] dataA, dataB;
	output logic [31:0] dataR;
	output logic [3:0] casesspecial// Cero,Inf,-Inf,Nan;


	// Internal signals to perform the multiplication
//Agregar los casos especiales, evaluandolos al final
//Verificar Nand
//Agregar el caso del 0	
	logic [47:0] Result;
	logic [7:0] exponent;
	logic [22:0] mantissa;
	logic sign;
	
	
	
	always_comb begin
		//Mantissa multiplier
		Result = {1'b1, A[22:0]} * {1'b1, B[22:0]};
		sign = dataA[31] ^ dataB[31];
		
//		//Mantissa multiplier
////		if((A[22:0] != 23'b0 && A[30:23] == 8'b11111111)||(B[22:0] != 23'b0 && B[30:23] == 8'b11111111))begin
////			Result = 2**47;//¿Es legal y lógico?
////		end
//		if(A[30:23] == 8'b11111111||B[30:23] == 8'b11111111)begin //Recuestionar evaluación de casos especiales en este punto
//			if(A[22:0] != 23'b0 ||B[22:0] != 23'b0 )
//					Result = 2**47;//¿Es legal y lógico?
//			else if(A[22:0] == 23'b0 || B[22:0] == 23'b0 )begin
//				if(A[31]==1'b1 || B[31]==1'b1) begin
//					Result = 2**47;//¿Es legal y lógico?
//				end
//			end
//					Result = 2**47;//¿Es legal y lógico?
//		end 
//		else begin
//			
//		end


		//Casos especiales(Revisar la asignación del caso especial al deco, podría usarse un entero)
		//Hacer condicionales de acuerdo al peso que tiene el valor, es decir, valor que se impone
		if(A[30:23] == 8'b11111111 || B[30:23] == 8'b11111111)begin //Recuestionar evaluación de casos especiales en este punto
			mantissa = Result[45:22];
			exponent = 8'b11111111;
			if(Result[45:23] != 23'b0 || A[30:23] == 8'b0 || B[30:23] == 8'b0)begin//¿Puede ser (A[] || B[]) == 0?
				casesspecial = 4'b0001; 			
			end
			else if (Result[45:23] == 23'b0 && sign ) begin 
				casesspecial = 4'b0010;				
			end
			else begin
				casesspecial = 4'b0100;	
			end
		end
		else if (A[30:23] == 8'b0 || B[30:23] == 8'b0)begin
			mantissa = Result[45:22];
			exponent = 8'b00000000;
			casesspecial = 4'b1000;	
		end
		//Exponent adder
		else begin
			if(Result[47] == 0)begin
				exponent = (A[30:23]-7'b1111111) + B[30:23];
				mantissa = Result[45:22];
			end
			else begin
				exponent = (A[30:23]-7'b1111111) + B[30:23] + 1b'1;
				mantissa = Result[46:23];
			end
		end
	end

	
	//Assembler
	assign dataR = {sign,exponent,mantissa}
	
endmodule

// ***************************** 
// Testbench for Multiplier Unit
// ***************************** 
module tb_multiplierunit ();
	// WRITE HERE YOUR CODE
endmodule