	.data
npares:	.space 4
nmult8:	.space 4
nums:	.hword 3, 8, 34, 12324, -24, 0


	.text
	ldr r0, =nums	@Puntero a la lista
	mov r1, #0	@Contador de pares
	mov r2, #0	@Contador de múltiplo de 8
	mov r3, #0b1	@Máscara de pares
	mov r4, #0b111	@Máscara de múltiplo de 8

loop:	ldrh r5, [r0]	@Cargar un número
	cmp r5, #0	@Ver si es 0 fin de cadena
	beq fin

	tst r5, r4	@Aplicar máscara y comprobar
	bne not_m
	add r1, #1	@Incrementar contador de pares
	add r2, #1	@Incrementar contador de múltiplo de 8
	b next

not_m:	tst r5, r3	@Aplicar máscara y comprobar
	bne next
	add r1, #1	@Incrementar contador de pares
	
next:	add r0, #2	@Actualizar puntero
	b loop

fin:	ldr r0, =npares	@Puntero al destino
	str r1, [r0]	@Almacenar resultado
	ldr r0, =nmult8	@Puntero al destino
	str r2, [r0]	@Almacenar resultado
	wfi