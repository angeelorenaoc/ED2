/*
 * This module is the Conditional Logic block of the Control Unit
 */ 
module condlogic(input logic BranchE,
						input logic [3:0] Cond,
						input logic [3:0] ALUFlags, FlagsE,
						input logic [1:0] FlagW,
						input logic PCS, RegW, MemW,
						output logic PCSrcM, RegWrite,MemWrite,
						output logic [3:0] Flags);
	// Internal signals
	logic [1:0] FlagWrite;
	logic CondEx, PCSrc, BranchAux;

	// Registers to store the ALUFlags when S == 1
	always_comb
		if(FlagWrite[1] == 1'b1) begin
			Flags[3:2] = ALUFlags[3:2];
		end
		else begin
			Flags[3:2] = FlagsE[3:2];
		end
		
	always_comb
		if(FlagWrite[0] == 1'b1) begin
			Flags[1:0] = ALUFlags[1:0];
		end
		else begin
			Flags[1:0] = FlagsE[1:0];
		end
	
	// write controls are conditional
	condcheck cc(Cond, Flags, CondEx);
	assign FlagWrite = FlagW & {2{CondEx}};
	assign RegWrite = RegW & CondEx;
	assign MemWrite = MemW & CondEx;
	assign PCSrc = PCS & CondEx;
	assign BranchAux = BranchE & CondEx;
	assign PCSrcM = PCSrc | BranchAux;

endmodule

/*
 * This submodule is the Condition Check block of the Conditional Logic block
 */ 
module condcheck(input logic [3:0] Cond,
						input logic [3:0] Flags,
						output logic CondEx);
	// Internal signals
	logic neg, zero, carry, overflow, ge;
	assign {neg, zero, carry, overflow} = Flags;
	assign ge = (neg == overflow);
	// Combinational process to check conditions
	always_comb
		case(Cond)
			4'b0000: CondEx = zero; // EQ
			4'b0001: CondEx = ~zero; // NE
			4'b0010: CondEx = carry; // CS
			4'b0011: CondEx = ~carry; // CC
			4'b0100: CondEx = neg; // MI
			4'b0101: CondEx = ~neg; // PL
			4'b0110: CondEx = overflow; // VS
			4'b0111: CondEx = ~overflow; // VC
			4'b1000: CondEx = carry & ~zero; // HI
			4'b1001: CondEx = ~(carry & ~zero); // LS
			4'b1010: CondEx = ge; // GE
			4'b1011: CondEx = ~ge; // LT
			4'b1100: CondEx = ~zero & ge; // GT
			4'b1101: CondEx = ~(~zero & ge); // LE
			4'b1110: CondEx = 1'b1; // Always
			default: CondEx = 1'bx; // undefined
		endcase
endmodule