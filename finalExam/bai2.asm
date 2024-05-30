;bai2: dem so ki tu khac nhau khi nhap 10 ki tu vao
.model small
.stack 100h
.data 
    msg1 db 10, 13, 'nhap 10 ki tu: $'
    msg2 db 10, 13, 'ket qua la: $'
    
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap ki tu
    xor cx, cx
    mov cl, 10
    loop_input: 
        mov ah, 1
        int 21h
        xor dx, dx
        mov dl, al
        push dx
        loop loop_input
    ;hien thi ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;solve
    
    
MAIN Endp
    solve proc
        ret
    solve endp
    
END MAIN