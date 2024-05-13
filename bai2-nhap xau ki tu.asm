;bai 2 - nhap vao mot xau ki tu roi hien tu chung len man hinh
.model small
.stack 100h
.data
    msg1 db 10, 13, 'hay nhap xau ki tu: $'
    msg2 db 10, 13, 'xau ki tu vua nhap la: $'
    
    string db 256 dup('$')
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, msg1
    int 21h
    
    mov ah, 10
    lea dx, string
    int 21h
    
    mov ah, 9
    lea dx, msg2
    int 21h
    
    lea dx, string + 2
    int 21h
    
    mov ah, 4ch
    int 21h
    
    
MAIN Endp
END MAIN