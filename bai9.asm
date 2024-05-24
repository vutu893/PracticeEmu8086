;bai9: chuan hoa ten
.model small
.stack 100h
.data
    msg1 db 10, 13,'nhap ten ban: $'
    msg2 db 10,13, 'ten cua ban sau khi chuan hoa: $'
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
    
    ;ket thuc chuong trinh
    mov ah, 4ch
    int 21h   
    
MAIN Endp
        
END MAIN