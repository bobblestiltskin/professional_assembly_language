AS	:= /usr/bin/as
CC	:= /usr/bin/gcc
LD	:= /usr/bin/ld

ASOPTS	:= -gstabs
CCOPTS	:= 

bubble: bubble.s bubble_sub.s vprintw.s

test_vprintw: test_vprintw.s vprintw.s

test_vprintb: test_vprintb.s vprintb.s

swaptest2: swaptest2.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

swaptest1: swaptest1.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

endian: endian.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

movtest4: movtest4.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

movtest2: movtest2.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

movtest1: movtest1.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

sizetest3: sizetest3.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

sizetest2: sizetest2.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

sizetest1: sizetest1.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

%: %.s
	$(CC) $(ASOPTS) -o $@ $^

clean:
	-rm -f *.o bubble bubble_sub cmovtest swaptest1 swaptest2 movtest1 movtest2 movtest3 movtest4 pushpop sizetest1 sizetest2 sizetest3 endian test_vprintb test_vprintw
