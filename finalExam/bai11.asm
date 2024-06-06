;bai11:go mot ki tu va in ra ma ascii o dong tiep theo
;dung khi gap enter
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap ki tu: $'
    msg2 db 10, 13, 'Ma ascii II cua ki tu la: $'
    hexa dw 16
    var db 0
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
loop_for:
    ;hien thi thong bao
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap ki tu
    mov ah, 1
    int 21h
    mov var, al
    cmp al, 13
    je exit_programing
    
    
    ;hien thi ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
    
    xor ax, ax
    mov al, var
    call convert_deci_hex
    jmp loop_for
    
exit_programing:
    mov ah, 4ch
    int 21h
MAIN Endp
    
    
    convert_deci_hex proc
        xor cx, cx
        loop_for1:
            xor dx, dx
            div hexa
            push dx
            inc cx
            cmp ax, 0
            jne loop_for1
        print:
            pop dx
            cmp dx, 9
            jle number
            jmp char
        number:
            add dx, '0'
            jmp ngat_1
        char:
            add dx, 55
            jmp ngat_1
        ngat_1:
            
            mov ah, 2
            int 21h
            loop print
        ret
    convert_deci_hex endp
END MAIN