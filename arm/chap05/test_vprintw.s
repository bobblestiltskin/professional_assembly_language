.equ datum_size,4
.globl main
.section .rodata
first:
	.asciz "Vector of words - values : %d"
subsequent:
	.asciz ", %d"
final:
	.asciz "\n"
values:
	.word 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60
endvalues:
.text
main:
	ldr	r0, =values
	mov	r1, #11
	ldr	r2, =first
	ldr	r3, =subsequent
	bl	_vprintw
	ldr	r0, =final
	bl	printf

        mov     r7, #1                  @ set r7 to 1 - the syscall for exit
        swi     0                       @ then invoke the syscall from linux
