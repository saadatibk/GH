section .data
    my_array dd 1,2,46,85,3
    value dd 7
    
section .text
    global _start

_start:
    mov rdi, my_array ; Load array pointer into RDI
    xor rax, rax 
    
loop_start:
    cmp rdi,value
    je loop_end
    add rdi,4
    jmp loop_start

loop_end:
    mov rax, rdi
    ret

not_found:
    ret -1
