section .data
    array dw 1, 2, 3, 4, 5      
    sum dw 0                    

section .text
    global _start

_start:
    mov esi, array              ; using esi register to start the array sum
    xor ax, ax                  ; clear ax register
    
sum_loop:
    add ax, [esi]               
    add esi, 4                  ; move to the next element (each element is 4 bytes)
    loop sum_loop               
    
    mov [sum], ax               ; Store the final sum 
    mov eax, 1                  ; Exit system call number
    xor ebx, ebx                ; Exit code 0
    int 0x80                    ; Call kernel
