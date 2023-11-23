module regfileEM(input logic clk,
					input logic we, reset,//enable
					input logic [31:0] In1,In2,
					input logic [3:0] WA3In,
					input logic [31:0] Pcin,
					output logic [31:0] Out1,Out2,
					output logic [3:0] WA3O,
					output logic [31:0]Pc);

	// Archivo de registros usados para las dos últimas etapas, ya que estas tienen dos entradas y dos salidas
	//Entradas execute:ALUResultE,WriteDataE   Salidas execute:ALUResultM,WriteDataM
	//Entradas Memory: RDM, ALUOutM				 Salidas Memory:ReadData, ALUOutW
	//Terminar y comentar cada una de las entradas y salidas
	logic [31:0] raux1,raux2,Pcaux;
	logic [3:0] raux3;
	
	// Three ported register file
	// Write third port on rising edge of clock
	always_ff @(posedge clk)
		if (reset)begin
				raux1 <= 0;
				raux2 <= 0;
				raux3 <= 0;
				Pcaux <= 0;
		end
		else if (we)begin
				raux1 <= In1;
				raux2 <= In2;
				raux3 <= WA3In;
				Pcaux <= Pcin;
			end
	//Asignación de señales auxiliares a salidas	
	assign Out1 = raux1;
	assign Out2 = raux2;
	assign WA3O = raux3;
	assign Pc = Pcaux;
endmodule