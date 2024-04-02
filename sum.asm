;in this NASM code is shown addition of 3 and 5

section .data
section .text
global _start

_start:
    mov rax, 3 
    add rax, 5
    ret    
    syscall
