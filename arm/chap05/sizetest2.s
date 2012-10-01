# sizetest2.s - A sample program to view the executable size
.section .bss
   .lcomm buffer, 10000
.section .text
.globl _start
_start:
        mov     r0, #0          @ set exit code to 0
        mov     r7, #1          @ set r7 to 1 - the syscall for exit
        swi     0               @ then invoke the syscall from linux
