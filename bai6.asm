;bai6
.model small
.stack 100h
.data
    msg1 db 10,13, 'nhap chuoi: $'
    msg2 db 10, 13, 'Ket qua la: $'
    str db 256 dup('$')
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    ;hien thi thong bao 1
    mov ah, 9
    lea dx, msg1
    int 21h
    
    ;hien thi thong bao 2
    lea dx, msg2
    int 21h
    
    call solve
MAIN Endp
    solve proc
        
    solve endp
END MAIN
    