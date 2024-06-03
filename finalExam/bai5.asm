;bai5: nhap vao 1 day bit roi chuyen sang he thap phan va hex
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Enter a binary number 8bit: $'
    msg2 db 10, 13, '>>>> Result decimary: $'
    msg3 db 10, 13, '>>>> Result hexa: $'
    str db 256 dup('$')
    deci db 0 
    muoi dw 10
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap chuoi
    mov ah, 10
    lea dx, str
    int 21h
    
    lea si, str+2
    xor cx, cx
    mov cl, str + 1
loop_deci:
    xor dx, dx
    mov dl, [si]
    sub dl, '0'
    sub cl, 1
    shl dl, cl
    add deci, dl
    inc si
    inc cl
    loop loop_deci
    
    
    ;hien thi ket qua
    mov ah, 9
    lea dx, msg2
    int 21h
    
    xor ax, ax
    mov al, deci
    call print_result
      
exit_programing:    
    mov ah, 4ch
    int 21h
    
MAIN Endp
    print_result proc
        xor cx, cx
        loop_push:
            xor dx, dx
            div muoi
            add dx, '0'
            push dx
            inc cx
            cmp ax, 0
            jne loop_push
        print:
            pop dx
            mov ah, 2
            int 21h
            loop print
        ret
    print_result endp
END MAIN