;bai16: dem so chu so le trong mot so
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap so: $'
    msg2 db 10, 13, 'so chu so le la: $'
    str db 255 dup('$')
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
    
    ;nhap so 
    mov ah, 10
    lea dx, str
    int 21h
    
    ;dem so chu so le
    lea si, str + 2
    xor cx, cx
    mov cl, str + 1
    call convert_string_to_number
    
    mov ax, bx
    call counter_old_number
    
    ;hien thi ket qua
    mov ah,9
    lea dx, msg2
    int 21h
    
    mov dl, n
    add dl, '0'
    mov ah, 2
    int 21h
    
exit_programming:
    mov ah, 4ch
    int 21h
MAIN Endp
    convert_string_to_number proc
        xor ax, ax
        mov al, 10
        xor bx, bx
        loop_for:
            xor ax, ax
            mov al, 10
            xor dx,dx
            mov dl, [si]
            sub dl, '0'
            mul bl
            add ax, dx
            mov bx, ax
            inc si
            loop loop_for
        ret
    convert_string_to_number endp
    
    counter_old_number proc
        counter:
           xor dx, dx
           div muoi
           test dx, 0001h
           jnz increasing
           jmp end_if
        increasing:
           inc n
        end_if:
           cmp ax, 0
           jne counter            
        ret
    counter_old_number endp
END MAIN