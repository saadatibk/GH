section .data
    my_array dd 1,2,46,85,3 
    value dd 46
    
section .text
    global _start

_start:
    mov rdi, my_array ; Load array pointer into RDI
    xor rax, rax ; Clear RAX register, where will be stored the result
    
loop_start:
    cmp rdi,value ; compare the value with an element of the array
    je loop_end ; if value if found, the exit the loop
    add rdi,4 ; move to the next element of the array
    jmp loop_start ;continue loop

loop_end:
    mov rax, rdi ; store result in RAX
    ret

not_found:
    ret -1 ; if not fount, return -1
