;bai 9: tim vi tri phan tu cuoi cung bang X trong mang neu co
;bai8: tim vi tri dau tien cua mang co gia tri bang X .
.model small
.stack 100h
.data
    msg0 db 10, 13, 'so phan tu cua mang: $'
    msg1 db 10, 13, 'nhap mang: $'
    msg2 db 10, 13, 'X bang: $'
    msg3 db 10, 13, 'Vi tri phan tu cuoi cung cua mang bang X la (theo chi so mang): $'
    msg4 db 10, 13, 'Khong co X trong mang $'
    space db 32,'$'
    arr db 100 dup(?)
    x db ?
    n db 0
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    lea dx, msg0
    call ngat_9
    
    ;nhap so phan tu cua mang
    mov ah, 1
    int 21h
    sub al, '0'
    mov n, al
    
    ;nhap mang 
    lea dx, msg1
    call ngat_9
    
    xor bx, bx
    lea si, arr + 2
    xor cx, cx
    mov cl, n
loop_input:
    mov ah, 1
    int 21h
    sub al, '0'
    mov [si + bx], al
    inc bx
    call space_ele
    loop loop_input

    ;nhap x
    lea dx, msg2
    call ngat_9
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov x, al
    
    ;search
    xor cx,cx
    mov cx, bx
    mov al, x
loop_search:
    cmp [si + bx], al
    je continue
    dec bx
    loop loop_search

not_search:
    lea dx, msg4
    call ngat_9
    jmp exit_programing
continue:
    ;hien thi thong bao ket qua
    lea dx, msg3
    call ngat_9
    mov dl, cl
    add dl, '0'
    mov ah, 2
    int 21h
    
exit_programing:
    mov ah, 4ch
    int 21h
MAIN Endp
    ngat_9 proc
        mov ah, 9
        int 21h
        ret
    ngat_9 endp
    
    space_ele proc
        lea dx, space
        mov ah, 9
        int 21h
        ret
    space_ele endp
END MAIN