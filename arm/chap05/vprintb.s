# this subroutine prints vectors of bytes
#
# inputs
#   r0 - start of vector
#   r1 - number of elements to print
#   r2 - pointer to start of string used to print each element
#
# no outputs
#
.globl _vprintb
.equ datum_size,1
.align 2
_vprintb:
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
vprintb_loop:
	ldrb	r1, [r4], #datum_size
	mov	r0, r6
	bl 	printf
	nop
	subs	r5, r5, #1
	bne	vprintb_loop

	ldmfd	sp!, {r4, r5, r6, pc}
