@ Programa Stack
@ Archivo: stack.s
@ Fecha: 13 diciembre 2021
@ Nombre: Grecia Cortes Valenciano

@ Programa que realiza las funciones básicas de una pila en ensamblador

//.section // __TEXT, __text
.global main

main:
     mov   r0, #2   @ Asignación de valor en r0
     push  {r0}    @ Guardar valor en la pila
     mov   r0, #3  @ Asignación de valor
     pop   {r0}    @ Elimina el valor de la pila
     bx    lr      @ Salida de main
