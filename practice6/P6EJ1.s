	.data
matriz:	.hword 1, 2, 3
	.hword 4, 5, 6
	.hword 7, 8, 9


	.text
main:	ldr r0, =matriz	@Parámetro
	mov r1, #3	@Parámetro
	bl cuadr	@Invocación de subprograma
	wfi

	@Subprograma
cuadr:	mov r3, #2	@Constante
	mul r3, r1	@Calcular posición en la matriz (half-words)
	add r3, #2
	
buc:	cmp r1, #0	@Ver si el contador es cero
	beq fin
	sub r1, #1	@Decrementar contador

	ldrh r2, [r0]	@Cargar el número
	mul r2, r2	@Calcular su cuadrado
	strh r2, [r0]	@Guardar el número

	add r0, r3	@Actualizar el puntero a la matriz
	b buc

fin:	mov pc, lr	@Volver al programa principal