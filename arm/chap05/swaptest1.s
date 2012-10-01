# swaptest1.s - An example of the swp instruction
.section .data
data:
   .int 10
.text
.globl _start
	.align 2
_start:
	ldr	r4, =data	@ load address of data to r4
	mov	r5, #5		@ store literal 5 to r5
	swp	r5, r5, [r4]	@ exchange value in r5 and address in r4

	ldr	r0, [r4]	@ set exit code to stored datum
        mov     r7, #1          @ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux

