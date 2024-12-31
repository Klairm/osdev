global loader          ; Entry point for the loader
extern sum             

; Constants
MAGIC_NUMBER      equ 0x1BADB002
FLAGS             equ 0x0
CHECKSUM          equ -(MAGIC_NUMBER + FLAGS)
KERNEL_STACK_SIZE equ 4096

section .multiboot
align 4  			; align variables into memory locations that are divisible by 4, this is done for perfomance and something else that I should research lol 
; I think it's because how x86 stack works, the reserved space for any type is always a word ( 4 Bytes )
	
dd MAGIC_NUMBER
dd FLAGS
dd CHECKSUM

section .text
align 4
loader:
    ; Set up the stack
    mov esp, kernel_stack + KERNEL_STACK_SIZE


    push dword 2
    push dword 2
    call sum

.loop:
    jmp .loop

section .bss
align 4
kernel_stack:
    resb KERNEL_STACK_SIZE  ; Reserve space for the stack
	
