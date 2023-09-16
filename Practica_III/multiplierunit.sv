// **********************
// Multiplier Unit Module
// **********************
module multiplierunit (dataA, dataB, dataR, casesspecial);
	input logic [31:0] dataA, dataB;
	output logic [31:0] dataR;
	output logic [3:0] casesspecial;// Cero,Inf,-Inf,Nan;


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
		Result = {1'b1, dataA[22:0]} * {1'b1, dataB[22:0]};
		sign = dataA[31] ^ dataB[31];
		
		//Casos especiales(Revisar la asignación del caso especial al deco, podría usarse un entero)
		//Hacer condicionales de acuerdo al peso que tiene el valor, es decir, valor que se impone
		
		if(dataA[30:23] == 8'b11111111 || dataB[30:23] == 8'b11111111)begin //Recuestionar evaluación de casos especiales en este punto
			mantissa = Result[45:22];
			exponent = 8'b11111111;
			if(Result[45:23] != 23'b0 || dataA[30:23] == 8'b0 || dataB[30:23] == 8'b0)begin//¿Puede ser (A[] || B[]) == 0?
				casesspecial = 4'b0001; 			
			end
			else if (Result[45:23] == 23'b0 && sign ) begin 
				casesspecial = 4'b0010;				
			end
			else begin
				casesspecial = 4'b0100;	
			end
		end
		else if (dataA[30:23] == 8'b0 || dataB[30:23] == 8'b0)begin
			mantissa = Result[45:22];
			exponent = 8'b00000000;
			casesspecial = 4'b1000;	
		end
		//Exponent adder
		else begin
			casesspecial = 4'b0000;
			if(Result[47] == 0)begin
				exponent = (dataA[30:23]-7'b1111111) + dataB[30:23];
				mantissa = Result[45:22];
			end
			else begin
				exponent = (dataA[30:23]-7'b1111111) + dataB[30:23] + 1'b1;
				mantissa = Result[46:23];
			end
		end
	end

	
	//Assembler
	assign dataR = {sign,exponent,mantissa};
	
endmodule

// ***************************** 
// Testbench for Multiplier Unit
// ***************************** 
module tb_multiplierunit ();
//	//Definición de las señales para la simulación
//	logic [31:0] dataA, dataB, dataR;
//	logic [3:0] casesspecial;
//	
//	multiplierunit multi (dataA, dataB, dataR, casesspecial);
//	
//	initial begin
//	
//	dataA = 31'b0;
//	dataB = 31'b0;
//	
//	//Los siguientes ciclos son utilizados para la variación de las entradas, y el cambio de operación.
//	for ( int i = 0; i < 4 ;i++) begin
//		for ( int j = 0; j < 4 ;j++) begin
//			
//			#(CLK_PERIOD * 1);
//			dataB = dataB + 5'b00100;
//			Opersel = 1;
//			
//			#(CLK_PERIOD * 4);
//			Opersel = 0;
//		
//		end
//		vA = vA + 5'b00100;
//	end
//		$stop;
//	end
//
//	
//always #(CLK_PERIOD / 2) clk = ~clk;
endmodule