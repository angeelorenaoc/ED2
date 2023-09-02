module nbitAdder #(parameter N = 5)(cin, a, b, cout, s);

	input logic [N-1:0] a, b;
	input logic cin;
	output logic [N-1:0] s;
	output logic cout;
	
	always_comb
		{cout, s} = {1’b0, a} + {1’b0, b} + cin;
		
endmodule