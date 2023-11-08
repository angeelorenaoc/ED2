module regfileEM(input logic clk,
					input logic we,//enable
					input logic [31:0] In1,In2,
					input logic [3:0] WA3In,
					output logic [31:0] Out1,Out2,
					output logic [3:0] WA3O);

	// Archivo de registros usados para las dos últimas etapas, ya que estas tienen dos entradas y dos salidas
	//Entradas execute:ALUResultE,WriteDataE   Salidas execute:ALUResultM,WriteDataM
	//Entradas Memory: RDM, ALUOutM				 Salidas Memory:ReadData, ALUOutW
	//Terminar y comentar cada una de las entradas y salidas
	logic [31:0] raux1,raux2;
	logic [3:0] raux3;
	
	// Three ported register file
	// Write third port on rising edge of clock
	always_ff @(posedge clk)
		if (we)begin
				raux1 <= In1;
				raux2 <= In2;
				raux3 <= WA3In;				
			end
		
	// Read two ports combinationally
	// register 15 reads PC + 8 instead
	assign Out1 = raux1;
	assign Out2 = raux2;
	assign WA3O = raux3;
endmodule