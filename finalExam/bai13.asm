;bai13: so fibonacci mo rong toi 14 so dau
.model small
.stack 100h
.data 
    msg1 db 10, 13, 'nhap so n: $'
    msg2 db 10, 13, 'n so fabonaci dau tien la: $'
    space db 32, '$'
    fabo db 100 dup(?)
    str db 100 dup('$')
    n db 0
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
    mov ah, 10
    lea dx, str
    int 21h
    
    ;chuyen chuoi thanh so 123 => so 123
    xor bx, bx
    xor cx, cx
    lea di, str+ 2
    mov cl, str + 1 
    xor ax, ax
   
loop_for1:
    mov al, 10
    xor dx, dx
    mov dl, [di]
    sub dl, '0'
    mul bl
    add ax, dx
    mov bx, ax
    inc di
    loop loop_for1
    
    mov n, bl
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;generate fabonaci number
    xor bx, bx
    mov bl, 3
    xor cx, cx
    mov cl, n
    sub cl, 3
    lea si, fabo + 2
    mov [si], 0
    mov [si + 1], 1
    mov [si + 2], 1
    
loop_generate_fabo:
    xor ax, ax
    xor dx, dx
    push bx
    dec bx
    mov al, [si + bx]
    dec bx
    mov dl, [si + bx]
    add al, dl
    pop bx
    mov [si + bx], al
    inc bx
    loop loop_generate_fabo
    
    ;hien thi ket qua
    
result:
    xor ax, ax
    mov al, [si]
    inc si
    call print_result
    call space_ele
    sub n, 1
    cmp n, 0
    jne result
    
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
    
    print_result proc
        xor cx, cx
        loop_for:
            xor dx, dx
            div muoi
            add dx, '0'
            push dx
            inc cx
            cmp ax, 0
            jne loop_for
        print:
            pop dx
            mov ah, 2
            int 21h
            loop print
        ret
    print_result endp
    
    
END MAIN