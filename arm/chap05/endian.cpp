@ swaptest.s – Converting big-endian to little-endian and vice-versa
@  In Arm V6 we can use the  rev instruction - but not supported here 

.globl _start
.section .data
vstart:
	.word 0x12345678
.text
_start:
	ldr	r1, =vstart
	ldr	r0, [r1]		@ load word to r0
#if ARCH >= 6
	rev	r0, r0
#else
	and	r2, r0, #0xff000000	@ load the top 2 bytes to r2
	and	r3, r0, #0x00ff0000	@ load the next 2 bytes to r3
	and	r4, r0, #0x0000ff00	@ load the next 2 bytes to r4
	and	r5, r0, #0x000000ff	@ load the bottom 2 bytes to r5
	mov	r0, r2, lsr #24		@ shift r2 bytes to bottom and store to r0
	orr	r0, r3, lsr #8		@ or the remaining shifted data
	orr	r0, r4, lsl #8
	orr	r0, r5, lsl #24
#endif
_stop:
	mov     r7, #1			@ set r7 to 1 - the syscall for exit
	swi     0			@ then invoke the syscall from linux

