;bai14: tinh giai thua
.model small
.stack 100h
.data
    msg1 db 10, 13, 'tinh giai thua cua: $'
    msg2 db 10, 13, 'Ket qua la: $'
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
    xor cx, cx
    mov cl, al
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    call giaithua
    
    ;ket thuc chuong trinh
    mov ah, 4ch
    int 21h
MAIN Endp
    giaithua proc
        xor ax, ax
        mov ax, 1
        mov bx, 1
        cal:
            mul bx
            inc bx
            cmp bx, cx
            jle cal        
        xor cx, cx
        giveresultinstack:
            mov dx, 0
            div muoi
            add dx, '0'
            push dx
            inc cx
            cmp ax, 0
            jne giveresultinstack
        hienthi:
            pop dx
            mov ah, 2
            int 21h
            loop hienthi
        ret
    giaithua endp
            
END MAIN