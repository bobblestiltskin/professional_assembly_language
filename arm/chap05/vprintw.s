# this subroutine prints vectors of words
#
# inputs
#   r0 - start of vector
#   r1 - number of elements to print
#   r2 - pointer to start of string used to print first element
#   r3 - pointer to start of string used to print subsequent elements
#
# no outputs
#
.globl _vprintw
.equ datum_size,4
.align 2
_vprintw:
	stmfd	sp!, {r4, r5, r6, r7, lr}	@ save registers on the stack
	cmp	r1, #0				@ exit if no elements
	ble	last
	mov	r4, r0				@ copy the parameters to locals
	mov	r5, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r1, [r4], #datum_size		@ load first vector element to r0 and bump pointer
	mov	r0, r6				@ address of first string to r0
	bl 	printf				@ and print itt
	nop
	subs	r5, r5, #1			@ decrement counter
	beq	last				@ and fall out if zero
vprintw_loop:
	ldr	r1, [r4], #datum_size		@ load next vector item to r0 and bump pointer
	mov	r0, r7				@ address of subsequent string to r0
	bl 	printf				@ and print it
	nop
	subs	r5, r5, #1			@ decrement counter
	bne	vprintw_loop			@ and loop if non-zero
last:

	ldmfd	sp!, {r4, r5, r6, r7, pc}	@ restore registers from stack and return
