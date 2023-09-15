// ******************* 
// Get Operands Module
// ******************* 
//Preguntar sobre alamcenamiento de variables, reutilización.
//Explicación de los demás módulos
//Data input i, ¿es entrada o salida?
module peripheral_getoperands (clk, reset, inputdata, enterpulse, datainput_i, dataA, dataB);
	input logic clk, reset;
	input logic [7:0] inputdata;
	input logic enterpulse;//¿Por qué se usa el enterpulse?
	input logic [3:0] datainput_i;
	//output logic [3:0] datainput_i;
	output logic [31:0] dataA, dataB;

	// Internal signals and processes to store data into proper registers
	logic [63:0] aux;
	
	peripheral_pulse pulse0 (enterpulse, clk, reset, pulse);
	
	always_ff (posedge clk, posedge reset) begin
		if(reset) begin
			datainput_i <= 0;
		end
		else if(enterpulse)begin 
			if (datainput_i < 8) begin//Revisar mañana condicionar aumento al pulso
				aux[datainput_i*8+:8] <= inputdata;
				//datainput_i <= datainput_i + 1'b1;
			end
		end
	end
	
	assign dataA = aux[31:0];
	assign dataB = aux[63:32];
	
endmodule			