section .text
    global _start

_start:
    mov rdi, 20          ; Set the input number to 20
    call factorial     
    call exit_program

factorial:
    mov rax, 1           
    cmp rdi, 1           ; Check if input is 1
    jbe .factorial_done  ; If input is 1, jump to the end

    .factorial_loop:
        imul rax, rdi    
        dec rdi          
        cmp rdi, 1         ; Check if current number is 1
        jg .factorial_loop ; If current number > 1, repeat loop
    .factorial_done:
    ret

exit_program:
    xor rdi, rdi         ; exit code 0
    syscall
