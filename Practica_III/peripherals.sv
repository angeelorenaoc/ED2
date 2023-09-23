// *********************** 
// Peripherals Unit Module
// *********************** 
module peripherals (clk, reset, enter, inputdata,
						  loaddata, casesspecialm,inputdata_ready,
                    dataA, dataB, dataR, 
						  disp3, disp2, disp1, disp0);
	input logic  clk, reset, enter;
	input logic  [7:0] inputdata;
	input logic  loaddata;
	input logic [4:0] casesspecialm;
	output logic inputdata_ready;
	output logic [31:0] dataA, dataB;
	input logic  [31:0] dataR;
	output logic [6:0] disp3, disp2, disp1, disp0;
	
	// Internal signals and module instantiation for pulse generation
	logic pulse;
	logic [3:0] count;
	logic [3:0] countout;
	logic [3:0] countf;
	logic [3:0] name;
	logic [7:0] aux;
	logic [4:0] casesspecial;
	
	// Instanciación del generador de pulsos 
	peripheral_pulse pulse0 (enter, clk, reset, pulse);

	// Process secuencial que se encarga de aumentar los contadores, esto con el fin de indicar hasta qué punto se da la carga de datos,
	// y hasta qué punto la generación de los resultados, el contador de las salidas vuelve hasta 0 para que se pueda mostrar la salida de manera
	//correcta en los displays
	always_ff @(posedge clk, posedge reset) begin
		if (reset) begin
			count = 4'b0000;
			inputdata_ready = 1'b0;
		end
		else if (pulse) begin
			if (count < 4'd7 )begin
				count = count + 1'b1 ;
				inputdata_ready = 1'b0;
			end
			else if (inputdata_ready)begin
				if(countout < 4'd3)begin
					countout = countout + 1'b1 ;
				end
				else begin
					countout = 0;
				end
			end
			else begin
				//count = 0;
				inputdata_ready = 1'b1;
			end
		end
	end
	//En este proceso se asigna la respectiva letra, es decir, cuando se estén cargando los datos de a se asignara su respectiva codificación
	//para ser enviada a los displays, del mismo modo para b y el resultado r, por eso se evalúa el contador y la señal loaddata
	always_comb begin
		if (count < 4'b0100 && loaddata == 1) begin
			name = 4'b1010;
			aux  = dataA[count[1:0]*8+:8];
		end
		else if (count < 4'b1000 && loaddata == 1) begin
			name = 4'b1011;
			aux  = dataB[count[1:0]*8+:8];
		end
		else begin
			name = 4'b1100;
			aux  = dataR[countout[1:0]*8+:8];
		end
	end
	assign casesspecial = (loaddata ? 5'b0 : casesspecialm);
	assign countf = (loaddata ? count : countout);
	// Instanciación del módulo que almacena la data de entrada
	peripheral_getoperands getdata (clk, reset, inputdata, loaddata, count, dataA, dataB);

	// Instanciación de los 4 displays de 7 segmentos
	peripheral_deco7seg deco3 (name, casesspecial, 1, 2'd3, disp3);
	peripheral_deco7seg deco2({2'b0, countf[1:0]}, casesspecial, 0, 2'd2, disp2);
	peripheral_deco7seg deco1(aux[7:4], casesspecial, 0, 2'd1, disp1);
	peripheral_deco7seg deco0 (aux[3:0], casesspecial, 0, 2'd0, disp0);
endmodule