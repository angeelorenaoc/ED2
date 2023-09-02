module main # (parameter fpga_freq = 50_000_000)
(
	
	input logic up,
	input logic rst,
	input logic clk,
	input logic timer,
	output logic [6:0] decsegm, unisegm
);


	reg internalClk;
	logic [3:0] value, tens, units;// número que se mostrará en el display


	// Se conectan todos los modulos
cntdiv_n #(fpga_freq) clock (clk, ~rst, internalClk, timer);

fsm machine (internalClk, ~rst, up, value);

converter conversor (value, tens, units);

deco7segdec deco1 (tens, decsegm);

deco7seg deco2 (units, unisegm);
	
endmodule



module tbmain ();

localparam CLK_PERIOD = 20ns;
localparam fpga_freq = 8;
logic up;
logic rst;
logic clk;
logic timer;
logic [6:0] decsegm;
logic [6:0] unisegm;

main #(fpga_freq) main_u0 (up, rst, clk, timer, decsegm, unisegm);

initial begin

clk = 0;
rst = 0;
up = 1;
timer = 0;

#(CLK_PERIOD * 1);
rst = 1;

#(CLK_PERIOD * 40);
up = 0;

#(CLK_PERIOD * 80);
timer = 1;
up =1;

#(CLK_PERIOD * 120);

$stop;
end

always #(CLK_PERIOD / 2) clk = ~clk;

endmodule
