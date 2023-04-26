	.data
cap:	.ascii "X"
numero:	.asciz "12321"


	.text

	ldr r0, =numero
	mov r1, #0

length:	ldrb r2, [r0]
	cmp r2, #0
	beq next
	add r1, #1
	add r0, #1
	b length

next:	cmp r1, #0
	beq vacio

	ldr r0, =numero
	sub r1, #1
	ldr r2, =numero
	add r2, r1

buc:	cmp r0, r2
	beq si_es

	ldrb r3, [r0]
	ldrb r4, [r2]

	cmp r3, r4
	bne no_es

	add r0, #1
	cmp r0, r2
	beq si_es

	sub r2, #1
	b buc

si_es:	mov r0, #'S'
	b fin

no_es:	mov r0, #'N'
	b fin

vacio:	mov r0, #'V'

fin: 	ldr r1, =cap
	str r0, [r1]
	wfi
	
