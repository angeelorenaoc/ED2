.global _start
	.equ MAXN, 200
	.text 
_start:
	LDR R0,=SortedData 	//Dirección de la primera posición del arreglo de salida
	LDR R12,=SortedData
	MOV R1, #0				//Valor de i
	LDR R2, =N
	LDR R2, [R2], #-1  		//Valor de j que indica la longitud del arreglo menos 1
	
/*Copia:					//Copia de la entrada en la salida
	STR R6, [R0], #4
	LDR R6, [R5,#4]!
	SUBS R7, R7, #1
	BNE Copia
	LDR R0, =SortedData*/
	

finish:
	b finish

MergeSort:				//Función que segmenta la lista
	PUSH {LR} 			//Guardamos la siguiente posición para cuando se salga del llamado de la función
	CMP R1,R2 			// Comparación i==j
	BNE ELSE
	ADD R3,R1,R2
	LSR R3, R3, #1 		//Se cálcula el nuevo punto medio para el arreglo
	
	IF:
		MOV PC,LR 		//Sale de la función porque no se puede partir más
	ELSE:
		PUSH {R2,LR} 	//Guarda el valor de j y lo reemplza por m
		MOV R2, R3
		BL  MergeSort
		MOV R3, R2 		//Recupera el valor original de m
		POP {R2, LR}	//Recupera el valor original de j
		ADD R4, R3, #1 	//Cálcula m+1
		PUSH {R1, LR} 	//Guarda el valor de i y lo reemplaza por m
		MOV R1, R4		
		BL  MergeSort
		POP {R1,LR}		//Recupera el valor orginal de i
		BL Fuse
		

Fuse://Función que organiza los números
	While:
		MOV R5, R1 					//Contador p
		ADD R4, R3, #1
		MOV R6, R4 					//Contador q
		MOV R7, R1 					//Contador r
		CMP R5, R3
		BGT End_While //While 2?
		CMP R4, R2
		BGT End_While //While 2?
		LDR R8, [R0, R5, LSL #2]	//s[p]
		LDR R9, [R0, R6, LSL #2]	//s[q]
		CMP R8, R9 					//s[p] < s[q]
		BGE ELSE_FUSE
		IF_FUSE:
		
		ELSE_FUSE:
		
		
	End_While:
		MOV PC,LR
		
	//While 2?
	
.data

N:  		.dc.l 10
Data: 		.dc.l 0x01226a27, 0xb7bc3585, 0xd33eba1d, 0x08563ea1, 0x41129fe2, 0xf716aedb, 0x2e281c6a, 0x4c27210a, 0xb4e92888, 0xdda93c9c
SortedData: .ds.l MAXN