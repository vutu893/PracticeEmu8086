;bai16: chuyen tu nhi phan ve he thap phan
.model small
.stack 100h
.data 
    msg1 db 10, 13, 'nhap chuoi nhi phan: $'
    msg2 db 10, 13, 'so he thap phan la: $'
    str db 256 dup('$')
    var dw 0
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
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;thuc hien chuyen doi
    lea si, str + 2
    xor cx, cx
    mov cl, str + 1
loop_for:
    mov ax, 0001h 
    xor bx, bx
    mov bl,[si]
    sub bl, '0'
    sub cl, 1
    shl ax, cl
    mul bx
    add var, ax
    inc si
    inc cl
    loop loop_for
    
end_loop:
    mov ax, var
    call printresult
exitprograming:
    mov ah, 4ch
    int 21h
     
MAIN Endp
    printresult proc
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
   printresult endp
END MAIN