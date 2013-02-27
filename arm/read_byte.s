.section .rodata
universe:
	.byte 42
.text
	.global	_start
_start:
	ldr	r1, =universe	@ store the address of the start of the read-only data to r1
	ldrb	r0, [r1], #0	@ load the datum at the address stored in r1 to r0
				@ the value in r0 is returned as the exit status of the process
	mov	r7, #1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
