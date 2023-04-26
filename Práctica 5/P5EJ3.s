	.data
matriz:	.byte 0b10000000, 0b00000000
	.byte 0b01000000, 0b00000000
	.byte 0b00100000, 0b00000000
	.byte 0b00010000, 0b11111111

	.balign 4
fil:	.word 2
col:	.word 12
val:	.byte 1


	.text
	ldr r0, =fil	@Dirección de la fila
	ldr r1, =col	@Dirección de la columna
	ldr r2, =val	@Dirección del valor
	ldr r0, [r0]	@Cargar la fila
	ldr r1, [r1]	@Cargar la columna
	ldrb r2, [r2]	@Cargar el valor

	ldr r3, =matriz	@Puntero a la matriz
	add r3, r0	@Sumarle fila*2
	add r3, r0

	cmp r1, #8	@Ver si es columna derecha o izquierda
	blt skip
	add r3, #1	@Sumar uno si es fila derecha

skip:	ldrb r4, [r3]	@Cargar el byte seleccionado

	cmp r1, #8	@Ver si es columna derecha o izquierda
	blt next
	sub r1, #8	@Decrementar ocho si es fila derecha (desplazamiento 0-7)

next:	mov r5, #0b10000000	@Crear máscara
	lsr r5, r1	@Desplazar el bit lo necesario

	cmp r2, #0	@Ver si el valor es cero
	beq cero
	orr r4, r5	@Aplicar la máscara con un OR si es 1
	b fin

cero:	bic r4, r5	@Aplicar la máscara con un AND NOT si es 0

fin:	strb r4, [r3]	@Almacenar el resultado en la matriz
	wfi