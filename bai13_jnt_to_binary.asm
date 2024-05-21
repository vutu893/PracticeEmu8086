;bai12: chuyen tu so he thap phan sang nhi phan
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so: $'
    msg2 db 10, 13, 'so he nhi phan la: $'
    var dw ?
    str db 256 dup('$')
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;thong bao nhap so
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so
    mov ah, 10
    lea dx, str
    int 21h
    
    ;chuyen doi chuoi so sang so nguyen
    xor bx, bx
    xor cx, cx
    lea si, str + 2
    mov cl, str + 1
    xor dx, dx
loop_for:
    xor ax, ax
    mov al, 10
    mul bx
    mov dl, [si]
    sub dl, '0'
    add ax, dx
    mov bx, ax
    inc si
    loop loop_for
    
end_loop:
    mov var, bx
    mov ax, var
    mov bx, 0002h 
    xor cx, cx
loop_divive:
    xor dx, dx
    div bx
    add dx, '0'
    push dx
    inc cx
    cmp ax, 0
    jne loop_divive
    
    ;hien thi thong bao ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
printresult:
    pop dx
    mov ah, 2
    int 21h
    loop printresult
    
exitprograming:
    mov ah, 4ch
    int 21h
MAIN Endp
END MAIN