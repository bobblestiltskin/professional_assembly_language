	.global	_start
_start:
	mov	r0, #42		@ the value in r0 is returned as the exit status of the process
	mov	r7, #1		@ set r7 to 1 - the syscall for exit
				@ calls listed in /usr/include/asm/unistd.h
	swi	0		@ then invoke the syscall from linux
