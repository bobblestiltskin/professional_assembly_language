# movtest1.s
@ An example of moving data from memory to a register
.globl main

.equ items,16
#.equ items,0
#.equ items,1
.equ datum_size,4
        .align 2
.section .rodata
before:
	.asciz "Before sorting, values are : %d" 
after:
	.asciz "After sorting,  values are : %d"
comma:
	.asciz ", %d"
new_line:
	.asciz "\n"
ok:
	.asciz "ok\n"
.section .data
values:
	.word 105, -7, 235, 61, 28, 315, 456, 63, 134, 97, 221, 53, 1000899, 145, 117, 5
evalues:
	.word 1, 2, 3

        .align 2
        .text
main:
	nop
	ldr	r0, =values
	mov	r1, #items
	ldr	r2, =before
	ldr	r3, =comma
	bl	_vprintw
	ldr	r0, =new_line
	bl 	printf
@	ldr	r0, =ok
@	bl 	printf

	ldr	r0, =values
	mov	r1, #items
	bl	_bubble
@	ldr	r0, =ok
@	bl 	printf

	ldr	r0, =values
	mov	r1, #items
	ldr	r2, =after
	ldr	r3, =comma
	bl	_vprintw
	ldr	r0, =new_line
	bl 	printf

	mov     r7, #1		@ set r7 to 1 - the syscall for exit
	swi     0		@ then invoke the syscall from linux
