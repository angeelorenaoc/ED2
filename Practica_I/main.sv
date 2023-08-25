module main(
	
	input logic up,
	input logic rst,
	input logic clk,
	input logic timer,
	output logic [5:0] disp,
	output logic [6:0] segm
);


	reg internalClk;
	logic segs;
	logic [3:0] value, tens, units;// número que se mostrará en el display sin su separación
	logic [6:0] decenas, unidades;


	
cntdiv_ #(segs) clock (clk, rst, internalClk);

fsm machine (internalClk, rst, up, value);

converter conversor (value, tens, units);

deco7seg deco1 (tens, decenas);

deco7seg deco2 (units, unidades);
	
endmodule


//¿Cómo hacer test Bench?
