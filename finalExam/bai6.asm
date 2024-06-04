;bai6: ma hoa ceaser voi k = 1
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap chuoi: $'
    msg2 db 10, 13, 'Cyphertext: $'
    str db 256 dup('$')
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap chuoi
    mov ah, 10
    lea dx, str
    int 21h
    
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;encryption
    lea si, str + 2
    xor cx, cx
    mov cl, str + 1
encryption:
    xor dx, dx
    mov dl, [si]
    cmp dl, 32
    je print
    cmp dl, 'a'
    jge cypher_lower
    cmp dl, 'Z'
    jle cypher_upper   
    
cypher_lower:
    cmp dl, 'z'
    je if1
    jmp end_if
    if1:
       mov dl, 'a'
       jmp print

cypher_upper:
    cmp dl, 'Z'
    je if2
    jmp end_if
    if2:    
        mov dl, 'A'
        jmp print
end_if:
    add dl, 1
print:
    call print_char
    inc si 
    loop encryption
    
exit_programing:
    mov ah, 4ch
    int 21h
MAIN Endp
    print_char proc
        mov ah, 2
        int 21h
        ret
    print_char endp
END MAIN