SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    ; TODO:
    ; preservar registros
    push eax
    push ebx
    push ecx
    push edx

    ; 1. calcular longitud
    mov ecx, eax        ; ecx = dirección de la cadena (para la syscall)
    mov edx, 0          ; contador de longitud = 0
    mov ebx, eax        ; ebx recorre la cadena

.loop:
    cmp byte [ebx], 0   ; es el final?
    je  .write          ; si es  0 ya terminamos de contar
    inc edx             ; longitud++
    inc ebx             ; avanzar al siguiente caracter
    jmp .loop
    ; 2. syscall write
.write:
    mov eax, 4          ; syscall write
    mov ebx, 1          ; stdout
    ; ecx ya tiene la dirección de la cadena
    ; edx ya tiene la longitud
    int 0x80

    ; restaurar registros
    pop edx
    pop ecx
    pop ebx
    pop eax

    mov esp, ebp
    pop ebp
    ret
