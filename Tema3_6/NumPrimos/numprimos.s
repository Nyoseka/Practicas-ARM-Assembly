@ Programa Numeros Primos
@ Archivo: numprimos.s
@ Nombre: Grecia Cortes Valenciano
@ Fecha: 14 diciembre 2021

@ Programa que imprime los 500 numeros primos

.bss
.comm prime, 2000 @ Espacio para los numeros

.data
spc: .ascii "  "
len = . - spc
nl: .ascii "\n"
limit: .long 500 

.text
.global	_start
_start:

P1:
ldr r1, =prime		
mov r0, $2		@ Toma al 2 como primer numero primo
str r0, [r1]		
ldr r0, =limit
ldr r9, [r0]		
mov r3, $3		
mov r4, $1		

P2:		
add r4, r4, $1		
str r3, [r1, #4]!	

P3:
cmp r4, r9		
bge P9			

P4:
add r3, r3, $2		

P5:			
ldr r6, =prime		
ldr r5, [r6]	@ Carga el primer divisor	
mov r7, r3		
mov r8, $0		@ Inicializa Q

P6:
cmp r7, r5		
subge r7, r7, r5 	
addge r8, r8, $1	@ Incrementa Q
bge P6			@ Repite el proceso
cmp r7, $0		
beq P4			@ Si el número no es primo, va a P4

P7:
cmp r8, r5		
ble P2			

P8:
mov r7, r3		
mov r8, $0		
ldr r5, [r6, #4]!	
bal P6			

P9:
mov r0, $1		
mov r4, $0		
mov r5, $0		
ldr r6, =prime	
ldr r3, [r6]		

@ Metodo para imprimir

printLoop:
bl print_num		
add r4, $1		
add r5, $1		
cmp r5, r9 		
bge exit		
cmp r4, $9		
bgt newline		
ble space		

@ Metodo para espacios
space:                 
mov r0, $1            
ldr r1, =spc		
ldr r2, =len	
mov r7, $4
svc $0
ldr r3, [r6, #4]!	
bal printLoop           

@ Metodo saltos de linea

newline:               
mov r0, $1             
ldr r1, =nl             
mov r2, $1
mov r7, $4
svc $0
ldr r3, [r6, #4]!       
mov r4, $0            
bal printLoop		@

@ Metodo para imprimir

print_num:
	stmfd sp!, {r0-r9, lr}	
	mov r4, $0 		
	mov r5, $1		

loop:			
	cmp r3, $9		
	ble stackPush		
	sub r3, r3, $10		
	add r4, r4, $1		
	bal loop		

stackPush:
	add r5, r5, $1		
	orr r0, r3, $0x30	
	stmfd	sp!, {r0}	
	cmp r4, $0		
	beq printChars		
	mov r3, r4		
	mov r4, $0		
	bal loop		

printChars:
	mov r1, sp		
	mov r0, $1		
	mov r2, $1		
	mov r7, $4		
	svc $0			
	subs r5, r5, $1		
	ble return		
	ldmfd sp!, {r0}		 
	bal printChars		
return:
	ldmfd sp!, {r0-r9, pc}	

@ Metodo salida
exit:
mov r0, $1			
ldr r1, =nl
mov r2, $1
mov r7, $4
svc $0
mov r7, $1			
svc $0

.end
