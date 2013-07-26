# swaptest2.s - An example of the swp instruction
.section .data
data:
   .int 10
.text
.globl _start
_start:
	ldr	r4, =data	@ load address of data to r4
	mov	r5, #5		@ store literal 5 to r5
	swp	r0, r5, [r4]	@ load r0 from address r4 and store r5 to address r4

        mov     r7, #1          @ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux

