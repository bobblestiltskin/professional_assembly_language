	.global _start
	.section .rodata
@entry:  b _start                 @ Skip over the data
arr:    .byte 10, 15, 20, 25, 2   @ Read-only array of bytes
eoa:                              @ Address of end of array + 1
        .align 2
        .text
_start:
        ldr   r1, =arr          @ r1 = &arr
        ldr   r2, =eoa          @ r2 = &eoa
        mov   r0, #0            @ r0 = 0
loop:   ldrb  r3, [r1], #1      @ r3 = *r1++
        add   r0, r3, r0        @ r0 += r3
        cmp   r1, r2            @ if (r1 != r2)
        bne   loop              @    goto loop
	mov	r7, #1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux

