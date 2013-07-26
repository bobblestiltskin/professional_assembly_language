# movtest1.s
@ An example of moving data from memory to a register
        .global _start

.section .rodata
value: .byte 42

        .text
_start:
	ldr	r1, =value
	ldrb	r0, [r1], #1	@ load the byte at address r1 to r0
	mov     r7, #1		@ set r7 to 1 - the syscall for exit
	swi     0		@ then invoke the syscall from linux
