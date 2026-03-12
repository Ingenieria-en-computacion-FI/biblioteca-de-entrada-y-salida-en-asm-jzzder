SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

    ; TODO:
    ; registros
    push eax
    push ebx
    push ecx
    push edx
    ; 1. syscall read
    mov ecx, eax        ; ecx = dirección del buffer
    mov edx, ebx        ; tamaño max
    mov eax, 3          
    mov ebx, 0          
    int 0x80         
    ; 2. guardar en buffer
    add ecx, eax  
    ; 3. agregar terminador 0
    dec ecx             ; retroceder al último byte leído
    cmp byte [ecx], 0x0A ;  salto de línea?
    je  .poner_nulo     ; si es '\n', reemplazar
    inc ecx    
.poner_nulo:
    mov byte [ecx], 0   ; escribir '\0' al final

    ; restaurar registros
    pop edx
    pop ecx
    pop ebx
    pop eax

    mov esp, ebp
    pop ebp
    ret
