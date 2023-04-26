	.data
nunos:	.space 4
num:	.quad	0x02AF785E01B59B34


	.text

	ldr r0, =num
	ldr r0, [r0]
	mov r1, #0	@Contador resultado

buc1:	cmp r0, #0
	beq next
	
	lsr r0, #1
	bcc buc1
	add r1, #1
	b buc1

next:	ldr r0, =num
	ldr r0, [r0, #4]

buc2:	cmp r0, #0
	beq fin

	lsr r0, #1
	bcc buc2
	add r1, #1
	b buc2

fin:	ldr r0, =nunos
	str r1, [r0]
	wfi
