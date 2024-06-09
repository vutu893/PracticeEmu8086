;bai15: tinh tong cua hai so 8 bit
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Nhap so thu nhat: $'
    msg2 db 10, 13, 'Nhap so thu hai: $'
    msg3 db 10, 13, 'Tong cua hai so la: $'
    sum dw 0
    str1 db 255 dup('$')
    str2 db 255 dup('$')
    number1 db ?
    number2 db ?
    muoi dw 10
.code 
MAIN Proc 
    mov ax, @data
    mov ds, ax
    
    ;thong bao nhap so thu nhat
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap so thu nhat
    mov ah, 10
    lea dx,str1
    int 21h
    
    ;gan gia tri cho number 1
    lea si, str1 + 2
    xor cx, cx
    mov cl, str1 + 1
    call convert_string_to_number
    
    mov number1, bl
    
    ;thong bao nhap so thu hai
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;nhap so thu hai
    mov ah, 10
    lea dx, str2
    int 21h
    
    ;gan gia tri cho number 2
    lea si, str2 + 2
    xor cx, cx
    mov cl, str2 + 1
    call convert_string_to_number
    
    mov number2, bl
    
    ;hien thi thong bao tinhs tong
    mov ah, 9
    lea dx, msg3
    int 21h
    
    ;tinh tong
    xor ax, ax
    mov al, number1
    xor bx, bx
    mov bl, number2
    
    add ax, bx
    
    ;hien thi ket qua tinh tong
    call print_result

exit_programming:
    mov ah, 4ch
    int 21h
MAIN Endp
    convert_string_to_number proc
            xor bx, bx
        loop_for: 
            xor ax, ax
            mov al, 10
            xor dx, dx
            mov dl, [si]
            inc si
            sub dl, '0'
            mul bl
            add ax, dx
            mov bx, ax
            loop loop_for
        ret
    convert_string_to_number endp
    
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
