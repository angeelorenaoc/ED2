module main #(parameter Bits = 5)

	(
	input logic clk, nrst, nOpersel,
	input logic [Bits-1:0] vA, vB,
	output logic [6:0] minus, tens, units,
	output logic [3:0] ALUflags, operation
	);
	
	//Definición de señales
	logic rst, Opersel;
	logic [1:0] control;
	logic [Bits-1: 0] Result;
	logic [3:0] ten, unit;
	
	
	//Negación de las señales reset y opersel, ya que estas son activas en bajo
	assign rst = ~nrst;
	assign Opersel = ~nOpersel;
	
	//Instanciación de los módulos necesarios para el diseño requerido
	counterpulse oper(Opersel, clk, rst, control, operation);
	
	Alu #(Bits) alu(vA, vB, control, Result, ALUflags);
	
	converter #(Bits) convert(ALUflags[3],Result, control,ten, unit);
	
	deco7seg decounit(unit, ten, ALUflags[3], 2, control, units);
	
	deco7seg decodec(ten, ten, ALUflags[3], 1, control, tens);
	
	deco7seg decominus(0, ten, ALUflags[3], 0, control, minus);
	
	
	endmodule
	
	module tbmain ();
	
	//Definición de las señales para la simulación
	localparam CLK_PERIOD = 20ns;
	localparam Bits = 5;
	logic clk;
	logic rst;
	logic Opersel;
	logic [Bits-1:0] vA;
	logic [Bits-1:0] vB;
	logic [6:0] minus;
	logic [6:0] tens;
	logic [6:0] units;
	logic [3:0] ALUflags;
	logic [3:0] operation;
	
	main #(5) main_u0 (clk,rst, Opersel, vA, vB, minus, tens, units, ALUflags, operation);
	
	initial begin
	
	clk = 0;
	rst = 0;
	vA = 5'b00000;
	vB = 5'b00000;
	Opersel = 0;
	
	#(CLK_PERIOD * 1);
	rst = 1;
	
	//Los siguientes ciclos son utilizados para la variación de las entradas, y el cambio de operación.
	for ( int i = 0; i < 4 ;i++) begin
		for ( int j = 0; j < 4 ;j++) begin
			
			#(CLK_PERIOD * 1);
			vB = vB + 5'b00100;
			Opersel = 1;
			
			#(CLK_PERIOD * 4);
			Opersel = 0;
		
		end
		vA = vA + 5'b00100;
	end
		$stop;
	end

	
always #(CLK_PERIOD / 2) clk = ~clk;
	
endmodule