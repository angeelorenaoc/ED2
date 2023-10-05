.equ	N, 3
.global _start
	
.text
_start:
	//Inicilization
	MOV		R0, #N
	LDR 	R1, =A

loop:
	LDR		R2, [R1, #0]
	LDR		R3, [R1, #(N*4)]
	MUL 	R2, R2, R3
	LDR		R3, [R1, #(N*12)]
	ADD		R2, R2, R3
	STR 	R2, [R1, #(2*N*4)]
	
	ADD		R1, R1, #4
	SUBS	R0, R0, #1
	BNE		loop

stop:
	B stop	
	
	.data
//Definir constantes
A:	.dc.l	1, 2, 3
B:	.dc.l	3, 5, 4
R:	.ds.l	N
C:	.dc.l	5, 6, 2