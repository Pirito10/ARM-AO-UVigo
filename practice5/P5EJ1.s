	.data
num8:	.asciz "1234567"
	.balign 4
num:	.space 4


	.text
	ldr r0, =num8	@Cadena de números
	mov r1, #0	@Contador de cadena

			@Calcular longitud de cadena
length:	ldrb r2, [r0]	@Cargar un número
	cmp r2, #0	@Ver si es final de cadena
	beq next
	add r0, #1	@Actualizar puntero
	add r1, #1	@Incrementar contador
	b length

next:	ldr r0, =num8	@Puntero a la cadena
	sub r1, #1	@Evitar el 0 final
	add r0, r1	@Poner puntero al final de cadena

	add r1, #1	@Volver a establecer el contador
	mov r2, #0	@Desplazamiento
	mov r3, #0	@Almacenamiento de resultado

buc:	cmp r1, #0	@Ver si el contador llegó a cero
	beq fin

	ldrb r4, [r0]	@Cargar un número
	sub r4, #48	@Pasarlo a decimal
	lsl r4, r2	@Desplazar lo necesario
	orr r3, r4	@Introducir el número en el resultado

	sub r0, #1	@Actualizar puntero a cadena
	sub r1, #1	@Actualizar contador de cadena
	add r2, #3	@Actualizar cantidad de desplazamiento
	b buc

fin:	ldr r0, =num	@Puntero al destino
	str r3, [r0]	@Almacenar el resultado
	wfi