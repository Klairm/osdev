LDFLAGS = -T link.ld -melf_i386
OBJS = loader.o
AS = nasm
ASFLAGS = -f elf32


all: build kernel.elf

build: loader.s
	$(AS) $(ASFLAGS) loader.s

kernel.elf: $(OBJS)
	ld $(LDFLAGS) $(OBJS) -o kernel.elf

run:
	qemu-system-i386 -d cpu -D log -kernel kernel.elf 



