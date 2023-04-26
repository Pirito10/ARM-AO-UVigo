	.data
ascii:	.space 4
num:	.hword	0xA30F


	.text

	ldr r0, =num
	mov r1, #0
	ldr r3, =ascii
	mov r4, #4

buc:	cmp r4, #0
	beq fin
	sub r4, #1

	ldrb r2, [r0]
	cmp r1, #0
	bne uno
	lsl r2, #28
	lsr r2, #28
	mov r1, #1
	b sigue

uno:	lsl r2, #24
	lsr r2, #28
	mov r1, #0
	add r0, #1

sigue:	cmp r2, #9
	ble nume
letra:	add r2, #55
	b skip
nume:	add r2, #48
	
skip:	strb r2, [r3]
	add r3, #1
	b buc

fin:	wfi
