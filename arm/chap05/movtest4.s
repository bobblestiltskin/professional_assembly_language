# movtest4.s – An example of indirect addressing
.equ datum_size,1
.globl _start
.align 2
.section .data
values:
   .byte 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60
.text
.align 2
_start:
	ldr	r4, =values
	mov	r5, #100
	strb	r5, [r4, #datum_size]!	@ write back the incremented data pointer
	ldrb	r0, [r4]		@ load that value to r0 for return to OS
        mov     r7, #1			@ set r7 to 1 - the syscall for exit
        swi     0                       @ then invoke the syscall from linux

