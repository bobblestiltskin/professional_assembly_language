.equ datum_size,1
.globl main
.align 2
.section .rodata
output:
	.asciz "The value is %d\n"
values:
	.byte 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60
endvalues:
.align 2
.text
	nop
main:
	nop
	ldr	r0, =values
	mov	r1, #11
	ldr	r2, =output
	bl	_vprintb

        mov     r7, #1                  @ set r7 to 1 - the syscall for exit
        swi     0                       @ then invoke the syscall from linux
