	.data
npal:	.space	4
cadena:	.asciz	"Una?dos_= tres    ."


	.text

	ldr r0, =cadena
	mov r1, #0	@Contador
	mov r2, #0	@Estado
	mov r3, #0b100000	@Máscara mayus

buc:	ldrb r4, [r0]
	
	cmp r4, #0
	beq fin

	bic r4, r3
	cmp r4, #'A'
	blt otro
	cmp r4, #'Z'
	bgt otro

letra:	cmp r2, #0
	bne skip
	add r1, #1
skip:	mov r2, #1
	add r0, #1
	b buc	

otro:	mov r2, #0
	add r0, #1
	b buc

fin:	ldr r0, =npal
	str r1, [r0]
	wfi
