;bai3
.model small
.stack 100h
.data
    msg1 db 10,13,'ban hay nhap xau ki tu: $'
    msg2 db 10,13, 'xau ki tu in hoa la: $'
    msg3 db 10, 13, 'xau ki tu in thuong la: $'
    str db 256 dup('$')
.code
MAIN Proc
    ;lay du lieu ve ds
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap xau ki tu
    mov ah,10
    lea dx, str
    int 21h
    
    ;bien xau ki tu thanh in thuong
    mov ah, 9
    lea dx, msg3
    int 21h
    
    call inthuong
    
    ;hien thi xau ki tu thanh in hoa
    mov ah, 9
    lea dx, msg2
    int 21h
    
    call inhoa
    
    ketthuc:
        mov ah, 4ch
        int 21h
MAIN Endp
    inthuong proc
        lea si, str+2
        lap1:
            mov dl, [si]
            cmp dl, 'a'
            jge in1
            cmp dl, 13
            je in1
            cmp dl, 'z'
            jl tang
        tang:
            add dl, 32
        in1:
            mov ah, 2
            int 21h
            inc si
            cmp [si], '$'
            jne lap1
        ret
    inthuong endp
    
    inhoa proc
        lea si, str+2
        lap2:
            mov dl, [si]
            cmp dl, 'Z'
            jle in2
            sub dl, 32
        in2:
            mov ah, 2
            int 21h
            inc si
            cmp [si], '$'
            jne lap2
        ret
    inhoa endp
END MAIN