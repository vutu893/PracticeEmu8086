;bai3; tinh trung binh cong cua mot mang
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap mang: $'
    msg2 db 10, 13, 'trung binh cong la; $'
    space db 32, '$'
    n db 10
    muoi dw 10
    sum db 0
.code 
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap mang
    xor cx,cx
    mov cl, n
loop_input:
    mov ah, 1
    int 21h
    sub al, '0'
    
if: 
    test al, 01h
    jnz tong
    
else_if:
    call space_ele
    jmp loop_input
    
tong:
    add sum, al
    call space_ele
    dec cx
    cmp cx, 0
    jne loop_input
    
    ;hien thi ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;tinh trung binh cong
    xor ax, ax
    mov al, sum
    div n
    
    mov ah, 00h
loop_push:
    xor dx, dx
    div muoi
    add dx, '0'
    push dx
    inc cx
    cmp ax, 0
    jne loop_push
    
print_result:
    pop dx
    mov ah, 2
    int 21h
    loop print_result
    
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