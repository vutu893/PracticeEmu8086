;bai22: tim min va max trong 1 mang: so trong mang la so 8bit
.model small
.stack 100h
.data
    msg1 db 10, 13, 'Nhap so phan tu: $'
    msg2 db 10, 13, 'Nhap mang: $'
    msg3 db 10, 13, 'So lon nhat la: $'
    msg4 db 10, 13, 'So nho nhat la: $'
    max dw ?
    min dw ?
    arr db 100 dup(?)
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
MAIN Endp
END MAIN
    