	.data
findme:	.asciz 	"ama"
string:	.asciz	" amama ama"


	.text
main:	mov r4, #0
	mov r5, #0

loop:	ldr r0, =findme
	ldr r1, =string
	add r1, r5

	bl search

	cmp r3, #0
	beq skip

	cmp r3, #1
	bne fin
	add r4, #1

skip:	add r5, #1
	b loop

fin:	mov r0, r4
	wfi

	@Subprograma
search:	ldrb r2, [r0]
	cmp r2, #0
	beq empty

	ldrb r3, [r1]
	cmp r3, #0
	beq empty

buc:	ldrb r2, [r0]
	cmp r2, #0
	beq si_es

	ldrb r3, [r1]
	cmp r2, #0
	beq no_es

	cmp r2, r3
	beq equal

no_es:	mov r3, #0
	b end

equal:	add r0, #1
	add r1, #1
	b buc

si_es:	mov r3, #1
	b end
	
empty:	mov r3, #0
	sub r3, #1

end:	mov pc, lr
