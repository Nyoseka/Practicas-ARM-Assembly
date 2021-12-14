@ Practica Cap 4
@ Archivo: p4.s
@ Nombre: Grecia Cortes Valenciano
@ Fecha: 13 de diciembre 2021

@ Programa que imprime Hola Mundo, único ejercicio básico del cuadernillo
.data
cadena : .asciz " Hola Mundo !\ n "
cadenafin :

.text
.global main

main : push { r7, lr }
mov r0, # 1 @ Salida
ldr r1, = cadena @ Enviamos cadena
mov r2, # cadenafin - cadena 
mov r7, # 4 
swi #0 @ Llamada a función write
mov r0, # 0 
pop { r7, lr } @ Recuperar registros
bx lr @ Salida de main
