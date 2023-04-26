	.data
cad1:	.asciz	"Hola    mundo!!    "
cad2:	.space	cad2-cad1
	.balign 4
letras:	.space 4
removed:.space 4


	.text
main:	ldr r0, =cad1	@Dirección a leer
	ldr r1, =cad2	@Dirección a escribir
	mov r2, #0	@Contador letras
	mov r3, #0	@Contador espacios
	mov r5, #0	@Comprobador espacios
	
loop:	ldrb r4, [r0]	@Cargar el primer carácter
	cmp r4, #0	@Ver si es fin de cadena
	beq fin
	cmp r4, #'A'	@Ver si es menor de 'A'
	blt otro
	cmp r4, #'Z'	@Ver si es menor de 'Z'
	ble mayus
	cmp r4, #'a'	@Ver si es menor de 'a'
	blt otro
	cmp r4, #'z'	@Ver si es menor de 'z'
	ble minus

otro:	cmp r5, #1	@Ver si hubo espacio
	beq skip
	strb r4, [r1]	@Almacenar carácter
	add r1, r1, #1	@Actualizar puntero

skip:	add r0, #1	@Actualizar puntero
	cmp r4, #32	@Ver si vuelve a ser espacio
	beq spc
	mov r5, #0	@Marcar que no es espacio
	b loop

mayus:	add r4, #32	@Pasar a minus
	add r2, #1	@Incrementar contador de letras
	mov r5, #0	@Marcar que no es espacio
	b otro

minus:	sub r4, #32	@Pasar a mayus
	add r2, #1	@Incrementar contador de letras
	mov r5, #0	@Marcar que no es espacio
	b otro

spc:	add r3, #1	@Incrementar contador de espacios
	mov r5, #1	@Marcar que es espacio
	b loop

fin:	strb r4, [r1]	@Almacenar el 0 final
	ldr r0, =letras	@Cargar dirección
	str r2, [r0]	@Almacenar contador
	ldr r0, =removed@Cargar dirección
	str r3, [r0]	@Almacenar contador
	wfi