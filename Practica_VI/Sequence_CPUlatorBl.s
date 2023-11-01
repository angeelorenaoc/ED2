.global _start
_start:
///Contadores de 10 leds, no 32
//Valor de condición ASR muy grande
	
	MOV R0, #0
	LDR R1, [R0,#0] //Load from switches
	LDR R1, =Switch
	LDR R2, =ROR
	//LDR R9, =ROR
	LDR R5, =Time
	MOV R4, #1
	MOV R6, #0
	MOV R7, #10
	
LOOP:
	LDR R3,[R1]
	SUBS R3, R3, #0
	LDREQ R2, [R1, #8]
	LDRNE R2, [R1, #12]
	STR R2, [R1, #4]
	
	BNE ELSE
	IF:
		ROR R2, R2, #1
		STR R2, [R1, #4]
		LDR R3,[R1]
		SUBS R3, R3, #0
		BNE LOOP
		
		BL DELAY
		/*
		LDR R3, [R1,#16] //Counter for delay
		DELAYIF:
			SUBS R3, R3, #1
			BNE DELAYIF
			*/
			B IF
	ELSE:
		LDR R3,[R1]
		SUBS R3, R4, R3
		BNE LOOP
		
		BL DELAY
		
		/*
		LDR R3, [R1,#16] //Counter for delay
		DELAYELSE:
			SUBS R3, R3, #1
			BNE DELAYELSE
		*/
		//LDR R3,[R1,#4]
		SUBS R3, R7, R6
		BNE ASR
		
		POP:
			LDREQ R2, [R1, #12]
			
			STR R2, [R1, #4]	
			MOV R6, #0
			B ELSE
		ASR:
			LSL R2,R2, #1
			STR R2, [R1, #4]
			ADD R6, R6, #1
			B ELSE
		
		
DELAY:
	LDR R3, [R5,#0] //Counter for delay
	DLOOP:
		SUBS R3, R3, #1
		BNE DLOOP
	MOV PC, LR		
		
	
.DATA
Switch:		.DC.L 0x00000000
LEDS:		.DC.L 0x00000000
ROR: 		.DC.L 0x88888888
Counter: 	.DC.L 0xffffffff
Time: 		.DC.L 0x00000F00