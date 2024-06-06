;bai10:tinh tong tu 1^2 den n^2 (n< 10)
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so n: $'
    msg2 db 10, 13, 'Tong tu 1^2 den n^2 bang: $'
    n db 0
    sum dw 0
    muoi dw 10
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao nhap n
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so n
    mov ah, 1
    int 21h
    sub al, '0'
    mov n, al
    
    ;hine thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;tinh tong
    xor cx, cx
    mov cl, n
loop_for:
    xor ax, ax
    xor bx, bx
    mov al, cl
    mov bl, cl
    mul bx
    add sum, ax
    loop loop_for

    mov ax, sum
    call print_result
exit_programing:
    mov ah, 4ch
    int 21h
MAIN Endp
    print_result proc
        xor cx,cx
        loop_for1:
            xor dx, dx
            div muoi
            add dx, '0'
            push dx
            inc cx
            cmp ax, 0
            jne loop_for1
        print:
            pop dx
            mov ah, 2
            int 21h
            loop print
        ret
        
    print_result endp
END MAIN