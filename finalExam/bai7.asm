;bai7: tim so chan nho nhat trong day so
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap day so: $'
    msg2 db 10, 13, 'so chan nho nhat la: '
    space db 32,'$'
    min db 10
    
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap chuoi
loop_input:
    xor ax, ax
    mov ah, 1
    int 21h
    cmp al, 13
    je if
    jmp else_if
if:
    jmp continue
else_if:
    sub al, '0'
    test al, 01h
    jz if2
    jmp end_if
if2:      
    cmp al, min
    jle swap
    jmp end_if
    swap:
        mov min, al 
end_if:
    call space_ele
    jmp loop_input
continue:
    mov ah, 9
    lea dx, msg2
    int 21h
    
    xor dx, dx
    mov dl, min
    add dl, '0'
    mov ah, 2
    int 21h
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