;bai23:swap hai phan tu trong mang cho truoc   
;ket qua: 1 2 3 5 4 6 7 8 9
.model small
.stack 100h
.data
    arr db 1,2,3,4,5,6,7,8,9
    msg1 db 10, 13, 'doi cho phan tu thu 3 voi phan tu thu 4$'
    msg2 db 10,13, 'mang la: $'
    space db 32, '$'
    
.code 
MAIN Proc
    
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;thuc hien dao vi tri phan tu 3 va phan tu 4
    lea si, arr 
    xor cx, cx
    mov cl, 9
    mov al, [si + 3]
    mov ah, [si + 4]
    mov [si + 3], ah
    mov [si + 4], al
    
    ;in ra ket qua
loop_for:
    xor dx, dx
    mov dl, [si]
    add dl, '0'
    mov ah, 2
    int 21h
    call space_ele
    inc si
    loop loop_for
exit_programing:
    mov ah, 4ch
    int 21h
MAIN Endp
    space_ele proc
        mov ah, 9
        lea dx, space
        int 21h
        ret
    space_ele endp
END MAIN
    