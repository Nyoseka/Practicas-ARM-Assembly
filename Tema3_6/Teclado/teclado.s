@ Programa teclado
@ Archivo: teclado.s
@ Nombre: Grecia Cortes Valenciano
@ Fecha: 13 diciembre 2021

@ Programa que toma entradas del teclado y lo imprime en pantalla

.section	.bss
.comm buffer, 48	     @ Reserva 48 como valor de buffer

.section	.data
msg:
	.ascii	"** Greeter **\nPlease enter your name: "
msgLen = . - msg
msg2:
	.ascii	"Hello "
msg2Len = . - msg2

.section	.text
.global	_start
_start:

@ Imprime el primer mensaje

mov r0, $1		    
ldr r1, =msg
ldr r2, =msgLen
mov r7, $4
svc $0

@ Llamada a syscall

mov r7, $3		   
mov r0, $1		
ldr r1, =buffer
mov r2, $0x30
svc $0

@ Imprime el segundo mensaje

mov r0, $1		    
ldr r1, =msg2
ldr r2, =msg2Len
mov r7, $4
svc $0

@ Imprime la salida

mov r0, $1		    
ldr r1, =buffer
mov r2, $0x30
mov r7, $4
svc $0

@ Salida de syscall
mov r7, $1	            
svc $0		           
.end
