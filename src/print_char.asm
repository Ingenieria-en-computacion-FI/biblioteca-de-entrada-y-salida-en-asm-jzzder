SECTION .text
global print_char

; ---------------------------------
; print_char
; Entrada:
;   AL = caracter a imprimir
; ---------------------------------

print_char:

    push ebp
    mov ebp, esp

    ; TODO:
    ; 1. Guardar el caracter en memoria
    
    ; se reserva un espacio en la pila para guardar el caracter
    ; empujamos el registro EAX que es donde se contiene AL hacia la pila.
    push eax ; esto coloca el caracter en la memoria (apuntada por ESP).
    ; 2. Usar syscall write  

    mov eax, 4          ; vamos a escribir algo aqui
    mov ebx, 1          ; escribe en la salida estandar
    mov ecx, esp        ; La dirección del tope de la pila que es donde está nuestro char
    mov edx, 1          ; lngitud de 1 byte
    int 0x80            
    ; 3. Imprimir 1 byte
    ; write(fd=1, buffer, 1)


    ; limpiar la pila y restaurar el marco de trabajo
    add esp, 4          ; eliminar el caracter de la pila 

    mov esp, ebp
    pop ebp
    ret
