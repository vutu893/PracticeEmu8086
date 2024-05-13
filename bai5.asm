 ;bai5
 .model small
 .stack 100h
 .data
    msg1 db 10,13,'nhap chuoi: $'
    msg2 db 10, 13, 'chuoi sau khi chuyen doi thanh in hoa: $'
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
    mov ah, 10
    lea dx, str
    int 21h
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    ;thuc hien chuyen thanh in hoa
    lea si, str+2
    lap1:
        mov dl, [si]
        cmp dl, 'Z'
        jle in2
        sub dl, 32
    in2:
        mov ah, 2
        int 21h
        inc si
        cmp [si],'$'
        jne lap1
    ;thoat khoi chuong trinh
    mov ah, 4ch
    int 21h
MAIN Endp
END MAIN