.global _ start
	.equ MAXN, 200
	.text
_ start:
	/* Inicio de Programa:
	 * Inicialización de registros y lectura de valores requeridos desde la memoria
	 */
	 
	/* Cuerpo del programa:
	 * Código principal ( *opcional* y subrutinas y llamados a subrutinas desde eI código
	 * principal) para realizar la operación dada por OP sobre los datos en memoria
	 */
	 
	/* Fin de Programa:
	 * Bucle infinito para evitar la búsqueda de nuevas instrucciones
	 */
finish:
	b finish

.data
N: 			.dc.l 	12
Data: 		.dc.l 	1,15, -79,35 ,16, -564 ,8542 , -89542 , 12921,54215 ,12, -35
OP: 		.dc.l 	1
SortedData: .ds.l 	MAXN