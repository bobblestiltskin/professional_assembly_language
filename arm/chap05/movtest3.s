# movtest3.s – Another example of using indexed memory locations
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
main:
	nop
	mov	r4, #0
	ldr	r5, =endvalues
	ldr	r6, =values
loop:
	ldrb	r1, [r6], #datum_size
	ldr	r0, =output
	bl 	printf
	cmp	r6, r5
	bne	loop
        mov     r7, #1                  @ set r7 to 1 - the syscall for exit
        swi     0                       @ then invoke the syscall from linux

