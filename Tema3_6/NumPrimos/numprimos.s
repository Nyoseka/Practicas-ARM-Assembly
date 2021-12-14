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
mov r0, $2		@ First prime is 2
str r0, [r1]		@ Store this number in "prime"
ldr r0, =limit
ldr r9, [r0]		@ r2 holds number of primes to find
mov r3, $3		@ initialize N to 3
mov r4, $1		@ initialize J to 1

P2:			@ we come here when we have found a prime
add r4, r4, $1		@ increment J
str r3, [r1, #4]!	@ store N in "prime" (with writeback)

P3:
cmp r4, r9		@ check if we are done
bge P9			@ if so branch to p9

P4:
add r3, r3, $2		@ add 2 to N 

P5:			@ start checking divisors
ldr r6, =prime		@ copy pointer to start of "prime"
ldr r5, [r6]		@ load first divisor
mov r7, r3		@ copy N into R
mov r8, $0		@ initialize Q

P6:
cmp r7, r5		@ if R >= divisor
subge r7, r7, r5 	@ subtract divisor from R
addge r8, r8, $1	@ increment Q
bge P6			@ repeat
cmp r7, $0		@ if R == 0 ...
beq P4			@ N is not prime so try next N

P7:
cmp r8, r5		@ compare Q with divisor
ble P2			@ if Q <= divisor, N is prime

P8:
mov r7, r3		@ reset r7 to N
mov r8, $0		@ reset Q
ldr r5, [r6, #4]!	@ get next divisor
bal P6			@ divide again

P9:
mov r0, $1		@ choose stdout
mov r4, $0		@ use r4 as a temporary counter
mov r5, $0		@ r5 counts total primes printed
ldr r6, =prime		@ pointer to "prime"
ldr r3, [r6]		@ load first prime

printLoop:
bl print_num		@ function call
add r4, $1		@ add one to temp counter
add r5, $1		@ add one to counter
cmp r5, r9 		@ are we done?
bge exit		@ if so, exit
cmp r4, $9		@ after 10 primes ...
bgt newline		@ print a newline
ble space		@ add spaces

space:                  @ we jump here if
mov r0, $1              @ we are going to 
ldr r1, =spc		@ print spaces
ldr r2, =len	
mov r7, $4
svc $0
ldr r3, [r6, #4]!	@ load next prime
bal printLoop           @ continue printing

newline:                @ we jump here if
mov r0, $1              @ we are going to
ldr r1, =nl             @ print a newline
mov r2, $1
mov r7, $4
svc $0
ldr r3, [r6, #4]!       @ load next prime
mov r4, $0              @ reset temporary counter
bal printLoop		@ continue printing
