	.data
cap:	.ascii	"X"
numero:	.asciz	"19234281"


	.text

	ldr r0, =numero
	mov r2, #0	@Contador de longitud
	mov r5, #'X'	@Constante
	mov r6, #1	@Estado

length:	ldrb r1, [r0]
	cmp r1, #0
	beq next
	add r2, #1
	add r0, #1
	b length

next:	ldr r0, =numero
	ldr r1, =numero
	sub r2, #1
	add r1, r2

buc:	cmp r0, r1
	beq fin
	
	ldrb r3, [r0]
	ldrb r4, [r1]

	cmp r3, r4
	bne cosas

	add r0, #1
	cmp r0, r1
	beq fin

	sub r1, #1
	b buc

cosas:	strb r5, [r0]
	strb r5, [r1]
	add r0, #1
	cmp r0, r1
	beq fin
	sub r1, #1
	mov r6, #0
	b buc

fin:	cmp r6, #0
	beq no_es
	
	mov r0, #'S'
	b end

no_es:	mov r0, #'N'

end:	ldr r1, =cap
	strb r0, [r1]
	wfi
