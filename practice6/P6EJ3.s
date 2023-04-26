	.data
nums:	.word 5, 4, 3, 1, 2, 2, -1, -2, 0


	.text
main:	ldr r0, =nums	
	mov r4, #0	@Offset en la lista

loop:	bl menor	@Llamada a subrutina

	ldr r1, [r0]	@Cargar el menor número
	cmp r1, #0	@Ver si es cero
	beq end
	
	ldr r2, =nums	@Cargar la dirección a la lista
	ldr r2, [r2, r4]	@Cargar el primer número de la lista sin ordenar

	str r2, [r0]	@Guardarlo en la posición del menor
	ldr r2, =nums	@Cargar inicio de lista
	str r1, [r2, r4]	@Guardar menor número al principio de la lista sin ordenar

	add r4, #4	@Incrementar el offset
	ldr r0, =nums	@Cargar puntero a la lista
	add r0, r4	@Apuntarlo al comienzo de la lista sin ordenar

	b loop

end:	wfi
	
	@Subprograma
menor:	mov r3, r0	@Dirección inicial

	ldr r2, [r0]	@Cargar el primer número
	cmp r2, #0	@Ver si es cero
	beq fin
	add r0, #4	@Actualizar puntero
	
buc:	ldr r1, [r0]	@Cargar un número
	cmp r1, #0	@Ver si es cero
	beq fin

	cmp r1, r2	@Ver cuál es menor
	bge skip
	mov r2, r1	@Sustituírlo
	mov r3, r0	@Guardar su dirección
skip:	add r0, #4	@Actualizar puntero
	b buc

fin:	mov r0, r3	@Copiar resultado
	mov pc, lr	@Retornar
