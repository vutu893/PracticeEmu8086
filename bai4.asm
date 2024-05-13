;bai4
.model small
.stack 100h
.data
    msg1 db 10, 13, 'nhap chuoi: $'
    msg2 db 10, 13, 'chuoi sau khi chuyen thanh in thuong: $'
    str db 256 dup('$')
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;nhap chuoi
    lea dx, str
    mov ah, 10
    int 21h
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    ;thuc hien in thuong 
    lea si, str+2
    lap1:
        mov dl, [si]
        cmp dl, 'a'
        jg in1
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
    ;ket thuc chuong trinh
    mov ah, 4ch
    int 21h
MAIN Endp
END MAIN