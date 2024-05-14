;bai7
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap xau ki tu: $'
    msg2 db 10, 13, 'xau ki tu dao nguoc: $'
    str db 256 dup('$')
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap xau ki tu
    mov ah, 10
    lea dx, str
    int 21h
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    call daonguoc
    
    ;ket thuc chuong trinh
    mov ah, 4ch
    int 21h
MAIN Endp
    daonguoc Proc
        lea si, str + 2
        xor cx, cx
        mov cl, str + 1
        lappush:
            mov dx, [si] 
            push dx
            inc si
            loop lappush
        xor cx, cx
        mov cl, str + 1
        hienthi:
            pop dx
            mov ah, 2
            int 21h
            loop hienthi
        ret
    daonguoc Endp
        
END MAIN