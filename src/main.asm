%include "../include/io.inc"

global _start

SECTION .data

; mensajes para pedir datos
msg_int    db "Ingrese un numero:",10,0
msg_char   db "Ingrese un caracter:",10,0
msg_str    db "Ingrese una cadena:",10,0
; mostrar resultados
msg_result  db "Resultados:",10,0
lbl_char    db "Caracter: ",0
lbl_numero  db "Numero: ",0
lbl_cadena  db "Cadena: ",0

SECTION .bss

buffer resb 64

SECTION .text

_start:

    ; -------------------------
    ; pedir entero
    ; -------------------------

    mov eax, msg_int
    call print_string

    call scan_int
    push eax                ; guardar numero en la pila

    ; -------------------------
    ; pedir caracter
    ; -------------------------

    mov eax, msg_char
    call print_string

    call scan_char          
    push eax                ; guardar caracter en la pila
    call scan_char         

    ; -------------------------
    ; pedir cadena
    ; -------------------------

    mov eax, msg_str
    call print_string

    mov eax, buffer
    mov ebx, 64
    call scan_string

    ; -------------------------
    ; mostrar resultados (de forma ordenada)
    ; -------------------------

    mov eax, msg_result
    call print_string

    mov eax, lbl_char
    call print_string
    pop eax                 
    call print_char
    call newline

    mov eax, lbl_numero
    call print_string
    pop eax                
    call print_int

    mov eax, lbl_cadena
    call print_string
    mov eax, buffer
    call print_string
    call newline

    ; -------------------------
    ; salir
    ; -------------------------
    mov eax, 1
    xor ebx, ebx
    int 0x80