;bai19: sap xep tu be den lon
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Nhap so phan tu cua mang: $'
    msg2 db 10, 13, 'Nhap mang: $'
    msg3 db 10, 13, 'Mang sau khi sap xep tu be den lon la: $'
    space db 32, '$'
    n db 0
    i db 0
    j db 0
    arr db 100 dup(?)
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;nhap thong bao 1
    lea dx, msg1
    call ngat_9
    
    ;nhap so phan tu
    mov ah, 1
    int 21h
    
    sub al, '0'
    mov n, al
    
    ;nhap mang
    xor cx, cx
    mov cl, n 
    xor bx,bx
    lea si, arr
    lea di, arr
loop_input:
    mov ah, 1
    int 21h
    sub al, '0'
    mov dl, al
    mov [si + bx], dl
    inc bx
    call space_ele
    loop loop_input

    ;soft
    lea dx, msg3
    call ngat_9
    
    mov al, n
    mov j, al
    mov i, al
    xor bx, bx
loop_for1:
    xor ax, ax
    xor dx, dx
    
    
    
exit_programming:
    mov ah, 4ch
    int 21h
MAIN Endp
    ngat_9 proc
        mov ah, 9
        int 21h
        ret
    ngat_9 endp
    space_ele proc
        mov ah, 9
        lea dx,space
        int 21h
        ret
    space_ele endp
END MAIN