# this subroutine bubble sorts vectors of words
#
# inputs
#   r0 - start of vector
#   r1 - number of elements to sort
#
# no outputs
#
# locals
#   r4 - current pointer
#   r5 - inner counter
#   r6 - keep_going flag
#   r7 - first element
#   r8 - second element

	.equ datum_size,4
	.globl _bubble
	.align 2
        .text
_bubble:
	nop
        stmfd	sp!, {r4, r5, r6, r7, r8, lr}	@ save variables to stack
	cmp	r1, #1				@ number of elements must be > 1
	ble	end_outer			@ stop if nothing to do

        sub	r5, r1, #1			@ need n-1 comparisons
        mov	r4, r0				@ initialise current pointer
	mov	r6, #0				@ this register set when we swap

loop_start:
	nop
	ldr	r7, [r4], #datum_size		@ load one element
	ldr	r8, [r4]			@ and next one
	cmp	r7, r8				@ compare them
	ble	no_swap				@ branch if second greater

	mov	r6, #1				@ set keep_going flag
	sub	r4, r4, #datum_size		@ reset pointer to first element
	swp	r8, r8, [r4]			@ exchange value in r8 and address in r4
	str	r8, [r4, #datum_size]!		@ store new r8 to incremented address
no_swap:
	nop
	subs	r5, r5, #1			@ decrement counter
	bne	loop_start			@ and restart loop if more needed

end_inner:
	nop
	cmp	r6, #0				@ check keep_going flag
	beq	end_outer			@ and leave if not set

	mov	r6, #0				@ clear keep_going flag 
	mov	r4, r0				@ reset pointer
        sub     r5, r1, #1			@ reset counter
	b	loop_start			@ start another iteration

end_outer:
	nop
        ldmfd   sp!, {r4, r5, r6, r7, r8, pc}	@ restore state from stack and leave subroutime
