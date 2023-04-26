	.data
numero:	.asciz "12535645"
	.balign
numde5:	.space 4

	.text
main:	ldr r0, =numero	@posición de la cadena
	ldr r1, =numde5	@posición del resultado
	mov r2, #0	@contador a cero
bucle:	ldrb r3, [r0]	@se carga un número de la cadena
	cmp r3, #0	@se mira si es un cero (fin de cadena)
	beq fin		@se salta al final si lo es
	cmp r3, #53	@se compara con un "5" ASCII (53 en decimal)
	beq cinco	@se salta a incrementar el contador si lo es
sigue:	add r0, r0, #1	@se incrementa el puntero a la cadena
	b bucle		@se vuelve al inicio del bucle
cinco:	add r2, r2, #1	@se incrementa el contador
	b sigue		@se continúa el bucle
fin: 	str r2, [r1]	@se almacena el resultado
	wfi
	
