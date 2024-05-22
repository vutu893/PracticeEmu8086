;bai17: thi ma hex chuyen sang he thap phan
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap chuoi hex: $'
    msg2 db 10, 13, 'gia tri o he thap phan la: $'
    str db 256 ('$')
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
    
    ;nhap chuoi hex
    mov ah, 10
    lea dx, str
    int 21h
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;thuc hien chuyen doi hex sang nhi phan
    
MAIN Endp
    hienthi proc
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
   hienthi endp
END MAIN