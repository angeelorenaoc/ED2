	.equ NMAX, 200
	.equ mas, 2//(¿Es mejor definir la macro?, o ¿Poner el número en el programa?)
.global _start
//Revisar lo del contador en el for par
_start:
	//Inicio del prorama:
	LDR R0, =N
	LDR R0, [R0]//Valor de i que indica la longitud del arreglo (¿Es necesario?)
	LDR R1, =Data //Dirección en la cual está data
	LDR R5,[R1]
	LDR R2, =OP //Dirección en la cual está el modo de ordenamiento.
	LDR R2,[R2]
	LDR R3, =SortedData //Dirección en la cual está el arreglo de resultados
	MOV R7, #1
	MOV R6, R0
	MOV R10, #0
	CMP R2, #1
	BEQ Copia
	
For_par://LLeva al arreglo de salida todos los números pares
	AND R4,R5,#1
	ADD R1 , R1, #4
	MOV R2, R5
	LDR R5, [R1]
	SUB R6, R6, #1 //Decremento del contador y actualización de las bandera
//	BEQ For_descendente_ext
	CMP R4, #0
	BNE For_par
	STR R2, [R3]
	ADD R3 , R3, #4
	ADD R10 , R10, #1
	CMP R6, #1
	BGE For_par
	LDR R3, =SortedData
//Organizar de forma descendente:
For_descendente_ext:
	CMP R7, R10
	BHS Endloop
	MOV R2, R3
	MOV R6, R3 
	LDR R4, [R2]
	MOV R8, R7
	ADD R7, R7, #1
	ADD R3, R3, #4
For_descendente_int:
	CMP R8, R10
	BHS For_descendente_ext
	ADD R8, R8, #1
	LDR R5, [R6, #4]!
	CMP R4, R5
	BGE For_descendente_int
	STR R5, [R2]
	STR R4, [R6]
	MOV R9, R5
	MOV R5, R4
	MOV R4, R9
	B For_descendente_int
	
Copia://Copia de la entrada en la salida
	STR R5, [R3], #4
	LDR R5, [R1,#4]!
	SUBS R6, R6, #1
	BNE Copia
	LDR R3, =SortedData//Podría volver a traer la dirreción en este punto?

//Organizar de forma ascendente:
For_ascendente_ext:
	CMP R7, R0
	BHS Endloop
	MOV R2, R3
	MOV R6, R3 
	LDR R4, [R2]
	MOV R8, R7
	ADD R7, R7, #1
	ADD R3, R3, #4
For_ascendente_int:
	CMP R8, R0
	BHS For_ascendente_ext
	ADD R8, R8, #1
	LDR R5, [R6, #4]!
	CMP R4, R5
	BLE For_ascendente_int
	STR R5, [R2]
	STR R4, [R6]
	MOV R9, R5
	MOV R5, R4
	MOV R4, R9
	B For_ascendente_int

Endloop: 
	B Endloop
	.data
/*Sección en la cual se encuntran los datos de entrada, que serán entregados el día de la presentación de la práctica*/
N: 			.DC.L 12 //Número que indica la longitud del arreglo
Data: 		.DC.L 0x3, 0x5, 0x4, 0xB, 0x6, 0x18, 0x123DC, 0x152, 0xDCA, 0x186, 0x15, 0xA45//Array con los valores a ordenar
OP:  		.DC.L 0x2 //Bandera que indica el tipo de ordenamiento.

SortedData: .DS.L NMAX //Vector en el que se guaradará la data ordenada.

	