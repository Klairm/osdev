LDFLAGS = -T link.ld -melf_i386
OBJS = loader.o kmain.o
AS = nasm
ASFLAGS = -f elf32
CC = gcc
CFLAGS = -m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -Wall -Wextra -Werror
SRC = src/*.c

all: kernel.elf

build: loader
	$(CC) $(CFLAGS) -c $(SRC)  -o kmain.o

clean:
	rm -rf *.o *.elf
$(OBJS): build

loader: loader.s
	$(AS) $(ASFLAGS) loader.s

kernel.elf: $(OBJS)
	ld $(LDFLAGS) $(OBJS) -o kernel.elf

run:
	qemu-system-i386 -d cpu -D log -kernel kernel.elf 



