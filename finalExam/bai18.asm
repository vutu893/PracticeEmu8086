;bai18: tinh tong tu 1+4+7+....+ 210
.model small
.stack 100h
.data
    msg1 db 10, 13, '1+4+7+...+211 = $'
    muoi dw 10
    tmp dw 1
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    ;thuc hien tinh toan
    xor ax, ax
    xor cx, cx
    mov cx, 71
loop_for:
    add ax, tmp
    add tmp, 3
    loop loop_for
    
    ;hien thi ket qua
    call print_result
exit_programming:
    mov ah, 4ch
    int 21h   
    
MAIN Endp
    print_result proc
        xor cx, cx
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