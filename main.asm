section .data
section .text
    global _start

_start:
    mov rax, 3
    add rax, 5
    ret    
    syscall