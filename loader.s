	global loader 		; entry symbol for the program to load
	; constants definitions
	MAGIC_NUMBER equ 0x1BADB002 
	FLAGS equ 0x0
	CHECKSUM equ -MAGIC_NUMBER
	KERNEL_STACK_SIZE equ 4096
	
	align 4 		; align variables into memory locations that are divisible by 4, this is done for perfomance and something else that I should research lol
; I think it's because how x86 stack works, the reserved space for any type is always a word ( 4 Bytes )
	
	section .text:
	

	; variable definitions
	dd MAGIC_NUMBER
	dd FLAGS
	dd CHECKSUM

	section .bss:
	mov esp, kernel_stack + KERNEL_STACK_SIZE
	
kernel_stack:
	resb KERNEL_STACK_SIZE
	

loader:
	mov eax, 0xBADC0FFE
	
.loop:
	jmp .loop
	
	
