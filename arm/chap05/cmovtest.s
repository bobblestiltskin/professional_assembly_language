# cmovtest.s - Find the largest value in a vector
.equ datum_size,2
.globl main
.section .rodata
output:
   .asciz "The largest value is %d\n"
.align 2
values:
   .hword 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
endvalues:
.align 2
.text
main:
	ldr	r3, =values		@ address of start of data
	ldr	r4, =endvalues		@ address of end of data
	ldrh	r1, [r3], #datum_size	@ store first data item at r1 - running highest
loop:
	ldrh	r2, [r3], #datum_size	@ store next data item at r2
	cmp	r2, r1			@ compare this item to highest
	movgt	r1, r2			@ if this item is greater save to highest
	cmp	r3, r4			@ compare current address to end of data
	bne	loop			@ if not equal restart loop

        ldr	r0, =output		@ load string
        bl	printf			@ and print

        mov	r7, #1			@ set r7 to 1 - the syscall for exit
        swi	0                       @ then invoke the syscall from linux

