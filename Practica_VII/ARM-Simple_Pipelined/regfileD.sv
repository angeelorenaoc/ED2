module regfileD(input logic clk,
					input logic we,reset,//enable
					input logic [31:0] RD1D, RD2D,ExtendD,InstrD, Pcin,
					output logic [31:0] RD1E, RD2E, ExtendE,InstrE,Pc);

	// Archivo de registros usados para las dos últimas etapas
	//Terminar y comentar cada una de las entradas y salidas
	logic [31:0] raux1,raux2,raux3,raux4, Pcaux;
	
	// Three ported register file
	// Write third port on rising edge of clock
	always_ff @(posedge clk)
		if (reset)begin
				raux1 <= 0;
				raux2 <= 0;
				raux3 <= 0;
				raux4 <= 0;
				Pcaux <= 0;
		end
		else if (we)begin
				raux1 <= RD1D;
				raux2 <= RD2D;
				raux3 <= ExtendD;
				raux4 <= InstrD;
				Pcaux <= Pcin;
		end
		
	// Read two ports combinationally
	// register 15 reads PC + 8 instead
	assign RD1E = raux1;
	assign RD2E = raux2;
	assign ExtendE = raux3;
	assign InstrE = raux4;
	assign Pc = Pcaux;
endmodule