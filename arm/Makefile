AS := /usr/bin/as
LD := /usr/bin/ld

ASOPTS := -gstabs

%: %.s
	$(AS) $(ASOPTS) -o $@.o $^
	$(LD) -o $@ $@.o

clean:
	-rm -f *.o syscall read_byte printf
