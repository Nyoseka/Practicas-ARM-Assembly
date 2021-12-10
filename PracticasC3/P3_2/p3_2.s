.data
var1 : .asciz " %d\ n"
seed : .word 1
const1 : .word 1103515245
const2 : .word 12345

.text
.global main

@ Salvamos registros
main : push { r4, r5 }

@ Llamada a mysrand
mov r0, # 42
