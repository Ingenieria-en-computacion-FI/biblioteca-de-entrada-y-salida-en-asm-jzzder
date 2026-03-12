extern print_char
global newline

SECTION .text

newline:

    push ebp
    mov ebp, esp

    ; TODO:
    ; imprimir '\n'
    mov al, 0x0A    
    call print_char

    mov esp, ebp
    pop ebp
    ret
