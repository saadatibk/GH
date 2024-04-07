  section .text
global is_sorted

; Function to check if an array is sorted
; Input:
;   rdi - Pointer to the beginning of the array
;   rsi - Size of the array
; Output:
;   rax - Boolean value (0 for false, 1 for true)
is_sorted:
    cmp     rsi, 1               ; Check if size <= 1
    jbe     .sorted              ; If true, array is sorted
    
    xor     rax, rax             ; Set return value to false (0)
    mov     rcx, rsi             ; Load size of the array into rcx
    
.loop:
    mov     rdx, [rdi]           ; Load current element into rdx
    add     rdi, 4               ; Move to the next element (assuming each element is 4 bytes)
    cmp     rdx, [rdi]           ; Compare current element with the next element
    jle     .continue_loop       ; If current element <= next element, continue loop
    jmp     .exit                ; Otherwise, array is not sorted
    
.continue_loop:
    loop    .loop                ; Decrement rcx and continue loop if rcx > 0
    
.sorted:
    mov     rax, 1               ; Set return value to true (1)
    ret                           ; Return
    
.exit:
    ret                           ; Return

    
