SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char

; ---------------------------------
; scan_char
; Salida:
;   AL = caracter leído
; ---------------------------------

scan_char:

    push ebp
    mov ebp, esp

    ; TODO:
    ; 1. usar syscall read
    mov eax, 3          ; syscall read
    mov ebx, 0          ; leer desde stdin
    mov ecx, char_buffer ; dirección donde guardar el caracter
    mov edx, 1          ; leer solo 1 byte
    int 0x80            
    ; 2. leer 1 byte desde stdin
    mov al, [char_buffer] ; mover el byte leído a AL
    ; 3. devolverlo en AL
    mov esp, ebp
    pop ebp
    ret
