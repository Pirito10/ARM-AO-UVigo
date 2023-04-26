	.data
findme:	.ascii	"estou?"
searchin:	.asciz	"estou:pois claro que estou."


	.text

	ldr r0, =findme
	ldr r1, =searchin
	mov r2, #0
	mov r5, #0

buc:	ldrb r3, [r0]
	cmp r3, #'?'
	beq si_es

	ldrb r4, [r1]
	cmp r4, #0
	beq no_es
	
	cmp r3, r4
	beq entrar
	mov r2, #0
	sub r0, r5
	mov r5, #0

next:	add r1, #1
	b buc

entrar:	mov r2, #1
	add r0, #1
	add r5, #1
	b next

si_es: 	mov r0, #1
	b fin
no_es:	mov r0, #0
fin:	wfi
