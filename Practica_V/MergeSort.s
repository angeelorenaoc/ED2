	.global _start
	.equ MAXN, 200
	.text 
_start:
	LDR R12,=Data
	LDR R0,=SortedData 	//Dirección de la primera posición del arreglo de salida
	MOV R1, #0			//Valor de i
	LDR R2, =N
	LDR R7, [R2]
	LDR R2, [R2,#0]  		
	SUB R2, R2, #1 		//Valor de j que indica la longitud del arreglo menos 1
	LDR R6, [R12]	
	MOV SP, #0
	
Copia_Original:			//Copia de la entrada en la salida
	STR R6, [R0], #4
	LDR R6, [R12,#4]!
	SUBS R7, R7, #1
	BNE Copia_Original
	//Se actualizan nuevamente las direcciones de los arreglos
	LDR R0, =SortedData
	LDR R12, =C
	LDR R7, =N
	LDR R7, [R7]
	
BL MergeSort

finish:
	b finish

//Función que segmenta la lista
MergeSort:				
	PUSH {R8, LR} 			//Guardamos la siguiente posición para cuando se salga del llamado de la función
	CMP R1,R2 			// Comparación i==j
	BNE ELSE

	IF:
		POP {R8, LR}
		MOV PC,LR 		//Sale de la función porque no se puede partir más
	
	ELSE:
		ADD R3,R1,R2
		LSR R3, R3, #1 		//Se calcula el nuevo punto medio para el arreglo	
		PUSH {R2,R3} 		//Guarda el valor de j y  m
		MOV R2, R3			//Lleva el valor de m a j
		BL  MergeSort
		POP {R2,R3}			//Recupera el valor original de j y de m
		PUSH {R1,R3} 		//Guarda el valor de i y m
		MOV R1, R3			//Lleva m a i
		ADD R1, R1, #1		//m+1
		BL  MergeSort
		POP {R1, R3}		//Recupera el valor orginal de i y de m
		BL Fuse
		//Copia el arreglo C en la salida	
		Copia_C:				
			PUSH {R2}
			For:
				LDR R8, [R12], #4
				STR R8, [R0], #4
				SUBS R2, R2, #1
				BHS For
			//Recuperación de las direccciones de los arreglos 

			LDR R0, =SortedData
			LDR R12, =C
			POP {R2}
			
		POP {R8, LR} 
		MOV PC, LR

//Función que organiza los números
Fuse:
	PUSH {R4, R5, R6, R7, R8, R9}
	MOV R5, R1 					//Contador p
	MOV R6, R3 					//Contador q
	ADD R6, R6, #1
	MOV R7, R1 					//Contador r
	
	While:
		CMP R5, R3
		BGT COMP // p > m
		CMP R6, R2
		BGT COMP // q > j
		LDR R8, [R0, R5, LSL #2]	//s[p]
		LDR R9, [R0, R6, LSL #2]	//s[q]
		CMP R8, R9 					//s[p] < s[q]
		BGE ELSE_FUSE
		
		IF_FUSE:
			STR R8, [R12, R7, LSL #2] //Almacena el valor s[p] 
			ADD R5, R5, #1
			ADD R7, R7, #1
			B While
			
		ELSE_FUSE:
			STR R9, [R12, R7, LSL #2]//Almacena el valor s[q]
			ADD R6, R6, #1
			ADD R7, R7, #1
			B While
			
		COMP:			
		CMP R5, R3
		BGT While_2 // p > m
		
		While_1:
			CMP R5, R3
			BHI End_While // p > m
			LDR R8, [R0, R5, LSL #2]	//s[p]
			STR R8, [R12, R7, LSL #2]	//Almacena el valor s[p] 
			ADD R5, R5, #1
			ADD R7, R7, #1
			B While_1
		
		While_2:
			CMP R6, R2
			BHI End_While // q > j
			LDR R9, [R0, R6, LSL #2]	//s[q]
			STR R9, [R12, R7, LSL #2]	//Almacena el valor s[q]
			ADD R6, R6, #1
			ADD R7, R7, #1
			B While_2	
			
	End_While:
		POP {R4,R5,R6,R7,R8, R9}
		MOV PC,LR
	

	
.data

N:  		.dc.l 	10
//Data: 		.dc.l  0x9, 0x12, 0x4, 0x30, 0x22, 0x6, 0x43
Data: 		.dc.l   0x7c5b8d6a, 0x9c7e3d5f, 0x4b7a9c2e, 0x6f1d8c5a, 0x3e9a4b7d, 0x8f2c1b3e, 0x5d8e9a4b, 0x2e6f1d8c, 0x1b3e9a4b, 0x9c2e6f1d
					/*
					2.086.374.762 (10), -1.669.448.353 (3), 1.266.326.574(7), 1.864.207.450 (9), 1.050.299.261 (6), -1.892.934.850 (1), 1.569.626.699 (8), 779.033.996 (5), 457.087.563 (4),
					-1.674.678.499(2)
					*/
SortedData: .ds.l MAXN
C: 			.ds.l MAXN
	