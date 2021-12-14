@ Programa Delay
@ Archivo: delay.s
@ Nombre: Grecia Cortes Valenciano
@ Fecha: 13 diciembre 2021

@ Programa que imprime el Hola Mundo 10 veces

.data
	.balign 4	
hello:  .asciz "Hello World!\n\n"
seconds:
	.int	1		@ Igual a 1 segundo
microsec:
	.int	500000		@ Igual a 0.5 segundos
	
n	.req    r6              @ Inicializamos contador
max	.req	r5		@ Límite del contador

.text
	.global main
	.extern printf
	.extern sleep
	.extern usleep
	
main:   push 	{ip, lr}	

	mov	n, #0 @ Inicializamos contador
	mov	max, #10 @ Inicializamos el límite
	
@ Bucle para imprimir

loop:	cmp	n, max		
	bgt	done
  ldr 	r0, =hello
  bl 	printf		@ Imprime el mensaje

@	ldr	r0, =seconds
@	ldr	r0, [r0]
@	bl	sleep

	ldr	r0, =microsec
	ldr	r0, [r0]	
	bl	usleep
	
	add	n, #1		@ Igual a instrucción n++
	b	loop

done:	
        pop 	{ip, pc}
