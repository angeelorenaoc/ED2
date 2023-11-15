.global
_start:
	MOV 	R0, #0
	LDR 	R1, [R0, #0]
	ASR 	R2, R1, #31
	LSL 	R3, R2, #31
	LSR		R4, R2, #15
	ROR 	R5, R4, #31
	BL		Store
End:
	B End
Store:
	STR		R5, [R0, #4]
	MOV		PC, LR