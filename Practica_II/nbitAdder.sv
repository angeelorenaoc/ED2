module nbitAdder #(parameter N = 5)(cin, a, b, cout, s);
	//Definición d entradas y salidas para el sumador
	input logic [N-1:0] a, b;
	input logic cin;
	output logic [N-1:0] s;
	output logic cout;
	
	always_comb
		//Se le asigna a la salida la suma y el valor del Carrie
		{cout, s} = {1’b0, a} + {1’b0, b} + cin;
		
endmodule