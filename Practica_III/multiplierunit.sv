// **********************
// Multiplier Unit Module
// **********************
module multiplierunit (dataA, dataB, dataR, casesspecial);
	input logic [31:0] dataA, dataB;
	output logic [31:0] dataR;
	output logic [4:0] casesspecial;// Cero,Inf,-Inf,Nan;


// Internal signals to perform the multiplication
//Agregar los casos especiales, evaluandolos al final
//Verificar Nand
//Agregar el caso del 0	
	logic [47:0] Resultado_auxiliar;
	logic [7:0] exponent;
	logic [22:0] mantissa;
	logic sign;
	logic aux;	
	
	always_comb begin
		//Mantissa multiplier
		
		Resultado_auxiliar = {1'b1, dataA[22:0]} * {1'b1, dataB[22:0]};//¿Cómo reevaluar el multiplicador?
		sign = dataA[31] ^ dataB[31];
		
		//Casos especiales(Revisar la asignación del caso especial al deco, podría usarse un entero)
		//Hacer condicionales de acuerdo al peso que tiene el valor, es decir, valor que se impone
		
		if(dataA[30:23] == 8'b11111111 || dataB[30:23] == 8'b11111111)begin //NAN & ±infinito
			mantissa = Resultado_auxiliar[45:23];
			exponent = 8'b11111111;																																	
																										//¿Puede ser (A[] || B[]) == 0?
			if((dataA[22:0] != 23'b0 && dataA[30:23] == 8'b11111111) || (dataB[22:0] != 23'b0 && dataB[30:23] == 8'b11111111))begin //NAN
				//Revisar cómo reevaular esta condición
				//if (dataA[30:0] == 8'b0 || dataB[30:0] == 8'b0) begin
				casesspecial = 5'b00001;
			end
			else if ((dataA[30:0] == 31'b0 && dataB[30:0] == 31'h7f800000) || (dataB[30:0] == 31'b0 && dataA[30:0] == 31'h7f800000)) begin //O*∞
				casesspecial = 5'b00001;
			end
			else if ((dataA[22:0] == 23'b0 || dataB[22:0] == 23'b0) && sign ) begin //-Infinito
				casesspecial = 5'b00010;
				mantissa = 23'b0;				
			end
			else begin //+Infinito
				casesspecial = 5'b00100;	
				mantissa = 23'b0;	
			end
		end
		else if ((dataA[30:0] == 31'b0 || dataB[30:0] == 31'b0))begin
			mantissa = 23'b0;
			exponent = 8'b00000000;
			casesspecial = 5'b10000 >> sign;	
		end
		/*
		else if ((dataA == 32'b0 || dataB == 32'b0) && sign == 1'b0)begin
			mantissa = 23'b0;
			exponent = 8'b00000000;
			casesspecial = 5'b10000;	
		end*/
		//Números "normales"
		else begin
			casesspecial = 5'b00000;
			if(Resultado_auxiliar[47] == 1'b0)begin
				exponent = (dataA[30:23]-7'b1111111) + dataB[30:23];
				mantissa = Resultado_auxiliar[45:23];
				aux = 1;
			end
			else begin
				exponent = (dataA[30:23]-7'b1111111) + dataB[30:23] + 1'b1;
				mantissa = Resultado_auxiliar[46:24];
				aux = 0;
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
	//Definición de las señales para la simulación
	localparam CLK_PERIOD = 20ns;
	logic clk;
	logic [31:0] dataA, dataB, dataR;
	logic [4:0] casesspecial;
	
	multiplierunit multi (dataA, dataB, dataR, casesspecial);
	
	initial begin
	
	clk = 0;
	dataA = 32'b0;
	dataB = 32'b0;
	
	//Verificación de casos especiales y algunos casos normales
	//Cero por Cero
	#(CLK_PERIOD * 1);
	dataA = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	dataB = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	//Cero por infinito
	#(CLK_PERIOD * 1);
	dataA = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	dataB = 32'b0111_1111_1000_0000_0000_0000_0000_0000;
	//-infinito por Cero
	#(CLK_PERIOD * 1);
	dataA = 32'b1111_1111_1000_0000_0000_0000_0000_0000;
	dataB = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	//-infinito por NAN
	#(CLK_PERIOD * 1);
	dataA = 32'b1111_1111_1000_0000_0000_0000_0000_0000;
	dataB = 32'b0111_1111_1000_0000_1111_0000_1111_0000;
	//infinito por NAN
	#(CLK_PERIOD * 1);
	dataA = 32'b0111_1111_1000_0000_0000_0000_0000_0000;
	dataB = 32'b0111_1111_1000_0000_1111_0000_1111_0000;
	//-infinito por infinito
	#(CLK_PERIOD * 1);
	dataA = 32'b1111_1111_1000_0000_0000_0000_0000_0000;
	dataB = 32'b0111_1111_1000_0000_0000_0000_0000_0000;
	//Cero por NAN
	#(CLK_PERIOD * 1);
	dataA = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	dataB = 32'b1111_1111_1000_0000_1111_0000_1111_0000;
	//NAN por NAN
	#(CLK_PERIOD * 1);
	dataA = 32'b0111_1111_1000_0000_1111_0000_1111_0000;
	dataB = 32'b1111_1111_1000_0000_1111_0000_1111_0000;
	//7.875*0=0
	#(CLK_PERIOD * 1);
	dataA = 32'b0100_0000_1111_1100_0000_0000_0000_0000;
	dataB = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	//7.875*0.1875=1.4765625
	#(CLK_PERIOD * 1);
	dataA = 32'b0100_0000_1111_1100_0000_0000_0000_0000;
	dataB = 32'b0011_1110_0100_0000_0000_0000_0000_0000;
	//−18*9.5=-171.0
	#(CLK_PERIOD * 1);
	dataA = 32'b1100_0001_1001_0000_0000_0000_0000_0000;
	dataB = 32'b0100_0001_0001_1000_0000_0000_0000_0000;
	#(CLK_PERIOD * 1);
	//-Infinito*9.5 = Infinito
	dataA = 32'b1111_1111_1000_0000_0000_0000_0000_0000;
	dataB = 32'b0100_0001_0001_1000_0000_0000_0000_0000;
	#(CLK_PERIOD * 1);
	//-Infinito*9.5 = Infinito
	dataA = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	dataB = 32'b1000_0000_0000_0000_0000_0000_0000_0000;
	#(CLK_PERIOD * 1);
	
		$stop;
	end

	always #(CLK_PERIOD / 2) clk = ~clk;
	
endmodule