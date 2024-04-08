section .data
    my_array dd 1, 2, 4, 3, 5

section .text
global _start

_start:
    lea esi, [my_array] ;load my_array address to esi register
    mov edi, dword [esi] ; load first element of the array to edi register
    add esi, 4 ; move to the next element of the array

_loop:
    mov ecx, dword [esi] ;load next element to ecx 
    cmp ecx, edi ; compare element with max
    jle _not_greater  ; Jump if ecx <= edi
    mov edi, ecx ; otherwise update edi (max) with ecx (current element)

_not_greater:
    add esi, 4
    cmp esi, my_array + 20  ; checking if we reached end of the array (20 = 5 elem * 4 bytes)
    jl _loop  ; Jump if esi < end of array

;if we reached end of the array, then edi contains the max value

mov eax, edi             ; Move the maximum value to the return register

; Exit the program
mov edi, 0               ; Clear edi 
mov eax, 60              ; syscall number for exit
syscall                  ; Invoke syscall to exit