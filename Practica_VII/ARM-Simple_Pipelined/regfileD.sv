module regfileD(input logic clk,
					input logic we,//enable
					input logic [31:0] RD1D, RD2D,ExtendD,
					input logic [3:0] InstrD, 
					output logic [31:0] RD1E, RD2E, ExtendE,
					output logic [3:0] InstrE);

	// Archivo de registros usados para las dos últimas etapas
	//Terminar y comentar cada una de las entradas y salidas
	logic [31:0] raux1,raux2,raux3;
	logic [3:0] raux4;
	
	// Three ported register file
	// Write third port on rising edge of clock
	always_ff @(posedge clk)
		if (we)begin
				raux1 <= RD1D;
				raux2 <= RD2D;
				raux3 <= ExtendD;
				raux4 <= InstrD;
			end
		
	// Read two ports combinationally
	// register 15 reads PC + 8 instead
	assign RD1E = raux1;
	assign RD2E = raux2;
	assign ExtendE = raux3;
	assign InstrE = raux4;
endmodule