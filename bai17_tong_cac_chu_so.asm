;bai17: tong cac chu so
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so: $'
    msg2 db 10, 13, 'tong cac chu so la: $'
    str db 256 dup('$')
    muoi dw 10
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so
    mov ah, 10
    lea dx, str
    int 21h
    
    ;hien thi thong bao2
    mov ah, 9
    lea dx, str
    int 21h
    
    ;tinh tong cac chu so
    xor ax, ax
    xor cx, cx
    lea si, str + 2
    mov cl, str + 1
loop_for:
    xor dx, dx
    mov dl,[si]
    sub dl, '0'
    add ax, dx
    inc dx
    inc si
    loop loop_for
     
    ;hien thi ket qua
    xor cx, cx
get_number:
    xor dx, dx
    div muoi
    add dx, '0'
    push dx       
    inc cx
    cmp ax, 0
    jne get_number  
    
    ;hien thi thong bao ket qua
    mov ah,9
    lea dx, msg2
    int 21h
        
print_result:    
    pop dx
    mov ah, 2
    int 21h
    loop print_result
    
exit_programing:
    mov ah, 4ch
    int 21h
MAIN Endp
END MAIN
