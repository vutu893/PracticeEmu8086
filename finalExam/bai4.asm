;bai4: tinh tong cua tu 1 mu 3 den n mu 3(n < 9)
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so nguyen n: $'
    msg2 db 10, 13, 'Tong la: $'
    msg3 db 10, 13, 'Tong co tinh chan $'
    msg4 db 10, 13, 'Tong co tinh le $'
    n db ?
    sum dw 0
    muoi dw 10
    
.code 
MAIN Proc
    mov ax, @data 
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so n
    mov ah, 1
    int 21h
    sub al, '0'
    mov n, al
    
    ;tinh tong
    xor cx, cx
    mov cl, n
loop_sum:
    mov ax, 0001h
    xor bx, bx
    mov bx, cx
mu_ba:
    mul bx
    mul bx
    mul bx
tong:
    add sum, ax
    dec cx
    cmp cx, 0
    jne loop_sum
    
    
    ;hien thi ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
    
    mov ax, sum
    xor cx, cx
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
END MAIN