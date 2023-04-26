	
	.data
pal:	.space 1
frase:	.ascii "   ."

	.text
main:	ldr r0, =frase	@Dirección a leer
	mov r2, #0	@Contador de longitud de cadena
	mov r3, #0	@Comprobador letras
	mov r6, #0b00100000
	
length:	ldrb r1, [r0]	@Cargar primer carácter
	cmp r1, #46	@Ver si es un punto (fin de cadena)
	beq done
	add r2, #1	@Incrementar contador
	add r0, #1	@Actualizar puntero
	cmp r1, #32	@Ver si es un espacio
	beq skip
	mov r3, #1	@Marcar que existe al menos un carácter
skip:	b length

done:	cmp r3, #0	@Ver si son todo espacios	
	beq empty
	sub r2, #1	@Decrementar longitud de cadena (eliminar el punto)
	ldr r0, =frase	@Dirección inicio de cadena
	ldr r1, =frase	@Dirección fin de cadena
	add r1, r2

loop:	ldrb r3, [r0]	@Cargar primer carácter
	ldrb r4, [r1]	@Cargar último carácter

next1:	cmp r3, #32	@Comprobar si el primero es espacio
	beq spc1
	bic r3, r6	@Pasar a mayus
next2:	cmp r4, #32	@Comprobar si el último es espacio
	beq spc2
	bic r4, r6	@Pasar a mayus

	cmp r3, r4	@Ver si son el mismo carácter
	bne no_pal	@Terminar si no lo son
	cmp r0, r1	@Ver si los punteros son el mismo
	beq si_pal	@Terminar si lo son
	add r0, #1	@Actualizar el puntero al inicio de cadena
	cmp r0, r1	@Ver si los punteros son el mismo
	beq si_pal	@Terminar si lo son
	sub r1, #1	@Actualizar el puntero al final de cadena
	b loop

spc1:	add r0, #1	@Actualizar el puntero
	ldrb r3, [r0]	@Cargar siguiente carácter
	b next1
spc2:	sub r1, r1, #1	@Actualizar el puntero
	ldrb r4, [r1]	@Cargar siguiente carácter
	b next2

no_pal:	mov r0, #78	@Cargar el código de 'N'
	b fin
si_pal:	mov r0, #83	@Cargar el código de 'S'
	b fin
empty: 	mov r0, #86	@Cargar el código de 'V'
fin:	ldrb r1, =pal
	strb r0, [r1]
	wfi
