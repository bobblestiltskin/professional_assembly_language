@ An example of moving register data to memory
        .global _start

.section .data
value: .byte 42
.text
_start:
        ldr	r1, =value
	mov	r0, #9
        strb	r0, [r1], #0		@store the byte at address r1 to r0
	add	r0, r0, r0
        ldrb    r0, [r1], #0    	@ load the byte at address r1 to r0
        mov     r7, #1			@ set r7 to 1 - the syscall for exit
        swi     0                       @ then invoke the syscall from linux

