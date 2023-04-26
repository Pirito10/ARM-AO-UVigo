	.data
numbcd:	.word	0x12345678

	.text
	mov r0, #0	@Destino
	ldr r1, =numbcd
	mov r2, #0	@Reg auxiliar
	mov r3, #0	@Estado
	mov r4, #28	@Desplazamiento
	mov r5, #8	@Contador

buc:	cmp r5, #0
	beq fin
	sub r5, #1

	ldrb r2, [r1]
	cmp r3, #0
	beq cero

uno:	lsr r2, #4
	mov r3, #0
	add r1, #1
	b skip

cero:	lsl r2, #28
	lsr r2, #28
	mov r3, #1

skip:	lsl r2, r4
	orr r0, r2

	sub r4, #4
	b buc

fin:	wfi
