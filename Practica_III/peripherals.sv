// *********************** 
// Peripherals Unit Module
// *********************** 
module peripherals (clk, reset, enter, inputdata,
						  loaddata, casesspecial,inputdata_ready,
                    dataA, dataB, dataR, 
						  disp3, disp2, disp1, disp0);
	input logic  clk, reset, enter;
	input logic  [7:0] inputdata;
	input logic  loaddata;
	input logic [3:0] casesspecial;
	output logic inputdata_ready;
	output logic [31:0] dataA, dataB;
	input logic  [31:0] dataR;
	output logic [6:0] disp3, disp2, disp1, disp0;
	
	// Internal signals and module instantiation for pulse generation
	logic pulse;
	logic [3:0] count;
	logic [3:0] name;
	logic [8:0] aux;
	
	// Instanciación del generador de pulsos 
	peripheral_pulse pulse0 (enter, clk, reset, pulse);

	// Process, internal signals and assign statement to control data input / output indexes and data input ready signals
	always_ff @(posedge clk, posedge reset) begin
		if (reset) begin
			count = 4'b0000;
			inputdata_ready = 1'b0;
		end
		else if (pulse) begin
			if (count < 8 )begin
				count = count + 1 ;
				inputdata_ready = 1'b1;
			end
			else
				count = 0;
		end
	end
	
	always_comb begin
		if (count < 4 && inputdata_ready == 0) begin
			name = 4'b1010;
			aux  = dataA[count[1:0]*8+:8];
		end
		else if (count < 4 && inputdata_ready == 0) begin
			name = 4'b1011;
			aux  = dataB[count[1:0]*8+:8];
		end
		else begin
			name = 4'b1100;
			aux  = dataR[count[1:0]*8+:8];
		end
	end
	
	// Internal signals and module instantiation for getting operands
	peripheral_getoperands getdata (clk, reset, inputdata, pulse, count, dataA, dataB);

	// Instanciación del deco(falta)
	peripheral_deco7seg deco3 (name, casesspecial, 1, 3, disp3);
	peripheral_deco7seg deco2(count[1:0], casesspecial, 0, 2, disp2);
	peripheral_deco7seg deco1(aux[7:4], casesspecial, 0, 1, disp1);
	peripheral_deco7seg deco0 (aux[3:0], casesspecial, 0, 0, disp0);
endmodule