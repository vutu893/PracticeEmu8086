;bai20: nhap 1 mang roi hien thi cac phan tu trong mang
.model small
.stack 100h
.data
    msg1 db 10, 13, 'so phan tu cua mang: $'
    msg2 db 10, 13, 'nhap cac phan tu cua mang: $'
    msg3 db 10, 13, 'mang vua nhap la: $'
    space db 32, '$'
    n db ? 
    index db 0
    arr db 100 dup(?)
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so phan tu mang vao bien n
    mov ah, 1
    int 21h
    sub al, '0'    
    mov n, al
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;nhap mang
    xor cx, cx
    lea si, arr
    mov cl, n
    xor bx, bx
    mov bl, n
loop_for:
    call input
    sub al, '0'
    mov [si], al
    call space_perform
    inc si
    loop loop_for
    
    ;hien thi mang
    sub si, bx
    xor bx, bx
    
    mov ah, 9
    lea dx, msg3
    int 21h 
    
    xor cx, cx
    mov cl, n
    
print_ele:
    xor dx, dx
    mov dl, [si]
    inc si
    add dl, '0'
    mov ah, 2
    int 21h
    call space_perform
    loop print_ele
exit_programing:
    mov ah, 4ch
    int 21h
    
MAIN Endp
    input proc
        mov ah, 1
        int 21h
        ret
    input endp 
    
    space_perform proc
        mov ah, 9
        lea dx, space
        int 21h
        ret
    space_perform endp
END MAIN