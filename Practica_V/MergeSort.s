.global _start
	.equ MAXN, 200
	.text 
_start:
	LDR R0,=SortedData 	//Dirección de la primera posición del arreglo de salida
	LDR R4, =N
	LDR R4, [R4]  		//Valor de i que indica la longitud del arreglo
	MOV R6, #4
	MUL R5, R4, R6
	ADD R5, R5, R0
	SUB R5, R5, #4
	MOV R3, R5			//Posición final del arreglo	
	LDR R5, =Data 		//Dirección en la cual está data
	LDR R6,[R5]   		// Valor en el arreglo de entrada
	MOV R7, R4			// Contador que itera en la data de entrada
Copia:					//Copia de la entrada en la salida
	STR R6, [R0], #4
	LDR R6, [R5,#4]!
	SUBS R7, R7, #1
	BNE Copia
	LDR R0, =SortedData

finish:
	b finish

MergeSort://Función que segmenta la lista
	ADD R5, R0, R3
	LSR R1, R5, #1
	ADD R2, R1, #4
	CMP R0,R3
	BNE ELSE
	IF:
		MOV PC,LR
	ELSE:
		PUSH{R0,R1,R2,R3,LR}
		MOV R3, R1
		ADD R5, R0, R3
		LSR R1, R5, #1
		ADD R2, R1, #4
		BL  MergeSort
		POP{R0,R1,R2,R3,LR}
		PUSH{R0,R1,R2,R3,LR}
		MOV R0, R1
		ADD R5, R0, R3
		LSR R1, R5, #1
		ADD R2, R1, #4
		BL  MergeSort
		POP{R0,R1,R2,R3,LR}
		

Fuse://Función que organiza los números
	
	
.data

N:  		.dc.l 10
Data: 		.dc.l 0x01226a27, 0xb7bc3585, 0xd33eba1d, 0x08563ea1, 0x41129fe2, 0xf716aedb, 0x2e281c6a, 0x4c27210a, 0xb4e92888, 0xdda93c9c
SortedData: .ds.l MAXN