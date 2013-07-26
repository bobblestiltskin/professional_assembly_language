.section	.rodata
#	.align	2
string:
	.asciz "Sum of %d and %d is %d\n"
.text
#	.align	2
	.global	main
	.type	main, %function
main:
	stmfd	sp!, {lr}	@ stash link register on stack
	ldr	r0, =string	@ store address of start of string to r0
	mov	r1, #1		@ then each parameter to subsequent registers
	mov	r2, #41
	mov	r3, #42
	bl	printf		@ call the c function to display information
	ldmfd	sp!, {pc}	@ retrieve stashed link register to program counter
	mov	r7, #1		@ set r7 to 1 - the syscall for exit
	swi	0		@ then invoke the syscall from linux
