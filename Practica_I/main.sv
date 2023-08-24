module main(
	
	input logic up,
	input logic rst,
	input logic clk,
	input logic timer,
	output logic [5:0] disp,
	output logic [6:0] segm
);

reg internalClk;
logic segs

always_comb (timer) begin
	if (timer)
		segs = 25;
	else
		segs = 18;
end

