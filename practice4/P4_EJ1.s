	
	.data
cad1:	.asciz	"Hola mundo!!"
cad2:	.space	cad2-cad1


	.text
main:	ldr r0, =cad1	@Dirección cadena original
	ldr r1, =cad2	@Dirección cadena resultado

buc:	ldrb r2, [r0]	@Cargar byte de la cadena
	cmp r2, #0	@Ver si es fin de cadena
	beq fin

	cmp r2, #122	@Ver si es mayor a 122 (código de la z)
	bgt sigue
	cmp r2, #97	@Ver si es menor a 97 (código de la a)
	blt sigue
	sub r2, #32	@Pasar a mayus
	b sigue

sigue:	strb r2, [r1]	@Almacenar en la cadena resultado
	add r0, #1	@Actualizar punteros a las cadenas
	add r1, #1
	b buc

fin: 	strb r2, [r0]	@Almacenar el 0 final
	wfi
