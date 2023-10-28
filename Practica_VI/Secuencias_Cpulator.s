.global _start
_start:
	
	
	MOV R0, #0
	//LDR R1, [R0,#0] //Load from switches
	LDR R1, =Switch
	LDR R2, =ROR
	LDR R5, =Time
	MOV R6, #0
	MOV R4, #1
	
LOOP:
	LDR R3,[R1]
	SUBS R3, R3, #0
	LDREQ R2, [R2, #0]
	LDRNE R2, [R2, #4]
	
	BNE ELSE
	IF:
		ROR R2, R2, #1
		STR R2, [R1, #4]
		LDR R3,[R1]
		SUBS R3, R3, #0
		BNE LOOP
		LDR R3, [R5,#0] //Counter for delay
		DELAYIF:
			SUBS R3, R3, #1
			BNE DELAYIF
			B IF
	ELSE:
		LDR R3,[R1]
		SUBS R7, R4, R3
		BNE LOOP
		
		LDR R3, [R5,#0] //Counter for delay
		DELAYELSE:
			SUBS R3, R3, #1
			BNE DELAYELSE
		
		SUBS R3, R2, #0x80000000
		MOVEQ R6, #1
		SUBS R3, R2, #0xFFFFFFFF
		MOVEQ R6, #0

		SUBS R3, R6, #1
		BEQ ASR

		LSL:
			LSL R2, R2, #1
			STR R2, [R1, #4]	
			B ELSE
		ASR:
			ASR R2,R2, #1
			STR R2, [R1, #4]
			B ELSE
		
		
		
	
.DATA
Switch:		.DC.L 0x00000001
LEDS:		.DC.L 0x00000000
ROR: 		.DC.L 0xAAAAAAAA
Counter: 	.DC.L 0xFFFFFFFF 
Time: 		.DC.L 0x0000F000