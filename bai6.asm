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
    
    mov ah, 10
    lea dx, str
    int 21h
    
    ;hien thi thong bao 2
    mov ah, 9
    lea dx, msg2
    int 21h
    
    lea si, str+2
    mov bx, [si]
    xor ax, ax 
    xor cx, cx
    mov cl, [str + 1]
    lap1:
      inc si
      mov dx, [si]
      cmp bx, dx
      jne in1
      loop lap1
    in1: 
      mov dl, al
      add dl, '0'
      mov ah, 2
      int 21h
        
MAIN Endp
END MAIN
    