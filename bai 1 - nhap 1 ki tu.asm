;bai 1 - nhap  1 ki tu tu ban phim roi hien thi ra man hinh
.model small
.stack 100h
.data
    msg1 db 10,13, 'hay nhap ki tu: $'
    msg2 db 10,13, 'ki tu ban vua nhap la: $'
    
    kitu db ?
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    mov dx, offset msg1
    int 21h
    
    mov ah, 1
    int 21h 
    mov kitu, al
    
    mov ah, 9
    mov dx, offset msg2
    int 21h
    
    mov ah,2
    mov dl, kitu
    int 21h
    
    mov ah, 4ch
    int 21h
    
MAIN Endp
END MAIN