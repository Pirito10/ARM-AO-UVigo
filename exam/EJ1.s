	.data
cadena:	.ascii "& ep2 : ! aprObAdo 3?"

	.text
	ldr r0, =cadena
	mov r1, #0	@Contador
	
buc:	ldrb r2, [r0]
	cmp r2, #'?'
	beq fin
	cmp r2, #'0'
	blt no_es
	cmp r2, #'9'
	ble si_es
	cmp r2, #'A'
	blt no_es
	cmp r2, #'Z'
	ble si_es
	cmp r2, #'a'
	blt no_es
	cmp r2, #'z'
	bgt no_es

si_es:	add r1, #1

no_es:	add r0, #1
	b buc

fin:	mov r0, r1
	wfi
